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

import com.pblabs.engine.core.Entity;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBGroup;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBGroup;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.injection.ComponentInjector;
import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Assert;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;

import hsl.haxe.Bond;
import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

class PBContext
	implements IPBContext 
{
	public var name (default, null) :String;
	public var started (default, null) :Bool;
	public var rootGroup (default, null) :IPBGroup;
	public var currentGroup(get_currentGroup, set_currentGroup) : IPBGroup;
	public var processManager (get_processManager, null) :IProcessManager;
	
	public var signalObjectAdded (default, null) :Signaler<IPBObject>;
	public var signalObjectRemoved (default, null) :Signaler<IPBObject>;
	
	/**
	 * Maps full property name e.g. #entity2.component3 to
	 * a list of Bonds.  These can be destroyed when the 
	 * component is reset.
	 */
	// public var objectBonds (default, null) :MultiMap<String, Bond>;
	
	// #if flash
	// public var displayContainer (get_displayContainer, null) :flash.display.Sprite;
	// var _displayContainer :flash.display.Sprite;
	// #end
	
	public var injector :Injector;
	var _managers :Map<String, Dynamic>;
	
	var _processManager :IProcessManager;
	var _tempPropertyInfo :PropertyInfo;
	var _currentGroup :IPBGroup;
	var _nameManager :NameManager;
	var _isSetup :Bool;
	
	public function new (?name:String)
	{
		_isSetup = false;
		if (name == null) {
			initializeName();
		} else {
			this.name = name;
		}
			
		injector = createInjector();
		_managers = Maps.newHashMap(String);
		_processManager = registerManager(IProcessManager, createProcessManager(), true);
		_tempPropertyInfo = new PropertyInfo();
		signalObjectAdded = new DirectSignaler(this);
		signalObjectRemoved = new DirectSignaler(this);
	}
	
	public function allocateEntity () :IEntity
	{
		return allocate(Entity);
	}
	
	/**
	 * Adds a GameObject to the Context. The GameObject must not be owned by another ObjectDB.
	 */
	public function register (object :IPBObject) :Void //Returns object for convenience
	{
		Preconditions.checkNotNull(object, "Cannot register a null object");
		Preconditions.checkNotNull(_nameManager, "NameManager not yet initialized");
		Preconditions.checkNotNull(rootGroup, "rootGroup not yet initialized");
		// Register with the NameManager.
		_nameManager.add(object);
		
		// Add to default group when appropriate.
		if (object.owningGroup == null) {
			if (_currentGroup != null) {
				object.owningGroup = _currentGroup;
			} else {
					throw "Had null currentGroup; currentGroup should always be a value, and should be rootGroup by default.";
			}
		} else if (object.owningGroup.rootGroup != rootGroup) {
			throw "Object group is not null, but the root group is not this context's root group";
		}
		
		Preconditions.checkArgument(object.owningGroup.rootGroup == rootGroup, "Object root group is not the context");
		
		// var gameObj = cast(obj, GameObject);
		
		// Preconditions.checkNotNull(gameObj, "obj must be non-null and of type GameObject");
		// Preconditions.checkArgument(!gameObj.isLiveObject, "obj already belongs to an ObjectDB");
		
		
		// //Add object to various holders
		// _gameObjects.add(gameObj);
		
		// // does the object have a name?
		// var objectName :String = obj.name;
		// if (null != objectName) {
		//	 _namedObjects.set(objectName, gameObj);
		// }

		// //Updating
		// if (Std.is(obj, ITickedObject)) {
		//	 _updatableObjectManager.addObject(cast( obj, ITickedObject));
		// }
		
		// //Groups
		// if (Std.is(obj, IGroupObject)) {
		//	 for (group in cast(obj, IGroupObject).groupNames()) {
		//		 addToGroup(group, obj);
		//	 }
		// }
		
		// // initialize object
		// var friend :GameObjectFriend = gameObj;
		// friend._parentDB = this;
		// friend.addedToDBInternal();
		
		// //Add the component groups here, the components may have 
		// //been modified after onAdd
		// if (Std.is(obj, Entity)) {
		//	 for (c in cast(obj, Entity)._components) {
		//		 if (Std.is(c, IGroupObject)) {
		//			 for (group in cast(c, IGroupObject).groupNames()) {
		//				 addToGroup(group, obj);
		//			 }
		//		 }
		//	 }
		// }
		
		// ++_objectCount;
		
		// objectAddedSignal.dispatch(gameObj);
		signalObjectAdded.dispatch(object);
	}
	
	//TODO: use object pooling
	public function allocate <T>(type :Class<T>) :T
	{                                                                           
		Assert.isNotNull(currentGroup);
		Assert.isTrue(currentGroup.context == this);
		Preconditions.checkNotNull(type, "Type class is null");
		
		if (type == IEntity) {
			untyped type = Type.resolveClass("com.pblabs.engine.core.Entity");
		}
		#if disable_object_pooling
		var i = Type.createInstance(type, EMPTY_ARRAY);
		#else
		var i = com.pblabs.engine.pooling.ObjectPoolMgr.SINGLETON.get(type);
		#end
		Assert.isNotNull(i, "allocated'd instance is null, type=" + type);
		//Components get injected by the entity
		if (!Std.is(i, IEntityComponent)) {
			injector.injectInto(i);
		} else {
			cast(i, IEntityComponent).context = this;
		}
		return i;
	}
	
	public function unregister (object :IPBObject) :Void
	{
		// Clear out the NameManager.
		_nameManager.remove(object);
		//Remove object from sets
		// getManager(SetManager).removeObjectFromAll(object);
		
	}
	
	public function dispatchObjectDestroyed (obj :IPBObject) :Void
	{
	    signalObjectRemoved.dispatch(obj);
	}
	
	public function getObjectNamed (name :String) :IPBObject
	{
		return _nameManager.get(name);
	}
	
	public function setup () :Void
	{
		com.pblabs.util.Assert.isFalse(_isSetup, "Only call setup once");
		_isSetup = true;
		Preconditions.checkNotNull(injector, "WTF is the injector null?");
		_nameManager = getManager(NameManager);
		
		Preconditions.checkNotNull(_nameManager, "WTF is the nameManager null?");
		
		injector.mapValue(IPBContext, this);
		Preconditions.checkArgument(injector.getMapping(IPBContext) == this, "Injector borked");

		// Set up root and current group.
		//The root group cannot easily be injected due to 
		//conflicting root groups/contexts at this stage.
		//Better to just setup this important group manually.
		var rg = new PBGroup();
		rg.context = this;
		// rg.owningGroup = rg;
		rg.name = _nameManager.validateName(name + " RootGroup");
		_nameManager.add(rg);
		rootGroup = rg;
		com.pblabs.util.Log.debug("about to set current group, currentGroup=" + currentGroup);
		currentGroup = rg;
		com.pblabs.util.Log.debug("done set current group");
		injector.mapValue(IPBGroup, rootGroup);
		
		// Do manager startup.
		initializeManagers();
	}
	
	public function enter () :Void
	{
	}
	
	/** Subclasses override */
	public function exit () :Void
	{
	}

	public function initializeManagers():Void
	{
		// Mostly will come from subclasses.
		//Some core classes
		//Needed for correct operation of many core components
		// registerManager(com.pblabs.engine.core.SignalBondManager, new com.pblabs.engine.core.SignalBondManager());
		// registerManager(SetManager, new SetManager());
		
		//Some core managers that
		// registerManager(SignalBondManager, new SignalBondManager());
		// registerManager(SetManager, new SetManager());
	}

	// public function registerManager <T> (clazz :Class<T>, 
	//	 ?instance :T = null, ?name :String = null, ?suppressInject :Bool = false) :T
	// {
	//	 var i:T = if (instance == null) Type.createInstance(clazz, null) else instance;
	//	 name = getManagerName(clazz, name);
	//	 _managers.set(name, i);
	//	 // _managers[clazz + "|" + name] = i;
	//	 // injector.mapValue(clazz, i, name);
	//	 if (!suppressInject) {
	//		 injector.injectInto(i);
	//	 }
		
	//	 if (Std.is(i, IPBManager)) {
	//		 cast(i, IPBManager).startup();
	//	 }
	//	 return i;
	// }
	
	public function getManager <T>(cls :Class<T>, ?name :String = null):T
	{
		// trace("getManager, key=" + 
		// return _managers.get(Util.getManagerName(clazz, name));
		return injector.getMapping(cls, name);
		//injector.getMapping(clazz, optionalName).getResponse(injector);
	}
	
	public function unregisterManager (clazz:Class<Dynamic>, ?name :String = null) :Void
	{
		var mng = _managers.remove(PBUtil.getManagerName(clazz, name));
		if (Std.is(mng, IPBManager)) {
			cast(mng, IPBManager).shutdown();
		}
		injector.unmap(clazz, name);
	}
	
	// public function registerContext (ctx :IPBContext):Void
	// {
	//	 Preconditions.checkArgument(!_contexts.exists(ctx.name), "Cannot have two contexts with the same name!"); 
		
	//	 // Store it and set up.
	//	 _contexts.set(ctx.name, ctx);
	//	 // var ctxObj:Dynamic = ctx;
	//	 // if(ctxObj['setInjectorParent'])
	//	 //	 ctxObj.setInjectorParent(injector);
	// }
	
	// public function unregisterContext(ctx:IPBContext):Void
	// {
	//	 Preconditions.checkNotNull(_contexts.get(ctx.name), "Unknown context '" + ctx.name + "'!");
	//	 _contexts.remove(ctx.name);
		
	//	 // Remove everything.
	//	 // var ctxObj:Dynamic = ctx;
	//	 // if(ctxObj['setInjectorParent'])
	//	 //	 ctxObj.setInjectorParent(null);
	//	 // _contexts[ctx.name] = null;
	// }
	
	public function inject (object :Dynamic) :Void
	{
		// injector.injectInto(object);
	}
	
	
	public function shutdown () :Void
	{
		_processManager.shutdown();
		rootGroup.destroy();
		rootGroup = null;
		_currentGroup = null;
		for (m in _managers) {
			if (Std.is(m, IPBManager)) {
				cast(m, IPBManager).shutdown();
			}
		}
		
		var game = getManager(PBGameBase);
		com.pblabs.util.Assert.isNotNull(game);
		
		
		_managers = null;
		injector = null;
		_tempPropertyInfo = null;
	}
	
	function initializeName():Void
	{
		contextNameCounter++;
		name = "Context" + contextNameCounter;
	}
	
	function get_currentGroup () :IPBGroup
	{
		return _currentGroup;
	}
	
	function set_currentGroup (val :IPBGroup) :IPBGroup
	{
		Preconditions.checkNotNull(val, "You cannot set the currentGroup to null; it must always be a valid PBGroup.");
		Preconditions.checkArgument(val.context == this, "Cannot mix objects between contexts. this=" + ReflectUtil.getClassName(this) + ", this.group=" + this.currentGroup + ", val=" + val);
		_currentGroup = val;
		return val;
	}
	
	static var contextNameCounter :Int = 0;
	
	public function lookup(name:String):Dynamic
	{
		return _nameManager.get(name);			
	}
	
	public function lookupEntity(name:String):IEntity
	{
		return cast(_nameManager.get(name), IEntity);			
	}
	
	public function lookupComponent(entityName:String, componentName:String):IEntityComponent
	{
		return _nameManager.getComponentByName(entityName, componentName);
	}		
	
	//Returns manager for convenience
	public function registerManager <T>(clazz:Class<Dynamic>, ?instance:T = null, ?optionalName:String="", ?suppressInject:Bool = false):T
	{
		if (instance == null) {
			instance = allocate(clazz);
		}

		com.pblabs.util.Assert.isFalse(_managers.exists(PBUtil.getManagerName(clazz, optionalName)), "A manager already exists " + PBUtil.getManagerName(clazz, optionalName));
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
	
	public function setInjectorParent (i :Injector) :Void
	{
		Preconditions.checkNotNull(i);
		injector.parent = i;
	}

	public function injectInto(instance:Dynamic):Void
	{
		injector.injectInto(instance);			
	}
	
	static function findProperty <T> (db :PBContext, entity :IEntity, reference :PropertyReference<T>, ?willSet :Bool = false, ?providedPi :PropertyInfo = null, ?suppressErrors :Bool = false) :PropertyInfo
	{
		// Early out if we got a null property reference.
		if (reference == null || reference.property == null || reference.property == "") {
			// com.pblabs.util.Log.debug("  null bail out early");
			return null;
		}

		// Must have a propertyInfo to operate with.
		if (providedPi == null) {
			providedPi = new PropertyInfo();
		}

		// Cached lookups apply only to components.
		if (reference.cachedLookup != null && reference.cachedLookup.length > 0) {
			if (entity == null) {
				com.pblabs.util.Log.error("Cached prop lookup, but entity is null");
				return null;
			}
			
			var cl:Array<String> = reference.cachedLookup;
			var cachedWalk:Dynamic = entity.lookupComponentByName(cl[0]);
			if (!cachedWalk) {
				handleMissingProperty(suppressErrors, reference, cl[0]);
				return null;
			}

			for (i in 1...cl.length - 1) {
				cachedWalk = Reflect.field(cachedWalk, cl[i]);
				if (cachedWalk == null) {
					handleMissingProperty(suppressErrors, reference, cl[i]);
					return null;
				}
			}

			var cachedPi:PropertyInfo = providedPi;
			cachedPi.propertyParent = cachedWalk;
			cachedPi.propertyName = if (cl.length > 1) cl[cl.length - 1] else null;
			return cachedPi;
		}

		// Split up the property reference.
		var propertyName:String = reference.property;
		var path:Array<String> = propertyName.split(".");

		// Distinguish if it is a component reference (@), named object ref (#), or
		// an X ML reference (!), and look up the first element in the path.
		var isTemplateXML :Bool = false;
		var itemName :String = path[0];
		var curIdx :Int = 1;
		var startChar :String = itemName.charAt(0);
		var curLookup :String = itemName.substr(1);
		var parentElem :Dynamic = null;
		if (startChar == "@") {
			if (entity == null) {
				com.pblabs.util.Log.error("component ref but no entity given for " + reference + " " + com.pblabs.util.Log.getStackTrace());
				return null;
			}
			
			// Component reference, look up the component by name.
			parentElem = entity.lookupComponentByName(curLookup);
			if (parentElem == null) {
				handleMissingProperty(suppressErrors, reference, curLookup);
				return null;
			}

			// Cache the split out string.
			path[0] = curLookup;
			reference.cachedLookup = path;
		} else if (startChar == "#") {
			// Named object reference. Look up the entity in the NameManager.
			//			parentElem = NameManager.instance.lookup(curLookup);
			parentElem = db._nameManager.get(curLookup);
			if (parentElem == null) {
				handleMissingProperty(suppressErrors, reference, curLookup);
				return null;
			}

			// Get the component on it.
			curIdx++;
			curLookup = path[1];
			var comLookup :IEntityComponent = cast(parentElem, IEntity).lookupComponentByName(curLookup);
			if (comLookup == null) {
				handleMissingProperty(suppressErrors, reference, curLookup,
					"Could not find component on named entity '" + (cast( parentElem, IEntity)).name +
					"'");
				return null;
			}
			parentElem = comLookup;
		} 
		else if (startChar == "!") {
			throw "! XML referencing not supported yet";
		} else {
			handleMissingProperty(suppressErrors, reference, startChar,
				"Got a property path that doesn't start with !, #, or @");
			return null;
		}

		// Make sure we have a field to look up.
		if (curIdx < path.length) {
			curLookup = path[curIdx++];
		}
		else {
			curLookup = null;
		}

		// Do the remainder of the look up.
		while (curIdx < path.length && parentElem != null) {
			// Try the next element in the path.
			var oldParentElem :Dynamic = parentElem;
			try {
				parentElem = Reflect.field(parentElem, curLookup);
			} catch (e :String) {
				parentElem = null;
			}
			

			// Several different possibilities that indicate we failed to advance.
			var gotEmpty:Bool = false;
			if (parentElem == null) {
				gotEmpty = true;
			}
			if (parentElem == null) {
				gotEmpty = true;
			}

			if (gotEmpty) {
				handleMissingProperty(suppressErrors, reference, curLookup);
				return null;
			}

			// Advance to next element in the path.
			curLookup = path[curIdx++];
		}

		// Did we end up with a match?
		if (parentElem != null) {
			var pi:PropertyInfo = providedPi;
			pi.propertyParent = parentElem;
			pi.propertyName = curLookup;
			return pi;
		}
		return null;
	}
	
	static function checkForHaxeProperties (info :PropertyInfo, p :PropertyReference<Dynamic>) :Void
	{
		Preconditions.checkNotNull(info, "Null PropertyInfo");
		
		if (info.propertyParent == null) {
			com.pblabs.util.Log.error(["info.propertyParent", info.propertyParent]);
			return;
		}
		
		if (Lambda.has(Type.getInstanceFields(Type.getClass(info.propertyParent)), "get_" + info.propertyName)) {
			// trace("Found getter=" + "get_" + info.propertyName);
			p.getterName = "get_" + info.propertyName;
		}
		if (Lambda.has(Type.getInstanceFields(Type.getClass(info.propertyParent)), "set_" + info.propertyName)) {
			p.setterName = "set_" + info.propertyName;
		}
		p.getterSetterChecked = true;
	}

	public static function handleMissingProperty (suppressErrors :Bool,
		reference :PropertyReference<Dynamic>, context :Dynamic, ?msg :String = null) :Void
	{
		if (suppressErrors) {
			return;
		}
		if (msg == null) {
			msg = "findProperty couldn't resolve";
		}
		com.pblabs.util.Log.warn([msg, "context", context, "ref", reference.property, com.pblabs.util.Log.getStackTrace()]);
	}
	
	public function getProperty<T> (property :PropertyReference<T>, ?defaultVal :T = null, ?entity :IEntity = null) :T
	{
		if (property == null) {
			return null;
		}
		// Look up the property.
		var info :PropertyInfo = findProperty(this, entity, property, false, _tempPropertyInfo, false);
		var result :T = null;
		if (info != null && !property.getterSetterChecked) {
			checkForHaxeProperties(info, property);
		}
		// Get value if any.
		if (info != null) {
			result = info.getValue(property);
		}
		else {
			result = defaultVal;
		}

		// Clean up to avoid dangling references.
		_tempPropertyInfo.clear();

		return result;
	}
	
	public function setProperty (property :PropertyReference<Dynamic>, value :Dynamic, ?entity :IEntity = null) :Void
	{
		com.pblabs.util.Assert.isNotNull(property);
		// Look up and set.
		var info:PropertyInfo = findProperty(this, entity, property, true, _tempPropertyInfo);
		
		if (info != null && !property.getterSetterChecked) {
			checkForHaxeProperties(info, property);
		}
		
		
		if (info != null) {
			info.setValue(value, property);
		} else {
			com.pblabs.util.Log.warn(["property", property, "info", info]);
		}

		// Clean up to avoid dangling references.
		_tempPropertyInfo.clear();
	}
	
	function get_processManager () :IProcessManager
	{
		return _processManager;
	}
	
	function createInjector () :Injector
	{
		return new ComponentInjector();
	}
	
	function createProcessManager () :IProcessManager
	{
		return new ProcessManager();	
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}

/**
 * Internal class used by Entity to service property lookups.
 */
class PropertyInfo
 {
	public function new() 
	{
		propertyParent = null;
		propertyName = null;
		isRuntimeProperty = false;
	}
	
	public var propertyParent :Dynamic;
	public var propertyName :String;
	public var isRuntimeProperty :Bool;

	public function getValue <T> (p :PropertyReference<T>) :T
	{
		Preconditions.checkNotNull(p, "PropertyReference cannot be null");
		if(propertyName != null) {
			if (p.getterName == null) {
				// return getCheckForSignalVars(Reflect.field(propertyParent,  propertyName));
				return Reflect.field(propertyParent,  propertyName);
			} else {
				return Reflect.callMethod(propertyParent, Reflect.field(propertyParent, p.getterName), EMPTY_ARRAY);
			}
		}
		else {
			return propertyParent;
		}
	}

	public function setValue<T> (value :Dynamic, ?p :PropertyReference<T>) :Void
	{
		if (propertyName != null) {
			// if (p == null || p.setterName == null && !setCheckForSignalVars(Reflect.field(propertyParent,  propertyName), value)) {
			if (p == null || p.setterName == null) {
				Reflect.setField(propertyParent,  propertyName, value);
			} else {
				Reflect.callMethod(propertyParent, Reflect.field(propertyParent, p.setterName), [value]);
			}
		}
	}

	public function clear():Void
	{
		propertyParent = null;
		propertyName = null;
		isRuntimeProperty = false;
	}
	
	public function toString () :String
	{
		return "PropertyInfo propertyParent=" + ReflectUtil.getClass(propertyParent) + ", propertyName=" + propertyName + ", isRuntimeProperty=" + isRuntimeProperty;
	}
	
	// inline function getCheckForSignalVars<T> (field :Dynamic) :T
	// {
	//	 if (Std.is(field, SignalVar)) {
	//		 return cast(field, SignalVar<Dynamic>).value;
	//	 } else {
	//		 return field;
	//	 }
	// }
	
	// inline function setCheckForSignalVars<T> (field :Dynamic, val :T) :Bool
	// {
	//	 if (Std.is(field, SignalVar)) {
	//		 cast(field, SignalVar<Dynamic>).value = val;
	//		 return true;
	//	 } else {
	//		 return false;
	//	 }
	// }
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}
