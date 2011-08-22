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

import Type;

using Lambda;

class SetMultiMap<K, V> extends AbstractMultiMap<K, V>,
	implements MultiMap<K, V>
{
	public static function create <K, V>(keyType :ValueType, ?valueType :ValueType) :SetMultiMap<K, V>
	{
		return new SetMultiMap<K, V>(keyType, valueType);
	}
	
	var _map :Map<K, Set<V>>;
	var _keyType :ValueType;
	var _valueType :ValueType;
	
	public function new (keyType :ValueType, ?valueType :ValueType)
	{
		super();
		_map = Maps.newHashMap(keyType);
		_keyType = keyType;
		_valueType = valueType;
	}
	
	override public function set (key :K, value :V) :Void
	{
		
		if (_valueType == null) {
			_valueType = Type.typeof(value);
			com.pblabs.util.Assert.isNotNull(_valueType, "Cannot get type of value=" + value);
		}
		super.set(key, value);
		var set :Set<V> = _map.get(key);
		if (set == null) {
			set = Sets.newSetOf(_valueType);
			_map.set(key, set);
		}
		set.add(value);
	}
	
	public function setAll (key :K, values :Iterable<V>) :Void
	{
		var set :Set<V> = _map.get(key);
		if (set == null) {
			set = Sets.newSetOf(_keyType);
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
		_map.remove(key);
		return set != null && set.size() > 0;
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
	
	public function sizeOf (key :K) :Int
	{
	    return _map.exists(key) && _map.get(key) != null ? _map.get(key).size() : 0;
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
}
