/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;
import haxe.FastList;

/**
 * For maps than need a separate list of keys to obey the generic 
 * <K,V> restriction.
 */
class KeyListMap <K, V> extends AbstractMap<K, V>
 {
	public function new() 
	{ 
		super();
		_keys = new FastList<K>();
	}
	
	override public function set (key :K, value :V) :Void
	{
		super.set(key, value);
		// _size++;
		_keys.add(key);
	}
	
	override public function remove (key :K) :Bool
	{
		if (super.remove(key)) {
			_keys.remove(key);
			return true;
		}
		return false;
	}
	
	public function keys () :Iterator<K>
	{
		return _keys.iterator();
	}
	
	override public function clear () :Void
	{
		super.clear();
		_keys = new FastList<K>();
	}
	
	var _keys :FastList<K>;
	
}
