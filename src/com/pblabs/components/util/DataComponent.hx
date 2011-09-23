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

import haxe.Serializer;

import haxe.Unserializer;

using Lambda;
/**
* Container for arbitrary data. As it is dynamic, you can set whatever
* fields you want. Useful for storing general purpose data.
*/

class DataComponent<T> extends EntityComponent, 
	implements Dynamic<T>, implements ISerializable
{
	public static function setEntityData (e :IEntity, key :String, val :Dynamic) :IEntity
	{
		Reflect.setField(ensureComponent(e), key, val);
		return e;
	}
	
	public static function getEntityData <DataType>(e :IEntity, key :String) :DataType
	{
		return Reflect.field(ensureComponent(e), key);
	}
	
	public static function ensureComponent (e :IEntity) :DataComponent<Dynamic>
	{
		if (e.getComponent(DataComponent) == null) {
			e.addComponent(e.context.allocate(DataComponent));
		}
		return e.getComponent(DataComponent);
	}
	
	public function new() 
	{
		super();
	}
	
	public function serialize (xml :Xml) :Void
	{
		var s = new Serializer();
		var map = new Hash<Dynamic>();
		for (f in Reflect.fields(this)) {
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
			Reflect.setField(this, key, map.get(key));
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		for (f in Reflect.fields(this).array()) {
			Reflect.deleteField(this, f);
		}
	}
	
}
