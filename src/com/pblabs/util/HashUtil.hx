/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;
import com.pblabs.util.ds.Hashable;

class HashUtil
{
	public static function computeHashCodeFromHashables (v1 :Hashable, v2 :Hashable) :Int
	{
		var value :Int = 17;
		value = value * 31 + (v1 == null ? 0 : v1.hashCode());  
		value = value * 31 + (v2 == null ? 0 : v2.hashCode());
		return value;
	}
}
