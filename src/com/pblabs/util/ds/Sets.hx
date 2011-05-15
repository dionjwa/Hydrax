/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds;

import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.sets.MapSet;

/**
 * Factory for creating Sets.
 *
 */
class Sets
 {
	/**
	 * Create a new Set for storing values of the specified class.
	 */
	public static function newSetOf <T>(valueClazz :Class<Dynamic>) :Set<T>
	{
		#if js
		if (valueClazz == String || valueClazz == Int) {
			return new MapSet<T>(Maps.newHashMap(valueClazz));
		} else {
			//js doesn't have Object sets
			return new com.pblabs.util.ds.sets.ArraySet<T>();
		}
		#else
		return new MapSet<T>(Maps.newHashMap(valueClazz));
		#end
	}
	
	public static function fromArray <T>(set :Set<T>, arr :Array<T>) :Set<T>
	{
	    set.clear();
	    for (i in arr) {
	    	set.add(i);
	    }
	    return set;
	}
	
}
