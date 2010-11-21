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
import com.pblabs.util.ds.maps.KeyListMap;
import com.pblabs.util.StringUtil;

/**
 * Used on platforms without non-Int/String object
 * associative arrays (dictionaries).  Converts the object to a 
 * string via Std.string(K), so you should implement unique 
 * toString methods on the key objects.
 *
 * NB, if the key is not a String, remember that the key itself 
 * is not stored, only String created from the non-String key.
 */

class StringMap<K, V> extends KeyListMap<K, V>,
	implements Map<K, V>
{
	public function new()
	{ 
		super();
		_hash = new Hash();
	}

	override public function set (key :K, value :V) :Void
	{
		var hash = getHash(key);
		if (!_hash.exists(hash)) {
			super.set(key, value);
		}
		_hash.set(hash, value);
	}

	public function get (key :K) :V
	{
		return _hash.get(getHash(key));
	}

	override public function exists (key :K) :Bool
	{
		return _hash.exists(getHash(key));
	}

	override public function remove (key :K) :Bool
	{
		var hash = getHash(key);
		if (!_hash.exists(hash)) {
			return false;
		}
		super.remove(key);
		var oldVal:V = _hash.get(hash);
		_hash.remove(hash);
		return oldVal != null;
	}

	override public function clear () :Void
	{
		super.clear();
		_hash = new Hash<V>();
	}
	
	public function iterator() : Iterator<V>
	{
		return _hash.iterator();
	}
	
	inline function getHash (key :K) :String
	{
		return StringUtil.getStringKey(key);
	}
	
	var _hash :Hash<V>;
}

