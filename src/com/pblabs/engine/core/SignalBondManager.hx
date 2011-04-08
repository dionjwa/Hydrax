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
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;

import hsl.haxe.Bond;
import hsl.haxe.Signaler;

using com.pblabs.engine.util.PBUtil;
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
	implements IPBManager
{
	/** Key for our own signal listening to changin contexts. */
	var key :Int;
	
	@inject("com.pblabs.engine.core.PBGameBase")
	var game :PBGameBase;
	
	public static function destroyBond (bond :Bond) :Bond
	{
		if (bond != null) {
			bond.destroy();
		}
		return null;
	}
	
	public static function bindSignal <T>(component :EntityComponent, signaler :Signaler<T>, listener :T->Dynamic#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(component.context, "component.context is null");
		com.pblabs.engine.debug.Profiler.enter("SignalBondManager lookup");		
		var bonds = component.context.getManager(SignalBondManager);
		com.pblabs.engine.debug.Profiler.exit("SignalBondManager lookup");
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		#if debug
		return bonds.bind(component, signaler, listener, infos);
		#else
		return bonds.bind(component, signaler, listener);
		#end
		
	}
	
	public static function bindVoidSignal (component :EntityComponent, signaler :Signaler<Void>, listener :Void->Dynamic#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(component.context, "component.context is null");
		com.pblabs.engine.debug.Profiler.enter("SignalBondManager lookup");		
		var bonds = component.context.getManager(SignalBondManager);
		com.pblabs.engine.debug.Profiler.exit("SignalBondManager lookup");
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		#if debug
		return bonds.bindVoid(component, signaler, listener, infos);
		#else
		return bonds.bindVoid(component, signaler, listener);
		#end
	}
	
	public function new ()
	{
		super(Int);
		key = com.pblabs.engine.util.PBUtil.KEY_COUNT++;
	}

	public function bind <T>(component :EntityComponent, signaler :Signaler<T>, listener :T->Dynamic#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		com.pblabs.engine.debug.Profiler.enter("bind");
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
		com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
		com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name for " + component.owner + "::" + com.pblabs.util.ReflectUtil.getClassName(component));
		
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
		
		#if debug
		bond.infos = infos;
		com.pblabs.util.Log.debug("New " + bond);
		#end
		
		return bond;
	}
	
	public function bindVoid (component :EntityComponent, signaler :Signaler<Void>, listener :Void->Dynamic#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		com.pblabs.engine.debug.Profiler.enter("bind");
		com.pblabs.util.Assert.isNotNull(component, "component is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
		com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
		com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name for " + component.owner + "::" + com.pblabs.util.ReflectUtil.getClassName(component));
		
		com.pblabs.engine.debug.Profiler.enter("prop");
		var key = component.key;
		com.pblabs.engine.debug.Profiler.exit("prop");
		com.pblabs.engine.debug.Profiler.enter("bind actual");
		var bond = signaler.bindVoid(listener);
		com.pblabs.util.Assert.isNotNull(bond, "bond is null");
		com.pblabs.engine.debug.Profiler.exit("bind actual");
		com.pblabs.engine.debug.Profiler.enter("set");
		set(key, bond);
		com.pblabs.engine.debug.Profiler.exit("set");
		com.pblabs.engine.debug.Profiler.exit("bind");
		
		#if debug
		bond.infos = infos;
		com.pblabs.util.Log.debug("New " + bond);
		#end
		
		return bond;
	}
	
	#if debug public function destroyBonds (key :Int) :Int #else
	public function destroyBonds (key :Int) :Void #end
	{
		#if debug
		var count :Int = 0;
		#end
		if (exists(key)) {
			for (bond in get(key)) {
				#if debug
				count++;
				#end
				bond.destroy();
			}
			remove(key);
		}
		
		#if debug
		return count;
		#end
	}
	
	public function startup():Void
	{
		com.pblabs.util.Assert.isNotNull(game);
		//Listen to new contexts so we can listen to object removal
		set(key, game.newActiveContextSignaler.bind(onNewContext));
		if (game.currentContext != null) {
			onNewContext(game.currentContext);
		}
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
		com.pblabs.util.Log.debug("Destroying on " + obj.name);
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
		#if debug
		var count = destroyBonds(c.key);
		com.pblabs.util.Log.debug(count + " bonds broken on " + c.name);
		#else
		destroyBonds(c.key);
		#end
	}
	
	function onNewContext (c :IPBContext) :Void
	{
		com.pblabs.util.Log.debug("onNewContext " + c.name);
		var ctx = cast(c, PBContext);
		var self = this;
		//Listen to destroyed entities
		set(ctx.key, ctx.signalObjectRemoved.bind(destroyBondOnEntity));
		//And remove the context specific listeners when the context goes pop
		set(ctx.key, ctx.signalDestroyed.bind(function (c :IPBContext) {
			com.pblabs.util.Log.debug("Destroying bonds on PBContext");
			self.destroyBonds(ctx.key);
		}));
	}
}
