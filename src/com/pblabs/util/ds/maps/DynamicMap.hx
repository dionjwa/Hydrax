/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
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
	public function new () {}
	
	public function set (key :String, value :V) :Void
	{
		Reflect.setField(this, key, value);
	}

	public function get (key :String) :V
	{
		return Reflect.field(this, key);
	}

	public function exists (key :String) :Bool
	{
		return Reflect.hasField(this, key);
	}

	public function remove (key :String) :Bool
	{
		return Reflect.deleteField(this, key);
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

	public function iterator() : Iterator<V>
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
		return MapUtil.toString(this);
	}
	#end

}

