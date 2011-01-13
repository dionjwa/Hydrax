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
interface Map<K, V> implements Collection<K> 
{
	/**
	  * Map the key to the value.
	  * Returns the previous value stored for that key, or undefined.
	  */
	function set (key :K, value :V) :V;

	/**
	  * Get the value associated with the key.
	  */
	function get (key :K) :V;

	/**
	  * Does a key exist that maps to a value
	  */
	// function exists (key :K) :Bool;

	/**
	  * Removes the key and associated value.
	  * Returns the associated value.
	  */
	function remove (key :K) :V;

	/**
	  * The number of [key, value] pairs.
	  */
	// function size () :Int;

	/**
	  * Remove all keys and values.
	  */
	// function clear () :Void;

	/**
	  * Iterator for all keys.
	  */
	function keys () :Iterator<K>;

	/**
	  * Iterator over all values.
	  */
	function iterator() : Iterator<V>;
	
	/**
	  * Iterate over all key-value pairs.  Some maps optimise this to be
	  * faster than regular iteration over keys, or to apply special functionality.
	  */
	function forEach (fn :K->V->Dynamic) :Void;

}
