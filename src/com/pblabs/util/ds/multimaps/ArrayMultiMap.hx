/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.multimaps;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.multimaps.AbstractMultiMap;

using com.pblabs.util.ArrayUtil;

class ArrayMultiMap<K, V> extends AbstractMultiMap<K, V>,
	implements MultiMap<K, V>
{
	public static function create <K, V>(keyClass :Class<Dynamic>) :ArrayMultiMap<K, V>
	{
		return new ArrayMultiMap<K, V>(keyClass);
	}
	
	public function new (?keyClass :Class<Dynamic>)
	{
		super();
		_map = Maps.newHashMap(keyClass);
	}
	
	override public function set (key :K, value :V) :Void
	{
		super.set(key, value);
		var arr = _map.get(key);
		if (arr == null) {
			arr = new Array<V>();
			_map.set(key, arr);
		}
		arr.push(value);
	}
	
	/**
	  * If there is no existing array, and values is an Array, 
	  * values will be used directly (so don't modify it).
	  */
	public function setAll (key :K, values :Iterable<V>) :Void
	{
		var arr = _map.get(key);
		if (arr == null) {
			if (Std.is(values, Array)) {
				_map.set(key, cast(values));
				return;
			} else {
				arr = new Array<V>();
				_map.set(key, arr);
			}
		}
		
		for (v in values) {
			arr.push(v);	
		}
	}

	override public function get (key :K) :Iterable<V>
	{
		return _map.get(key);
	}

	public function exists (key :K) :Bool
	{
		return _map.exists(key) && _map.get(key).length > 0;
	}
	
	public function existsEntry (key :K, value :V) :Bool
	{
		var arr = _map.get(key);
		if (arr == null) {
			return false;
		}
		return arr.exists(value);
	}
																															   
	public function remove (key :K) :Bool
	{
		var arr = _map.get(key);
		_size -= if (arr == null) 0 else arr.length;
		_map.remove(key);
		return arr != null && arr.length > 0;
	}
	
	public function removeEntry (key :K, value :V) :Bool
	{
		var arr = _map.get(key);
		if (arr == null) {
			return false;
		}
		var present = arr.remove(value);
		if (present) {
			_size--;
		}
		if (arr.length == 0) {
			_map.remove(key);
		}
		return present;
	}
	
	override public function keys () :Iterator<K>
	{
		return _map.keys();
	}

	override public function clear () :Void
	{
		super.clear();
		for (k in _map.keys()) {
			_map.remove(k);
		}
	}
	
	var _map :Map<K, Array<V>>;
}


