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
