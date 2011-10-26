/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import Type;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.maps.MapBuilder;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;
import com.pblabs.util.ds.multimaps.SetMultiMap;

import hsl.haxe.Bond;

using Lambda;

using com.pblabs.util.IterUtil;
using com.pblabs.util.ReflectUtil;
using com.pblabs.util.StringUtil;

/**
  * Manages IPBObject set membership.  It's recommended to 
  * use the "using" import version so that the IPBObjects have 
  * the instance methods.
  *
  * An object can belong to any number of sets.  Removal of 
  * sets do not automatically destroy the set member objects,
  * however, destruction of Entity objects triggers set removal
  */
class SetManager extends PBManager
{
	/** Maps set names to objects */
	var _sets :MultiMap<String, IPBObject>;
	/** Maps set names to objects */
	var _componentSets :MultiMap<String, IEntityComponent>;
	var _components :MultiMap<IEntityComponent, String>;
	/** Maps objects to sets */
	var _objects :MultiMap<IPBObject, String>;
		
	static var EMPTY_STRING_ARRAY :Array<String> = [];
	static var EMPTY_OBJECT_ARRAY :Array<IPBObject> = [];
	static var EMPTY_ENTITY_ARRAY :Array<IEntity> = [];
	static var EMPTY_COMPONENT_ARRAY :Array<IEntityComponent> = [];
	
	//The static functions are for "using" 
	public static function getAllInSet(context :IPBContext, set :String) :Iterable<IPBObject>
	{
		com.pblabs.util.Assert.isNotNull(context);
		com.pblabs.util.Assert.isNotNull(getSetManager(context));
		com.pblabs.util.Assert.isNotNull(getSetManager(context).getObjectsInSet(set));
		com.pblabs.util.Assert.isFalse(set.isBlank());
		return getSetManager(context).getObjectsInSet(set).filter(com.pblabs.util.Predicates.notNull);
	}
	
	public static function destroyAllInSet(context :IPBContext, set :String) :Void
	{
		com.pblabs.util.Assert.isNotNull(context);
		com.pblabs.util.Assert.isNotNull(getSetManager(context));
		return getSetManager(context).destroySet(set);
	}
	
	public static function getAllEntitiesInSet(context :IPBContext, set :String) :Iterable<IEntity>
	{
		com.pblabs.util.Assert.isNotNull(context);
		com.pblabs.util.Assert.isNotNull(getSetManager(context));
		com.pblabs.util.Assert.isNotNull(getSetManager(context).getObjectsInSet(set));
		com.pblabs.util.Assert.isFalse(set.isBlank());
		return getSetManager(context).getEntitiesInSet(set).filter(com.pblabs.util.Predicates.notNull);
	}
	
	public static function addToSet (obj :IEntity, set :String) :IEntity
	{
		getSetManager(obj.context).addObjectToSet(obj , set);
		return obj;
	}
	
	public static function getSets (obj :IPBObject) :Iterable<String>
	{
		var sets = getSetManager(obj.context).getObjectSets(obj);
		return sets == null ? EMPTY_STRING_ARRAY : sets;
	}
	
	public static function removeFromAllSets (obj :IPBObject) :Void
	{
		getSetManager(obj.context).removeObjectFromAll(obj);
	}
	
	public function new ()
	{
		super();
		_sets = SetMultiMap.create(ValueType.TClass(String));
		_objects = SetMultiMap.create(ValueType.TClass(PBObject));
		
		_components = SetMultiMap.create(ValueType.TClass(EntityComponent));
		_componentSets = ArrayMultiMap.create(ValueType.TClass(String));
	}
	
	public function addObjectToSet (obj :IPBObject, set :String) :Void
	{
		Preconditions.checkNotNull(obj);
		Preconditions.checkNotNull(set);
		
		//Add object to set
		if (_sets.existsEntry(set, obj)) {
			return;
		}
		_sets.set(set, obj);
		_objects.set(obj, set);
	}
	
	public function getObjectsInSet(set :String) :Iterable<IPBObject>
	{
		var it = _sets.get(set);
		return it == null ? EMPTY_OBJECT_ARRAY : it;
	}
	
	public function getComponentsInSet (set :String) :Iterable<IEntityComponent>
	{
		var it = _componentSets.get(set);
		return it == null ? EMPTY_COMPONENT_ARRAY : it;
	}
	
	public function getEntitiesInSet(set :String) :Iterable<IEntity>
	{
		var it = _sets.get(set);
		if (it == null) {
			return EMPTY_ENTITY_ARRAY;
		}
		var arr :Array<IEntity> = [];
		for (e in it) {
			if (Std.is(e, IEntity)) {
				arr.push(cast(e, IEntity));
			}
		}
		return arr;
	}
	
	public function getObjectSets (obj :IPBObject) :Iterable<String>
	{
		return _objects.get(obj);
	}
	
	public function isObjectInSet (obj :IPBObject, set :String) :Bool
	{
		return _sets.existsEntry(set, obj);
	}
	
	public function removeObjectFromSet (obj :IPBObject, set :String) :Void
	{
		_sets.removeEntry(set, obj);
		_objects.removeEntry(obj, set);
	}
	
	public function removeSet (set :String) :Iterable<IPBObject>
	{
		var objs = _sets.get(set);
		for (o in objs) {
			_objects.removeEntry(o, set);
		}
		_sets.remove(set);
		return objs;
	}
	
	public function getComponentSets () :Iterable<String>
	{
		return _componentSets.keys().toArray();
	}
	
	public function removeComponentSet (set :String) :Iterable<IEntityComponent>
	{
		var objs = _componentSets.get(set);
		if (objs != null) {
			for (o in objs) {
				_components.removeEntry(o, set);
			}
		}
		_componentSets.remove(set);
		return objs;
	}
	
	public function removeObjectFromAll (obj :IPBObject) :Void
	{
		var objectSets = _objects.get(obj);
		if (objectSets != null) {
			for (s in objectSets) {
				_sets.removeEntry(s, obj);
			}
		}
		_objects.remove(obj);
	}
	
	public function addComponentToSet (component :IEntityComponent, set :String) :Void
	{
		_componentSets.set(set, component);
		_components.set(component, set);
		
		addObjectToSet(component.owner, set);
	}
	
	public function removeComponentFromSets (component :IEntityComponent) :Void
	{
		for (set in _components.get(component)) {
			_componentSets.removeEntry(set, component);
			removeObjectFromSet(component.owner, set);
		}
		_components.remove(component);
	}
	
	public function destroySet (set :String) :Void
	{
		if (!_sets.exists(set) && !_componentSets.exists(set)) {
			return;
		}
		
		if (_sets.exists(set)) {
			for (obj in removeSet(set)) {
				if (obj != null && obj.isLiveObject) {
					obj.destroy();
				}
			}
		}
		
		if (_componentSets.exists(set)) {
			for (comp in removeComponentSet(set)) {
				if (comp != null && comp.isRegistered) {
					comp.owner.destroy();
				}
			}
		}
	}
	
	public function iterator () :Iterator<String>
	{
		return _sets.keys();
	}
	
	public function onObjectDestroyed (obj :IPBObject) :Void
	{
	    removeObjectFromAll(obj);
	}
	
	override public function startup () :Void
	{
		super.startup();
		com.pblabs.util.Assert.isNotNull(context.getManager(SignalBondManager), "SignalBondManager required");
		context.getManager(SignalBondManager).bind(this, cast(context, PBContext).signalObjectRemoved, onObjectDestroyed);
	}	
	
	override public function shutdown():Void
	{
		super.shutdown();
		_sets.clear();
		_objects.clear();
	}
	
	/**
	  * Mark a component class with the @set class attribute, and it will be automatically added to component sets
	  */
	static function isInSet (cls :Class<Dynamic>) :Bool
	{
		var m = haxe.rtti.Meta.getType(cls);
		if (m != null) {
			return Reflect.fields(m).has("set");
		} else {
			return false;
		}
	}
	
	static function getClassSets (cls :Class<Dynamic>) :Array<String>
	{
		var sets = [];
		var m = haxe.rtti.Meta.getType(cls);
		if (m != null) {
			for (field in Reflect.fields(m)) {
				if (field == "sets") {
					for (s in cast(Reflect.field(m, field), Array<Dynamic>)) {
						if (Std.is(s, Array)) {
							for (ss in cast(s, Array<Dynamic>)) {
								sets.push(ss);
							}
						} else {
							sets.push(s);
						}
					}
				} 
			}
		} 
		return sets;
	}
	
	static function getSetManager (context :IPBContext) :SetManager
	{
		Preconditions.checkNotNull(context, "Null context");
		var sm = context.getManager(SetManager);
		Preconditions.checkNotNull(sm, "Cannot find the context SetManager");
		return sm;
	}

	#if debug
	public function toString () :String
	{
		var s = "Sets {";
		for (set in this) {
			s += "\n  " + set + ": " + _sets.get(set).count();
		}
		s += "\n}, objects: " + _objects.keys().toArray().count();
		return s;
	}
	#end
}
