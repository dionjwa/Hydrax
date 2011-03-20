/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;

/**
 * Used on platforms without non-Int/String object
 * associative arrays (dictionaries).  Converts the key to a 
 * int viathe 'key' field, so you have to make sure that keys
 * do not collide.
 */
class KeyedObjectMap<K, V> extends TransformKeyMap<K, Int, V>
{
	public static function getObjectKey (obj :Dynamic) :Int
	{
		return obj.key;
	}
	
	public function new ()
	{
		super(getObjectKey, new IntHashMap<V>()); 
	}
}
