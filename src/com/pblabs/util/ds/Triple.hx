/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds;

import com.pblabs.util.ds.Hashable;
import com.pblabs.util.ds.Tuple;
import com.pblabs.util.StringUtil;
import com.pblabs.util.EqualableUtil;

class Triple <V1, V2, V3> extends Tuple<V1, V2>
{
	public var v3 (default, null) :V3;
	
	public function new (v1 :V1, v2 :V2, v3 :V3)
	{
		super(v1, v2);
		this.v3 = v3;
	}
	
	//TODO: make better.  This is a rather crappy hash function.  
	public static function computeHashCode (v1 :Dynamic, v3 :Dynamic, v2 :Dynamic) :Int
	{
		return Tuple.computeHashCode(v1, v2) * 31 + 
			if (v3 == null) {
				StringUtil.hashCode("" + null);
			} else if (Std.is(v3, Int)) {
				v3;
			} else if (Std.is(v3, Hashable)) {
				cast(v3, Hashable).hashCode();
			} else {
				StringUtil.hashCode("" + v3);
			};
	}
	
	override public function equals (other :Dynamic) :Bool
	{
		if (!Std.is(other, Triple)) {
			return false;
		}
		var v :Triple <V1, V2, V3> = cast(other);
		return EqualableUtil.equals(v1, v.v1) && EqualableUtil.equals(v2, v.v2) && EqualableUtil.equals(v3, v.v3);
	}
	
	override public function toString () :String
	{
		return "[" + v1 + ", " + v2 + ", "+ v3 + "]";
	}
	
	override public function clear () :Void
	{
		super.clear();
		v3 = null;
	}
}


