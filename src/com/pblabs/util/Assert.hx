/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;


/**
 * Assertion checks.
 */
#if (!debug && !cpp) extern #end 
class Assert 
{
	/**
	 * Throws an error if the condition evaluates to false.
	 * @param condition The statement to evaluate.
	 * @param info Additional information describing the condition.
	 */
	#if debug
	inline public static function isTrue (condition:Bool, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (!condition) fail(info == null ? "isTrue" : info, posInfos);
	}
	#else
	inline public static function isTrue (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	#if debug
	inline public static function isFalse (condition:Bool, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (condition) fail(info == null ? "isFalse" : info, posInfos);
	}
	#else
	inline public static function isFalse (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	#if debug
	inline public static function isNotNull (value :Dynamic, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value == null) fail(info == null ? "isNotNull" : info, posInfos);
	}
	#else
	inline public static function isNotNull (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	#if debug
	inline public static function isNull (value :Dynamic, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value != null) fail(info == null ? "isNull" : info, posInfos);
	}
	#else
	inline public static function isNull (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	/**
	  * Assert that value is >= 0 and < length
	  */
	#if debug
	inline public static function isValidIndex (value :Int, length :Int, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value < 0 || value >= length) fail(info == null ? "isValidIndex" : info, posInfos);
	}
	#else
	inline public static function isValidIndex (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	#if debug
	/** Checks if a value is [low, high] */
	inline public static function isWithinRange (value :Float, low :Float, high :Float, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value < low || value > high) fail(info == null ? "isWithinRange" : info, posInfos);
	}
	#else
	inline public static function isWithinRange (ignored :Dynamic, ignored :Dynamic, ignored :Dynamic) :Void {}
	#end

	#if debug	
	inline static function fail (message :String, info:haxe.PosInfos) :Void
	{
		//Some javascript targets don't show exceptions, so at least log the error
		#if js
		Log.error("Assertion '" + message + "' failed in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName);
		#end
		throw "Assertion '" + message + "' failed in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName;
	}
	#end
}
