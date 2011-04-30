/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import haxe.PosInfos;

import haxe.Stack;

/**
 * As many libraries use their own log system, this class allows
 * transparently using any logger without a giant refactor.
 * Just replace the dynamic functions with your chosen logger.
 */
#if no_logging extern #end 
class Log
{
	#if no_logging
	public static var DEBUG :Dynamic;
	public static var INFO :Dynamic;
	public static var WARN :Dynamic;
	public static var ERROR :Dynamic;
	
	public static inline function debug (ignored :Dynamic, ?ignored :Dynamic) :Void {}
	public static inline function info (ignored :Dynamic, ?ignored :Dynamic) :Void {}
	public static inline function warn (ignored :Dynamic, ?ignored :Dynamic) :Void {}
	public static inline function error (ignored :Dynamic, ?ignored :Dynamic) :Void {}
	public static inline function setLevel (key :Dynamic, level :Dynamic) :Void {}
	public static inline function getStackTrace () :String {return null;}
	#else
	
	inline public static var DEBUG = LogLevel.DEBUG;
	inline public static var INFO = LogLevel.INFO;
	inline public static var WARN = LogLevel.WARN;
	inline public static var ERROR = LogLevel.ERROR;
	
	public static dynamic function debug (msg :Dynamic, ?infos : PosInfos) :Void
	{
		trace("debug: " + msg, infos);
	}
	
	public static dynamic function info (msg :Dynamic, ?infos : PosInfos) :Void
	{
		trace("info: " + msg, infos);
	}
	
	public static dynamic function warn (msg :Dynamic, ?infos : PosInfos) :Void
	{
		trace("warn: " + msg, infos);
	}
	
	public static dynamic function error (msg :Dynamic, ?infos : PosInfos) :Void
	{
		trace("error: " + msg, infos);
	}
	
	public static dynamic function setLevel (key :Dynamic, level :LogLevel) :Void
	{
		//
	}
	
	inline public static function getStackTrace () :String
	{
		return haxe.Stack.toString(haxe.Stack.callStack());
	}
	#end
}

// #if !no_logging
enum LogLevel {
	DEBUG;
	INFO;
	WARN;
	ERROR;
	OFF;
}
// #end
