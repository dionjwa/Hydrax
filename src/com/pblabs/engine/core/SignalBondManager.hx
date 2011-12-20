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
import org.transition9.rtti.ReflectUtil;
import org.transition9.ds.multimaps.ArrayMultiMap;

import de.polygonal.ds.Hashable;

import hsl.haxe.Bond;
import hsl.haxe.Signaler;

import Type;

using com.pblabs.engine.util.PBUtil;
using org.transition9.util.StringUtil;

/**
  * Holds signal bindings for Hashable objects.  When the Entity is 
  * reset or destroyed, all signals bound via this class are also destroyed.
  * That means:
  *   -bind the signals in the EntityComponent.onReset method.
  *   -use SignalBondManager.bindSignal to bind the signals.
  */
class SignalBondManager extends ArrayMultiMap<Int, Bond>,
	implements IPBManager, implements Hashable, implements haxe.rtti.Infos
{
	/** Key for our own signal listening to changin contexts. */
	public var key :Int;
	
	@inject
	public var game :PBGameBase;
	
	public static function destroyBond (bond :Bond) :Bond
	{
		if (bond != null) {
			bond.destroy();
		}
		return null;
	}
	
	public static function bindSignal <T>(component :EntityComponent, signaler :Signaler<T>, listener :T->Dynamic#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		org.transition9.util.Assert.isNotNull(component, "component is null");
		org.transition9.util.Assert.isNotNull(signaler, ' signaler is null');
		org.transition9.util.Assert.isNotNull(component.context, "component.context is null");
		org.transition9.util.Assert.isNotNull(listener, ' listener is null');
		var bonds = component.context.getManager(SignalBondManager);
		org.transition9.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
		#if debug
		return bonds.bind(component, signaler, listener, infos);
		#else
		return bonds.bind(component, signaler, listener);
		#end
	}
	
	public static function bindVoidSignal (component :EntityComponent, signaler :Signaler<Void>, listener :Void->Dynamic#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		org.transition9.util.Assert.isNotNull(component, "component is null");
		org.transition9.util.Assert.isNotNull(component.context, "component.context is null");
		var bonds = component.context.getManager(SignalBondManager);
		org.transition9.util.Assert.isNotNull(bonds, "SignalBondManager is null");
		
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
		org.transition9.util.Assert.isNotNull(owner, "owner is null");
		org.transition9.util.Assert.isNotNull(signaler, "signaler is null");
		org.transition9.util.Assert.isNotNull(listener, "listener is null");
		#if debug
		if (Std.is(owner, IEntityComponent)) {
			var component = cast(owner, IEntityComponent);
			org.transition9.util.Assert.isTrue(component.isRegistered, "component is unregistered");
			org.transition9.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
			org.transition9.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name for " + component.owner + "::" + org.transition9.rtti.ReflectUtil.getClassName(component));
		}
		#end
		var bond = signaler.bind(listener);
		if (onlyOnce) {
			bond.destroyOnUse();
		}
		set(owner.key, bond);
		
		#if debug
		org.transition9.util.Assert.isNotNull(infos, " infos is null");
		bond.infos = infos;
		bond.debugInfo = infos == null ? "no infos @SignalBondManager.bind" : ""; 
		org.transition9.util.Log.debug("New " + bond);
		#end
		
		return bond;
	}
	
	public function bindVoid (owner :Hashable, signaler :Signaler<Void>, listener :Void->Dynamic, ?onlyOnce :Null<Bool> = false#if debug ,?infos :haxe.PosInfos #end ) :Bond
	{
		org.transition9.util.Assert.isNotNull(owner, "owner is null");
		org.transition9.util.Assert.isNotNull(signaler, "signaler is null");
		org.transition9.util.Assert.isNotNull(listener, "listener is null");
		#if debug
		if (Std.is(owner, IEntityComponent)) {
			var component = cast(owner, IEntityComponent);
			org.transition9.util.Assert.isTrue(component.isRegistered, "component is unregistered");
			org.transition9.util.Assert.isTrue(component.owner.isLiveObject, "component entity is not initialized.  Entities much be initialized first");
			org.transition9.util.Assert.isFalse(component.owner.name.isBlank(), "owner has no name for " + component.owner + "::" + org.transition9.rtti.ReflectUtil.getClassName(component));
		}
		#end
		
		var bond = signaler.bindVoid(listener);
		if (onlyOnce) {
			bond.destroyOnUse();
		}
		org.transition9.util.Assert.isNotNull(bond, "bond is null");
		set(owner.key, bond);
		
		#if debug
		bond.infos = infos;
		org.transition9.util.Log.debug("New " + bond);
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
		org.transition9.util.Assert.isNotNull(game);
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
		org.transition9.util.Log.debug("Destroying on " + obj.name);
		destroyBonds(obj);
		
		if (Std.is(obj, IEntity)) {
			//Signals bound to component signalers
			for (c in cast(obj, IEntity)) {
				org.transition9.util.Assert.isNotNull(c, "??EntityComponent is null??");
				destroyBonds(c);
			}
		}
	}
	
	public function destroyBonds (c :Hashable) :Void
	{
		org.transition9.util.Assert.isNotNull(c, "??owner is null??");
		#if debug
		var count = destroyBondsOnKey(c.key);
		org.transition9.util.Log.debug(count + " bonds broken on " + ReflectUtil.getClassName(c));
		#else
		destroyBondsOnKey(c.key);
		#end
	}
	
	public function onNewContext (c :IPBContext) :Void
	{
		org.transition9.util.Log.debug("onNewContext " + c.name);
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
	
	#if debug
	override public function toString () :String
	{
		return org.transition9.util.StringUtil.stringify(this);
	}
	#end
}
