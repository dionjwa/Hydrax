/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;


import haxe.rtti.CType;

using Lambda;

/**
  * Will get/set fields with accessor methods, as long as 
  * the accessor methods are formatted get_xY, set_xY, where
  * xY is the variable.
  */
class ReflectUtil
{
	static var cacheXml = new Hash<Xml>();
	static var cacheClassdef = new Hash<Classdef>();
	static var classDefParser = new haxe.rtti.XmlParser();
	static var fieldTypes = new Hash<CType>();
	
	inline public static function tinyClassName (cls :Class<Dynamic>) :String
	{
		com.pblabs.util.Assert.isNotNull(cls);
		var name = Type.getClassName(cls);//getClassName(obj);
		com.pblabs.util.Assert.isNotNull(name, "null class name from class object");
		var tokens = name.split(".");
		return tokens[tokens.length - 1];
	}
	
	public static function getClassName (obj :Dynamic) :String
	{
		return Type.getClassName(getClass(obj));
	}
	
	public static function isSameClass (obj1 :Dynamic, obj2 :Dynamic) :Bool
	{
		return getClass(obj1) == getClass(obj2);
	}
	
	public static function hasSuperClass (cls :Class<Dynamic>, superClass :Class<Dynamic>) :Bool
	{
	    var sc = Type.getSuperClass(cls);
	    while (sc != null) {
	    	if (superClass == sc) {
	    		return true;
	    	}
	    	sc = Type.getSuperClass(sc);
	    }
	    return false;
	}
	
	public static function getClass (obj :Dynamic) :Class<Dynamic>
	{
		switch (Type.typeof(obj)) {
			case TUnknown:
				throw "Unknown map key type";
			case TObject:
				//Assume obj is a class or interface 
				return obj;
			case TNull:
				return null;
			case TInt:
				return Int;
			case TFunction:
				return null;
			case TFloat:
				return Float;
			case TEnum(e):
				return null;
			case TClass(c):
				return c;
			case TBool:
				return null;
		}
	}
	
	public static function getRttiXml(cls : Class < Dynamic > ) :Xml
	{
		var name = Type.getClassName(cls);
		if (cacheXml.exists(name))
			return cacheXml.get(name);
		if (untyped cls.__rtti == null)
			return null;
		var x = Xml.parse(untyped cls.__rtti).firstChild();
		cacheXml.set(name, x);
		return x;
	}
	
	public static function getClassdef (cls : Class< Dynamic>) :Classdef
	{
		var name = Type.getClassName(cls);
		if (cacheClassdef.exists(name)) {
			return cacheClassdef.get(name);
		}
		var x = getRttiXml(cls);
		if (x == null) {
			return null;
		}
		
		var typeTree = classDefParser.processElement(x);
		
		var cdef :Classdef = switch (typeTree) {
			case TClassdecl(c): c;
			default: null;
		}
		
		cacheClassdef.set(name, cdef);
		return cdef;
	}
	
	public static function getFieldType (cls : Class< Dynamic>, field :String) :CType
	{
		var id = Type.getClassName(cls) + "." + field;
		if (fieldTypes.exists(id)) {
			return fieldTypes.get(id);
		}
		
		var cdef :Classdef = getClassdef(cls);
		if (cdef == null) {
			return null;
		}
		
		for (f in cdef.fields) {
			if (f.name == field) {
				fieldTypes.set(id, f.type);
				return f.type;
			}
		}
		
		var sp = Type.getSuperClass(cls);
		var type = if (sp == null) null else getFieldType(sp, field);
		fieldTypes.set(id, type);
		return type;
	}
	
	public static function getVarFieldType (cls : Class< Dynamic>, field :String) :Class<Dynamic>
	{
		var type = getFieldType(cls, field);
		if (type != null) {
			switch (type) {
				case CClass(name, params):
				return Type.resolveClass(name);
				default:
				Log.error(getClassName(cls) + "." + field + " is not a class var");
				return null;
			}
		}
		Log.error("No rtti for " + getClassName(cls));
		return null;
	}
	
	public static function field (obj :Dynamic, field :String) :Dynamic
	{
		if (Lambda.has(Type.getInstanceFields(Type.getClass(obj)), "get_" + field)) {
		//Probably faster, but sometimes doesn't work
		// if (Reflect.field(obj, "get_" + field) != null) {cg
			return Reflect.callMethod(obj, Reflect.field(obj, "get_" + field), EMPTY_ARRAY);
		} else {
			return Reflect.field(obj, field);
		}
	}
	
	public static function setField (obj :Dynamic, field :String, val :Dynamic) :Void
	{
		// if (Reflect.field(obj, "set_" + field) != null) {
		if (Reflect.hasField(obj, "set_" + field)) {
			Reflect.callMethod(obj, Reflect.field(obj, "set_" + field), [val]);
		} else {
			Reflect.setField(obj, field, val);
		}
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = new Array();
}


