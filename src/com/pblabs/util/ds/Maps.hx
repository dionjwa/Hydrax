/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds;

import Type.ValueType;

import com.pblabs.util.ds.Hashable;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.maps.EnumMap;
import com.pblabs.util.ds.maps.HashMap;
import com.pblabs.util.ds.maps.HashableMap;
import com.pblabs.util.ds.maps.IntHashMap;
import com.pblabs.util.ds.maps.StringMap;
import com.pblabs.util.ds.maps.TransformKeyMap;

using Lambda;

/**
 * Factory for creating various Maps.
 */
class Maps
{
	
	public static var IS_OBJECT_DICTIONARY :Bool = #if flash true; #else false; #end
	/**
	 * Create a new Map designed to hold keys of the specified class.
	 * If the class is Hashable (but not an Enum) then a HashMap will be used, 
	 * 
	 * If keyClazz is null, default to an object map, if it exists.
	 */
	public static function newHashMap <K, V> (type :ValueType) :Map<K, V>
	{
		// trace('keyClazz=' + keyClazz);
		
		com.pblabs.util.Assert.isNotNull(type);
		switch (type) {
			case TNull: throw "TNull not allowed for map key type";
			case TInt: return cast new IntHashMap<V>();
			case TFloat: 
				//TODO: Hmm, is this a good idea?  Can dictionaries store floats correctly across all platforms?
				//Plus numeric precision means comparing Floats is a bad idea
				//Keep here for the sake of completeness.
				return new StringMap<K, V>();
			case TBool: throw "TBool not allowed for map key type";
			case TObject: //Assume it's a class type
				//Convert the classes to strings if not in Flash
				if (IS_OBJECT_DICTIONARY) {
					#if flash
					return new HashMap<K, V>();
					#else
					return cast new HashMap<V>();
					#end
				} else {
					return new StringMap<K, V>();
				}
			case TFunction: throw "TFunction not allowed for map key type";
			case TClass(c): return createMapFromClass(c);
			case TEnum(e): //Convert enums to Int's.  Doesn't work on enums with parameters, or rather, they are treated as the same key.
				return new EnumMap<K, V>();
			case TUnknown: throw "Unknown map key type";
		}
		throw "No map found for " + type;
		return null;
		
		
		
		// if (Type.typeof(keyClazz) == null) {
		// 	// com.pblabs.util.Log.warn("Returning StringMap because: null from Type.typeof(" + Std.string(keyClazz) + ")"); 
		// 	return new StringMap<K, V>();
		// } else {
		// 	switch (Type.typeof(keyClazz)) {
		// 		case TUnknown: throw "Unknown map key type";
		// 		case TObject: 
		// 			try {
		// 				// trace(Type.getEnumConstructs(keyClazz));
		// 				classname = "TEnum";
		// 			} catch (e :Dynamic) {
		// 				// trace("Not an enum");
		// 				classname = Type.getClassName(keyClazz);
		// 			}
				
		// 		case TNull: throw "TNull not allowed for map key type";
		// 		case TInt: classname = "TInt";
		// 		case TFunction: throw "TFunction not allowed for map key type";
		// 		case TFloat: classname = "TFloat";
		// 		case TEnum(e): classname = "TEnum";
		// 		case TClass(c): classname = Type.getClassName(c);
		// 		case TBool: throw "TBool not allowed for map key type";
		// 	}
		// }
		// // trace('classname=' + classname);
		
		
		
		// if (classname == "com.pblabs.util.ds.Hashable") {
		// 	return cast new HashableMap();
		// }
		// else if (classname == "Class") {
		// 	if (IS_OBJECT_DICTIONARY) {
		// 		#if flash
		// 		return new HashMap<K, V>();
		// 		#else
		// 		return cast new HashMap<V>();
		// 		#end
		// 	} else {
		// 		return new StringMap<K, V>();
		// 	}
		// }
		// else if (classname == "TInt" || classname == "Int") {
		// 	return cast new IntHashMap<V>();
		// }
		// else if (classname == "String") {
		// 	#if flash
		// 	return new HashMap<K, V>();
		// 	#else
		// 	return cast new HashMap<V>();
		// 	#end
		// }
		// else if (classname == "TEnum") {
		// 	//Convert enums to Int's.  Doesn't work on enums with parameters, or rather, they are treated as the same key.
		// 	return new EnumMap<K, V>();
		// }
		// else if (classname == "TFloat" || classname == "Float") {
		// 	//TODO: Hmm, is this a good idea?  Can dictionaries store floats correctly across all platforms?
		// 	return new StringMap<K, V>();
		// } else {
			
		// 	// #if js
		// 	// if (keyClazz == Hashable) {
		// 	// 	return cast new IntHashMap<V>();
		// 	// } else if (Type.getInstanceFields(keyClazz).has("key")) {
		// 	// 	return new com.pblabs.util.ds.maps.KeyedObjectMap();
		// 	// } else {
		// 	// 	com.pblabs.util.Log.warn("keyClazz=" + Type.getClassName(keyClazz) + ", JS target doesn't support non-String/Int dictionaries, and the key is not Hashable, nor does it have a key:Int field. Falling back to a StringMap, where the objects are converted to a String with com.pblabs.util.StringUtil.getStringKey()");
		// 	// 	return new StringMap();
		// 	// 	// return new HashMap();
		// 	// }
		// 	// #end
			
		// 	var k = keyClazz != null ? Type.createEmptyInstance(keyClazz) : null;
			
		// 	// #if cpp
		// 	// if (haxe.rtti.ReflectUtil.is(k, "com.pblabs.util.Enumerable")) {
		// 	// #else
		// 	if (Std.is(k, com.pblabs.util.Enumerable)) {
		// 	// #end
		// 		//Although Enum is Hashable, don't use the Hashable map
		// 		//if we have true object associative arrays. 
		// 		if (IS_OBJECT_DICTIONARY) {
		// 			#if flash
		// 			return new HashMap<K, V>();
		// 			#else
		// 			return cast new HashMap<V>();
		// 			#end
		// 		} else {
		// 			return new StringMap<K, V>();
		// 		}
				
		// 	} else if (Std.is(k, Hashable)) {
		// 		untyped return new HashableMap<K, V>();
		// 	} 
		// 	else if (Std.is(k, com.pblabs.util.ds.Hashable)) {
		// 		untyped return new com.pblabs.util.ds.maps.PolygonalHashableMap<K, V>();
		// 	}
			
		// 	else {
		// 		if (IS_OBJECT_DICTIONARY) {
		// 			#if flash
		// 			return new HashMap<K, V>();
		// 			#else
		// 			return cast new HashMap<V>();
		// 			#end
		// 		} else if (Type.getInstanceFields(keyClazz).has("key")) {
		// 			return new com.pblabs.util.ds.maps.KeyedObjectMap();
		// 		} else {
		// 			com.pblabs.util.Log.warn("keyClazz=" + Type.getClassName(keyClazz) + ", target doesn't support non-String/Int dictionaries, and the key is not Hashable, nor does it have a key:Int field. Falling back to a StringMap, where the objects are converted to a String with com.pblabs.util.StringUtil.getStringKey()");
		// 			return new StringMap();
		// 		}
		// 	}
		// }
	}
	
	static function createMapFromClass <K, V>(cls :Class<Dynamic>) :Map<K, V>
	{
		var classname :String = Type.getClassName(cls);
		if (classname == "com.pblabs.util.ds.Hashable") {
			return cast new HashableMap();
		} else if (classname == "String") {
			#if flash
			return new HashMap<K, V>();
			#else
			return cast new HashMap<V>();
			#end
		}
		
		var k = Type.createEmptyInstance(cls);
		if (Std.is(k, com.pblabs.util.Enumerable)) {
			//Although Enum is Hashable, don't use the Hashable map
			//if we have true object associative arrays. 
			if (IS_OBJECT_DICTIONARY) {
				#if flash
				return new HashMap<K, V>();
				#else
				return cast new HashMap<V>();
				#end
			} else {
				return new StringMap<K, V>();
			}
		} else if (Std.is(k, Hashable)) {
			untyped return new HashableMap<K, V>();
		} 
		else if (Std.is(k, com.pblabs.util.ds.Hashable)) {
			untyped return new com.pblabs.util.ds.maps.PolygonalHashableMap<K, V>();
		} else {
			if (IS_OBJECT_DICTIONARY) {
				#if flash
				return new HashMap<K, V>();
				#else
				return cast new HashMap<V>();
				#end
			} else if (Type.getInstanceFields(cls).has("key")) {
				return new com.pblabs.util.ds.maps.KeyedObjectMap();
			} else {
				com.pblabs.util.Log.warn("cls=" + classname + ", target doesn't support non-String/Int dictionaries, and the key is not Hashable, nor does it have a key:Int field. Falling back to a StringMap, where the objects are converted to a String with com.pblabs.util.StringUtil.getStringKey()");
				return new StringMap();
			}
		}
	}
}
