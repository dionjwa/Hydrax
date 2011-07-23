/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

/**
  * Uses Equalable for testing equality if the element
  * implements the interface. 
  */
class IterUtil
{
	public static function getFirst <T>(it :Iterable<T>, f :T->Bool) :T
	{
		for (val in it) {
			if (f(val)) {
				return val;
			}
		}
		return null;
	}
	
	/**
	 * @return the zero-based index of the matching element, or -1 if none found.
	 */
	public static function indexOf (it :Iterable<Dynamic>, element :Dynamic) :Int
	{
		if (it != null) {
			var idx = 0;
			var iter = it.iterator();
			while (iter.hasNext()) {
				if (EqualableUtil.equals(iter.next(), element)) {
					return idx; 
				}
				idx++;
			}
		}
		return -1; // never found
	}
	
	public static function exists (arr :Iterable<Dynamic>, element :Dynamic) :Bool
	{
		return indexOf(arr, element) != -1;
	}
	
	public static function join (arr :Iterable<Dynamic>, ?sep :String = ", ") :String
	{
		var iter = arr.iterator();
		var s = if (iter.hasNext()) Std.string(iter.next()) else "";
		while (iter.hasNext()) {
			s += sep + iter.next();
		}
		return s;
	}
	
	public static function map<A, B> (it :Iterator<A>, f :A->B) :Iterable<B>
	{
		var list = new List<B>();
		while(it.hasNext()) {
			list.add(f(it.next()));
		}
		return list;
	}
	
	public static function toArray <T> (it :Iterator<T>) :Array<T>
	{
		var result = new Array<T>();
		while (it.hasNext()) {
			result.push(it.next());
		}
		return result;
	}
	
	public static function const <T> (val :T) :Dynamic->T
	{
		return function (ignore :Dynamic) :T {
			return val;
		}
	}
	
	public static function id <T> (val :T) :T
	{
		return val;
	}
	
	/**
	  * Convenience function when about to iterate over a possibly null array
	  */
	public static function ensureNotNull <T> (arr :Array<T>) :Array<T>
	{
		return arr  != null ? arr :cast EMPTY_ARRAY;
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}
