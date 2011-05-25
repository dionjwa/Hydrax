/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.MapUtil;

/**
  * A map that implements Dynamic, so you can set key/values
  * using dot notation, i.e. map.key = foo;
  * 
  * Tested on Flash and JS platforms.
  */
class DynamicMap<V>
	implements Map<String, V>, implements Dynamic<V>
{
	public static function from <T>(obj :Dynamic) :DynamicMap<T>
	{
		var m = new DynamicMap<T>();
		for (f in Reflect.fields(obj)) {
			m.set(f, Reflect.field(obj, f));
		}
		return m;
	}
	
	public function new () {}
	
	public function set (key :String, value :V) :V
	{
		Reflect.setField(this, key, value);
		return value;
	}

	public function get (key :String) :V
	{
		return Reflect.field(this, key);
	}

	public function exists (key :String) :Bool
	{
		return Reflect.hasField(this, key);
	}

	public function remove (key :String) :V
	{
		var previous = get(key);
		Reflect.deleteField(this, key);
		return previous;
	}

	public function size () :Int
	{
		//Untested, does this include class members in all platforms?
		return Reflect.fields(this).length;
	}

	public function clear () :Void
	{
		for (k in keys()) {
			remove(k);
		}
	}

	public function keys () :Iterator<String>
	{
		return Reflect.fields(this).iterator();
	}

	public function iterator() :Iterator<V>
	{
		//Not efficient at all
		var values = new Array<V>();
		for (k in keys()) {
			values.push(get(k));
		}
		return values.iterator();
	}
	
	#if debug
	public function toString () :String
	{
		return null;//MapUtil.toString(this);
	}
	#end
	
	public function forEach (fn :String->V->Dynamic) :Void
	{
		throw "Abstract";
	}

}

