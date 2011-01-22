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
import com.pblabs.util.ds.multimaps.ArrayMultiMap;

import hsl.haxe.Bond;
import hsl.haxe.Signaler;

using com.pblabs.engine.util.PBUtil;

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
class SignalBondManager extends ArrayMultiMap<String, Bond>,
	implements IPBManager, implements haxe.rtti.Infos
{
	@inject
	var context :IPBContext;
	
	public static function bindSignal <T>(component :IEntityComponent, signaler :Signaler<T>, listener :T->Dynamic) :Void
	{
	    var bonds = component.context.getManager(SignalBondManager);
	    com.pblabs.util.Assert.isNotNull(bonds);
	    bonds.bind(component, signaler, listener);
	}
	
	public function new ()
	{
		super();
	}

	public function bind <T>(component :IEntityComponent, signaler :Signaler<T>, listener :T->Dynamic) :Void
	{
		var key = component.entityPropString();
		var bond = signaler.bind(listener);
		set(key, bond);
	}
	
	public function destroyBonds (key :String) :Void
	{
		if (exists(key)) {
			for (bond in get(key)) {
				bond.destroy();
			}
			remove(key);
		}
	}
	
	public function startup():Void
	{
		com.pblabs.util.Preconditions.checkNotNull(context, "Context is null");
		com.pblabs.util.Preconditions.checkArgument(Std.is(context, PBContext), "No PBContext");
		cast(context, PBContext).signalObjectRemoved.bind(destroyBondOnEntity);
	}
	
	public function shutdown():Void
	{
		cast(context, PBContext).signalObjectRemoved.unbind(destroyBondOnEntity);
		for (k in keys()) {
			for (b in get(k)) {
				b.destroy();
			}
		}
		clear();
		context = null;
	}
	
	public function destroyBondOnEntity (obj :IPBObject) :Dynamic
	{
		destroyBonds(obj.name);
		if (Std.is(obj, IEntity)) {
			//Signals bound to component signalers
			for (c in cast(obj, IEntity)) {
				com.pblabs.util.Assert.isNotNull(c, "??IEntityComponent is null??");
				destroyBonds(c.entityPropString());
			}
		}
	}
}
