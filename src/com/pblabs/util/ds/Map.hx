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
 * A map is the same as a Hash, except that both keys and values
* are typed. 
 *
 * @see com.pblabs.util.ds.Maps
 */
interface Map<K, V> 
{
	/**
	  * Map the key to the value.
	  */
	function set (key :K, value :V) :Void;

	/**
	  * Get the value associated with the key.
	  */
	function get (key :K) :V;

	/**
	  * Does a key exist that maps to a value
	  */
	function exists (key :K) :Bool;

	/**
	  * Removes the key and associated value.
	  */
	function remove (key :K) :Bool;

	/**
	  * The number of [key, value] pairs.
	  */
	function size () :Int;

	/**
	  * Remove all keys and values.
	  */
	function clear () :Void;

	/**
	  * Iterator for all keys.
	  */
	function keys () :Iterator<K>;

	/**
	  * Iterator over all values.
	  */
	function iterator() : Iterator<V>;

}
