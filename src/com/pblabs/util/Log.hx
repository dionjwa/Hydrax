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
package com.pblabs.util;

import haxe.PosInfos;

import haxe.Stack;

/**
 * As many libraries use their own log system, this class allows
 * transparently using any logger without a giant refactor.
 * Just replace the dynamic functions with your chosen logger.
 */
#if !enable_logging extern #end 
class Log
{
	#if enable_logging
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
	
	public static dynamic function print (msg :Dynamic, ?infos : PosInfos) :Void
	{
		haxe.Log.trace(msg, infos);
	}
	#else
	public static inline function debug (msg :Dynamic) :Void {}
	public static inline function info (msg :Dynamic) :Void {}
	public static inline function warn (msg :Dynamic) :Void {}
	public static inline function error (msg :Dynamic) :Void {}
	#end
	
	public static function getStackTrace () :String
	{
		return haxe.Stack.toString(haxe.Stack.callStack());
	}
	
}


