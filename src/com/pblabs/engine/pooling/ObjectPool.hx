/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.pooling;import haxe.FastList;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;

using Lambda;

class ObjectPool<T>
 {
	/**
	 * Creates a new object pool.
	 *
	 * @param grow If true, the pool grows the first time it becomes empty.
	 */
	
	// public var clazz (default, null) : Class<T>;
	public var size(getSize, null) : Int;
	/**
	 * Creates a new object pool.
	 *
	 * @param grow If true, the pool grows the first time it becomes empty.
	 */
	public function new (clazz :Class<T>)
	{
		Preconditions.checkNotNull(clazz, "You must supply a class argument");
		_clazz = clazz;
		_objects = new Array<T>();
	}

	/**
	 * The pool size.
	 */
	public function getSize ():Int
	{
		return _objects.count();
	}

	/**
	 * @private
	 */
	public function addObject (o :T) :Void
	{
		Preconditions.checkNotNull(o);
		_objects.push(o);
	}

	/**
	 * Get the next available object from the pool or put it back for the
	 * next use. If the pool is empty and resizable, an error is thrown.
	 */
	public function getObject () :T
	{
		com.pblabs.util.Log.debug("Get/create " +  _clazz);
		var obj = _objects.pop();
		if (obj == null) {
			obj = Type.createInstance(_clazz, ObjectPoolMgr.EMPTY_ARRAY);
			com.pblabs.util.Log.debug("no objects in pool, creating " +  _clazz);
			return obj;
		} else {
			com.pblabs.util.Log.debug("from pool " +  _clazz);
			return obj;
		}
	}

	/**
	 * Unlock all ressources for the garbage collector.
	 */
	public function shutdown () :Void
	{
		_objects = null;
	}

	var _clazz :Class<T>;
	var _objects :Array<T>;
}


