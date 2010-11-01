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
class Assert 
{
	/**
	 * Throws an error if the condition evaluates to false.
	 * @param condition The statement to evaluate.
	 * @param info Additional information describing the condition.
	 */
	inline public static function isTrue(condition:Bool, ?info:String, ?posInfos:haxe.PosInfos)
	{
		if (!condition) fail(info, posInfos);
	}
	
	inline public static function isFalse(condition:Bool, ?info:String, ?posInfos:haxe.PosInfos)
	{
		if (condition) fail(info, posInfos);
	}
	
	inline public static function isNotNull(value :Dynamic, ?info:String, ?posInfos:haxe.PosInfos)
	{
		if (value == null) fail(info, posInfos);
	}
	
	inline public static function isNull(value :Dynamic, ?info:String, ?posInfos:haxe.PosInfos)
	{
		if (value != null) fail(info, posInfos);
	}
	
	/**
	  * Assert that value is >= 0 and < length
	  */
	inline public static function isValidIndex(value :Int, length :Int, ?info:String, ?posInfos:haxe.PosInfos)
	{
		if (value < 0 || value >= length) fail(info, posInfos);
	}
	
	inline static function fail (message :String, info:haxe.PosInfos) :Void
	{
	    #if !debug
		return;
	    #else
	    throw "Assertion '" + message + "' failed in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName;
	    #end
	}
}
