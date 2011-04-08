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

import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using com.pblabs.util.ArrayUtil;

enum	ContextTransition {
	PUSH(c :IPBContext);
	POP;
	CHANGE(c :IPBContext);
	REMOVE(c :IPBContext);
}

/**
  * The base game manager.
  * This class inits all the managers, and managers the IPBContexts.
  */
class PBGameBase
#if cpp
	implements haxe.rtti.Infos
#end
{
	public var currentContext (get_currentContext, null) :IPBContext;
	var _currentContext :IPBContext;
	function get_currentContext() :IPBContext
	{
		return _currentContext;
	}
	
	public var newActiveContextSignaler (default, null) :Signaler<IPBContext>;
	public var activeContextRemovedSignaler (default, null) :Signaler<IPBContext>;
	var injector :Injector;

	var _contexts :Array<IPBContext>;
	var _contextTransitions :Array<ContextTransition>;
	var _isUpdatingContextTransition :Bool;
	var _managers :Map<String, Dynamic>;
	var _contextProcessManager :com.pblabs.engine.time.ProcessManager;
	/** Functions to call after the main update loop is finished. */
	var _callLater :Array<Void->Dynamic>;
	
	#if !neko
	var _timer :#if flash flash.utils.Timer; #else haxe.Timer; #end
	#end
	
	public function new()
	{
		_contextTransitions = [];
		_isUpdatingContextTransition = false;
		#if profiler
		//Start profiling.  This is disabled if the "profiler" compiler key command is not set
		com.pblabs.engine.debug.Profiler.bindToKey();
		#end
		
		_callLater = [];
		init();
	}
	
	public function initializeManagers():Void
	{
		// Mostly will come from subclasses.
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
		
		com.pblabs.util.Assert.isNotNull(instance);

		_managers.set(PBUtil.getManagerName(clazz, optionalName), instance);
		
		if(!suppressInject) {
			injector.injectInto(instance);
		}
		
		//Injection mapping is after the injection of this object, 
		//as this object may access the same class as a parent
		//manager
		injector.mapValue(clazz, instance, optionalName);
		
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(instance, "com.pblabs.engine.core.IPBManager")) {
		#else
		if (Std.is(instance, IPBManager)) {
		#end
			try {
				cast(instance, IPBManager).startup();
			#if flash
			} catch (e :flash.errors.TypeError) {
			#else
			#end
			} catch (e :Dynamic) {
				trace("Fuck, error casting " + instance + "::" + com.pblabs.util.ReflectUtil.getClassName(instance) +" to a IPBManager, even though it says it's one: " + Std.is(instance, IPBManager) + "\n" + e);  
			}
		}
		return instance;
	}
	
	public function allocate <T>(type :Class<T>) :T
	{
		com.pblabs.util.Assert.isNotNull(type, "type is null");
		if (type == IPBContext) {
			type = cast Type.resolveClass("com.pblabs.engine.core.PBContext");
		}
		com.pblabs.util.Assert.isNotNull(type, "type is null");
		var i = Type.createInstance(type, EMPTY_ARRAY);
		com.pblabs.util.Assert.isNotNull(i, "allocated'd instance is null, type=" + type);
		
		injector.injectInto(i);
		
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(i, "com.pblabs.engine.core.IPBContext") || com.pblabs.util.ReflectUtil.is(i, "com.pblabs.engine.core.PBContext")) {
		#else
		if (Std.is(i, IPBContext) || Std.is(i, PBContext)) {
		#end
			var ctx = cast(i, PBContext);
			//On flash Reflect.hasField is sufficient, however on JS
			//Type.getInstanceFields is needed 
			if (Reflect.hasField(ctx, "setInjectorParent") || Type.getInstanceFields(type).has("setInjectorParent")) {
				Reflect.callMethod(ctx, Reflect.field(ctx, "setInjectorParent"), [injector]);
			}
			ctx.setup();
			
			com.pblabs.util.Assert.isTrue(ctx.injector.getMapping(IPBContext) == ctx);
			
			#if cpp
			if (ctx.getManager(IProcessManager) != null && com.pblabs.util.ReflectUtil.is(ctx.getManager(IProcessManager), "com.pblabs.engine.time.ProcessManager")) {
			#else
			if (ctx.getManager(IProcessManager) != null && Std.is(ctx.getManager(IProcessManager), ProcessManager)) {
			#end	
				//The IPBContext starts paused, we control the unpausing.
				cast(ctx.getManager(IProcessManager), ProcessManager).isRunning = false;
			}
		}
		return i;
	}
	
	public function pushContext (ctx :IPBContext) :IPBContext
	{
		_contextTransitions.push(ContextTransition.PUSH(ctx));
		return ctx;
	}
	
	public function popContext () :Void
	{
	    _contextTransitions.push(ContextTransition.POP);
	}
	
	public function changeContext (c :IPBContext) :Void
	{
	    _contextTransitions.push(ContextTransition.CHANGE(c));
	}
	
	public function removeContext (c :IPBContext) :Void
	{
		_contextTransitions.push(ContextTransition.REMOVE(c));
	}
	
	public function callLater (f :Void->Dynamic) :Void
	{
		com.pblabs.util.Assert.isNotNull(f);
	    _callLater.push(f);
	}
	
	public function shutdown () :Void
	{
		com.pblabs.util.Log.debug("Stopping timer");
		stopTimer();
		com.pblabs.util.Log.debug("Destroying currentContext");
		
		com.pblabs.util.Log.debug("Sutting down contexts");
		for (context in _contexts) {
			if (context != null) {
				com.pblabs.util.Log.debug("Shutting down " + com.pblabs.util.ReflectUtil.getClassName(context));
				context.shutdown();
			}
		}
		com.pblabs.util.Log.debug("Shutting down managers");
		for (m in _managers) {
			#if cpp
			if (com.pblabs.util.ReflectUtil.is(m, "com.pblabs.engine.core.IPBManager")) {
			#else
			if (Std.is(m, IPBManager)) {
			#end
				com.pblabs.util.Log.debug("Shutting down " + com.pblabs.util.ReflectUtil.getClassName(m));
				cast(m, IPBManager).shutdown();
			}
		}
		
		#if debug
		com.pblabs.util.Assert.isFalse(newActiveContextSignaler.isListenedTo);
		com.pblabs.util.Assert.isFalse(activeContextRemovedSignaler.isListenedTo);
		#end
		
		_managers = null;
		injector = null;
		_contexts = null;
		_currentContext = null;
		_contextTransitions = null;
		_isUpdatingContextTransition = false;
		_contextProcessManager = null;
	}
	
	/**
	  * Update contexts.  If more than one transition occurs, it will wait until
	  * all transitions are complete before calling enter() on the top context.
	  */
	function updateContextTransitions () :Void
	{
		if (_isUpdatingContextTransition || _contextTransitions.length == 0) {
			return;
		}
		
		var self = this;
		var removeCurrentContext = function () :Void {
			var c = self._currentContext;
			self._currentContext = null;
			com.pblabs.util.Assert.isNotNull(c);
			c.getManager(IProcessManager).isRunning = false;
			self._contexts.remove(c);
			c.exit();
			self.activeContextRemovedSignaler.dispatch(c);
			c.shutdown();
		}
		
		_isUpdatingContextTransition = true;
		
		//Do the transitions, then set the _currentContext at the end
		while (_contextTransitions.length > 0) {
			var nextTransition = _contextTransitions.shift();//Removes the first element and returns it.
			switch (nextTransition) {
				case PUSH(c):
					if (_currentContext != null) {
						_currentContext.exit();
						activeContextRemovedSignaler.dispatch(_currentContext);
						_currentContext = null;
					}
					_contexts.push(c);
				case POP:
					if (_currentContext != null) {
						removeCurrentContext();
					} else {
						_contexts.pop();
					}
				case CHANGE(c):
					if (_currentContext != null) {
						removeCurrentContext();
					} else {
						_contexts.pop();
					}
					_contexts.push(c);
				case REMOVE(c):
					if (c == _currentContext) {
						removeCurrentContext();
					} else {
						_contexts.remove(c);	
					}
			}
		}
		
		_currentContext = _contexts[_contexts.length - 1];
		_isUpdatingContextTransition = false;
		_contextProcessManager = null;
		
		if (_currentContext != null) {
			//Dispatch the signaller first, so that managers are notified.
			newActiveContextSignaler.dispatch(_currentContext);
			_currentContext.enter();
			_contextProcessManager = cast _currentContext.getManager(IProcessManager);
			_contextProcessManager.isRunning = true;
		}
	}
	
	function init () :Void
	{
		//Called by the constructor.
		newActiveContextSignaler = new DirectSignaler(this);
		activeContextRemovedSignaler = new DirectSignaler(this);
		_managers = Maps.newHashMap(String);

		injector = createInjector();
		_contexts = new Array();
		
		registerManager(PBGameBase, this, null, true);
		
		initializeManagers();
		
		startTimer();
	}
	
	function onFrame (#if flash event:flash.events.TimerEvent #end):Void
	{
		if (_contextProcessManager != null) {
			_contextProcessManager.onFrame(#if flash event #end);
		}
		if (_contextTransitions.length > 0) {
			updateContextTransitions();
			// if (_contextProcessManager != null) {
			// 	_contextProcessManager.onFrame(#if flash event #end);
			// }
		}
		
		while (_callLater.length > 0) {
			_callLater.pop()();
		}
		#if flash
		event.updateAfterEvent();
		untyped flash.Lib.current.stage.invalidate();
		#end
	}
	
	function startTimer ():Void
	{
		Preconditions.checkArgument(_timer == null, "Timer is not null, have we already started the timer?");
		#if flash
		_timer = new flash.utils.Timer(untyped flash.Lib.current.stage["frameRate"]);
		_timer.addEventListener(flash.events.TimerEvent.TIMER, onFrame);
		_timer.start();
		#elseif !neko
		if (_timer == null) {
			com.pblabs.util.Log.debug("Creating haxe.Timer"); 
			com.pblabs.util.Log.info("Assuming a frame rate of 30fps");
			_timer = new haxe.Timer(Std.int(1000/30));
			_timer.run = onFrame;
		}
		#end
	}
	
	function stopTimer ():Void
	{
		Preconditions.checkArgument(_timer != null, "Timer is null, have we called stopTimer already?");
		#if flash
		_timer.removeEventListener(flash.events.TimerEvent.TIMER, onFrame);
		_timer.stop();
		_timer = null;
		#elseif !neko
		_timer.stop();
		_timer.run = null;
		_timer = null;
		#end
	}

	function createInjector () :Injector
	{
		return new Injector();
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}
