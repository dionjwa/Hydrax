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
import com.pblabs.util.ds.maps.ForwardingMap;

using com.pblabs.util.IterUtil;
using Lambda;

/**
  * This map keeps a separate sorted list of keys.  Thus, addition (eps.)
  * and removal of keys is slightly more expensive than regular
  * maps, but key or value iteration and value retrieval is just as fast.
  */
class SortedMap<K, V> extends ForwardingMap<K, V>
{
	public function new (source :Map<K, V>, sortFunction :K->K->Int)
	{
		Preconditions.checkNotNull(sortFunction, "Sort function null");
		super(source);
		_sortFunction = sortFunction;
		_sortedKeys = source.keys().toArray();
		_sortedKeys.sort(_sortFunction);
	}
	
	override public function set (key :K, value :V) :Void
	{
		super.set(key, value);
		if (!_sortedKeys.has(key)) {
			_sortedKeys.push(key);
			_sortedKeys.sort(_sortFunction);
		}
	}
	
	override public function remove (key :K) :Bool
	{
		_sortedKeys.remove(key);
		return super.remove(key);
	}
	
	override public function clear () :Void
	{
		super.clear();
		_sortedKeys = new Array();
	}
	
	override public function keys () :Iterator<K>
	{
		return _sortedKeys.iterator();
	}
	
	var _sortedKeys :Array<K>;
	var _sortFunction :K->K->Int;

}


