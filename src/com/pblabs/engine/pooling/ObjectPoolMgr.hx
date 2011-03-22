/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.pooling;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBManagerBase;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

/**
  * Usage:
  *
  * In PBGame or a subclass:
  *
  *  override function init () :Void
  *	{
  *		super.init();
  *		
  *   //Make sure you have created one in initializeManagers().
  *		var pool = getManager(com.pblabs.engine.pooling.ObjectPoolMgr);
  *		com.pblabs.util.Assert.isNotNull(pool);
  *		//Register pooled classes
  *		pool.register(com.pblabs.components.spatial.SpatialComponent);
  *		pool.register(com.pblabs.components.base.AlphaComponent);
  *		pool.register(com.pblabs.components.tasks.TaskComponent);
  */
class ObjectPoolMgr extends PBManagerBase
{
	// public static var SINGLETON :ObjectPoolMgr = new ObjectPoolMgr();	 
 	
	public function new() 
	{
		super();
		_classes = [];
		_pools = Maps.newHashMap(String);
	}
	
	public var registeredClasses(getRegisteredClasses, null) : Array<Dynamic>;
	public function getRegisteredClasses ():Array<Class<Dynamic>>
	{
		return _classes;
	}

	public function add<T> (o :T) :Void
	{
		if (o == null) {
			com.pblabs.util.Log.warn(["addObject", "object", null]);
			return;
		}
		var pool :ObjectPool<T> = cast( _pools.get(ReflectUtil.getClassName(o)));
		if (pool == null) {
			com.pblabs.util.Log.debug(["addObject", "class not registered", o]);
			return;
		}
		pool.addObject(o);
	}

	/**
	 * Get the next available object from the pool, or create a new object if pool is empty.
	 */
	public function get <T> (clazz :Class<T>) :T
	{
		Preconditions.checkNotNull(clazz);
		var pool :ObjectPool<T> = cast( _pools.get(ReflectUtil.getClassName(clazz)));
		if (pool != null) {
			return pool.getObject();
		} else {
			com.pblabs.util.Log.debug(["getObject", "class not registered ", clazz]);
			com.pblabs.util.Log.debug("registered classes:" +  _classes);
		}
		return Type.createInstance(clazz, EMPTY_ARRAY);
	}

	public function register<T> (clazz :Class<T>, ?pool :ObjectPool<T> = null) :Void
	{
		var className = ReflectUtil.getClassName(clazz);
		Preconditions.checkArgument(_pools.get(className) == null, clazz + " already registered");
		if (pool == null) {
			pool = new ObjectPool(clazz);
		}
		_pools.set(className, pool);
		_classes.push(clazz);
	}

	override public function shutdown () :Void
	{
		super.shutdown();
		for (p in _pools) {
			p.shutdown();
		}
		_pools.clear();
		_classes = null;
	}
	
	override function onContextRemoval () :Void
	{
		super.onContextRemoval();
		cast(context, PBContext).signalObjectRemoved.unbind(onObjectDestroyed);
	}
	
	override function onNewContext () :Void
	{
		super.onNewContext();
		cast(context, PBContext).signalObjectRemoved.bind(onObjectDestroyed);
	}
	
	function onObjectDestroyed (obj :IPBObject) :Void
	{
		if (Std.is(obj, IEntity)) {
			var e :IEntity = cast obj;
			for (c in e) {
				add(c);
			}
		}
		add(obj);
	}

	var _classes:Array<Class<Dynamic>> ;
	var _pools:Map<String, ObjectPool<Dynamic>>;
	public static var EMPTY_ARRAY :Array<Dynamic> = [];
}
