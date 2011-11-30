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
import haxe.rtti.ReflectUtil;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;

import de.polygonal.ds.Hashable;

import hsl.haxe.Bond;
import hsl.haxe.Signaler;

import Type;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.StringUtil;

/**
  * Holds signal bindings for Hashable objects.  When the Entity is 
  * reset or destroyed, all signals bound via this class are also destroyed.
  * That means:
  *   -bind the signals in the EntityComponent.onReset method.
  *   -use SignalBondManager.bindSignal to bind the signals.
  */
class SignalBondManager extends ArrayMultiMap<Int, Bond>,
	implements IPBManager, implements Hashable
{
	/** Key for our own signal listening to changin contexts. */
	public var key :Int;
	
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
		com.pblabs.util.Assert.isNotNull(signaler, ' signaler is null');
		com.pblabs.util.Assert.isNotNull(component.context, "component.context is null");
		com.pblabs.util.Assert.isNotNull(listener, ' listener is null');
		var bonds = component.context.getManager(SignalBondManager);
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
		var bonds = component.context.getManager(SignalBondManager);
		com.pblabs.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		#if debug
		return bonds.bindVoid(component, signaler, listener, infos);
		#else
		return bonds.bindVoid(component, signaler, listener);
		#end
	}
	
	public function new ()
	{
		super(ValueType.TInt);
		key = com.pblabs.engine.util.PBUtil.KEY_COUNT++;
	}

	public function bind <T>(owner :Hashable, signaler :Signaler<T>, listener :T->Dynamic, ?onlyOnce :Null<Bool> = false #if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		com.pblabs.util.Assert.isNotNull(owner, "owner is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		#if debug
		if (Std.is(owner, IEntityComponent)) {
			var component = cast(owner, IEntityComponent);
			com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
			com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
			com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name for " + component.owner + "::" + haxe.rtti.ReflectUtil.getClassName(component));
		}
		#end
		var bond = signaler.bind(listener);
		if (onlyOnce) {
			bond.destroyOnUse();
		}
		set(owner.key, bond);
		
		#if debug
		com.pblabs.util.Assert.isNotNull(infos, " infos is null");
		bond.infos = infos;
		bond.debugInfo = infos == null ? "no infos @SignalBondManager.bind" : ""; 
		com.pblabs.util.Log.debug("New " + bond);
		#end
		
		return bond;
	}
	
	public function bindVoid (owner :Hashable, signaler :Signaler<Void>, listener :Void->Dynamic, ?onlyOnce :Null<Bool> = false#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		com.pblabs.util.Assert.isNotNull(owner, "owner is null");
		com.pblabs.util.Assert.isNotNull(signaler, "signaler is null");
		com.pblabs.util.Assert.isNotNull(listener, "listener is null");
		#if debug
		if (Std.is(owner, IEntityComponent)) {
			var component = cast(owner, IEntityComponent);
			com.pblabs.util.Assert.isTrue(component.isRegistered, "component is unregistered");
			com.pblabs.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
			com.pblabs.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name for " + component.owner + "::" + haxe.rtti.ReflectUtil.getClassName(component));
		}
		#end
		
		var bond = signaler.bindVoid(listener);
		if (onlyOnce) {
			bond.destroyOnUse();
		}
		com.pblabs.util.Assert.isNotNull(bond, "bond is null");
		set(owner.key, bond);
		
		#if debug
		bond.infos = infos;
		com.pblabs.util.Log.debug("New " + bond);
		#end
		
		return bond;
	}
	
	#if debug public function destroyBondsOnKey (key :Int) :Int #else
	public function destroyBondsOnKey (key :Int) :Void #end
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
		bind(this, game.signalContextSetup, onNewContext);
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
		destroyBonds(obj);
		
		if (Std.is(obj, IEntity)) {
			//Signals bound to component signalers
			for (c in cast(obj, IEntity)) {
				com.pblabs.util.Assert.isNotNull(c, "??EntityComponent is null??");
				destroyBonds(c);
			}
		}
	}
	
	public function destroyBonds (c :Hashable) :Void
	{
		com.pblabs.util.Assert.isNotNull(c, "??owner is null??");
		#if debug
		var count = destroyBondsOnKey(c.key);
		com.pblabs.util.Log.debug(count + " bonds broken on " + ReflectUtil.getClassName(c));
		#else
		destroyBondsOnKey(c.key);
		#end
	}
	
	public function onNewContext (c :IPBContext) :Void
	{
		com.pblabs.util.Log.debug("onNewContext " + c.name);
		var ctx = cast(c, PBContext);
		var self = this;
		//Listen to destroyed entities
		bind(this, ctx.signalObjectRemoved, destroyBondOnEntity);
		//And remove the context specific listeners when the context goes pop
		var bond :Bond = null;
		bond = bind(ctx, ctx.signalDestroyed, function (c :IPBContext) {
			self.destroyBonds(c);
		}, true);
	}
}
