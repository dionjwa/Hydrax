/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBGroup;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGroup;
import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using com.pblabs.util.ArrayUtil;

typedef PBContextFriend = {
	function setupInternal () :Void;
	function shutdownInternal () :Void;
	function enter () :Void;
	function exit () :Void;
}

/**
  * The base game manager.
  * This class inits all the managers, and managers the IPBContexts.
  */
class PBGameBase
{
	
	public var currentContext (get_currentContext, null) :IPBContext;
	var _currentContext :IPBContext;
	public var newActiveContextSignaler (default, null) :Signaler<IPBContext>;
	var injector :Injector;

	var _contexts :Array<IPBContext>;
	var _contextTransitions :Array<ContextTransition>;
	var _isUpdatingContextTransition :Bool;
	var _managers :Map<String, Dynamic>;
	
	public function new()
	{
		_contextTransitions = [];
		_isUpdatingContextTransition = false;
		//Start profiling.  This is disabled if the "profiler" compiler key command is not set
		com.pblabs.engine.debug.Profiler.bindToKey();
	}
	
	public function startup () :Void
	{
		//Called by the constructor.
		newActiveContextSignaler = new DirectSignaler(this);
		_managers = Maps.newHashMap(String);

		injector = createInjector();
		_contexts = new Array();
		// _contextsDirty = false;
		initializeManagers();
	}
	
	public function injectInto(instance:Dynamic):Void
	{
		injector.injectInto(instance);			
	}
	
	public function getManager <T>(cls :Class<T>, ?name :String = null):T
	{
		return injector.getMapping(cls, name);
	}
	
	//Returns manager for convenience
	public function registerManager <T>(clazz:Class<Dynamic>, ?instance:T = null, ?optionalName:String="", ?suppressInject:Bool = false):T
	{
		if (instance == null) {
			instance = allocate(clazz);
		}

		_managers.set(PBUtil.getManagerName(clazz, optionalName), instance);
		
		if(!suppressInject) {
			injector.injectInto(instance);
		}
		
		//Injection mapping is after the injection of this object, 
		//as this object may access the same class as a parent
		//manager
		injector.mapValue(clazz, instance, optionalName);
		
		if(Std.is(instance, IPBManager)) {
			cast(instance, IPBManager).startup();
		}
		return instance;
	}
	
	public function allocate <T>(type :Class<T>) :T
	{
		if (type == IPBContext) {
			untyped type = PBContext;
		}
		
		var i = Type.createInstance(type, EMPTY_ARRAY);
		com.pblabs.util.Assert.isNotNull(i, "allocated'd instance is null, type=" + type);
		
		injector.injectInto(i);
		
		if (Std.is(i, IPBContext) || Std.is(i, PBContext)) {
			var ctx = cast(i, PBContext);
			//On flash Reflect.hasField is sufficient, however on JS
			//Type.getInstanceFields is needed 
			if (Reflect.hasField(ctx, "setInjectorParent") || Type.getInstanceFields(type).has("setInjectorParent")) {
				Reflect.callMethod(ctx, Reflect.field(ctx, "setInjectorParent"), [injector]);
			}
			ctx.setup();
			
			com.pblabs.util.Assert.isTrue(ctx.injector.getMapping(IPBContext) == ctx);
			if (ctx.getManager(IProcessManager) != null && Std.is(ctx.getManager(IProcessManager), ProcessManager)) {
				//The IPBContext starts paused, we control the unpausing.
				cast(ctx.getManager(IProcessManager), ProcessManager).isRunning = false;
			}
		}
		return i;
	}
	
	public function pushContext (ctx :IPBContext) :Void
	{
		_contextTransitions.push(ContextTransition.PUSH(ctx));
		updateContextTransitions();
		
		// Preconditions.checkNotNull(ctx, "Cannot add a null context");
		// Preconditions.checkArgument(!_contexts.has(ctx), "Context already added");
		// Preconditions.checkArgument(!Std.is(ctx, PBContext) || cast(ctx, PBContext).injector.parent == injector, "PBContext injector has no parent.  Use allocate() to create the PBContext, not new PBContext");
		// stopContexts();
		// _contexts.push(ctx);
		// ctx.getManager(IProcessManager).isRunning = true;
		// startTopContext();
	}
	
	public function popContext () :Void
	{
	    _contextTransitions.push(ContextTransition.POP);
		updateContextTransitions();
	}
	
	public function changeContext (c :IPBContext) :Void
	{
	    _contextTransitions.push(ContextTransition.CHANGE(c));
		updateContextTransitions();
	}
	
	public function removeContext (c :IPBContext) :Void
	{
		_contextTransitions.push(ContextTransition.REMOVE(c));
		updateContextTransitions();
		
	    // com.pblabs.util.Assert.isNotNull(c);
	    // if (c != currentContext && currentContext != null) {
	    // 	currentContext.exit();
	    // }
	    // _contexts.remove(c);
	    
	}
	
	public function shutdown () :Void
	{
		getManager(IProcessManager).isRunning = false;
		if (currentContext != null) {
			currentContext.getManager(IProcessManager).isRunning = false;
			currentContext.rootGroup.destroy();
		}
		
		for (context in _contexts) {
			if (context != null) {
				context.shutdown();
			}
		}
		
		for (m in _managers) {
			if (Std.is(m, IPBManager)) {
				cast(m, IPBManager).shutdown();
			}
		}
		_managers = null;
		injector = null;
		_contexts = null;
	}
	
	function updateContextTransitions () :Void
	{
		if (_isUpdatingContextTransition) {
			return;
		}
		
		var self = this;
		//Update transitions in between updates
		if (_currentContext != null && _currentContext.getManager(IProcessManager).isRunning) {
			//Local access
			var ctx = _currentContext; 
			ctx.getManager(IProcessManager).callLater(function () :Void {
				if (ctx.getManager(IProcessManager).isRunning) {
					ctx.getManager(IProcessManager).isRunning = false;
				}
				self.updateContextTransitions();
			});
			return;
		}
	
		var hasShutdown = [];
		
		var curCtx = _currentContext;
		
		var removeContext = function (c :IPBContext) :Void {
			com.pblabs.util.Assert.isNotNull(c);
			c.getManager(IProcessManager).isRunning = false;
			self._contexts.remove(c);
			c.exit();
			c.shutdown();
			hasShutdown.push(c);
		}
		
		
		_isUpdatingContextTransition = true;
		
		//Do the transitions, then set the _currentContext at the end
		while (_contextTransitions.length > 0) {
			switch (_contextTransitions.shift()) {
				case PUSH(c):
					if (_currentContext != null) {
						_currentContext.exit();
						_currentContext = null;
					}
				_contexts.push(c);
				case POP:
					if (_currentContext != null) {
						removeContext(_currentContext);
						_currentContext = null;
					} else {
						_contexts.pop();
					}
				case CHANGE(c):
					if (_currentContext != null) {
						removeContext(_currentContext);
						_currentContext = null;
					} else {
						_contexts.pop();
					}
					_contexts.push(c);
				case REMOVE(c):
					if (c == _currentContext) {
						removeContext(_currentContext);
					} else {
						_contexts.remove(c);	
					}
			}
		}
		
		
		_currentContext = _contexts[0];
		_isUpdatingContextTransition = false;
		
		if (_currentContext != null) {
			//Dispatch the signaller first, so that managers are notified.
			newActiveContextSignaler.dispatch(_currentContext);
			_currentContext.enter();
			_currentContext.getManager(IProcessManager).isRunning = true;
		}
		
		
		
		// Preconditions.checkNotNull(ctx, "Cannot add a null context");
		// Preconditions.checkArgument(!_contexts.has(ctx), "Context already added");
		// Preconditions.checkArgument(!Std.is(ctx, PBContext) || cast(ctx, PBContext).injector.parent == injector, "PBContext injector has no parent.  Use allocate() to create the PBContext, not new PBContext");
		// stopContexts();
		// _contexts.push(ctx);
		// ctx.getManager(IProcessManager).isRunning = true;
		// startTopContext();
	}
	
	
	// function stopContexts () :Void
	// {
	// 	for (c in _contexts) {
	// 		c.getManager(IProcessManager).isRunning = false;
	// 	}
	// 	if (_contexts.length > 0) {
	// 		_contexts[_contexts.length].exit();
	// 	}
	// }
	
	// function startTopContext () :Void
	// {
	// 	if (currentContext != null) {
	// 		#if debug
	// 		com.pblabs.util.Assert.isNotNull(currentContext, "How is the top context null?");
	// 		com.pblabs.util.Assert.isNotNull(currentContext.getManager(IProcessManager), "Where is the IProcessManager?");
	// 		#end
	// 		cast(currentContext.getManager(IProcessManager), ProcessManager).isRunning = true;
	// 		//Dispatch the signaller first, so that managers are notified.
	// 		newActiveContextSignaler.dispatch(currentContext);
	// 		currentContext.enter();
	// 	} 
	// }
	
	function get_currentContext() :IPBContext
	{
		return _currentContext;
		// return _contexts[_contexts.length - 1];
	}
	
	function createInjector () :Injector
	{
		return new Injector();
	}
	
	public function initializeManagers():Void
	{
		// Mostly will come from subclasses.
	}
	
	 static var EMPTY_ARRAY :Array<Dynamic> = [];
}

enum	ContextTransition {
	PUSH(c :IPBContext);
	POP;
	CHANGE(c :IPBContext);
	REMOVE(c :IPBContext);
}
