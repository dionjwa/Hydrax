/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.maps.ExpiringEntry;
import com.pblabs.util.ds.maps.LinkedMap;

import haxe.Timer;

/**
  * A map where keys expire at times given by a supplied function. 
  */
class VariableExpiringMap<K, V> extends LinkedMap<K, V>
{
	var _computeExpireTime :K->V->Int;
	var _expireHandler :K->V->Void;
	var _timer :Timer;

	public static function createVariableExpiringMapFunction <K, V> (computeExpireTime :K->V->Int, ?expireHandler :K->V->Void = null) :Map<K, V>->Map<K, V>
	{
		return function (source :Map<K, V>) :Map<K, V> {
			return new VariableExpiringMap(source, computeExpireTime, expireHandler); 
		}
	}
	
	public function new (source :Map<K, V>, computeExpireTime :K->V->Int, ?expireHandler :K->V->Void = null)
	{
		super(source);
		Preconditions.checkNotNull(computeExpireTime);
		_computeExpireTime = computeExpireTime;
		_expireHandler = expireHandler;
		_timer = new Timer(33, false);
		_timer.run = handleTimer;
	}
	
	override function newEntry (key :K, value :V) :LinkedEntry<K, V>
	{
		var ee = new ExpiringEntry<K, V>(key, value, _computeExpireTime(key, value));
		if (!_timer.isRunning) {
			_timer.start();
		}
		return ee;
	}
	
	override function addNewEntry (e :LinkedEntry<K, V>) :Void
	{
		var entry :ExpiringEntry<K, V> = cast e;
		//Add in order
		if (_anchor.after == _anchor) {
			entry.addBefore(_anchor);
			_timer.stop();
			_timer.delay = entry.expireTime - getNow();
			_timer.start();
		} else if (cast(_anchor.before, ExpiringEntry<Dynamic, Dynamic>).expireTime <= entry.expireTime) {
			//After previous entries
			entry.addAfter(_anchor.before);
		} else {
			var current = _anchor.after;
			while (current != _anchor) {
				var exp :ExpiringEntry<K, V> = cast current;
				if (entry.expireTime <= exp.expireTime) {
					entry.addBefore(exp);
					break;
				}
				current = current.after;
			}
			if (_anchor.after == entry) {
				_timer.stop();
				_timer.delay = entry.expireTime - getNow();
				_timer.start();	
			}
		}
	}
	
	function handleTimer () :Void
	{
		var now = getNow();
		var entry = _anchor.after;
		
		while (entry != _anchor) {
			var exp :ExpiringEntry<K, V> = cast entry;
			var untilExpire = exp.expireTime - now;
			if (untilExpire <= 0) {
				remove(exp.key);
				if (_expireHandler != null) {
					try {
						_expireHandler(exp.key, exp.value);
					} catch (e :Dynamic) {
						Log.warn("Error calling expire handler " + e);
					}
				}

			} else {
				_timer.delay = untilExpire;
				_timer.start();
				return;
			}
			entry = entry.after;
	   }
	   
	   if (_anchor.after == _anchor) {
	   	   _timer.stop();
	   }
	}
	
	inline function getNow () :Int
	{
		return Std.int(haxe.Timer.stamp() * 1000);	
	}
}
