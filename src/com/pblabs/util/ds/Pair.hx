/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds;
import com.pblabs.util.HashUtil;
import com.pblabs.util.StringUtil;
using com.pblabs.util.EqualableUtil;

class Pair<T:Hashable>
	implements Hashable
{
	static var temp :Pair<Dynamic> = new Pair(null, null);
	
	public static function containsPair (c :Collection<Dynamic>, v1 :Dynamic, v2 :Dynamic) :Bool
	{
		temp.set(v1, v2);
	    var isValue = c.exists(temp);
	    temp.clear();
	    return isValue;
	}
	
	public static function comparePairs (a :Pair<Dynamic>, b :Pair<Dynamic>) :Int
	{
		return com.pblabs.util.Comparators.compareInts(a.hashCode(), b.hashCode());    
	}
	
	public var v1 (default, null) :T;
	public var v2 (default, null) :T;
	
	public function new (v1 :T, v2 :T)
	{
		set(v1, v2);
	}
	
	public function hashCode () :Int
	{
		return _hashCode;
	}
	
	public function equals (other :Pair<T>) :Bool
	{
		return v1.equals(other.v1) && v2.equals(other.v2);//other.hashCode() == this.hashCode();
	}
	
	//Bad idea?
	public function clear () :Void
	{
		v1 = null;
		v2 = null;
		_hashCode = 0;
	}
	
	//Bad idea?  It would fuck up Tuple map keys
	//OTOH, it lets us cache keys.
	public function set (v1 :T, v2 :T) :Pair <T>
	{
		this.v1 = v1;
		this.v2 = v2;
		if (v1 == null && v2 == null) {
			_hashCode = 0;
		} else if (v1 == null){
			_hashCode = v2.hashCode();
		} else if (v2 == null){
			_hashCode = v1.hashCode();
		}else {
			//Collisions when the values are close together
			// _hashCode = v1.hashCode() ^ v2.hashCode();
			_hashCode = StringUtil.hashCode(haxe.SHA1.encode(v1.hashCode() + ":" + v2.hashCode()));
		}
		return this;
	}

	var _hashCode :Int;
	
	#if debug
	public function toString () :String
	{
		return "Pair[" + v1 + ", " + v2 + "]";
	}
	#end
}
