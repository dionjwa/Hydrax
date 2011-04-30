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
package com.pblabs.engine.serialization;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBManagerBase;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.VectorTools;
import com.pblabs.util.Enumerable;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;
import com.pblabs.util.XMLUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;

using Lambda;

using StringTools;

using com.pblabs.util.IterUtil;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XMLUtil;

/**
 * Singleton class for serializing and deserializing objects. This class 
 * implements a default serialization behavior based on the format described
 * in the XMLFormat reference. This default behavior can be replaced on a class
 * by class basis by implementing the ISerializable interface.
 * 
 * @see ISerializable
 */
class Serializer extends PBManagerBase
#if cpp
	,implements haxe.rtti.Infos
#end
{
	var _currentEntity :IEntity;
	var _serializers :Map<String, Dynamic->Xml->Void>;
	var _deserializers :Map<String, Dynamic->Xml->String->Dynamic>;
	var _deferredReferences :Array<ReferenceNote>;
	var _resources :Map<String, ResourceNote>;
	var _typeInfo :TypeInfo;
	
	public var ignoredTypes (default, null) :Set<Class<Dynamic>>;
	public function new()
	{
		super();
		_deserializers = Maps.newHashMap(String);
		_serializers = Maps.newHashMap(String);
		_deferredReferences = [];
		_resources = Maps.newHashMap(String);
		
		// initialize our default Serializers. Note "special" cases get a double
		// colon so there can be no overlap w/ any real type.
		// _deserializers.set("::DefaultSimple", deserializeSimple);
		_deserializers.set("::DefaultComplex", deserializeComplex);
		_deserializers.set("Bool", deserializeBool);
		_deserializers.set("Int", deserializeIntLocal);
		_deserializers.set("Float", deserializeFloatLocal);
		_deserializers.set("Enum", deserializeEnumLocal);
		_deserializers.set("Array", deserializeIterable);
		_deserializers.set("List", deserializeIterable);
		_deserializers.set("com.pblabs.util.ds.Map", deserializeIterable);
		_deserializers.set("Class", deserializeClass);
		_deserializers.set("com.pblabs.util.Enumerable", deserializeEnumerable);
		_deserializers.set("com.pblabs.util.EnumWrappedEnumerable", deserializeEnumerable);
		_deserializers.set("com.pblabs.geom.Vector2", deserializeVector2);
		
		_serializers.set("::DefaultSimple", serializeSimple);
		_serializers.set("::DefaultComplex", serializeComplex);
		_serializers.set("Bool", serializeBool);
		_serializers.set("Int", serializeInt);
		_serializers.set("Float", serializeFloat);
		_serializers.set("Enum", serializeEnum);
		_serializers.set("Array", serializeIterable);
		_serializers.set("List", serializeIterable);
		_serializers.set("Iterable", serializeIterable);
		_serializers.set("com.pblabs.util.ds.Map", serializeIterable);
		_serializers.set("com.pblabs.util.Enumerable", serializeEnumerable);
		_serializers.set("com.pblabs.util.EnumWrappedEnumerable", serializeEnumerable);
		_serializers.set("ISerializable", serializeSerializable);
		_serializers.set("com.pblabs.geom.Vector2", serializeVector2);
		
		
		ignoredTypes = Sets.newSetOf(Class);
		
		ignoredTypes.add(hsl.haxe.DirectSignaler);
		ignoredTypes.add(hsl.haxe.Signaler);
		
		
		_typeInfo = new TypeInfo();
		
		
		// // Do a quick sanity check to make sure we are getting metadata.
		// var tmd = new TestForMetadata();
		// if(TypeUtility.getTypeHint(tmd, "someArray") != "Number")
		// {
		//	 // Don't error, as it makes it very hard for CS4 people to develop.
		//	 com.pblabs.util.Log.print(this, "Metadata is not included in this build of the engine, so serialization will not work!\n" + 
		//		 "Add --keep-as3-metadata+=TypeHint,EditorData,Embed,Inject to your compiler arguments to get around this.");
		// }
	}
	
	/**
	 * Serializes an object to XML. This is currently not implemented.
	 * 
	 * @param object The object to serialize. If this object implements ISerializable,
	 * its serialize method will be called to do the serialization, otherwise the default
	 * behavior will be used.
	 * 
	 * @return The xml describing the specified object.
	 * 
	 * @see ISerializable
	 */
	public function serialize(object :Dynamic, xml :Xml) :Void
	{
		if (Std.is(object, ISerializable)) {
			cast(object, ISerializable).serialize(xml);
		}
		else if (Std.is(object, IEntity)) {
			_currentEntity = cast(object, IEntity);
			_currentEntity.serialize(xml);
		}
		else {
			var typeHint :String = null;
			var typeName :String = null;
			var valueKey :String = null; 
			
			switch (Type.typeof(object)) {
				case TUnknown:
				//TODO: Assume it's a class or interface
				case TObject:
				case TNull: valueKey = "unknown";
				case TInt: valueKey = typeHint = "Int";
				case TFunction:
				case TFloat: valueKey = typeHint = "Float";
				case TEnum(e): valueKey = "Enum";
				case TClass(c): 
					typeHint = Type.getClassName(c);
					typeHint = typeHint == "String" ? null : typeHint;
					typeName = Type.getClassName(c); valueKey = typeName == "String" ? "::DefaultSimple" : "::DefaultComplex";
				case TBool: valueKey = typeHint = "Bool";
			}
			
			if (Std.is(object, Map) || Std.is(object, Array) || Std.is(object, List)) {
				valueKey = "Iterable"; 
			}
			
			if (_serializers.exists(typeName)) {
				_serializers.get(typeName)(object, xml);
			} else if (_serializers.exists(valueKey)) {
				_serializers.get(valueKey)(object, xml);
			} else {
				com.pblabs.util.Log.error("No serializer for " + typeName);
			}
				
			if (typeHint != null) {
				xml.set("type", typeHint);
			}
			
			// throw "Currently all serializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object);
			// com.pblabs.util.Log.warn("Currently all serializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object));
			// // Normal case - determine type and call the right Serializer.
			// var typeName = ReflectUtil.getClassName(object);
			// trace("serializer for " +typeName + ": " +_serializers.exists(typeName));
			// if (_serializers.exists(typeName)) {
			// 	typeName = isSimpleType(object) ? "::DefaultSimple" :"::DefaultComplex";
			// 	trace("typeName=" + typeName);
			// 	_serializers.get(typeName)(object, xml);
			// } else {
			// 	com.pblabs.util.Log.error("No serializer for " + typeName);
			// }
			// serializeComplex(name :String, object :Dynamic, xml :XML) :Void
			
		}
	}
	
	/**
	 * Deserializes an object from an xml description.
	 * 
	 * @param object The object on which the xml description will be applied.
	 * @param xml The xml to deserialize from.
	 * @param typeHint For an array, dictionary, or dynamic class, a type hint can
	 *				be specified as to what its children should be. Optional.
	 * 
	 * @return A reference to the deserialized object. This is always the same as
	 * the object parameter, with the exception of types that are passed by value.
	 * Code that calls this method should always use the return value rather than
	 * the passed in value for this reason.
	 */
	public function deserialize(object :Dynamic, xml :Xml, ?typeHint :String=null) :Dynamic
	{
		com.pblabs.util.Log.debug("object=" + object + ", typeHint=" + typeHint);
		// Preconditions.checkNotNull(context, "context is null");
		// Preconditions.checkNotNull(object, "object is null");
		Preconditions.checkNotNull(xml, "xml is null");
		
		if (object != null) {
			
			// Dispatch our special cases - entities and ISerializables.
			if (Std.is(object, ISerializable)) {
				return cast(object, ISerializable).deserialize(xml);
			}
			else if (Std.is(object, IEntity)) {
				_currentEntity = cast(object, IEntity);
				com.pblabs.util.Log.debug("deserializing entity");
				_currentEntity.deserialize(xml, true);
				resolveReferences();
				return cast(object, IEntity);
			} else if (Std.is(object, IEntityComponent)) {
				return deserializeComplex(object, xml, typeHint);
			} 
		}
		
		typeHint = typeHint == null ? xml.get("type") : typeHint;
		if (_deserializers.exists(typeHint)) {
			return _deserializers.get(typeHint)(object, xml, typeHint);
		}
		
		//Check for Enumerables
		if (typeHint != null) {
			var cls = Type.resolveClass(typeHint);
			if (cls != null) {
				if (ReflectUtil.hasSuperClass(cls, Enumerable)) {
					return deserializeEnumerable (object, xml, typeHint);
				} else {
					//If the static class has a deserialize method, we will store it here
					if (Type.getInstanceFields(cls).has("deserialize")) {
						com.pblabs.util.Log.info("Adding " + Type.getClassName(cls) + " to mapped (de)serializers");
						var des = function (obj :Dynamic, xml :Xml, typeHint :String) :Dynamic {
							var inst = Type.createInstance(cls, EMPTY_ARRAY);
							Reflect.callMethod(inst, Reflect.field(inst, "deserialize"), [xml]);
							return inst;
						}
						_deserializers.set(Type.getClassName(cls), des);
						return des(null, xml, null);
					}
				}
			}
		}
		
		com.pblabs.util.Log.error("No deserializer found for " + xml + ", typeHint=" + typeHint);
		//Fall back to deserializing complex
		// deserializeComplex(context, object, xml, typeHint);
		return XMLUtil.parseString(xml);
		
		
		// com.pblabs.util.Log.warn("Currently all deserializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object));
		// return object;
		// throw "Currently all deserializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object);
		// // Normal case - determine type and call the right Serializer.
		// var typeName = ReflectUtil.getClassName(object);
		// if (!_deserializers.exists(typeName)) {
		//	 typeName = xml.hasSimpleContent() ? "::DefaultSimple" :"::DefaultComplex";
		// }
		// trace("typeName=" + typeName);
		// #if debug
		// com.pblabs.util.Assert.isNotNull(_deserializers.get(typeName), "No deserializer for " + typeName);
		// #end
		
		// return _deserializers.get(typeName)(context, object, xml, typeHint);
	}
	
	/**
	 * Set the entity relative to which current serialization work is happening. Mostly for internal use.
	 */
	public function setCurrentEntity(e :IEntity) :Void
	{
		_currentEntity = e;
	}
	
	/**
	 * Clear the entity relative to which current serialization work is happening. Mostly for internal use.
	 */
	public function clearCurrentEntity() :Void
	{
		_currentEntity = null;
	}
	
	/**
	 * Not all references are resolved immediately. In order to minimize spam,
	 * we only report "dangling references" at certain times. This method 
	 * triggers such a report.
	 */
	public function reportMissingReferences() :Void
	{
		for (reference in _deferredReferences) {
			reference.reportMissing();
		}
	}
	
	function isSimple(xml :Xml, typeName :String) :Bool
	{
		// Complex content is assumed if there are child nodes in the xml, or the xml text is
		// an empty string, unless the type is a string. This is because any simple type that
		// is not a string has to have a value. Otherwise, it must be a class that doesn't have
		// its children specified.
		if (typeName == "String")
			return true;
		
		//TODO :what is the haxe version of complex content?
		if (xml.hasComplexContent())
			return false;
		
		if (xml.toString() == "")
			return false;
		
		return true;
	}
	
	function isSimpleType(object :Dynamic) :Bool
	{
		var typeName = ReflectUtil.getClassName(object);
		if (typeName == "String" || typeName == "Int" || typeName == "Float" || typeName == "Bool") {
			return true;
		}
		
		return false;
	}
	
	// function deserializeSimple(object :Dynamic, xml :XML, typeHint :String) :Dynamic
	// {
	//	 // If the tag is empty and we're not a string where """ is a valid value,
	//	 // just return that value.
	//	 if (xml.toString() == "" && !(Std.is(object, String)))
	//		 return object;
		
	//	 return xml.toString();
	// }
	
	public static function serializeSimple(value :Dynamic, xml :Xml) :Void
	{
		xml.addChild(Xml.createPCData(Std.string(value)));
	}
	
	function deserializeComplex(object :Dynamic, xml :Xml, typeHint :String) :Dynamic
	{
		//Haxe cannot determine  at runtime if an object implements Dynamic 
		var isDynamic = false;//Std.is(object, Array);// || (TypeUtility.isDynamic(object));// || Std.is(object, Dictionary)
		var xmlPath = "";			
		
		for (fieldXML in xml.elements()) {
			// Figure out the field we're setting, and make sure it is present.
			var fieldName :String = fieldXML.nodeName;
			
			var typeName :String = fieldXML.get("type");
			if (typeName.isBlank()) {
				
				// var ctype = ReflectUtil.getFieldType(Type.getClass(object), fieldName);
				var cls = ReflectUtil.getVarFieldType(object, fieldName);
				if (cls != null) {
					typeName = Type.getClassName(cls);
				}
				// typeName = ReflectUtil.getVarFieldType(object, fieldName);
			}
			
			if (typeName.isBlank()) {
				typeName = switch (Type.typeof(ReflectUtil.field(object, fieldName))) {
					case TUnknown: null;
					case TObject: null;
					case TNull: null;
					case TInt: "Int";
					case TFunction: null;
					case TFloat: "Float";
					case TEnum(e): "Enum";
					case TClass(c): Type.getClassName(c); 
					case TBool: "Bool";
				}	
			}
			
			if (typeName == "String") {
				typeName = "::DefaultSimple";
			}
			
			if (!typeName.isBlank() && !_deserializers.exists(typeName)) {
				typeName = "::DefaultComplex";
			}
			
			
			// Determine the type.
	
			// if (isDynamic && typeName == null)
			//	 typeName = "String";
			
			// deserialize into the child.
			if (!getChildReference(object, fieldName, fieldXML) 
				&& !getResourceObject(object, fieldName, fieldXML))
			{
				var child :Dynamic = getChildObject(object, fieldName, typeName, fieldXML);
				if (child != null) {
					// Deal with typehints.
					// var childTypeHint :String = null;//TypeUtility.getTypeHint(object, fieldName);
					// child = deserialize(child, fieldXML, childTypeHint);
					com.pblabs.util.Log.error("The field " + fieldName + " of type " + typeName + " could not be instantiated");
					continue;
				}
				
				// Assign the new value.
				try {
					ReflectUtil.setField(object, fieldName, child);
					// object[fieldName] = child;
				} catch(e :Dynamic) {
					xmlPath = reportXMLPath(fieldXML);
					com.pblabs.util.Log.error("The field " + fieldName + " could not be set to '" + child + "' due to :" + e.toString() + " " + xmlPath);
				}
			}
		}
		
		return object;
	}
	
	//TODO:broken
	public static function deserializeEnumerable (object :Dynamic, xml :Xml, typeHint :String) :Dynamic
	{
		com.pblabs.util.Assert.isNotNull(xml);
		typeHint = typeHint == null ? xml.get("type") : typeHint;
		xml = switch (xml.nodeType) {
			case Xml.Document: xml.firstChild();
			case Xml.Element: xml.firstChild();
			default: xml;
		}
		try {
			return Enumerable.serializedValueOf(typeHint, xml.nodeValue);
		} catch (e :Dynamic){
			com.pblabs.util.Log.error("Problem getting Enumerable, type=" + xml.get("type") + ", value=" + xml.nodeValue + ", " + e); 
			return null;
		}
	}
	
	public static function serializeEnumerable (object :Dynamic, xml :Xml) :Void
	{
		var e :Enumerable<Dynamic> = object;
		// trace("serializeEnumerable");
		// trace("xml.nodeType=" + xml.nodeType);
		xml.addChild(Xml.createPCData(e.name));
	}
	
	/**
	 * Given an Xml element, walk up its parent references and show the path
	 * in the document, including any name attributes.
	 */
	public function reportXMLPath(item :Dynamic) :String
	{
		// Report each tag and its name attribute if any.
		var path :String = "(";
		
		var stack :Array<Dynamic> = [];
		var itemWalk :Dynamic = item;
		while(itemWalk)
		{
			stack.unshift(itemWalk);
			itemWalk = itemWalk.parent();
		}
		
		for(i in 0...stack.length)
		{
			var x :Dynamic = stack[i];
			
			path += "<" + x.name().toString();
			
			if(x.hasOwnProperty("@name"))
				path += " name=\"" + x.get("name") + "\"";
			
			path += ">";
			
			if(i < stack.length-1)
				path += " --> ";
		}
		
		path += ")";
		
		return path;
	}
	
	public function serializeComplex(object :Dynamic, xml :Xml) :Void
	{
		if (object == null) { 
			return;
		}
		
		if (Std.is(object, Enumerable)) {
			serializeEnumerable(object, xml);
			return;
		}
		
		if (Std.is(object, Array) || Std.is(object, List) || Std.is(object, Map)) {
			serializeIterable(object, xml);
			return;
		}
		
		var cls = ReflectUtil.getClass(object);
		
		for (f in Type.getInstanceFields(Type.getClass(object))) {
			if (isIgnored(cls, f)) {
				continue;
			}
			
			var valueInfo = getTypeInfo(ReflectUtil.field(object, f));
			
			if (valueInfo != null) {
				com.pblabs.util.Assert.isNotNull(_serializers.get(valueInfo.typeKey), "No serializer for the key " + valueInfo.typeKey + " for field=" +f);
				var childXml = Xml.createElement(f);
				//If we can't work out the type, we default to a String
				if (valueInfo.typeHint != null && valueInfo.typeHint != "String") {
					childXml.set("type", valueInfo.typeHint);
				}
				 _serializers.get(valueInfo.typeKey)(valueInfo.val, childXml);
				xml.addChild(childXml);
			}
			
			_typeInfo.typeHint = null;
			_typeInfo.typeKey = null;
			_typeInfo.val = null;
		}
		
		
	}
	
	function getTypeInfo (val :Dynamic) :TypeInfo
	{
		if (val == null) {
			return null;
		}
		_typeInfo.val = val;
		
		// var typeHint :String = null;
		var cls :Class<Dynamic> = null;
		// var valueKey :String = null;
		
		_typeInfo.typeKey = switch (Type.typeof(val)) {
			case TUnknown: null;
			//TODO: Assume it's a class or interface
			case TObject: null;
			case TNull: "unknown";
			case TInt: "Int";
			case TFunction: null;
			case TFloat: "Float";
			case TEnum(e): "Enum";
			case TClass(c): cls = c; Type.getClassName(c);
			case TBool: "Bool";
		}
		
		//Null or cannot serialize
		if (_typeInfo.typeKey == null) {
			return null;
		}
		
		//One of the basic types
		if (cls == null) {
			return _typeInfo;
		}
		
		_typeInfo.typeHint = _typeInfo.typeKey; 
		
		//Check for ignored types
		if (ignoredTypes.exists(cls)) {
			return null;
		}
		
		var clsName = _typeInfo.typeKey;
		
		if (Std.is(val, ISerializable)) {
			_typeInfo.typeKey = "ISerializable";
		} else if (clsName == "String") {
			_typeInfo.typeKey = "String";
		} else if (Std.is(val, Map) || Std.is(val, Array) || Std.is(val, List)) {
			_typeInfo.typeKey = "Iterable";
		} else if (Std.is(val, Enumerable)) {
			_typeInfo.typeKey = "com.pblabs.util.Enumerable";
		} else if (clsName == "com.pblabs.util.SignalVar") {
			//Don't serialize the SignalVar, rather the value
			_typeInfo.typeHint = _typeInfo.typeKey = _typeInfo.val = null;
			return getTypeInfo(cast(val, com.pblabs.util.SignalVar<Dynamic>).value);
		} else if (_serializers.exists(clsName)) {
			_typeInfo.typeKey = clsName;
		} else {
			_typeInfo.typeKey = "::DefaultComplex";
		}
		
		return _typeInfo;
	}
	
	public function isIgnored (cls :Class<Dynamic>, fieldName :String) :Bool
	{
		if (fieldName.startsWith("_")) {
			return true;
		}
		
		var meta = haxe.rtti.Meta.getFields(cls);
		if (meta != null && Reflect.hasField(meta, fieldName)) {
			var editorData = Reflect.field(Reflect.field(meta, fieldName), "editorData");
			if (editorData != null) {
				for (val in cast(editorData, Array<Dynamic>)) {
					if (Reflect.hasField(val, "ignore") && Reflect.field(val, "ignore")) {
						return true;
					}
				}
			}
		}
		
		var supercls = Type.getSuperClass(cls);
		if (supercls != null) {
			return isIgnored(supercls, fieldName);
		} else {
			return false;
		}
	}
	
	public static function serializeProperty (xml :Xml, object :Dynamic) :Void
	{
		xml.addChild(Xml.createPCData(Std.string(object)));
	}
	
	public static function deserializeBool(xml :Xml, object :Dynamic, typeHint :String) :Dynamic
	{
		com.pblabs.util.Assert.isNotNull(xml);
		return (xml.firstChild().toString() == "true");
	}
	
	public static function serializeBool(val :Dynamic, xml :Xml) :Void
	{
		xml.addChild(Xml.createPCData(val ? "true" : "false"));
	}
	
	static function deserializeIntLocal (object :Dynamic, xml :Xml, ignored :String) :Dynamic
	{
		return deserializeInt(xml);
	}
	
	public static function deserializeInt (xml :Xml) :Int
	{
		com.pblabs.util.Assert.isNotNull(xml);
		return Std.parseInt(xml.firstChild().nodeValue.trim());
	}
	
	public static function serializeInt(val :Dynamic, xml :Xml) :Void
	{
		xml.addChild(Xml.createPCData(Std.string(val)));
	}
	
	public static function deserializeFloat(xml :Xml) :Float
	{
		com.pblabs.util.Assert.isNotNull(xml);
		return Std.parseFloat(xml.firstChild().nodeValue);
	}
	
	static function deserializeFloatLocal(ignored :Dynamic, xml :Xml, ignored :String) :Dynamic
	{
		return deserializeFloat(xml);
	}
	
	public static function serializeFloat(val :Float, xml :Xml) :Void
	{
		xml.addChild(Xml.createPCData(Std.string(val)));
	}
	
	public static function deserializeEnum(xml :Xml, ?typeHint :String) :Dynamic
	{
		com.pblabs.util.Assert.isNotNull(xml);
		typeHint = typeHint.isBlank() ? xml.get("type") :typeHint;
		com.pblabs.util.Assert.isNotNull(typeHint);
		return Type.createEnum(Type.resolveEnum(typeHint), xml.firstChild().nodeValue, []);
	}
	
	static function deserializeEnumLocal(obj :Dynamic, xml :Xml, typeHint :String) :Dynamic
	{
		return deserializeEnum(xml, typeHint);
	}
	
	public static function serializeEnum(val :Dynamic, xml :Xml) :Void
	{
		xml.nodeValue = Type.enumConstructor(val);
	}
	
	public static function serializeVector2 (val :Dynamic, xml :Xml) :Void
	{
		VectorTools.serializeXY(cast val, xml);
	}
	
	public static function deserializeVector2 (object :Dynamic, xml :Xml, typeHint :String) :Dynamic
	{
		return VectorTools.deserializeXY(xml);
	}
	
	public static function serializeSerializable(val :Dynamic, xml :Xml) :Void
	{
		cast(val, ISerializable).serialize(xml);
	}
	
	public static function deserializeSerializable(val :Dynamic, xml :Xml) :Dynamic
	{
		cast(val, ISerializable).deserialize(xml);
		return val;
	}
	
	public function deserializeIterable(object :Dynamic, xml :Xml, typeHint :String) :Dynamic
	{
		for (childXML in xml.elements())
		{
			// Where are we assigning this item?
			var key = childXML.nodeName;
			// Deal with escaping numbers and the "add to end" behavior.
			if (key.charAt(0) == "_") {
				key = key.substr(1);
			}
			
			// Might be invalid...
			if (key.isBlank() && Std.is(object, Map)) {
				var xmlPath = reportXMLPath(childXML);
				com.pblabs.util.Log.error([object, "deserialize", "Cannot add a value to a Map without a key. " + xmlPath]);
				continue;
			}
				
			// Infer the type.
			var typeName = childXML.get("type");
			if (typeName.isBlank())
				typeName = xml.get("childType");
				
			if (typeName.isBlank())
				typeName = typeHint != null ? typeHint :"String";
				
			// deserialize the value.
			if (!getChildReference(object, key, childXML) 
				|| !getResourceObject(object, key, childXML, typeHint))
			{
				var value :Dynamic = getChildObject(object, key, typeName, childXML);
				if (value != null) {
					// var value :Dynamic = 
					deserialize(value, childXML, typeName);
				}
					
				// Assign, either to key or to end of array.
				if (!key.isBlank()) {
					com.pblabs.util.Assert.isTrue(Std.is(object, Map), "key length >1 but object is not a map");
					cast(object, Map<Dynamic, Dynamic>).set(key, value);
					// ReflectUtil.setField(object, key, value);
				}
				else {
					if (Std.is(object, Array)) 
						cast(object, Array<Dynamic>).push(value);
					else if (Std.is(object, List))
						cast(object, List<Dynamic>).add(value);
				}
			}
		}
		
		return object;
	}
	
	public function serializeIterable (object :Iterable<Dynamic>, xml :Xml) :Void
	{
		if (object == null) {
			return;
		}
		
		// Decide if they all share the same type
		var hasType :Bool = true;
		var anyChild :Dynamic = null;
		for (child in object) {
			if (anyChild == null)
				anyChild = child;
			else if (child != null && ReflectUtil.getClass(child) != ReflectUtil.getClass(anyChild))
				hasType = false;
		}
		
		// If it's empty, we're done
		if (anyChild == null)
			return;
		
		// Assign child type, if any
		if (hasType)
			xml.set("childType", ReflectUtil.getClassName(anyChild));
		
		// Now write all children
		var isMap = Std.is(object, Map);
		var iteratable :Array<Dynamic> = isMap ? cast(object, Map<Dynamic, Dynamic>).keys().toArray() : object.iterator().toArray();
		for (ii in 0...iteratable.length) 
		{
			
			// Get the information
			// var propertyName :String = (Std.is(object, Dictionary)) ? element :"_";
			var propertyName :String = isMap ? Std.string(iteratable[ii]) : "_";
			var propertyValue :Dynamic = isMap ? cast(object, Map<Dynamic, Dynamic>).get(iteratable[ii]) : iteratable[ii];
			var propertyXML :Xml = Xml.createElement(propertyName);
			
			// Write type
			if (!hasType)
				propertyXML.set("type", ReflectUtil.getClassName(propertyValue)); 
			
			// Write non-entities, or reference entities
			if (!setChildReference(object, propertyValue, propertyXML)) {
				if (_serializers.exists(xml.get("childType"))) {
					_serializers.get(xml.get("childType"))(propertyValue, propertyXML);
				} else {
					serialize(propertyValue, propertyXML);
				}
			}
			
			// Save
			xml.addChild(propertyXML);
		}
	}
	
	public function deserializeClass(object :Dynamic, xml :Xml, typeHint :String) :Dynamic
	{
		com.pblabs.util.Assert.isNotNull(xml);
		return Type.resolveClass(xml.firstChild().nodeValue);
	}
	
	/**
	 * A tag can have attributes which encode references of various types. This method
	 * parses them and resolves the references.
	 */ 
	function getChildReference(object :Dynamic, fieldName :String, xml :Xml) :Bool
	{
		var nameReference :String = xml.get("nameReference");
		var componentReference :String = xml.get("componentReference");
		if(componentReference == null) {
			componentReference = xml.get("entityName");
		}                                                                     
		
		var componentName :String = xml.get("componentName");
		var objectReference :String = xml.get("objectReference");
		
		if (!nameReference.isBlank() || !componentReference.isBlank() || !componentName.isBlank() || !objectReference.isBlank())
		{
			var reference :ReferenceNote = new ReferenceNote();
			reference.context = context;
			reference.owner = object;
			reference.fieldName = fieldName;
			reference.nameReference = nameReference;
			reference.componentReference = componentReference;
			reference.componentName = componentName;
			reference.objectReference = objectReference;
			reference.currentEntity = _currentEntity;
			
			if (!reference.resolve()) {
				trace("adding to deferredReferences " + reference);
				_deferredReferences.push(reference);
			}
			
			return true;
		}
		
		return false;
	}
	
	/**
	 * A tag can have attributes which encode references of various types. This method
	 * parses them and resolves the references.
	 */ 
	static function setChildReference(object :Dynamic, reference :Dynamic, xml :Xml) :Bool
	{
		// Write entity reference
		if (Std.is(reference, IEntity)) {
			xml.set("nameReference", cast(reference, IEntity).name);
			// xml.get("nameReference") = (cast(reference, IEntity)).name; 
			return true;
		}
		// Write component reference
		if (Std.is(reference, IEntityComponent)) {
			xml.set("entityName", cast(reference, IEntityComponent).owner.name);
			xml.set("componentName", cast(reference, IEntityComponent).name);
			
			// xml.get("entityName") = (cast(reference, IEntityComponent)).owner.name; 
			// xml.get("componentName") = (cast(reference, IEntityComponent)).name; 
			return true;
		}
		return false;
	}
	
	/**
	 * Find or instantiate the value that should go in a named field on an object.
	 * 
	 * @param object The object which will have the object assigned.
	 * @param fieldName The field on the object we are working with.
	 * @param typeName The desired type; if different than what is there we replace
	 *				 the existing interface.
	 */
	function getChildObject(object :Dynamic, fieldName :String, typeName :String, fieldXml :Xml) :Dynamic
	{
		// Get the child object, if it is present.
		var childObject :Dynamic = null;
		try {
			childObject = ReflectUtil.field(object, fieldName); 
		} catch(e :Dynamic) {
		}
		
		// If requested type isn't the same as what we found, reset the object.
		var desiredType = Type.resolveClass(typeName);
		
		
		if (childObject == null || !(Std.is(childObject, desiredType))) {
			// childObject = Type.createInstance(Type.resolveClass(typeName), EMPTY_ARRAY);
			childObject = deserialize(null, fieldXml, typeName); 
			// childObject = context.allocate(Type.resolveClass(typeName));
		}
		
		// Note we want to check for null here; null is distinct from coerce-to-false.
		if (childObject == null) {
			var xmlPath :String = reportXMLPath(fieldXml);
			com.pblabs.util.Log.error("Unable to create type " + typeName + " for the field " + fieldName + ". " + xmlPath);
			return null;
		}
		
		return childObject;
	}
	
	function getResourceObject(object :Dynamic, fieldName :String, xml :Xml, ?typeHint :String = null) :Bool
	{
		var filename :String = xml.get("filename");
		
		// If attribute is not found, there might be a child tag (depending on what serializer is used.
		if(filename.isBlank()) {
			filename = xml.child("filename") != null ? xml.child("filename").nodeValue : null;
		}
		
		if(filename.isBlank())
			return false;
		
		var type :Class<Dynamic> = null;
		if(typeHint != null) {
			type = Type.resolveClass(typeHint);
		}
		else {
			type = ReflectUtil.getVarFieldType(object, fieldName);//Type.resolveClass(TypeUtility.getFieldType(object, fieldName));
		}
		
		var resource = new ResourceNote();
		resource.context = context;
		resource.owner = object;
		resource.fieldName = fieldName;
		resource.load(filename, type);
		
		// we have to hang on to these so they don't get garbage collected
		_resources.set(filename, resource);
		return true;
	}
	
	// internal doesn't work here for some reason. It's just being referenced in the ResourceNote support class
	public function removeResource(filename :String) :Void
	{
		_resources.remove(filename);
	}
	
	public function resolveReferences() :Void
	{
		com.pblabs.util.Log.debug("");
		var i = 0;
		while (i < _deferredReferences.length) {
			var reference = _deferredReferences[i];
			if (!reference.resolve()) {
				i++;
			} else {
				_deferredReferences.splice(i, 1);
			}
		}
		// for (i in 0..._deferredReferences.length)
		// {
		//	 var reference :ReferenceNote = _deferredReferences[i];
		//	 if (!reference.resolve())
		//		 continue;

		//	 _deferredReferences.splice(i, 1);
		//	 i--;
		// }
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}

private class ResourceNote
{
	public var context :IPBContext;
	public var owner :Dynamic;
	public var fieldName :String;
	
	public function new () {}
	
	
	public function load(filename :String, type :Class<Dynamic>) :Void
	{
		throw "Not implemented";
		// var resource :Resource = context.getManager(IResourceManager).load(filename, type, onLoaded, onFailed);
		
		// if(resource)
		//	 owner[fieldName] = resource;
	}
	
	// public function onLoaded(resource :Resource) :Void
	// {
	//	 context.getManager(Serializer).removeResource(resource.filename);
	// }
	
	// public function onFailed(resource :Resource) :Void
	// {
	//	 com.pblabs.util.Log.error(owner, "set " + fieldName, "No resource was found with filename " + resource.filename + ".");
	//	 context.getManager(Serializer).removeResource(resource.filename);
	// }
	
}

private class ReferenceNote
{
	public var context :IPBContext;
	public var owner :Dynamic;
	public var fieldName :String;
	public var nameReference :String;
	public var componentReference :String;
	public var componentName :String;
	public var objectReference :String;
	public var currentEntity :IEntity;
	public var reportedMissing :Bool;
	
	public function new ()
	{
		reportedMissing = false;
	}
	
	
	public function resolve() :Bool
	{
		// Look up by name.
		if (!nameReference.isBlank()) {
			var namedObject :IEntity = context.lookupEntity(nameReference);
			if (namedObject == null)
				return false;
			
			ReflectUtil.setField(owner, fieldName, namedObject);
			reportSuccess();
			return true;
		}
		
		// Look up a component on a named object by name (first) or type (second).
		if (!componentReference.isBlank()) {
			var componentObject :IEntity = context.lookupEntity(componentReference);
			if (null == componentObject)
				return false;
			
			var component :IEntityComponent = null;
			if (!componentName.isBlank()) {
				component = componentObject.getComponentByName(componentName);
				if (null == component)
					return false;
			}
			else {
				var componentType = ReflectUtil.getVarFieldType(ReflectUtil.getClass(owner), fieldName);//TypeUtility.getFieldType(owner, fieldName);
				component = componentObject.getComponentByType(componentType);
				if (null == component)
					return false;
			}
			
			ReflectUtil.setField(owner, fieldName, component);
			reportSuccess();
			return true;
		}
		
		// Component reference on the entity being deserialized when the reference was created.
		if (!componentName.isBlank())
		{
			var localComponent :IEntityComponent = currentEntity.getComponentByName(componentName);
			if (null == localComponent)
				return false;
			
			ReflectUtil.setField(owner, fieldName, localComponent);
			reportSuccess();
			return true;
		}
		
		// Or instantiate a new entity.
		if (!objectReference.isBlank()) {
			ReflectUtil.setField(owner, fieldName, context.getManager(TemplateManager).instantiateEntity(objectReference, context));
			
			// owner[fieldName] = context.getManager(TemplateManager).instantiateEntity(objectReference);
			reportSuccess();
			return true;
		}
		
		// Nope, none of the above!
		return false;
	}
	
	/**
	 * Trigger a console report about any references that haven't been resolved.
	 */
	public function reportMissing() :Void
	{
		// Don't spam.
		if(reportedMissing)
			return;
		reportedMissing = true;
		
		var firstPart = owner.toString() + "[" + fieldName + "] on entity '" + currentEntity.name + "' - ";
		
		// Name reference.
		if(nameReference != null) {
			com.pblabs.util.Log.warn(firstPart + "Couldn't resolve reference to named entity '" + nameReference + "'");
			return; 
		}
		
		// Look up a component on a named object by name (first) or type (second).
		if (componentReference != "") {
			com.pblabs.util.Log.warn(firstPart + " Couldn't find named entity '" + componentReference + "'");
			return;
		}
		
		// Component reference on the entity being deserialized when the reference was created.
		if (componentName != "") {
			com.pblabs.util.Log.warn(firstPart + " Couldn't find component on same entity named '" + componentName + "'");
			return;
		}
	}
	
	function reportSuccess() :Void
	{
		// If we succeeded with no spam then be quiet on success too.
		if(!reportedMissing)
			return;
		
		var firstPart = owner.toString() + "[" + fieldName + "] on entity '" + currentEntity.name + "' - ";
		
		// Name reference.
		if(nameReference != null) {
			com.pblabs.util.Log.warn(firstPart + " After failure, was able to resolve reference to named entity '" + nameReference + "'");
			return; 
		}
		
		// Look up a component on a named object by name (first) or type (second).
		if (!StringUtil.isBlank(componentReference)) {
			com.pblabs.util.Log.warn(firstPart + " After failure, was able to find named entity '" + componentReference + "'");
			return;
		}
		
		// Component reference on the entity being deserialized when the reference was created.
		if (!StringUtil.isBlank(componentName)) {
			com.pblabs.util.Log.warn(firstPart + " After failure, was able to find component on same entity named '" + componentName + "'");
			return;
		}
	}
}

class TypeInfo
{
	public var typeKey :String;
	public var typeHint :String;
	public var val :Dynamic;
	public function new (){}
	
	public function toString () :String
	{
	   return StringUtil.stringify(this, ["typeKey", "typeHint", "val"]);
	}
}
