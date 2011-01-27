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
using com.pblabs.util.StringUtil;

/**
  * Holds signal bindings for IEntityComponents.  When the Entity is 
  * reset or destroyed, all signals bound via this class are also destroyed.
  * That means:
  *   -you must intialized the IEntity before adding signals so that the 
  *	 components have unique keys (using PropertyReferences)
  *   -bind the signals in the EntityComponent.onReset method.
  *   -use SignalBondManager.bindSignal to bind the signals.
  */
class SignalBondManager extends ArrayMultiMap<String, Bond>,
	implements IPBManager, implements haxe.rtti.Infos
{
	@inject
	var context :IPBContext;
	
	public static function bindSignal <T>(component :IEntityComponent, signaler :Signaler<T>, listener :T->Dynamic) :Void
	{
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(component.context, "component.context is null");
		
		var bonds = component.context.getManager(SignalBondManager);
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		bonds.bind(component, signaler, listener);
	}
	
	public static function destroyAllBonds (c :IEntityComponent) :Void
	{
		com.pblabs.util.Assert.isNotNull(c, "component is null");
		com.pblabs.util.Assert.isNotNull(c.context, "component.context is null");
		
		var bonds = c.context.getManager(SignalBondManager);
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		bonds.destroyBonds(c.entityPropString());
	}
	
	/**
	  * Assumes that signals are rebound on the IEntityComponentonReset() call.
	  */
	public static function resetBonds (c :IEntityComponent) :Void
	{
		destroyAllBonds(c);
		c.reset();
	}
	
	public function new ()
	{
		super();
	}

	public function bind <T>(component :IEntityComponent, signaler :Signaler<T>, listener :T->Dynamic) :Void
	{
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
		com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
		com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name");
		
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
