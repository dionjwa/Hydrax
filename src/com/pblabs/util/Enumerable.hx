/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.util.Comparators;
import com.pblabs.util.Equalable;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Hashable;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.maps.StringMap;

using Lambda;

using com.pblabs.util.IterUtil;

/**
* Base class that implements common functionality for enumeration classes. An
* enumeration class is essentially a class that is just a list of constant
* values. They can be used to add type safety to properties that need to be
* limited to a specific subset of values.
* 
* HaXe enums don't have this convenient field accession, and allow multiple instances.
*/
class Enumerable<T>
	implements Hashable, implements Equalable<Enumerable<T>>, implements Comparable<Enumerable<T>>  
{
	public var name (get_name, never) :String;
	public var ordinal (get_ordinal, never) :Int;
	
	public static function values <T>(cls :Class<T>) :Iterable<T>
	{
		return cast(_enums.get(cls));
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
		var arr = _enums.get(cls).array();
		Preconditions.checkPositionIndex(ordinal, arr.length);
		return cast(arr[ordinal]);
	}
	
	public static function getOrdinal (e :Enumerable<Dynamic>) :Int
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
	  * Keep the constructor private
	  */
	private function new (name :String) 
	{
		Preconditions.checkNotNull(name);
		_name = name;
		var cls = Type.getClass(this);
		
		if (!_enums.exists(cls)) {
			_enums.set(cls, new StringMap());
		}
		
		var map = _enums.get(cls);
		
		Preconditions.checkArgument(!map.exists(name), "Enum already exists! " + this);
		map.set(name, this);
		_ordinal = Enumerable.getOrdinal(this);
		//Be default, the hashCode is the ordinal value.
		_hashCode = _ordinal; 
	}
	
	inline public function equals (other :Enumerable<T>) :Bool
	{
		return other == this;
	}

	public function hashCode () :Int
	{
		return _hashCode;
	}

	public function toString () :String
	{
		return name;
	}
	
	public function compareTo (other :Enumerable<T>) :Int
	{
		com.pblabs.util.Assert.isTrue(Std.is(other, Type.getClass(this)), "Not same Enumerable type");
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
}


