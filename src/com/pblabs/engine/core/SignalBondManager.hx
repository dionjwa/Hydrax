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
using com.pblabs.util.ReflectUtil;
using com.pblabs.util.StringUtil;

/**
  * Holds signal bindings for EntityComponents.  When the Entity is 
  * reset or destroyed, all signals bound via this class are also destroyed.
  * That means:
  *   -you must intialized the IEntity before adding signals so that the 
  *	 components have unique keys (using PropertyReferences)
  *   -bind the signals in the EntityComponent.onReset method.
  *   -use SignalBondManager.bindSignal to bind the signals.
  */
class SignalBondManager extends ArrayMultiMap<Int, Bond>,
	implements IPBManager//, implements haxe.rtti.Infos
{
	public static var OBJECT_DESTROYED_KEY :Int = -1;
	
	@inject("com.pblabs.engine.core.PBGameBase")
	var game :PBGameBase;

	public static function destroyBond (bond :Bond) :Bond
	{
		if (bond != null) {
			bond.destroy();
		}
		return null;
	}
	
	public static function bindSignal <T>(component :EntityComponent, signaler :Signaler<T>, listener :T->Dynamic) :Void
	{
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(component.context, "component.context is null");
		com.pblabs.engine.debug.Profiler.enter("SignalBondManager lookup");		
		var bonds = component.context.getManager(SignalBondManager);
		com.pblabs.engine.debug.Profiler.exit("SignalBondManager lookup");
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		bonds.bind(component, signaler, listener);
	}
	
	public static function bindVoidSignal (component :EntityComponent, signaler :Signaler<Void>, listener :Void->Dynamic) :Void
	{
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(component.context, "component.context is null");
		com.pblabs.engine.debug.Profiler.enter("SignalBondManager lookup");		
		var bonds = component.context.getManager(SignalBondManager);
		com.pblabs.engine.debug.Profiler.exit("SignalBondManager lookup");
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		bonds.bindVoid(component, signaler, listener);
	}
	
	public function new ()
	{
		super(Int);
		// com.pblabs.util.Assert.isTrue(Std.is(_map, com.pblabs.util.ds.maps.IntHashMap), "? No IntHashMap?");
	}

	public function bind <T>(component :EntityComponent, signaler :Signaler<T>, listener :T->Dynamic) :Void
	{
		com.pblabs.engine.debug.Profiler.enter("bind");
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
		com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
		com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name");
		
		com.pblabs.engine.debug.Profiler.enter("prop");
		var key = component.key;
		com.pblabs.engine.debug.Profiler.exit("prop");
		com.pblabs.engine.debug.Profiler.enter("bind actual");
		var bond = signaler.bind(listener);
		com.pblabs.engine.debug.Profiler.exit("bind actual");
		com.pblabs.engine.debug.Profiler.enter("set");
		set(key, bond);
		com.pblabs.engine.debug.Profiler.exit("set");
		com.pblabs.engine.debug.Profiler.exit("bind");
	}
	
	public function bindVoid (component :EntityComponent, signaler :Signaler<Void>, listener :Void->Dynamic) :Void
	{
		com.pblabs.engine.debug.Profiler.enter("bind");
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
		com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
		com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name");
		
		com.pblabs.engine.debug.Profiler.enter("prop");
		var key = component.key;
		com.pblabs.engine.debug.Profiler.exit("prop");
		com.pblabs.engine.debug.Profiler.enter("bind actual");
		var bond = signaler.bindVoid(listener);
		com.pblabs.engine.debug.Profiler.exit("bind actual");
		com.pblabs.engine.debug.Profiler.enter("set");
		set(key, bond);
		com.pblabs.engine.debug.Profiler.exit("set");
		com.pblabs.engine.debug.Profiler.exit("bind");
	}
	
	public function destroyBonds (key :Int) :Void
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
		com.pblabs.util.Assert.isNotNull(game);
		game.newActiveContextSignaler.bind(onNewContext);
	}
	
	public function shutdown():Void
	{
		for (k in keys()) {
			for (b in get(k)) {
				b.destroy();
			}
		}
		clear();
		game = null;
	}
	
	public function destroyBondOnEntity (obj :IPBObject) :Void
	{
		destroyBonds(cast(obj, Entity).key);
		
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(obj, "com.pblabs.engine.core.IEntity")) {
		#else
		if (Std.is(obj, IEntity)) {
		#end
			//Signals bound to component signalers
			for (c in cast(obj, IEntity)) {
				com.pblabs.util.Assert.isNotNull(c, "??EntityComponent is null??");
				destroyBondsOnComponent(cast(c, EntityComponent));
			}
		}
	}
	
	inline public function destroyBondsOnComponent (c :EntityComponent) :Void
	{
		com.pblabs.util.Assert.isNotNull(c, "??EntityComponent is null??");
		destroyBonds(c.key);
	}
	
	function onNewContext (c :IPBContext) :Void
	{
		destroyBonds(OBJECT_DESTROYED_KEY);
		set(OBJECT_DESTROYED_KEY, cast(c, PBContext).signalObjectRemoved.bind(destroyBondOnEntity));
	}
}
