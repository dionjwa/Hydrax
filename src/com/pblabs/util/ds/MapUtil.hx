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

typedef MapType = {
	function keys () :Iterator<Dynamic>;
	function get (key :Dynamic) :Dynamic;
}
// #end

/**
 *Use using com.pblabs.util.ds.MapUtil 
 */
class MapUtil
{
	public static function forEach (map :Map<Dynamic, Dynamic>, fn :Dynamic->Dynamic->Dynamic) :Void
	{
		for (k in map.keys()) {
			//If the function returns true, stop looping
			if (fn(k, map.get(k))) {
				break;
			}
		}
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
	
	// #if debug
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
	// #end
}
