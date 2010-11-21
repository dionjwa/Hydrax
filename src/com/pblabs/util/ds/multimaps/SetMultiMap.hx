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
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;
import com.pblabs.util.ds.multimaps.AbstractMultiMap;

using Lambda;

// using com.pblabs.util.ArrayUtil;

class SetMultiMap<K, V> extends AbstractMultiMap<K, V>,
	implements MultiMap<K, V>
{
	public static function create <K, V>(keyClass :Class<Dynamic>) :SetMultiMap<K, V>
	{
		return new SetMultiMap<K, V>(keyClass);
	}
	
	public function new (keyClass :Class<Dynamic>)
	{
		super();
		_map = Maps.newHashMap(keyClass);
		_keyClass = keyClass;
	}
	
	override public function set (key :K, value :V) :Void
	{
		super.set(key, value);
		var set :Set<V> = _map.get(key);
		if (set == null) {
			set = Sets.newSetOf(_keyClass);
			_map.set(key, set);
		}
		set.add(value);
	}
	
	public function setAll (key :K, values :Iterable<V>) :Void
	{
		var set :Set<V> = _map.get(key);
		if (set == null) {
			set = Sets.newSetOf(_keyClass);
			_map.set(key, set);
		}
		
		for (v in values) {
			set.add(v);	
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
		var set = _map.get(key);
		if (set == null) {
			return false;
		}
		return set.exists(value);
	}
																															   
	public function remove (key :K) :Bool
	{
		var set = _map.get(key);
		_size -= if (set == null) 0 else set.size();
		return _map.remove(key);
	}
	
	public function removeEntry (key :K, value :V) :Bool
	{
		var set = _map.get(key);
		if (set == null) {
			return false;
		}
		var present = set.remove(value);
		if (present) {
			_size--;
		}
		if (set.size() == 0) {
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
	
	var _map :Map<K, Set<V>>;
	var _keyClass :Class<Dynamic>;
}

