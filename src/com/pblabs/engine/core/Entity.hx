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

import com.pblabs.engine.serialization.Serializer;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.ITickedObject;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using com.pblabs.engine.core.SetManager;
using com.pblabs.util.StringUtil;

/**
 * Default implementation of IEntity.
 * 
 * <p>Please use allocateEntity() to get at instances of Entity; this allows
 * us to pool Entities at a later date if needed and do other tricks. Please
 * program against IEntity, not Entity, to avoid dependencies.</p>
 */
class Entity extends PBObject, 
	implements IEntity
{
	public var destroyedSignal (get_destroyedSignal, null):Signaler<IEntity>;
	var _destroyedSignal :Signaler<IEntity>;
	function get_destroyedSignal () :Signaler<IEntity>
	{
		//Lazily create
		if (_destroyedSignal == null) {
			_destroyedSignal = new DirectSignaler(this);
		}
		return _destroyedSignal;
	}
	
	var _deferring :Bool;
	var _components :Map<String, IEntityComponent>;
	var _deferredComponents :Array<PendingComponent>;
	
	public function new() 
	{
		super();
		_deferring = false;
		_components = Maps.newHashMap(String);
		_deferredComponents = [];
	}
	
	/** Iterate over components */
	public function iterator () :Iterator<IEntityComponent>
	{
		return _components.iterator();
	}
	
	public var deferring(get_deferring, set_deferring) : Bool;
	
	public function get_deferring():Bool
	{
		return _deferring;
	}
	
	public function set_deferring(value:Bool):Bool
	{
		if(_deferring == true && value == false) {
			// Resolve everything, and everything that that resolution triggers.
			var needReset:Bool = _deferredComponents.length > 0;
			var sets = context.getManager(SetManager);
			while(_deferredComponents.length > 0) {
				var pc = _deferredComponents.shift();
				
				//Add the timed components here rather than forcing
				//each implementing class to add itself.
				
				#if cpp
				if (com.pblabs.util.ReflectUtil.is(pc.item, "com.pblabs.engine.time.ITickedObject")) {
				#else
				if (Std.is(pc.item, ITickedObject)) {
				#end
					_context.processManager.addTickedObject(cast(pc.item));
				}
				
				
				#if cpp
				if (com.pblabs.util.ReflectUtil.is(pc.item, "com.pblabs.engine.time.IAnimatedObject")) {
				#else
				if (Std.is(pc.item, IAnimatedObject)) {
				#end
					_context.processManager.addAnimatedObject(cast(pc.item));
				}
				
				injectComponent(pc.item, sets);
				pc.item.register(this, pc.name);
			}
			
			// Mark deferring as done.
			_deferring = false;
			
			// Fire off the reset.
			if(needReset) {
				doResetComponents();
			}				
		}
		_deferring = value;
		return value;
   }
	
	public override function initialize (?name :String = null) :Void
	{
		// Pass control up.
		super.initialize(name);

		// Resolve any pending components.
		deferring = false;
	}
	
	public override function destroy():Void
	{
		// Give listeners a chance to act before we start destroying stuff.
		destroyedSignal.dispatch(this);
		//The context destruction dispatcher
		cast(context, PBContext).dispatchObjectDestroyed(this);
		
		// Unregister our components.
		for (c in _components)
		{
			if(c.isRegistered) {
				c.unregister();
			}
			
			#if debug
			_context.getManager(com.pblabs.engine.core.PBGameBase).callLater(c.postDestructionCheck);
			#end
			
			#if cpp
			if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.ITickedObject")) {
			#else
			if (Std.is(c, ITickedObject)) {
			#end
				_context.processManager.removeTickedObject(cast(c));
			}
			
			
			#if cpp
			if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.IAnimatedObject")) {
			#else
			if (Std.is(c, IAnimatedObject)) {
			#end
				_context.processManager.removeAnimatedObject(cast(c));
			}
		}
		
		// And remove their references from the dictionary.
		for (c in _components.array()) {
			com.pblabs.util.Assert.isNotNull(c, "How can the component be null?");
			_components.remove(c.name);
		}
		
		if (_deferredComponents != null && _deferredComponents.length > 0) {
			for (p in _deferredComponents) {
				p.item.unregister();
			}
		}
		
		// Get out of the NameManager and other general cleanup stuff.
		super.destroy();
		com.pblabs.util.Assert.isFalse(destroyedSignal.isListenedTo);
		_deferring = false;
		_components.clear();
		_deferredComponents = [];
	}
	
	/**
	 * Serializes an entity. Pass in the current XML stream, and it automatically
	 * adds itself to it.
	 * @param	xml the <things> XML stream.
	 */
	public function serialize(xml :Xml):Void
	{
		var entityXML = Xml.createElement("entity");
		entityXML.set("name", name);
		
		var serializer = context.getManager(Serializer); 
		for (component in _components) {
			var componentXML = Xml.createElement("component");
			componentXML.set("name", component.name);
			componentXML.set("type", ReflectUtil.getClassName(component));			
			serializer.serialize(component, componentXML);
			entityXML.addChild(componentXML);
		}

		xml.addChild(entityXML);			
	}
	
	public function deserialize(xml :Xml, ?registerComponents:Bool = true) :Void
	{
		// Note what entity we're deserializing to the Serializer.
		context.getManager(Serializer).setCurrentEntity(this);

		// Push the deferred state.
		var oldDefer = deferring;
		deferring = true;
		
		var serializer = context.getManager(Serializer);
		com.pblabs.util.Assert.isNotNull(serializer);
		
		// Process each component tag in the xml.
		for (componentXML in xml.elements())
		{
			// Error if it's an unexpected tag.
			if(componentXML.nodeName.toLowerCase() != "component") {
				com.pblabs.util.Log.error("Found unexpected tag '" + componentXML.nodeName + "', only <component/> is valid, ignoring tag, error in entity '" + name + "'.");
				continue;
			}
			
			var componentName = componentXML.get("name");
			var componentClassName = componentXML.get("type");
			var component :IEntityComponent = null;
			
			if (!componentClassName.isBlank()) {
				// If it specifies a type, instantiate a component and add it.
				var type :Class<Dynamic> = Type.resolveClass(componentClassName);
				if (null == type) {
					com.pblabs.util.Log.error("Unable to find type '" + componentClassName + "' for component '" + componentName +"' on entity '" + name + "'.");
					continue;
				}
				
				component = cast(context.allocate(type), IEntityComponent);
				if (null == component) {
					com.pblabs.util.Log.error("Unable to instantiate component " + componentName + " of type " + componentClassName + " on entity '" + name + "'.");
					continue;
				}
				
				if (!addComponent(component, componentName)) {
					continue;
				}
			} else {
				// Otherwise just get the existing one of that name.
				component = getComponentByName(componentName);
				if (null == component) {
					com.pblabs.util.Log.error("No type specified for the component " + componentName + " and the component doesn't exist on a parent template for entity '" + name + "'.");
					continue;
				}
			}
			
			com.pblabs.util.Log.debug("deserializing component " + componentName);
			// Deserialize the XML into the component.
			serializer.deserialize(component, componentXML);
			com.pblabs.util.Log.debug("deserialized component " + componentName);
		}
		
		// Deal with set membership.
		var setsAttr = xml.get("sets");
		if (!setsAttr.isBlank()) {
			// The entity wants to be in some sets.
			var setNames = setsAttr.split(",").map(StringTools.trim);
			if (setNames != null) {
				// There's a valid-ish set string, let's loop through the entries
				var sets = context.getManager(SetManager);
				for (set in setNames) {
					if (!set.isBlank()) {
						this.addToSet(set);
					}
				}
			}
		}			
		
		// Restore deferred state.
		deferring = oldDefer;
	}
	
	public function addComponent (c :IEntityComponent, ?componentName :String) :Bool
	{
		Preconditions.checkNotNull(c, "Cannot add a null component");
		
		componentName = componentName == null ? PBUtil.getDefaultComponentName(Type.getClass(c)) : componentName; 
		// Check the context.
		com.pblabs.util.Assert.isTrue(c.context != null, "Component has a null context!");
		com.pblabs.util.Assert.isTrue(context != null, "Entity has a null context!");
		com.pblabs.util.Assert.isTrue(c.context == context, "Component and entity are not from same context!");
		
		// Add it to the dictionary.
		if (!doAddComponent(c, componentName)) {
			return false;
		}

		// If we are deferring registration, put it on the list.
		if (deferring) {
			var p = new PendingComponent();
			p.item = c;
			p.name = componentName;
			_deferredComponents.push(p);
			return true;
		}
		injectComponent(c);
		
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.ITickedObject")) {
		#else
		if (Std.is(c, ITickedObject)) {
		#end
			_context.processManager.addTickedObject(cast(c));
		}
		
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.IAnimatedObject")) {
		#else
		if (Std.is(c, IAnimatedObject)) {
		#end
			_context.processManager.addAnimatedObject(cast(c));
		}
		// We have to be careful w.r.t. adding components from another component.
		c.register(this, componentName);
		// Fire off the reset.
		doResetComponents();
		
		return true;
	}
	
	public function removeComponent(component:IEntityComponent):Void
	{
		com.pblabs.util.Assert.isNotNull(component, "Why is the component null? " + com.pblabs.util.Log.getStackTrace());
		
		#if debug
		_context.getManager(com.pblabs.engine.core.PBGameBase).callLater(component.postDestructionCheck);
		#end
		
		// Update the dictionary.
		if (component.isRegistered && !doRemoveComponent(component))
			return;

		// Deal with pending.
		if(!component.isRegistered)
		{
			// Remove it from the deferred list.
			for(i in 0..._deferredComponents.length)
			{
				if((cast( _deferredComponents[i], PendingComponent)).item != component)
					continue;
				
				// TODO: Forcibly call register/unregister to ensure onAdd/onRemove semantics?
				_deferredComponents.splice(i, 1);
				break;
			}
			
			for (k in _components.keys()) {
				if (_components.get(k) == component) {
					_components.remove(k);
					break;
				}
			}

			return;
		}
		
		component.unregister();
		if (!deferring) {
			doResetComponents();
		}
	}
	
	public function getComponentByType <T>(componentType:Class<T>):T
	{
		for (c in _components)
		{
			#if cpp
			com.pblabs.util.Assert.isTrue(Type.getClassName(componentType) != "Dynamic");
			#end
			if (Std.is(c, componentType))
				return cast(c);
		}
		
		return null;
	}
	
	public function getComponent <T>(componentType:Class<T>):T
	{
		return getComponentByType(componentType);
	}
	
	public function getComponentsByType <T>(componentType:Class<T>):Array<T>
	{
		var list = new Array();
		
		#if cpp
		com.pblabs.util.Assert.isTrue(Type.getClassName(componentType) != "Dynamic");
		#end
			
		for (component in _components)
		{
			if (Std.is(component, componentType))
				list.push(component);
		}
		
		return cast(list);
	}
	
	public function getComponentByName <T>(componentName:String):T
	{
		return cast(_components.get(componentName));
	}
	
	public function doesPropertyExist (property :PropertyReference<Dynamic>):Bool
	{
		return _context.getProperty(property, null, this, true) != null;
	}
	
	public function getProperty <T> (property :PropertyReference<T>, ?defaultVal :T = null) :T
	{
		return _context.getProperty(property, defaultVal, this);
	}
	
	public function setProperty (property :PropertyReference<Dynamic>, value :Dynamic) :Void
	{
		_context.setProperty(property, value, this);
	}
	
	function doAddComponent(c:IEntityComponent, componentName:String):Bool
	{
		if (componentName == "") {
			com.pblabs.util.Log.warn(["AddComponent", "A component name was not specified. This might cause problems later."]);
		}
		
		if (c.owner != null) {
			com.pblabs.util.Log.error(["AddComponent", "The component " + componentName + " already has an owner. (" + name + ")"]);
			return false;
		}
		
		if (_components.exists(componentName)) {
			com.pblabs.util.Log.error(["AddComponent", "A component with name " + componentName + " already exists on this entity (" + name + ")."]);
			return false;
		}
		
		c.owner = this;
		c.name = componentName;
		_components.set(componentName, c);
		return true;
	}
	
	function doRemoveComponent(c:IEntityComponent):Bool
	{
		if (c.owner != this)
		{
			com.pblabs.util.Log.error(["doRemoveComponent", "The component " + c.name + " is not owned by this entity. (" + name + ")"]);
			return false;
		}
		
		if (_components.get(c.name) == null)
		{
			com.pblabs.util.Log.error(["doRemoveComponent", "The component " + c.name + " was not found on this entity. (" + name + ")"]);
			return false;
		}
		
		_components.remove(c.name);
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.ITickedObject")) {
		#else
		if (Std.is(c, ITickedObject)) {
		#end
			_context.processManager.removeTickedObject(cast(c));
		}
		
		
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.IAnimatedObject")) {
		#else
		if (Std.is(c, IAnimatedObject)) {
		#end
			_context.processManager.removeAnimatedObject(cast(c));
		}
		return true;
	}
	
	/**
	 * Call reset on all the registered components in this entity.
	 */
	function doResetComponents():Void
	{
		com.pblabs.engine.debug.Profiler.enter("doResetComponents");
		var oldDefer:Bool = _deferring;
		deferring = true;
		
		var sm = context.getManager(SignalBondManager);
		sm.destroyBondOnEntity(this);
		
		var sets = context.getManager(SetManager);
		
		com.pblabs.util.Log.debug(name + " started reseting");
		for (component in _components)
		{
			// Skip unregistered entities. 
			if(!component.isRegistered) {
				continue;
			}
			
			//Reset it!
			com.pblabs.util.Log.debug("    reseting " + component.name);
			com.pblabs.engine.debug.Profiler.enter("reseting " + component.name);
			component.reset();
			com.pblabs.engine.debug.Profiler.exit("reseting " + component.name);
			com.pblabs.util.Log.debug("    done reseting " + component.name);
		}
		com.pblabs.util.Log.debug("  finished reseting");
		com.pblabs.engine.debug.Profiler.exit("doResetComponents");
		deferring = false;
	}
	
	function injectComponent (c :IEntityComponent, ?sets :SetManager = null) :Void
	{
		sets = sets == null ? context.getManager(SetManager) : sets;
		//Inject the component fields
		 _context.injectInto(c);
		 //Inject the sets (components annotated with @sets("set1", "set2") at the constructor
		 if (sets != null) {
		 	 sets.injectSets(c);
		 } else {
		 	 com.pblabs.util.Log.warn("No SetManager, cannot inject IEntityComponents into sets");
		 }
	}
}

class PendingComponent
{
	public function new () {}
	
	public var item :IEntityComponent;
	public var name :String;
}
