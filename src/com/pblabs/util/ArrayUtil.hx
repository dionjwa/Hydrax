/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.util.EqualableUtil;
import mathx.RandomGenerator;

/**
 * Contains methods operating on Arrays that understand the 
 * Equalable interface.
 */
class ArrayUtil	
{
	/**
	 * @return the zero-based index of the matching element, or -1 if none found.
	 */
	public static function indexOf (it :Array<Dynamic>, element :Dynamic) :Int
	{
		return com.pblabs.util.IterUtil.indexOf(it, element);
	}
	
	public static function exists (arr :Array<Dynamic>, element :Dynamic) :Bool
	{
		return indexOf(arr, element) != -1;
	}
	
	public static function isEmpty (arr :Array<Dynamic>) :Bool
	{
		return arr == null || arr.length == 0;
	}
	/**
	 * Remove the first instance of the specified element from the array.
	 *
	 * @return true if an element was removed, false otherwise.
	 */
	public static function removeFirst (arr :Array<Dynamic>, element :Dynamic) :Bool
	{
		return removeIfImpl(arr, element, true);
	}

	/**
	 * Removes all instances of the specified element from the array.
	 *
	 * @return true if at least one element was removed, false otherwise.
	 */
	public static function removeAll (arr :Array<Dynamic>, element :Dynamic) :Bool
	{
		return removeIfImpl(arr, element, false);
	}
	
	/**
	 * Randomly shuffle the elements in the specified array.
	 *
	 * @param rando a random number generator to use, or null if you don't care.
	 */
	public static function shuffle (arr :Array<Dynamic>, rando :RandomGenerator = null) :Void
	{
		var randFunc = rando != null ? rando.nextInt :
			function (n :Int) :Int {
				return Std.int(Math.random() * n);
			};
		// starting from the end of the list, repeatedly swap the element in
		// question with a random element previous to it up to and including
		// itself
		var ii = arr.length - 1;
		while (ii > 0) {
			var idx = randFunc(ii + 1);
			var tmp = arr[idx];
			arr[idx] = arr[ii];
			arr[ii] = tmp;
			ii--;
		}
	}

	/**
	 * Implementation of removeIf methods.
	 */
	static function removeIfImpl (arr :Array<Dynamic>, element :Dynamic, firstOnly :Bool) :Bool
	{
		var removed:Bool = false;
		var ii :Int = 0;
		while (ii < arr.length) {
			if (EqualableUtil.equals(element, arr[ii])) {
				arr.splice(ii--, 1);
				if (firstOnly) {
					return true;
				}
				removed = true;
			}
			ii++;
		}
		return removed;
	}
}
