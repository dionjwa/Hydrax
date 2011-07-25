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
import com.pblabs.util.ds.Set;
import com.pblabs.util.Preconditions;
/**
 * A Set that uses a Map for storing the elements.
 */
class MapSet<T> implements Set<T> 
{
	public function new (source :Map<T, Bool>)
	{
		_source = Preconditions.checkNotNull(source);
	}

	public function add (o :T) :Void
	{
		_source.set(o, true);
	}

	public function exists (o :T) :Bool
	{
		return _source.exists(o);
	}

	public function remove (o :T) :Bool
	{
		var isPrevious = exists(o);
		_source.remove(o);
		return isPrevious;
	}

	public function size () :Int
	{
		return _source.size();
	}

	public function isEmpty () :Bool
	{
		return _source.size() == 0;
	}

	public function clear () :Void
	{
		_source.clear();
	}
	public function iterator() : Iterator<T>
	{
		//Iterate over values, not keys, since keys may be converted
		//to Ints or Strings by the underlying map
		return _source.keys();
	}
	
	public function forEach (fn :T->Dynamic) :Void
	{
		_source.forEach(function (k :T, v :Dynamic) :Bool {
			return fn(v);
		});
	}
	
	#if debug
	public function toString () :String
	{
		return "(" + Lambda.array(this).join(", ") + ")";
	}
	#end
	
	
	/** The map used for our source. */
	var _source:Map<T, Bool>;
}

