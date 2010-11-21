/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.sets;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.MultiSet;
import com.pblabs.util.ds.Set;
import com.pblabs.util.Preconditions;
using com.pblabs.util.ds.MapUtil;

/**
 * A MultiSet for keeping counts of objects.
 */
class MultiMapSet<T> implements MultiSet<T> 
{
	public static function create <T>(keyClass :Class<T>) :MultiMapSet<T>
	{
		var map :Map<T, Int> = Maps.newHashMap(keyClass);
		return new MultiMapSet<T>(map);
	}
	
	public function new (source :Map<T, Int>)
	{
		_source = Preconditions.checkNotNull(source);
	}
	
	public function count (o :T) :Int
	{
		return exists(o) ? _source.get(o) : 0;
	}

	public function add (o :T) :Void
	{
		_source.set(o, count(o) + 1);
	}

	public function exists (o :T) :Bool
	{
		return _source.exists(o);
	}

	public function remove (o :T) :Bool
	{
		var curCount = count(o) - 1;
		if (curCount < 0) {
			return false;
		}
		if (curCount == 0) {
			return _source.remove(o);
		} else {
			_source.set(o, curCount);
			return true;
		}
	}

	public function size () :Int
	{
		return _source.size();
	}

	public function isEmpty () :Bool
	{
		return _source.isEmpty();
	}

	public function clear () :Void
	{
		return _source.clear();
	}
	public function iterator() : Iterator<T>
	{
		return _source.keys();
	}
	
	public function forEach (fn :Dynamic->Bool) :Void
	{
		_source.forEach(function (k :Dynamic, v :Dynamic) :Bool {
			return fn(k);
		});
	}
	
	/** The map used for our source. */
	var _source:Map<T, Int>;
}


