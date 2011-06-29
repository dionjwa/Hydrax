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

/**
 * Used on platforms without non-Int/String object
 * associative arrays (dictionaries).  Converts the enum key to a 
 * int  via Type.enumIndex(K), so doesn't work with enums with contructor args.
 */

class EnumMap<K, V> extends TransformKeyMap<K, Int, V>
{
	public function new ()
	{
		super(Type.enumIndex, new IntHashMap<V>()); 
	}
}
