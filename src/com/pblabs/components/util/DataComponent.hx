/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.util;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;

import haxe.Serializer;

import Type;

import haxe.Unserializer;

using Lambda;

/**
* Container for arbitrary data. As it is dynamic, you can set whatever
* fields you want. Useful for storing general purpose data.
*/

class DataComponent<T> extends EntityComponent, 
	implements Dynamic<T>, implements ISerializable
{
	static var COMPONENT_NAME = "DataComponent";
	
	public static function setEntityData (e :IEntity, key :String, val :Dynamic) :IEntity
	{
		ensureComponent(e).set(key, val);
		return e;
	}
	
	public static function getEntityData <DataType>(e :IEntity, key :String) :DataType
	{
		return ensureComponent(e).get(key);
	}
	
	public static function removeEntityData <DataType>(e :IEntity, key :String) :Void
	{
		return ensureComponent(e).remove(key);
	}
	
	public static function ensureComponent (e :IEntity) :DataComponent<Dynamic>
	{
		if (e.getComponent(DataComponent) == null) {
			e.addComponent(e.context.allocate(DataComponent), COMPONENT_NAME);
		}
		return e.getComponentByName(COMPONENT_NAME);
	}
	
	var _addedFields :Set<String>;
	
	public function new() 
	{
		super();
		_addedFields = Sets.newSetOf(ValueType.TClass(String));
	}
	
	public function get (key :String) :Dynamic
	{
		return Reflect.field(this, key);
	}
	
	public function set (key :String, value :Dynamic) :Void
	{
		if (value == null) {
			remove(key);
		} else {
			Reflect.setField(this, key, value);
			_addedFields.add(key);
		}
	}
	
	public function remove (key :String) :Void
	{
		_addedFields.remove(key);
		Reflect.deleteField(this, key);
	}
	
	public function serialize (xml :Xml) :Void
	{
		var s = new Serializer();
		var map = new Hash<Dynamic>();
		for (f in _addedFields) {
			map.set(f, Reflect.field(this, f));
		}
		s.serialize(map);
		xml.set("data", s.toString());
	}
	
	public function deserialize (xml :Xml) :Dynamic
	{
		var d = new Unserializer(xml.get("data"));
		var map :Hash<Dynamic> = d.unserialize();
		for (key in map.keys()) {
			_addedFields.add(key);
			Reflect.setField(this, key, map.get(key));
		}
		return this;
	}
	
	override public function unregister():Void
	{
		super.unregister();
		//Copy since the set is modified in the loop
		for (f in _addedFields.array()) {
			remove(f);
		}
		_addedFields.clear();
	}
}
