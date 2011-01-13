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
import com.pblabs.util.ds.maps.ForwardingMap;

class ImmutableMap<K, V> extends ForwardingMap<K, V>
{
	public function new (source :Map<K, V>)
	{
		super(source);
	}
	
	override public function set (key :K, value :V) :V
	{
	   throw "Unsupported operation: Immutable";
	   return null;
	}
	
	override public function remove (key :K) :V
	{
		throw "Unsupported operation: Immutable";
		return null;
	}
	
	override public function clear () :Void
	{
		throw "Unsupported operation: Immutable";
	}
	
}


