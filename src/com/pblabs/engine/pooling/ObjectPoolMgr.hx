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

import Type;
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
 	var _classes:Array<Class<Dynamic>> ;
	var _pools:Map<String, ObjectPool<Dynamic>>;
	var _tempPool :Array<Dynamic>;
	var _isCallingLater :Bool;
	
	public function new() 
	{
		super();
		_classes = [];
		_pools = Maps.newHashMap(ValueType.TClass(String));
		_tempPool = [];
		_isCallingLater = false;
	}
	
	public var registeredClasses(getRegisteredClasses, null) : Array<Dynamic>;
	public function getRegisteredClasses ():Array<Class<Dynamic>>
	{
		return _classes;
	}

	public function add<T> (o :T) :Void
	{
		if (o == null) {
			com.pblabs.util.Log.warn("ObjectPoolMgr.add(null)");
			return;
		}
		_tempPool.push(o);
		checkPostponedAddObects();
	}

	/**
	 * Get the next available object from the pool, or create a new object if pool is empty.
	 */
	public function get <T> (clazz :Class<T>) :T
	{
		checkPostponedAddObects();
		Preconditions.checkNotNull(clazz);
		var pool :ObjectPool<T> = cast( _pools.get(ReflectUtil.getClassName(clazz)));
		if (pool != null) {
			return pool.getObject();
		} else {
			// com.pblabs.util.Log.debug(["getObject", "class not registered ", ReflectUtil.getClassName(clazz)]);
			// com.pblabs.util.Log.debug("registered classes:" + _classes);
		}
		return Type.createInstance(clazz, EMPTY_ARRAY);
	}

	public function register<T> (clazz :Class<T>, ?pool :ObjectPool<T> = null) :Void
	{
		var className = ReflectUtil.getClassName(clazz);
		Preconditions.checkArgument(_pools.get(className) == null, className + " already registered");
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
		_pools = null;
		_classes = null;
		_tempPool = null;
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
	
	/**
	  * Adding objects to pools must be done at the end of the update loop, since 
	  * destruction of complex data structures may result in components added to 
	  * the pool with listeners still connected to signals, and these components 
	  * may then be reused even though they will only be clean at the end of the 
	  * update loop.
	  */
	function addObjectsInTempPool () :Void
	{
		_isCallingLater = false;
		
		var i = 0;
		//No more than 50 objects per frame to avoid big lags when destroying 
		//entire scenes.
		while (_tempPool.length > 0 && i < 50) {
			i++;
			var o = _tempPool.pop();
			var pool :ObjectPool<Dynamic> = cast( _pools.get(ReflectUtil.getClassName(o)));
			if (pool == null) {
				return;
			}
			pool.addObject(o);
		}
	}
	
	inline function checkPostponedAddObects () :Void
	{
		if (!_isCallingLater && _tempPool.length > 0) {
			game.callLater(addObjectsInTempPool);
			_isCallingLater = true;
		}
	}

	public static var EMPTY_ARRAY :Array<Dynamic> = [];
}
