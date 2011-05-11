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
package com.pblabs.engine.core;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

/**
 * WARNING: this code does not currently work, conversion is still a work in progress. 
 * The ObjectTypeManager, together with the ObjectType class, is essentially an abstraction
 * of a bitmask to allow objects to be identified with friendly names, rather than complicated
 * numbers.
 * 
 * @see ObjectType
 */
class ObjectTypeManager
// #if cpp
// 	implements haxe.rtti.Infos
// #end
{
	/**
	* The number of object types that have been registered.
	*/
	public var typeCount(get_typeCount, null) :Int;
	function get_typeCount() :Int
	{
		return _typeCount;
	}
	/**
	 * The number of object types that have been registered.
	 */
	public function new() 
	{ 
		_typeCount = 0;
		_typeList = Maps.newHashMap(String);
		_bitList = new Array();
	}
	
	public function getTypeInstance(typeName :String) :ObjectType
	{
		var ot = new ObjectType([]);
		ot.manager = this;
		ot.typeName = typeName;
		return ot;
	}
	
	/**
	 * Gets the number associated with a specified object type, registering it if
	 * necessary.
	 * 
	 * @param typeName The name of the object type to retrieve.
	 * 
	 * @return The number associated with the specified type.
	 */
	public function getType(typeName :String) :Int
	{
		if (!_typeList.exists(typeName)) {
			if (_typeCount == 32) {
				com.pblabs.util.Log.warn("Only 32 unique object types can be created.");
				return 0;
			}
			
			_typeList.set(typeName, _typeCount);
			_bitList[1 << _typeCount] = typeName;
			_typeCount++;
		}
		
		return 1 << _typeList.get(typeName);
	}
	
	/**
	 * Gets the name of an object type based on the number it was assigned.
	 * 
	 * @param number The number of the type to find.
	 * 
	 * @return The name of the type with the specified number, or null if 
	 * the number is not assigned to any type.
	 */
	public function getTypeName(number :Int) :String
	{
		return _bitList[number];
	}
	
	/**
	 * Determines whether an object type is of the specified type.
	 * 
	 * @param type The type to check.
	 * @param typeName The name of the type to check.
	 * 
	 * @return True if the specified type is of the specified type name. Keep in
	 * mind, the type must match exactly, meaning, if it has multiple type names
	 * associated with it, this will always return false.
	 * 
	 * @see #DoesTypeOverlap()
	 */
	public function doesTypeMatch(type :ObjectType, typeName :String) :Bool
	{
		var t :Null<Int> = _typeList.get(typeName);
		return (t != null) && type.bits == 1 << t;
	}
	
	/**
	 * Determines whether an object type contains the specified type.
	 * 
	 * @param type The type to check.
	 * @param typeName The name of the type to check.
	 * 
	 * @return True if the specified type is of the specified type name. Keep in
	 * mind, the type must only contain the type name, meaning, if it has multiple
	 * type names associated with it, only one of them has to match.
	 * 
	 * @see #DoesTypeMatch()
	 */
	public function doesTypeOverlap(type :ObjectType, typeName :String) :Bool
	{
		var t :Null<Int> = _typeList.get(typeName);
		return (t != null) && (type.bits & (1 << t)) != 0;
	}
	
	/**
	 * Determines whether two object types are of the same type.
	 * 
	 * @param type1 The type to check.
	 * @param type2 The type to check against.
	 * 
	 * @return True if type1 and type2 contain the exact same types.
	 */
	public function doTypesMatch(type1 :ObjectType, type2 :ObjectType) :Bool
	{
		return type1.bits == type2.bits;
	}
	
	/**
	 * Determines whether two object types have overlapping types.
	 * 
	 * @param type1 The type to check.
	 * @param type2 The type to check against.
	 * 
	 * @return True if type1 has any of the type contained in type2.
	 */
	public function doTypesOverlap(type1 :ObjectType, type2 :ObjectType) :Bool
	{
		if (type1 == null || type2 == null)
			return false;
		
		return (type1.bits & type2.bits) != 0;
	}
	
	/**
	 * Forcibly register a specific flag. Throws an error if you overwrite an
	 * existing flag.
	 */
	public function registerFlag(bitIndex :Int, name :String) :Void
	{
		// Sanity.
		if(getTypeName(bitIndex) != null) 
			throw "Bit already in use!";
		if(_typeList.exists(name))
			throw "Name already assigned to another bit!";
		
		// Update typeCount so subsequent updates still work. This may
		// cause wasted bits.
		if(bitIndex >= _typeCount) {
			_typeCount = bitIndex + 1;
		}
		
		// And stuff into our arrays.
		// _typeList.get(name) = bitIndex;
		_bitList[bitIndex] = name;
	}
	
	var _typeCount :Int;
	var _typeList :Map<String, Int>;
	var _bitList :Array<String>;
}
