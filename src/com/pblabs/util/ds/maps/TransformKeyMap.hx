/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;

import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Map;

import haxe.FastList;

using Lambda;

/**
 * Basis for maps where the stored key is different to 
 * the given key.  Examples: HashableMap, where Hashable keys
 * only have the int hash code stored in the map.
 *
 * Keys are stored in a separate list (for iteration of key values) as 
 * the given keys are not used by the underlying map.
 */
class TransformKeyMap<K, K2, V>
	implements Map<K, V>
{
	var _convertKey :K->K2;
	var _keys :FastList<K>;
	
	public function new(convertKeyFn :K->K2, source :Map<K2, V>)
	{ 
		_source = Preconditions.checkNotNull(source);
		_convertKey = convertKeyFn;
		_keys  = new FastList<K>();
	}

	public function set (key :K, value :V) :V
	{
		var k2 = _convertKey(key);
		if (!_source.exists(k2)) {
			_keys.add(key);
		}
		return _source.set(k2, value);
	}

	public function get (key :K) :V
	{
		return _source.get(_convertKey(key));
	}

	public function exists (key :K) :Bool
	{
		return _source.exists(_convertKey(key));
	}

	public function remove (key :K) :V
	{
		var k2 = _convertKey(key);
		if (_source.exists(k2)) {
			_keys.remove(key);
		}
		return _source.remove(k2);
	}

	public function size () :Int
	{
		return _source.size();
	}

	public function clear () :Void
	{
		_source.clear();
		_keys  = new FastList<K>();
	}

	public function keys () :Iterator<K>
	{
		return _keys.iterator();
	}

	public function iterator () :Iterator<V>
	{
		return _source.iterator();
	}
	
	#if debug
	public function toString () :String
	{
		return Std.string(_source);
	}
	#end
	
	public function forEach (fn :K->V->Dynamic) :Void
    {
        for (k2 in _keys) {
        	fn(k2, get(k2));
        }
    }

	var _source:Map<K2, V>;
}
