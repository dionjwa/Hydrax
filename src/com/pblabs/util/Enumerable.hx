/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.util.Comparators;
import com.pblabs.util.Equalable;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Hashable;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.maps.StringMap;

import haxe.Md5;

using Lambda;

using StringTools;

using com.pblabs.util.IterUtil;

/**
* Base class that implements common functionality for enumeration classes. An
* enumeration class is essentially a class that is just a list of constant
* values. They can be used to add type safety to properties that need to be
* limited to a specific subset of values.
* 
* HaXe enums don't have this convenient field accession, and allow multiple instances.
*
* The data in Enumerables can also be defined in xml files.  This is useful for editors, where
* you may want to edit the constants.  Embed the xml file of the deserialized Enumerable e.g.
* -resource rsrc/gamedata/YourEnumerable.xml@com.foo.YourEnumerable
* Then call Enumerable.deserializeAllFromEmbeddedXML() at some point to load all embedded
* Enumerables.  Currently only Float fields annotated with @serializable are automatically
* serialized/deserialized, otherwise you can override the ISerializable methods.
*/
class Enumerable<T>
	implements Hashable, implements Equalable<Enumerable<T>>, implements Comparable<Enumerable<T>> 
{
	public var name (get_name, never) :String;
	public var ordinal (get_ordinal, never) :Int;

	public static function values <T>(cls :Class<T>) :Iterable<T>
	{
		return cast(_enumsSorted.get(cls));
	}
	
	public static function enumerables () :Iterable<Class<Dynamic>>
	{
		return _enums.keys().toArray();
	}
	
	public static function names (cls :Class<Dynamic>) :Iterator<String>
	{
		var enums = _enums.get(cls);
		if (enums == null) {
			return null;
		}
		return enums.keys();
	}
	
	public static function valueOf <T>(cls :Class<T>, name :String) :T
	{
		return cast(_enums.get(cls).get(name));
	}
	
	public static function serializedValueOf <T>(clsName :String, name :String) :T
	{
		return valueOf(Type.resolveClass(clsName), name);
	}
	
	public static function valueOfOrdinal <T>(cls :Class<T>, ordinal :Int) :T
	{
		Preconditions.checkNotNull(cls);
		Preconditions.checkNotNull(_enums.get(cls));
		for (e in _enums.get(cls)) {
			if (e.ordinal == ordinal) {
				return cast e;
			}
		}
		throw "No Enumerable of type " + cls + " with ordinal=" + ordinal;
		return null;
	}
	
	static function getOrdinal (e :Enumerable<Dynamic>) :Int
	{
		var cls = Type.getClass(e);
		Preconditions.checkNotNull(cls);
		var arr = _enums.get(cls).array();
		return arr.indexOf(e);
	}
	
	//For map functions
	static function getEnumName (e :Enumerable<Dynamic>) :String
	{
		return e.name;
	}
	
	/**
	  * Serializes all Enumerables of the class
	  */
	public static  function serializeEnumerable (xml :Xml, cls :Class<Dynamic>) :Void
	{
		xml.set("class", Type.getClassName(cls));
		com.pblabs.util.Assert.isNotNull(_enums.get(cls), "No Enumerable of type " + cls);
		for (e in _enums.get(cls)) {
			var child = Xml.createElement(e.name);
			xml.addChild(child);
			e.serialize(child);
		}
	}
	
	/**
	  * Deserializes all Enumerables of the class
	  */
	public static function deserializeEnumerable (xml :Xml) :Dynamic
	{
		com.pblabs.util.Assert.isNotNull(xml);
		com.pblabs.util.Assert.isNotNull(xml.get("class"));
		var cls = Type.resolveClass(xml.get("class"));
		com.pblabs.util.Assert.isNotNull(cls, "Resolved class is null from 'class' attribute=" + xml.get("class"));
		com.pblabs.util.Assert.isNotNull(_enums.get(cls), "No Enumerable of type " + cls);
		var enums = _enums.get(cls);
		for (childXML in xml) {
			if (childXML.nodeType == Xml.Element) {
				var e = enums.get(childXML.nodeName);
				com.pblabs.util.Assert.isNotNull("No Enumerable of type " + cls + " with name=" + childXML.nodeName);
				e.deserialize(childXML);
			}
		}
	}
	
	/**
	  * Deserialize all Enumerables with embedded XML data.
	  */
	static function deserializeAllFromEmbeddedXML () :Void
	{
		for (enumCls in _enums.keys()) {
			if (haxe.Resource.listNames().has(Type.getClassName(enumCls))) {
				com.pblabs.util.Log.debug("Deserializing  " + Type.getClassName(enumCls));
				var root = Xml.parse(haxe.Resource.getString(Type.getClassName(enumCls)).trim());
				Enumerable.deserializeEnumerable(root.firstChild());
			}
		}
	}
	
	public static function setup () :Void
	{
	    deserializeAllFromEmbeddedXML();
	}
	
	
	/**
	  * Keep the constructor private
	  */
	private function new (name :String) 
	{
		Preconditions.checkNotNull(name);
		_name = name;
		var cls = Type.getClass(this);
		
		if (!_enums.exists(cls)) {
			_enums.set(cls, new StringMap());
			_enumsSorted.set(cls, new Array());
		}
		
		var map = _enums.get(cls);
		Preconditions.checkNotNull(map, "No map for " + name + " of type " + cls + ", but _enums.exists(cls)=" + _enums.exists(cls));
		var arr =_enumsSorted.get(cls);
		
		Preconditions.checkArgument(!map.exists(name), "Enum already exists! " + this);
		map.set(name, this);
		arr.push(this);
		_ordinal = map.size();
		//Make sure the hash values aren't close to each other
		_hashCode = StringUtil.hashCode(Md5.encode(Type.getClassName(cls) + _ordinal)); 
	}
	
	public function equals (other :Enumerable<T>) :Bool
	{
		return other == this;
	}

	public function hashCode () :Int
	{
		return _hashCode;
	}

	public function serialize (xml :Xml) :Void
	{
		//Get the serializable fields by parsing the original xml
		var root = Xml.parse(haxe.Resource.getString(ReflectUtil.getClassName(this)).trim()).firstChild();
		var serializableFields = [];
		
		var breakout = false;
		for (xmlChild in root) {
			if (xmlChild.nodeType == Xml.Element) {
				breakout = true;
				for (field in xmlChild) {
					if (field.nodeType == Xml.Element) {
						serializableFields.push(field.nodeName);
					}
				}
			}
			if (breakout) break;
		}
		
		for (fieldName in serializableFields) {
			var fieldXml = Xml.createElement(fieldName);
			xml.addChild(fieldXml);
			fieldXml.addChild(Xml.createPCData(Std.string(Reflect.field(this, fieldName))));
		}
	}
	
	public function deserialize (xml :Xml) :Dynamic
	{
		var cls = Type.getClass(this);
		for (fieldElement in xml) {
			if (fieldElement.nodeType != Xml.Element) {
				continue;
			}
			var fieldName = fieldElement.nodeName;
			var data = fieldElement.firstChild().nodeValue;
			if (!Math.isNaN(Std.parseFloat(data))) {
				Reflect.setField(this, fieldName, Std.parseFloat(data));
			}
		}
	}
	
	public function toString () :String
	{
		return name;
	}
	
	public function compareTo (other :Enumerable<T>) :Int
	{
		// com.pblabs.util.Assert.isTrue(Std.is(other, Type.getClass(this)), "Not same Enumerable type");
		return Comparators.compareInts(this.ordinal, other.ordinal);
	}
	
	inline function get_name () :String
	{
		return _name;
	}
	
	inline function get_ordinal () :Int
	{
		return _ordinal;
	}
	
	var _name :String;
	var _hashCode :Int;
	var _ordinal :Int;
	
	//Hidden static map of all Enumerable instances.
	static var _enums :Map<Class<Dynamic>, Map<String, Enumerable<Dynamic>>> = new StringMap();
	static var _enumsSorted :Map<Class<Dynamic>, Array<Enumerable<Dynamic>>> = new StringMap();
}
