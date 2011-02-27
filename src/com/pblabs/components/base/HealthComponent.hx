/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.util.MathUtil;

using com.pblabs.util.XMLUtil;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

class HealthComponent extends EntityComponent,
	implements ISerializable
{
	public var amountOfDamage(get_amountOfDamage, null) : Float;
	
	@editor({ui:"HUISlider", label:"Health", maximum: "healthMax", minimum: 0})
	public var health(get_health, set_health) : Float;
	public var isDead(getIsDead, null) : Bool;
	public var time(get_time, null) : Float;
	public var timeSinceLastDamage(get_timeSinceLastDamage, null) : Float;
	public var signalDamaged :Signaler<HealthEvent>;
	public var signalDied :Signaler<HealthEvent>;
	public var signalHealed :Signaler<HealthEvent>;
	public var signalResurrected :Signaler<HealthEvent>;
	
	public var damageMagnitude :Float;
	var damageModifier :Hash<Float>;
	public var destroyOnDeath :Bool;
	public var healthMax :Float;
	//Local cache to avoid variable creation
	var _tempPrevHealth :Float;
	
	public function new ()
	{
		super();
		signalDamaged = new DirectSignaler(this);
		signalDied = new DirectSignaler(this);
		signalHealed = new DirectSignaler(this);
		signalResurrected = new DirectSignaler(this);
		_cachedHealthEvent = new HealthEvent(0, 0, null);
		setDefaults();
	}
	
	inline function setDefaults () :Void
	{
		damageMagnitude = 1.0;
		destroyOnDeath = false;
		_health = healthMax = 100;
		_timeOfLastDamage = -1000;
	}
	
	public function serialize (xml :Xml) :Void
	{
		xml.createChild("health", _health);
		xml.createChild("healthMax", healthMax);
	}
	
	public function deserialize (xml :Xml) :Dynamic
	{
		_health = xml.parseFloat("health");
		healthMax = xml.parseFloat("healthMax");
	}
	
	public function setDamageModifier (key :String, multiplier :Float) :Void
	{
		if (damageModifier == null) {
			damageModifier = new Hash();
		}
		damageModifier.set(key, multiplier);
	}

	/**
	 * How far are we from being fully healthy?
	 */
	public function get_amountOfDamage ():Float
	{
		return healthMax - _health;
	}

	function get_health ():Float
	{
		return _health;
	}

	function set_health (value :Float):Float
	{
		// Clamp the amount of damage.
		value = MathUtil.fclamp(value, 0, healthMax);
		
		// Notify via a HealthEvent.
		_tempPrevHealth = _health;
		// Set new health value.
		//Log.print(this, "Health becomes " + _Health);
		_health = value;
		
		if (value < _tempPrevHealth && signalDamaged.isListenedTo) {
			_cachedHealthEvent.reset(value - _tempPrevHealth, value, _lastDamageOriginator);
			signalDamaged.dispatch(_cachedHealthEvent);
		}

		if (_tempPrevHealth > 0 && value == 0 && signalDied.isListenedTo) {
			_cachedHealthEvent.reset(value - _tempPrevHealth, value, _lastDamageOriginator);
			signalDied.dispatch(_cachedHealthEvent);
		}

		if (_tempPrevHealth == 0 && value > 0 && signalResurrected.isListenedTo) {
			_cachedHealthEvent.reset(value - _tempPrevHealth, value, _lastDamageOriginator);
			signalResurrected.dispatch(_cachedHealthEvent);
		}

		if (_tempPrevHealth > 0 && value > _tempPrevHealth && signalHealed.isListenedTo) {
			_cachedHealthEvent.reset(value - _tempPrevHealth, value, _lastDamageOriginator);
			signalHealed.dispatch(_cachedHealthEvent);
		}

		// Handle destruction...
		if (destroyOnDeath && _health <= 0) {
			// Kill the owning container if requested.
			owner.destroy();
		}
		return value;
		// Clamp the amount of damage.
	}

	public function getIsDead () :Bool
	{
		return _health <= 0;
	}

	/**
	 * Time in milliseconds since the last damage this unit received.
	 */
	public function get_timeSinceLastDamage ():Float
	{
		return time - _timeOfLastDamage;
	}

	/**
	 * Apply damage!
	 *
	 * @param amount Float of HP to debit (positive) or credit (negative).
	 * @param damage damageType String identifier for the type of damage. Used
	 *						  to lookup and apply a damage modifier from DamageModifier.
	 * @param originator The entity causing the damage, if any.
	 */
	public function damage (amount :Float, ?damageType :String = null, ?originator :IEntity = null) :Void
	{
		_lastDamageOriginator = originator;

		// Allow modification of damage based on type.
		if (damageType != null && damageModifier != null && damageModifier.exists(damageType)) {
			//Log.print(this, "Damage modified by entry for type '" + damageType + "' factor of " + DamageModifier[damageType]);
			amount *= damageModifier.get(damageType);
		}

		// For the flash magnitude, average in preceding fade.
		damageMagnitude = Math.min(1.0, (amount / _health) * 4);
		_timeOfLastDamage = time;

		// Apply the damage.
		health -= amount;

		// If you wanted to do clever things with the last guy to hurt you,
		// you might want to keep this value set. But since it can have GC
		// implications and also lead to stale data we clear it.
		_lastDamageOriginator = null;
	}

	override function onAdd () :Void
	{
		super.onAdd();
		_health = healthMax;
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		setDefaults();
	}

	function get_time ():Float
	{
		return context.getManager(IProcessManager).virtualTime;
	}

	var _health :Float;
	var _lastDamageOriginator :IEntity;
	var _timeOfLastDamage :Float;
	var _cachedHealthEvent :HealthEvent;
	
	#if debug
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		com.pblabs.util.Assert.isFalse(signalDamaged.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalDied.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalHealed.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalResurrected.isListenedTo);
		
	}
	#end
	#if (debug || editor)
	public function toString () :String
	{
		return "Health=" + health + " / " + healthMax; 
	}
	#end
}

/**
 * Event fired by the HealthComponent on the entity when health changes.
 */
class HealthEvent
{
	/**
	 * Change in health.
	 */
	public var delta:Float;
	
	/**
	 * Current health amount, after the delta. The health property on the 
	 * component is not updated until after the event is processed.
	 */
	public var amount:Float;
	
	/**
	 * Entity which caused this damage (or healing), if any.
	 */
	public var originatingEntity :IEntity;
	
	public function new (deltaAmt:Float, amountAmt:Float, originator:IEntity)
	{
		delta = deltaAmt;
		amount = amountAmt;
		originatingEntity = originator;
	}
	
	public function reset (?deltaAmt :Float = 0, ?amountAmt :Float = 0, ?originator :IEntity = null) :Void
	{
		delta = deltaAmt;
		amount = amountAmt;
		originatingEntity = originator;
	}
	
	public function isDead():Bool
	{
		return amount == 0;
	}
}


