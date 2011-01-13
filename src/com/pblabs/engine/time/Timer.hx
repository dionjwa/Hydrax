/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.time;

/**
  * Direct copy of haxe.Timer, with the added ability to stop and
  * restart the Timer.
  */
//TODO: submit patch to haxe repo
class Timer {
	#if (neko || php)
	#else

	private var id : Null<Int>;

	#if js
	private static var arr = new Array<com.pblabs.engine.time.Timer>();
	private var timerId : Int;
	#end
	
	public var delay (default, set_delay):Int;
	function set_delay (val :Int) :Int
	{
		this.delay = val;
		if (isRunning) {
			stop();
			start();
		}
		return val;
	}
	
	public function new (delay :Int, ?startAutomatically :Bool = true) 
	{
		set_delay(delay);
		if (startAutomatically) {
			start();
		}
	}
	
	public function start () :Void
	{
		if (id != null) 
			stop();
		#if flash9
			var me = this;
			id = untyped __global__["flash.utils.setInterval"](function() { me.run(); },delay);
		#elseif flash
			var me = this;
			id = untyped _global["setInterval"](function() { me.run(); },delay);
		#elseif js
			id = arr.length;
			arr[id] = this;
			timerId = untyped window.setInterval("com.pblabs.engine.time.Timer.arr["+id+"].run();",delay);
		#end
	}

	public function stop() {
		if( id == null )
			return;
		#if flash9
			untyped __global__["flash.utils.clearInterval"](id);
		#elseif flash
			untyped _global["clearInterval"](id);
		#elseif js
			untyped window.clearInterval(timerId);
			arr[id] = null;
			if( id > 100 && id == arr.length - 1 ) {
				// compact array
				var p = id - 1;
				while( p >= 0 && arr[p] == null )
					p--;
				arr = arr.slice(0,p+1);
			}
		#end
		id = null;
	}
	
	public var isRunning (get_isRunning, never) :Bool;
	inline function get_isRunning () :Bool
	{
	    return id != null;
	}
	
	public dynamic function run() {
	}
	
	// public static function delay( f : Void -> Void, delay : Int ) {
	// 	var t = new haxe.Timer(delay);
	// 	t.run = function() {
	// 		t.stop();
	// 		f();
	// 	};
	// 	return t;
	// }

	#end

	/**
		Returns a timestamp, in seconds
	**/
	public static function stamp() : Float {
		#if flash
			return flash.Lib.getTimer() / 1000;
		#elseif neko
			return neko.Sys.time();
		#elseif php
			return php.Sys.time();
		#elseif js
			return Date.now().getTime() / 1000;
		#elseif cpp
			return untyped __time_stamp();
		#else
			return 0;
		#end
	}

	#if editor
	public static var timers :Array<Timer> = [];
	public static var stoppedTimers :Array<Timer> = [];
	public static function stopTimers () :Void
	{
	    for (t in timers) {
	    	if (t.isRunning) {
	    		stoppedTimers.push(t);
	    		t.stop();
	    	}
	    }
	}
	
	public static function startTimers () :Void
	{
	    for (t in stoppedTimers) {
	    	t.start();
	    }
	    stoppedTimers = [];
	}
	#end
}
