/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.MultiMap;
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
class SetManager extends PBManagerBase,
	implements haxe.rtti.Infos
{
	var _bonds :Array<Bond>;
	
	//The static functions are for "using" 
	public static function getAllInSet(context :IPBContext, set :String) :Iterable<IPBObject>
	{
		com.pblabs.util.Assert.isNotNull(context);
		com.pblabs.util.Assert.isNotNull(getSetManager(context));
		com.pblabs.util.Assert.isNotNull(getSetManager(context).getObjectsInSet(set));
		com.pblabs.util.Assert.isFalse(set.isBlank());
		return getSetManager(context).getObjectsInSet(set).filter(com.pblabs.util.Predicates.notNull);
	}
	
	public static function addToSet (obj :IPBObject, set :String) :Void
	{
		getSetManager(obj.context).addObjectToSet(obj , set);
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
		_bonds = [];
		_sets = SetMultiMap.create(String);
		_objects = SetMultiMap.create(PBObject);
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
	
	public function getEntitiesInSet(set :String) :Iterable<IEntity>
	{
		var it = _sets.get(set);
		return cast(it == null ? EMPTY_OBJECT_ARRAY : it);
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
		var objs = _sets.get(set).array();
		for (o in objs) {
			_objects.removeEntry(o, set);
		}
		_sets.remove(set);
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
	
	public function destroySet (set :String) :Void
	{
		for (obj in removeSet(set)) {
			obj.destroy();
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
	
	override public function shutdown():Void
	{
		removeBonds();
		_bonds = null;
		_sets.clear();
		_objects.clear();
		_sets = null;
		_objects = null;
		super.shutdown();
	}
	
	public function injectSets (obj :IEntityComponent, ?cls :Class<Dynamic>) :Void
	{
		cls = cls == null ? obj.getClass() : cls;
		
		var m = haxe.rtti.Meta.getType(cls);
		
		if (m != null) {
			for (field in Reflect.fields(m)) {
				if (field == "sets") {
					for (s in cast(Reflect.field(m, field), Array<Dynamic>)) {
						addObjectToSet(obj.owner, s);				
					}
				}
			}
		}
	}
	
	override function onNewContext () :Void
	{
		com.pblabs.util.Assert.isNotNull(context);
	    _bonds.push(cast(context, PBContext).signalObjectRemoved.bind(onObjectDestroyed));		
	}
	
	override function onContextRemoval () :Void
	{
		removeBonds();
	}
	
	function removeBonds () :Void
	{
		for (bond in _bonds) {
			bond.destroy();
		}
		_bonds = [];
	}
	
	static function getSetManager (context :IPBContext) :SetManager
	{
		Preconditions.checkNotNull(context, "Null context");
		var sm = context.getManager(SetManager);
		Preconditions.checkNotNull(sm, "Cannot find the context SetManager");
		return sm;
	}

	/** Maps set names to objects */
	var _sets :MultiMap<String, IPBObject>;
	/** Maps objects to sets */
	var _objects :MultiMap<IPBObject, String>;
	
	static var EMPTY_STRING_ARRAY :Array<String> = [];
	static var EMPTY_OBJECT_ARRAY :Array<IPBObject> = [];
	
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
