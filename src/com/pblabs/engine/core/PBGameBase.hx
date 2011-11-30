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

import Type;

import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.F;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using com.pblabs.util.ArrayUtil;

/**
  * Defines transitions between contexts.  When the transition is finished, the callback is called.
  * The first IPBContext is the currently inactive context (the previous). This can be null.
  * The second is the currently active context (the new context).  This usually isn't null, but could be
  * if it's the first context and should appear with a transition effect.
  */
typedef PBContextTransitionEffect = IPBContext->IPBContext->(Void->Void)->Void; 

enum	ContextTransition {
	PUSH(c :IPBContext, ?effect :PBContextTransitionEffect);
	POP(c :IPBContext, ?effect :PBContextTransitionEffect);
	PLACE_ON_TOP(c :IPBContext, ?effect :PBContextTransitionEffect);
	CHANGE(oldContext :IPBContext, newContext :IPBContext, ?effect :PBContextTransitionEffect);
	REMOVE(c :IPBContext, ?effect :PBContextTransitionEffect);
	ROLL_BACK_UNTIL(cls :Class<Dynamic>, ?effect :PBContextTransitionEffect);//Must be an IPBContext
}

/**
  * The base game manager.
  * This class inits all the managers, and managers the IPBContexts.
  */
class PBGameBase
{
	public var currentContext (get_currentContext, null) :IPBContext;
	var _currentContext :IPBContext;
	function get_currentContext() :IPBContext
	{
		return _currentContext;
	}
	
	public var signalContextSetup (default, null) :Signaler<IPBContext>;
	public var signalContextShutdown (default, null) :Signaler<IPBContext>;
	public var signalContextEnter (default, null) :Signaler<IPBContext>;
	public var signalContextExit (default, null) :Signaler<IPBContext>;
	var injector :Injector;

	public var contexts (get_contexts, never) :Array<IPBContext>;
	function get_contexts () :Array<IPBContext>
	{
		return _contexts != null ? _contexts.copy() : [];
	}
	
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
		
		if (Std.is(instance, IPBManager)) {
			cast(instance, IPBManager).startup();
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
		if (Std.is(i, IPBContext) || Std.is(i, PBContext)) {
			var ctx = cast(i, PBContext);
			//On flash Reflect.hasField is sufficient, however on JS
			//Type.getInstanceFields is needed 
			if (Reflect.hasField(ctx, "setInjectorParent") || Type.getInstanceFields(type).has("setInjectorParent")) {
				Reflect.callMethod(ctx, Reflect.field(ctx, "setInjectorParent"), [injector]);
			}
			//Bind the context shutdown signal to ours
			var self = this;
			var bond :hsl.haxe.Bond = null;
			bond = cast(ctx, PBContext).signalDestroyed.bind(
				function (c :IPBContext) :Void {
					self.signalContextShutdown.dispatch(ctx);
				}).destroyOnUse();
			//Fire setup
			signalContextSetup.dispatch(ctx);
			ctx.setupInternal();
			
			com.pblabs.util.Assert.isTrue(ctx.injector.getMapping(IPBContext) == ctx);
			
			if (ctx.getManager(IProcessManager) != null && Std.is(ctx.getManager(IProcessManager), ProcessManager)) {
				//The IPBContext starts paused, we control the unpausing.
				cast(ctx.getManager(IProcessManager), ProcessManager).isRunning = false;
			}
		}
		return i;
	}
	
	public function pushContext <T>(c :Class<T>, ?effect :PBContextTransitionEffect) :T
	{
		var ctx = allocate(c);
		_contextTransitions.push(ContextTransition.PUSH(cast ctx, effect));
		return ctx;
	}
	
	public function setTopContext (ctx :IPBContext, ?effect :PBContextTransitionEffect) :IPBContext
	{
		com.pblabs.util.Assert.isNotNull(ctx, ' ctx is null');
		_contextTransitions.push(ContextTransition.PLACE_ON_TOP(ctx, effect));
		return ctx;
	}
	
	public function popContext (?effect :PBContextTransitionEffect) :Void
	{
	    _contextTransitions.push(ContextTransition.POP(currentContext, effect));
	}
	
	public function changeContext (oldContext :IPBContext, c :Class<Dynamic>, ?effect :PBContextTransitionEffect) :Dynamic
	{
		var newContext :IPBContext = allocate(c);
		com.pblabs.util.Assert.isNotNull(oldContext);
		com.pblabs.util.Assert.isNotNull(newContext);
		com.pblabs.util.Assert.isTrue(oldContext != newContext); 
	    _contextTransitions.push(ContextTransition.CHANGE(oldContext, newContext, effect));
	    return newContext;
	}
	
	public function removeContext (c :IPBContext, ?effect :PBContextTransitionEffect) :Void
	{
		_contextTransitions.push(ContextTransition.REMOVE(c, effect));
	}
	
	public function rollBackUntil (c :Class<Dynamic>, ?effect :PBContextTransitionEffect) :Void
	{
		_contextTransitions.push(ContextTransition.ROLL_BACK_UNTIL(c, effect));
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
				com.pblabs.util.Log.debug("Shutting down " + haxe.rtti.ReflectUtil.getClassName(context));
				context.shutdown();
			}
		}
		com.pblabs.util.Log.debug("Shutting down managers");
		for (m in _managers) {
			if (Std.is(m, IPBManager)) {
				com.pblabs.util.Log.debug("Shutting down " + haxe.rtti.ReflectUtil.getClassName(m));
				cast(m, IPBManager).shutdown();
			}
		}
		
		#if debug
		com.pblabs.util.Assert.isFalse(signalContextEnter.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalContextExit.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalContextSetup.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalContextShutdown.isListenedTo);
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
		com.pblabs.util.Log.debug("updateContextTransitions");
		com.pblabs.util.Log.debug("_contextTransitions.length=" + _contextTransitions.length);
		com.pblabs.util.Log.debug('_isUpdatingContextTransition=' + _isUpdatingContextTransition);
		
		if (_isUpdatingContextTransition || _contextTransitions.length == 0) {
			return;
		}
		
		_isUpdatingContextTransition = true;
		
		com.pblabs.engine.debug.Profiler.enter("updateContextTransitions");
		var self = this;
		
		if (_currentContext != null) {
			_currentContext.getManager(IProcessManager).isRunning = false;
		}
		var previousContext = _currentContext;
		var transition :PBContextTransitionEffect = null;
		var functionStack :Array<Void->Void> = [];
		
		var exit = function (c :IPBContext) :Void->Void {
			return function () :Void {
				c.exit();
				self.signalContextExit.dispatch(c);
				c.getManager(IProcessManager).isRunning = false;
			}
		}
		
		var destroy = function (c :IPBContext) :Void->Void {
			return function () :Void {
				self.signalContextShutdown.dispatch(c);
				c.shutdown();
			}
		}
		
		var destroyCurrentContext = function () :Void {
			functionStack.push(exit(self._currentContext));
			functionStack.push(destroy(self._currentContext));
			self._contexts.remove(self._currentContext);
			self._currentContext = null;
		}
		
		//Do the transitions, then set the _currentContext at the end
		while (_contextTransitions.length > 0) {
			var nextTransition = _contextTransitions.shift();//Removes the first element and returns it.
			switch (nextTransition) {
				case PUSH(c, effect):
					transition = effect;
					if (_currentContext != null) {
						functionStack.push(exit(_currentContext));
						_currentContext = null;
					}
					_contexts.push(c);
				case POP(c, effect):
					transition = effect;
					if (_currentContext == c) {
						functionStack.push(exit(_currentContext));
						_currentContext = null;
					}
					functionStack.push(destroy(c));
					_contexts.remove(c);
					
				case CHANGE(oldContext, newContext, effect):
					transition = effect;
					com.pblabs.util.Assert.isNotNull(oldContext);
					if (_currentContext == oldContext) {
						destroyCurrentContext();
						_contexts.push(newContext);
					} else {
						var idx = _contexts.indexOf(oldContext);
						com.pblabs.util.Assert.isWithinRange(idx, 0, _contexts.length);
						_contexts[idx] = newContext;
						functionStack.push(destroy(oldContext));
					}
					
				case REMOVE(c, effect):
					transition = effect;
					if (c == _currentContext) {
						destroyCurrentContext();
					} else {
						functionStack.push(destroy(c));
						_contexts.remove(c);
					}
				case ROLL_BACK_UNTIL(cls, effect):
					transition = effect;
					if (_currentContext != null && Std.is(_currentContext, cls)) {
						functionStack.push(exit(_currentContext));
					} else {
						if (_currentContext != null) {
							destroyCurrentContext();
						}
						while (_contexts.length > 0 && !Std.is(_contexts[_contexts.length - 1], cls)) {
							var ctx = _contexts.pop();
							functionStack.push(destroy(ctx));
						}
						if (_contexts.length == 0) {
							_contexts.push(allocate(cls));
						}
					}
				case PLACE_ON_TOP(c, effect):
					transition = effect;
					if (_currentContext != null) {
						functionStack.push(exit(_currentContext));
						_currentContext != null;
					}
					_contexts.remove(c);
					_contexts.push(c);
			}
		}
		
		//Define function for all the exiting/destroying
		var doExitDestroyActions = function () :Void {
			while (functionStack.length > 0) {
				functionStack.shift()();
			}
		}
		
		_currentContext = _contexts[_contexts.length - 1];
		_isUpdatingContextTransition = false;
		_contextProcessManager = null;
	
		if (_currentContext != null) {
			com.pblabs.util.Assert.isNotNull(this.currentContext, ' this.currentContext is null');
			//Dispatch the signaller first, so that managers are notified.
			com.pblabs.util.Log.debug("New current context=" + _currentContext);
			signalContextEnter.dispatch(_currentContext);
			Reflect.callMethod(_currentContext, Reflect.field(_currentContext, "enterInternal"), null);
			_contextProcessManager = cast _currentContext.getManager(IProcessManager);
			_contextProcessManager.isRunning = true;
		} else {
			com.pblabs.util.Log.debug("No current context");
		}
	
		//Now that the local functions are defined, do the scene transition if there
		if (transition != null) {
			transition(previousContext, _currentContext, doExitDestroyActions);
		} else {
			doExitDestroyActions();
		}
		
		com.pblabs.engine.debug.Profiler.exit("updateContextTransitions");
	}
	
	function init () :Void
	{
		//Called by the constructor.
		signalContextEnter = new DirectSignaler(this);
		signalContextExit = new DirectSignaler(this);
		signalContextSetup = new DirectSignaler(this);
		signalContextShutdown = new DirectSignaler(this);
		_managers = Maps.newHashMap(ValueType.TClass(String));

		injector = createInjector();
		_contexts = new Array();
		
		registerManager(PBGameBase, this, null, true);
		
		initializeManagers();
		
		startTimer();
	}
	
	function onFrame (#if flash event :flash.events.TimerEvent #end):Void
	{
		com.pblabs.util.Log.debug("onFrame");
		com.pblabs.util.Log.debug('_contextProcessManager=' + _contextProcessManager);
		if (_contextProcessManager != null) {
			_contextProcessManager.onFrame(#if flash event #end);
		}

		if (_contextTransitions != null && _contextTransitions.length > 0) {
			updateContextTransitions();
		}

		while (_callLater.length > 0) {
			_callLater.pop()();
		}
		#if flash
		if (event != null) {//We may be called from an external process, and therefore have no event
			event.updateAfterEvent();
			untyped flash.Lib.current.stage.invalidate();
		}
		#end
	}
	
	function startTimer ():Void
	{
		com.pblabs.util.Log.debug("startTimer");
		#if !neko
		Preconditions.checkArgument(_timer == null, "Timer is not null, have we already started the timer?");
		#end
		
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
		com.pblabs.util.Log.debug("stopTimer");
		#if !neko
		Preconditions.checkArgument(_timer != null, "Timer is null, have we called stopTimer already?");
		#end
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
