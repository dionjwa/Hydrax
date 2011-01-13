/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.util.Log;

/**
 * Assertion checks.
 */
#if !debug extern #end 
class Assert 
{
	/**
	 * Throws an error if the condition evaluates to false.
	 * @param condition The statement to evaluate.
	 * @param info Additional information describing the condition.
	 */
	#if debug
	public static function isTrue (condition:Bool, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (!condition) fail(info == null ? "isTrue" : info, posInfos);
	}
	#else
	public static inline function isTrue (ignored :Dynamic, ?info :Dynamic) :Void
	{
	}
	#end
	
	#if debug
	public static function isFalse (condition:Bool, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (condition) fail(info == null ? "isFalse" : info, posInfos);
	}
	#else
	public static inline function isFalse (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	#if debug
	public static function isNotNull (value :Dynamic, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value == null) fail(info == null ? "isNotNull" : info, posInfos);
	}
	#else
	public static inline function isNotNull (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	#if debug
	public static function isNull (value :Dynamic, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value != null) fail(info == null ? "isNull" : info, posInfos);
	}
	#else
	public static inline function isNull (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	/**
	  * Assert that value is >= 0 and < length
	  */
	#if debug
	public static function isValidIndex (value :Int, length :Int, ?info:String, ?posInfos:haxe.PosInfos) :Void
	{
		if (value < 0 || value >= length) fail(info == null ? "isValidIndex" : info, posInfos);
	}
	#else
	public static inline function isValidIndex (ignored :Dynamic, ?info :Dynamic) :Void {}
	#end
	
	inline static function fail (message :String, info:haxe.PosInfos) :Void
	{
		//Some javascript targets don't show exceptions, so at least log the error
		#if js
		Log.error("Assertion '" + message + "' failed in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName);
		#end
		throw "Assertion '" + message + "' failed in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName;
	}
}
