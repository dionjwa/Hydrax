/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript aspirin library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * aspirin library - Taking some of the pain out of Actionscript development.
 * Copyright (C) 2007-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/ooo-aspirin/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pblabs.util;

import com.pblabs.util.EqualableUtil;
import com.pblabs.util.ReflectUtil;

/**
 * Predicates suitable for lambda filter and map functions.
 */
class Predicates
 {
	
	/**
	 * A predicate that tests for null (or undefined) items.
	 */
	public static function isNull (item :Dynamic) :Bool
	{
		return (item == null);
	}

	/**
	 * A predicate that tests for items that are not null.
	 */
	public static function notNull (item :Dynamic) :Bool
	{
		return (item != null);
	}

	/**
	 * Create a predicate that tests if the item has a property that is Util.equals() to the
	 * specified value.
	 */
	public static function createPropertyEquals (propName :String, value :Dynamic) :Dynamic ->Bool
	{
		return function (item :Dynamic) :Bool {
			return item != null && EqualableUtil.equals(ReflectUtil.field(item, propName), value); 
		};
	}

	/**
	 * Create a predicate that returns true if the item is in the specified Array.
	 */
	public static function createIn (array :Array<Dynamic>) :Dynamic->Bool
	{
		return function (item :Dynamic) :Bool {
			return Lambda.has(array, item);
		};
	}

	/**
	 * Return a predicate that tests for items that are "is" the specified class.
	 */
	public static function createIs (clazz :Class<Dynamic>) :Dynamic->Bool
	{
		return function (item :Dynamic) :Bool {
			return Std.is(item, clazz);
		};
	}

	/**
	 * Return a predicate that is the negation of the specified predicate.
	 */
	public static function createNot (pred :Dynamic->Bool) :Dynamic->Bool
	{
		return function (arg :Dynamic) :Bool {
			return !pred(arg);
		}
		// return function (?args:Array<Dynamic>) :Bool {
		//	 args = if (args == null) EMPTY_ARRAY else args;
		//	 return !Reflect.callMethod(null, pred, args);
		// };
	}

	/**
	 * Return a predicate that is true if all the specified predicate Functions are true
	 * for any item.
	 */
	public static function createAnd (predicates:Array<Dynamic>) :Dynamic
	{
		return function (?args:Array<Dynamic>) :Bool {
			args = if (args == null) EMPTY_ARRAY else args;
			for (pred in predicates) {
				if (!Reflect.callMethod(null, pred, args)) {
					return false;
				}
			}
			return true;
		};
	}

	/**
	 * Return a predicate that is true if any of the specified predicate Functions are true
	 * for any item.
	 */
	public static function createOr (predicates:Array<Dynamic>) :Dynamic
	{
		return function (args:Array<Dynamic>) :Bool {
			args = if (args == null) EMPTY_ARRAY else args;
			for (pred in predicates) {
				if (Reflect.callMethod(null, pred, args)) {
					return true;
				}
			}
			return false;
		};
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = []; 
}


