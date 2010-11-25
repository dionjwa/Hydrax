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

/**
  * The base game manager.
  * This class inits all the managers, and managers the IPBContexts.
  */
class PBGameBase //extends PBContext
	// implements IPBContext
{
	// public var name (default, null) :String;
	public var currentContext(get_currentContext, null) :IPBContext;
	public var newActiveContextSignaler (default, null) :Signaler<IPBContext>;
	var injector :Injector;
	// public var rootGroup (default, null) :IPBGroup;
	// public var currentGroup (get_currentGroup, set_currentGroup) :IPBGroup;
	
	// public var started (default, null):Bool;
	
	// #if flash
	// public var displayContainer (get_displayContainer, null) :flash.display.Sprite;
	// var _displayContainer :flash.display.Sprite;
	// #end

	var _contexts :Array<IPBContext>;
	var _contextsDirty :Bool;
	// var _isRunning :Bool;
	// var _hasStarted :Bool;
	var _managers :Map<String, Dynamic>;
	// var _processManager :ProcessManager;
	// var _nameManager :NameManager;
	
	public function new()//?name :String = "PBGame context") 
	{
		// startup();
	}
	
	public function startup () :Void
	{
		// super();
		// this.name = name;

		newActiveContextSignaler = new DirectSignaler(this);
		_managers = Maps.newHashMap(String);

		injector = createInjector();
		// injector.mapValue(IPBContext, this);
		// _nameManager = registerManager(NameManager, new NameManager(), true);
		
		// _processManager = registerManager(IProcessManager, new ProcessManager(), true);
		// _processManager.paused = true;
		
		// rootGroup = new PBGroup();
		// rootGroup.context = this;
		// injector.mapValue(IPBGroup, rootGroup);
		// rootGroup.name = _nameManager.validateName("Game RootGroup");
		
		_contexts = new Array();
		_contextsDirty = false;
		// _isRunning = false;
		// started = false;
		
		// #if flash
		// _displayContainer = new flash.display.Sprite();
		// _displayContainer.name = this.name;
		// _displayContainer.mouseEnabled = _displayContainer.mouseChildren = false;
		// injector.mapValue(flash.display.Sprite, _displayContainer);
		// #end
		
		initializeManagers();
		// _nameManager = getManager(Name.add(rootGroup);
		
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
		#if debug
		com.pblabs.util.Assert.isNotNull(i, "allocated'd instance is null, type=" + type);
		#end
		
		injector.injectInto(i);
		
		if (Std.is(i, IPBContext) || Std.is(i, PBContext)) {
			var ctx = cast(i, PBContext);
			//On flash Reflect.hasField is sufficient, however on JS
			//Type.getInstanceFields is needed 
			if (Reflect.hasField(ctx, "setInjectorParent") || Type.getInstanceFields(type).has("setInjectorParent")) {
				Reflect.callMethod(ctx, Reflect.field(ctx, "setInjectorParent"), [injector]);
			}
			// #if (flash || cpp)
			// ctx.startup(_displayContainer);
			// #else
			ctx.startup();
			// #end
			
			#if debug
			com.pblabs.util.Assert.isTrue(ctx.injector.getMapping(IPBContext) == ctx);
			#end
			if (ctx.getManager(IProcessManager) != null && Std.is(ctx.getManager(IProcessManager), ProcessManager)) {
				//The IPBContext starts paused, we control the unpausing.
				cast(ctx.getManager(IProcessManager), ProcessManager).paused = true;
			}
		}
		return i;
	}
	
	public function pushContext (ctx :IPBContext) :Void
	{
		Preconditions.checkNotNull(ctx, "Cannot add a null context");
		Preconditions.checkArgument(!_contexts.has(ctx), "Context already added");
		Preconditions.checkArgument(!Std.is(ctx, PBContext) || cast(ctx, PBContext).injector.parent == injector, "PBContext injector has no parent.  Use allocate() to create the PBContext, not new PBContext");
		stopContexts();
		_contexts.push(ctx);
		ctx.getManager(IProcessManager).paused = true;
		startTopContext();
	}
	
	// public function startup () :Void//#if flash ?parentContainer :flash.display.DisplayObjectContainer #end) :Void
	// {
		// Preconditions.checkArgument(!started, "Game has already started, do not call this again");
		// started = true;
		
		// #if flash
		// if (parentContainer != null) {
		//	 Preconditions.checkNotNull(_displayContainer, "displayContainer is null");
		//	 parentContainer.addChild(_displayContainer);
		// } else {
		//	 // _displayContainer =
		//	 //If no parent passed in, assume we want to attach to the stage
		//	 flash.Lib.current.addChild(_displayContainer);
		// }
		// #end
		// startTopContext();
		
		
		
		// // _hasStarted = true;
		// Log.debug(["Initializing " + this + " '" + name + "'."]);
		// #if flash
		// if (parentContainer != null) {
		//	 Preconditions.checkNotNull(_displayContainer, "displayContainer is null");
		//	 parentContainer.addChild(_displayContainer);
		// } else {
		//	 _displayContainer = flash.Lib.current;
		// }
		// #end
		
		// if (currentContext != null) {
		//	 cast(currentContext.getManager(IProcessManager), ProcessManager).paused = false;
		// }
			
		// if (!_isRunning) {
		//	 _isRunning = true;
		//	 // startup();
			
		// }
	// }
	
	public function shutdown () :Void
	{
		// _processManager.stop();
		// rootGroup.destroy();
		// rootGroup = null;
		for (m in _managers) {
			if (Std.is(m, IPBManager)) {
				cast(m, IPBManager).shutdown();
			}
		}
		_managers = null;
		injector = null;
	}
	
	// Name lookups.
	public function lookup (name:String):Dynamic
	{
		throw "Not implemented";
		return null;
	}
	
	public function lookupEntity (name:String):IEntity
	{
		throw "Not implemented";
		return null;
	}
	
	// public function lookupComponent (entityName:String, componentName:String):IEntityComponent
	// {
	//	 throw "Not implemented";
	//	 return null;
	// }
	
	function stopContexts () :Void
	{
		for (c in _contexts) {
			c.getManager(IProcessManager).stop;
		}
	}
	
	function startTopContext () :Void
	{
		if (currentContext != null) {
			#if debug
			com.pblabs.util.Assert.isNotNull(currentContext, "How is the top context null?");
			com.pblabs.util.Assert.isNotNull(currentContext.getManager(IProcessManager), "Where is the IProcessManager?");
			#end
			cast(currentContext.getManager(IProcessManager), ProcessManager).paused = false;//!started;
			newActiveContextSignaler.dispatch(currentContext);
		} else {
			// Log.error("startTopContext, but currentContext==" + currentContext);
		}
	}
	
	function get_currentContext() :IPBContext
	{
		return _contexts[_contexts.length - 1];
	}
	
	function createInjector () :Injector
	{
		return new Injector();
	}
	
	// function get_currentGroup () :IPBGroup
	// {
	//	 return rootGroup;
	// }
	
	// function set_currentGroup (val :IPBGroup) :IPBGroup
	// {
	//	 throw "Cannot set group of PBGameBase";
	//	 return val;
	// }
	
	// #if flash
	// inline function get_displayContainer () :flash.display.Sprite
	// {
	//	 return _displayContainer;
	// }
	// #end
	
	public function initializeManagers():Void
	{
		// Mostly will come from subclasses.
	}
	
	inline static var EMPTY_ARRAY :Array<Dynamic> = [];
}
