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

using com.pblabs.util.EqualableUtil;

/**
  * Bidirectional map, keys and values must be unique.
  */
class BiMap<K, V> extends ForwardingMap<K, V>
{
	public function new (source :Map<K, V>, inverse :Map<V, K>)
	{
		super(source);
		Preconditions.checkNotNull(inverse);
		_inverse = inverse;
		_inverseView = new ImmutableMap(_inverse);
		_inverse.clear();
		for (k in source.keys()) {
			set(k, source.get(k));
		}
	}
	
	override public function set (key :K, value :V) :V
	{
		if (_inverse != null && exists(key)) {
			_inverse.remove(get(key));
		}
		var previous = super.set(key, value);
		_inverse.set(value, key);
		return previous;
	}
	
	override public function remove (key :K) :V
	{
		if (exists(key)) {
			_inverse.remove(get(key));
		}
			
		return super.remove(key);
	}
	
	override public function clear () :Void
	{
		super.clear();
		inverse().clear();
	}
	
	/**
	  * ImmutableMap map.
	  */
	public function inverse () :Map<V, K>
	{
		return _inverseView;
	}
	
	var _inverse :Map<V, K>;
	var _inverseView :ImmutableMap<V, K>;
}


