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
* HaXe enums don't have this convenient field accession. and allow multiple instances, 
* but to also have the compiler checking of enums in switches, this class wraps enum types.
*/
class Enumerable<T,E>
	implements Hashable, implements Equalable<Enumerable<T,E>>, implements Comparable<Enumerable<T,E>>  
{
	public var name (get_name, never) :String;
	public var ordinal (get_ordinal, never) :Int;
	/** Corresponding enum.  Used for haxe compiler enum functionality e.g. switches. */
	public var e (get_enum, never) :E;
	
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
		// trace("cls=" + cls);
		// trace("_enums.get(cls)=" + com.pblabs.util.ds.MapUtil.toString(_enums.get(cls)));
		return cast(_enums.get(cls).get(name));
	}
	
	public static function serializedValueOf <T>(clsName :String, name :String) :T
	{
		// trace("clsName=" + clsName);
		// trace("name=" + name);
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
	
	public static function getOrdinal (e :Enumerable<Dynamic, Dynamic>) :Int
	{
		var cls = Type.getClass(e);
		Preconditions.checkNotNull(cls);
		var arr = _enums.get(cls).array();
		return arr.indexOf(e);
	}
	
	//For map functions
	static function getEnumName (e :Enumerable<Dynamic, Dynamic>) :String
	{
		return e.name;
	}
	
	/**
	  * Keep the constructor private
	  */
	private function new (en :E) 
	{
		Preconditions.checkNotNull(en);
		Preconditions.checkArgument(switch(Type.typeof(en)) {
			case TEnum(e): true;
			default: false;
		}, "en must be an Enum");
		_enum = en;
		_name = Type.enumConstructor(en);
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
	
	inline public function equals (other :Enumerable<T,E>) :Bool
	{
		return other == this;
	}

	inline public function hashCode () :Int
	{
		return _hashCode;
	}

	public function toString () :String
	{
		return name;
	}
	
	public function compareTo (other :Enumerable<T,E>) :Int
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
	
	inline function get_enum () :E
	{
		return _enum;
	}
	
	var _name :String;
	var _enum :E;
	var _hashCode :Int;
	var _ordinal :Int;
	
	//Hidden static map of all Enumerable instances.
	static var _enums :Map<Class<Dynamic>, Map<String, Enumerable<Dynamic, Dynamic>>> = new StringMap();
}


