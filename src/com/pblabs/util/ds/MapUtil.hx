/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds;

import com.pblabs.util.Constants;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Map;

import Type;

typedef MapType = {
	function keys () :Iterator<Dynamic>;
	function get (key :Dynamic) :Dynamic;
}

/**
 *Use using com.pblabs.util.ds.MapUtil 
 */
class MapUtil
{
	public static function copyFrom (destination :Map<Dynamic, Dynamic>, source :Map<Dynamic, Dynamic>) :Map<Dynamic, Dynamic>
	{
		for (k in source.keys()) {
			destination.set(k, source.get(k));
		}
		return destination;
	}
	
	
	public static function forEach (map :Map<Dynamic, Dynamic>, fn :Dynamic->Dynamic->Dynamic) :Void
	{
		com.pblabs.util.Assert.isNotNull(map, " map is null");
		com.pblabs.util.Assert.isNotNull(fn, " fn is null");
		for (k in map.keys()) {
			//If the function returns true, stop looping
			if (fn(k, map.get(k))) {
				break;
			}
		}
	}
	
	public static function fromArray <T>(arr :Array<Dynamic>, type :ValueType) :T
	{
		if (arr == null) {
			return null;
		}
		var map = Maps.newHashMap(type);
		var ii = 0;
		while (ii < arr.length) {
			map.set(arr[ii], arr[ii + 1]);
			ii += 2;
		}
		return cast map;
	}
	
	public static function toArray (map :Map<Dynamic, Dynamic>) :Array<Dynamic>
	{
		if (map == null) {
			return null;
		}
		var arr :Array<Dynamic> = [];
		for (k in map.keys()) {
			arr.push(k);
			arr.push(map.get(k));
		}
		return arr;
	}
	
	
	public static function isEmpty (map :Map<Dynamic, Dynamic>) :Bool
	{
		return map.size() == 0;
	}
	
	public static function createToField <T> (fieldName :String) :Dynamic->T
	{
		return function (obj :Dynamic) :T {
			return ReflectUtil.field(obj, fieldName);
		}
	}
	
	public static function createFunctionMapping <T> (fieldName :String) :Dynamic->T
	{
		return function (obj :Dynamic) :T {
			return Reflect.callMethod(obj, fieldName, Constants.EMPTY_ARRAY);
		}
	}
	
	public static function createIndexMap <T> (items :Array<T>, map :Map<Int,T>) :Void
	{
		for (ii in 0...items.length) {
			map.set(ii, items[ii]);
		}
	}
	
	/**
	  * For use with Lambda.mapi
	  */
	public static function toIndex (index :Int, item :Dynamic) :Int
	{
		return index;
	}
	
	public static function toString(map :MapType, ?sep :String = ":", ?stringifyValues :Bool = false) :String 
	{
		if (map == null) {
			return "null";
		}
		var s = new StringBuf();
		s.add("{");
		var it = map.keys();
		for(i in it) {
			s.add(StringUtil.getStringKey(i));
			s.add(sep);
			if (stringifyValues) s.add("'");
			s.add(StringUtil.getStringKey(map.get(i)));
			if (stringifyValues) s.add("'");
			if( it.hasNext() )
				s.add(", ");
		}
		s.add("}");
		return s.toString();
	}
}
