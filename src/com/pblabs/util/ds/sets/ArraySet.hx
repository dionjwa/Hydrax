package com.pblabs.util.ds.sets;

import com.pblabs.util.ds.Set;
using com.pblabs.util.ArrayUtil;

class ArraySet<T> implements Set<T>
{
	var _arr :Array<T>;
	
	public function new ()
	{
		_arr = [];
	}
	
	public function add (o :T) :Void
	{
		remove(o);
		_arr.push(o);		
	}
	
	public function remove (o :T) :Bool
	{
		return _arr.removeFirst(o);
	}

	public function isEmpty () :Bool
	{
		return _arr.length == 0;
	}

	public function iterator() : Iterator<T>
	{
		return _arr.iterator();
	}
	
	public function exists (o :T) :Bool
	{
		return _arr.exists(o);
	}

	public function size () :Int
	{
		return _arr.length;
	}

	public function clear () :Void
	{
		_arr = [];
	}
	
	#if debug
	public function toString () :String
	{
		return com.pblabs.util.ArrayUtil.join(_arr);
	}
	#end
}
