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

using Lambda;

using com.pblabs.util.ArrayUtil;

//TODO: untested
class ListMultiMap<K, V> extends AbstractMultiMap<K, V>,
	implements MultiMap<K, V>
{
	public static function create <K, V>(keyClass :Class<Dynamic>) :ListMultiMap<K, V>
	{
		return new ListMultiMap<K, V>(keyClass);
	}
	
	public function new (keyClass :Class<Dynamic>)
	{
		super();
		_map = Maps.newHashMap(keyClass);
	}
	
	override public function set (key :K, value :V) :Void
	{
		super.set(key, value);
		var arr = _map.get(key);
		if (arr == null) {
			arr = new List<V>();
			_map.set(key, arr);
		}
		arr.add(value);
	}
	
	public function setAll (key :K, values :Iterable<V>) :Void
	{
		var arr = _map.get(key);
		if (arr == null) {
			arr = new List<V>();
			_map.set(key, arr);
		}
		
		for (v in values) {
			arr.add(v);	
		}
	}

	override public function get (key :K) :Iterable<V>
	{
		return _map.get(key);
	}

	public function exists (key :K) :Bool
	{
		return _map.exists(key);
	}
	
	public function existsEntry (key :K, value :V) :Bool
	{
		var arr = _map.get(key);
		if (arr == null) {
			return false;
		}
		return arr.has(value);
	}
																															   
	public function remove (key :K) :Bool
	{
		var arr = _map.get(key);
		_size -= if (arr == null) 0 else arr.length;
		_map.remove(key);
		return arr != null;
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
			if (arr.length == 0) {
				_map.remove(key);
			}
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
	
	var _map :Map<K, List<V>>;
}


