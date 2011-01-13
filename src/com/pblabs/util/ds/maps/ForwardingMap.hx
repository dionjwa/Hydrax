/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;

/**
 * A map that forwards requests to another map, used as a building
 * block for more complex functionality.
 */
class ForwardingMap<K, V> implements Map<K, V> 
{
	
	public function new (source :Map<K, V>)
	{
		_source = Preconditions.checkNotNull(source);
	}

	public function set (key :K, value :V) :V
	{
		return _source.set(key, value);
	}

	public function get (key :K) :V
	{
		return _source.get(key);
	}

	public function exists (key :K) :Bool
	{
		return _source.exists(key);
	}

	public function remove (key :K) :V
	{
		return _source.remove(key);
	}

	public function size () :Int
	{
		return _source.size();
	}

	public function clear () :Void
	{
		_source.clear();
	}

	public function keys () :Iterator<K>
	{
		return _source.keys();
	}

	public function iterator () :Iterator<V>
	{
		return _source.iterator();
	}
	
	public function toString () :String
	{
		return Std.string(_source);
	}
	
	public function forEach (fn :K->V->Dynamic) :Void
    {
        _source.forEach(fn);
    }

	var _source:Map<K, V>;
}

