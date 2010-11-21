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
		return new MapSet<T>(Maps.newHashMap(valueClazz));
	}
}


