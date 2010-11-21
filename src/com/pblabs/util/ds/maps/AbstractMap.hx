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
import com.pblabs.util.ds.MapUtil;

/**
 * A skeletal building block for maps.
 */
class AbstractMap <K, V>
{
	public function new () :Void
	{
		_size = 0;
	}
	
	public function clear () :Void
	{
		_size = 0;
	}
	
	public function size () :Int
	{
		return _size;
	}
	
	public function exists( key : K ) : Bool 
	{
		throw "Subclasses must override";
		return false;
	}
	
	public function set (key : K, value : V) : Void 
	{
		if (!exists(key)) {
			_size++;
		}
	}
	
	public function remove (key : K) : Bool 
	{
		if (exists(key)) {
			_size--;
			return true;
		}
		return false;
	}
	
	var _size :Int;
}


