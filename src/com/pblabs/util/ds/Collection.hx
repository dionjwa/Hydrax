/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds;
/**
 * A collection of objects.
 */
interface Collection<T>
{
	/**
	 * Returns true if this set contains the specified element.
	 */
	function exists (o :T) :Bool;

	/**
	 * Removes the specified element from this set if it is present.
	 * Returns true if the set contained the specified element.
	 */
	// function remove (o :T) :Bool;

	/**
	 * Returns the number of elements in this set.
	 */
	function size () :Int;

	/**
	 * Returns true if this set contains no elements.
	 */
	// function isEmpty () :Bool;

	/**
	 * Remove all elements from this set.
	 */
	function clear () :Void;
}
