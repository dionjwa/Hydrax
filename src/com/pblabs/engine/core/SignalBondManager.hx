/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.core.IPBManager;

import hsl.haxe.Bond;

import com.pblabs.util.ds.multimaps.ArrayMultiMap;

/**
  * Manages signal bonds for convenient access to destroy.
  * Every object that uses signals must make sure to remove 
  * all listeners when destroyed.  Rather than having multiple 
  * objects implement the same functionality, this class allows
  * an object to register and remove all listeners.
  *
  * The suggested use is to register listeners on initialization,
  * and then call destroyBonds on destruction.
  */
class SignalBondManager extends ArrayMultiMap<Dynamic, Bond>,
	implements IPBManager
{
	public function new ()
	{
		super();
	}

	public function destroyBonds (key :Dynamic) :Void
	{
		if (exists(key)) {
			for (b in get(key)) {
				b.destroy();
			}
			remove(key);
		}
	}
	
	public function startup():Void
	{
	}
	
	public function shutdown():Void
	{
		for (k in keys()) {
			for (b in get(k)) {
				b.destroy();
			}
		}
		clear();
	}
}


