package com.pblabs.util;

class TimerUtil
{
	/**
		Returns a timestamp, in seconds
	**/
	public static function stampms() : Int {
		#if flash
			return flash.Lib.getTimer();
		#elseif neko
			return Std.int(neko.Sys.time() * 1000);
		#elseif php
			return Std.int(php.Sys.time() * 1000);
		#elseif js
			return Date.now().getTime();
		#elseif cpp
			return Std.int(untyped __global__.__time_stamp() * 1000);
		#else
			return 0;
		#end
	}

}
