/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript aspirin library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * aspirin library - Taking some of the pain out of Actionscript development.
 * Copyright (C) 2007-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/ooo-aspirin/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pblabs.util.ds.maps;

import com.pblabs.util.ds.Map;

import haxe.Timer;

/**
 * A map that will automatically expire elements.
 */
class ExpiringMap<K, V> extends LinkedMap<K, V> 
{
	public static function createExpiringMapFunction <K, V>(ttl :Int, ?expireHandler :K->V->Void = null) :Map<K, V>->Map<K, V>
	{
		return function (source :Map<K, V>) :Map<K, V> {
			return new ExpiringMap(source, ttl, expireHandler); 
		}
	}
	
	public function new (source :Map<K, V>, ttl :Int, ?expireHandler :K->V->Void = null)
	{
		super(source);
		Preconditions.checkArgument(ttl > 0, "expire interval must be > 0");
		_ttl = ttl;
		_expireHandler = expireHandler;
	}

	/** @private */
	override function newEntry (key :K, value :V) :LinkedEntry<K, V>
	{
		var ee = new ExpiringEntry<K, V>(key, value, Std.int(haxe.Timer.stamp() * 1000) + _ttl);
		if (_timer == null) {
			_timer = new Timer(_ttl);
			_timer.run = handleTimer;
		}
		return ee;
	}

	/** @private */
	function handleTimer () :Void
	{
		// _timer.reset();
		// _timer.stop();
		var now :Int = Std.int(haxe.Timer.stamp() * 1000);
		// go through the entries, removing some as necessary
		while (_anchor.after != _anchor) {
			
			var exp :ExpiringEntry<K, V> = cast _anchor.after;
			var untilExpire = exp.expireTime - now;
			if (untilExpire <= 0) {
				remove(exp.key);
				if (_expireHandler != null) {
					try {
						_expireHandler(exp.key, exp.value);
					} catch (e :Dynamic) {
						Log.warn(["Error calling expire handler", e]);
					}
				}

			} else {
				// _timer.delay = untilExpire;
				// _timer.start();
				return;
			}
		}
		
		if (_anchor.after == _anchor) {
			_timer.stop();
			_timer = null;
		} 
	}

	/** @private */
	var _ttl:Int;

	/** @private */
	var _expireHandler :K->V->Void;

	/** @private */
	var _timer:Timer;
}
