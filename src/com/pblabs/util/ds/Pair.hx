package com.pblabs.util.ds;

import com.pblabs.util.EqualableUtil;
import com.pblabs.util.HashUtil;
import com.pblabs.util.StringUtil;

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
		return other.hashCode() == this.hashCode();
	}
	
	public function toString () :String
	{
		return "Pair[" + v1 + ", " + v2 + "]";
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
			_hashCode = v1.hashCode() ^ v2.hashCode();
		}
		return this;
	}

	var _hashCode :Int;
}
