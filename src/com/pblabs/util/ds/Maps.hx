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
	
	public static var IS_OBJECT_DICTIONARY :Bool = #if (flash || cpp) true; #else false; #end
	/**
	 * Create a new Map designed to hold keys of the specified class.
	 * If the class is Hashable (but not an Enum) then a HashMap will be used, 
	 * 
	 * If keyClazz is null, default to an object map, if it exists.
	 */
	public static function newHashMap <K, V> (keyClazz :Dynamic) :Map<K, V>
	{
		com.pblabs.util.Assert.isNotNull(keyClazz);
		var classname :String = null;
		
		if (Type.typeof(keyClazz) == null) {
			// com.pblabs.util.Log.warn("Returning StringMap because: null from Type.typeof(" + Std.string(keyClazz) + ")"); 
			return new StringMap<K, V>();
		} else {
			classname = switch (Type.typeof(keyClazz)) {
				case TUnknown: throw "Unknown map key type";
				case TObject: Type.getClassName(keyClazz);
				case TNull: throw "TNull not allowed for map key type";
				case TInt: "TInt";
				case TFunction: throw "TFunction not allowed for map key type";
				case TFloat: "TFloat";
				case TEnum(e): "TEnum";
				case TClass(c): Type.getClassName(c);
				case TBool: throw "TBool not allowed for map key type";
			}
		}
		
		if (classname == "Class") {
			if (IS_OBJECT_DICTIONARY) {
				#if flash
				return new HashMap<K, V>();
				#else
				return cast new HashMap<V>();
				#end
			} else {
				return new StringMap<K, V>();
			}
		}
		else if (classname == "TInt" || classname == "Int") {
			return cast new IntHashMap<V>();
		}
		else if (classname == "String") {
			#if flash
			return new HashMap<K, V>();
			#else
			return cast new HashMap<V>();
			#end
		}
		else if (classname == "TEnum") {
			//Convert enums to Strings.  Doesn't work on enums with parameters, or rather, they are treated as the same key.
			return new StringMap<K, V>();
		}
		else if (classname == "TFloat" || classname == "Float") {
			//TODO: Hmm, is this a good idea?  Can dictionaries store floats correctly across all platforms?
			return new StringMap<K, V>();
		} else {
			
			// #if js
			// if (keyClazz == Hashable) {
			// 	return cast new IntHashMap<V>();
			// } else if (Type.getInstanceFields(keyClazz).has("key")) {
			// 	return new com.pblabs.util.ds.maps.KeyedObjectMap();
			// } else {
			// 	com.pblabs.util.Log.warn("keyClazz=" + Type.getClassName(keyClazz) + ", JS target doesn't support non-String/Int dictionaries, and the key is not Hashable, nor does it have a key:Int field. Falling back to a StringMap, where the objects are converted to a String with com.pblabs.util.StringUtil.getStringKey()");
			// 	return new StringMap();
			// 	// return new HashMap();
			// }
			// #end
			
			var k = keyClazz != null ? Type.createEmptyInstance(keyClazz) : null;
			
			// #if cpp
			// if (com.pblabs.util.ReflectUtil.is(k, "com.pblabs.util.Enumerable")) {
			// #else
			if (Std.is(k, com.pblabs.util.Enumerable)) {
			// #end
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
				
			#if cpp
			} else if (com.pblabs.util.ReflectUtil.is(k, "com.pblabs.util.ds.Hashable")) {
			#else
			} else if (Std.is(k, Hashable)) {
			#end
				untyped return new HashableMap<K, V>();
			} else {
				if (IS_OBJECT_DICTIONARY) {
					#if flash
					return new HashMap<K, V>();
					#else
					return cast new HashMap<V>();
					#end
				} else if (Type.getInstanceFields(keyClazz).has("key")) {
					return new com.pblabs.util.ds.maps.KeyedObjectMap();
				} else {
					com.pblabs.util.Log.warn("keyClazz=" + Type.getClassName(keyClazz) + ", target doesn't support non-String/Int dictionaries, and the key is not Hashable, nor does it have a key:Int field. Falling back to a StringMap, where the objects are converted to a String with com.pblabs.util.StringUtil.getStringKey()");
					return new StringMap();
				}
			}
		}
	}
}
