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
  * A map that stores multiple values for each key.
  */
interface MultiMap <K, V>
{
	public function clear () :Void;
	public function exists (key :K) :Bool;
	public function existsEntry (key :K, value :V) :Bool;
	public function get (key :K) :Iterable<V>;
	public function keys () :Iterator<K>;
	// public function iterator () :Iterator<K>;
	public function remove (key :K) :Bool;
	public function removeEntry (key :K, value :V) :Bool;
	public function set (key :K, value :V) :Void;
	public function setAll (key :K, values :Iterable<V>) :Void;
	/** Key size*/
	public var length (get_length, null) :Int;
	
}
