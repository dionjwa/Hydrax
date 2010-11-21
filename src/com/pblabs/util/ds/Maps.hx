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

using Lambda;

/**
 * Factory for creating various Maps.
 */
class Maps
 {
	/**
	 * Create a new Map designed to hold keys of the specified class.
	 * If the class is Hashable (but not an Enum) then a HashMap will be used, 
	 * 
	 * If keyClazz is null, default to an object map, if it exists.
	 */
	public static function newHashMap <K, V> (?keyClazz :Dynamic) :Map<K, V>
	{
		var classname :String = null;
		if (keyClazz != null) {
			classname = switch (Type.typeof(keyClazz)) {
				case TUnknown:
				throw "Unknown map key type";
				case TObject:
				Type.getClassName(keyClazz);
				case TNull:
				throw "TNull not allowed for map key type";
				case TInt:
				"TInt";
				case TFunction:
				throw "TFunction not allowed for map key type";
				case TFloat:
				"TFloat";
				case TEnum(e):
				throw "TEnum not allowed for map key type";
				case TClass(c):
				Type.getClassName(c);
				case TBool:
				throw "TBool not allowed for map key type";
			}
		}
		
		if (classname == "TInt") {
			return new IntHashMap<K, V>();
		} 
		else if (classname == "String") {
			return new HashMap<K, V>();
		} 
		else if (classname == "TFloat") {
			//TODO: Hmm, is this a good idea?  Can dictionaries store floats correctly across all platforms.
			return new StringMap<K, V>();
		} else {
			
			#if js
			if (keyClazz == Hashable) {
				return new IntHashMap();
			} else {
				return new HashMap();
			}
			#end
			
			var k = keyClazz != null ? Type.createEmptyInstance(keyClazz) : null;
			if (Std.is(k, com.pblabs.util.Enumerable)) {
				//Although Enum is Hashable, don't use the Hashable map
				//if we have true object associative arrays. 
				#if (flash || neko || cpp)
				return new HashMap<K, V>();
				#else
				return new StringMap<K, V>();
				#end
			} else if (Std.is(k, Hashable)) {
				return new HashableMap<K, V>();
			} else {
				#if (flash || neko || cpp)
				return new HashMap<K, V>();
				#else
				//Ok, the platform doesn't support non-String/Int keys,
				//and our key is also not Hashable.  Fallback to converting 
				//keys to Strings.
				return new StringMap<K, V>();
				#end
			}
		}
	}
}


