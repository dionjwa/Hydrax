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
import com.pblabs.util.StringUtil;

/**
 * Used on platforms without non-Int/String object
 * associative arrays (dictionaries).  Converts the key to a 
 * string via Std.string(K), so you should implement unique 
 * toString methods on the key objects.
 *
 * NB, if the key is not a String, remember that the key itself 
 * is not stored, only String created from the non-String key.
 */

 class StringMap<K, V> extends TransformKeyMap<K, String, V>
{
	public function new ()
	{
		super(StringUtil.getStringKey, new HashMap<String, V>()); 
	}
}
