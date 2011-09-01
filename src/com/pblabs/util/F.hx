/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;
class F
{
	public static function id <T>(x :T) :Void->T
	{
		return function () :T {
			return x;
		}
	}
	
	public static function id2 <T>(x :T) :Dynamic->T
	{
		return function (?_) :T {
			return x;
		}
	}
	
	/**
	  * Haxe's strict typing means you can't use a function :Void->Dynamic in the 
	  * place of Void->Void, and just ignore the return type.
	  */
	public static function ignoreReturn(f :Void->Dynamic) :Void->Void
	{
		return function () :Void {f();}
	}
	
	public static function ignoreArg(f :Void->Void) :Dynamic->Void
	{
		return function (?_) :Void {f();}
	}
	
	public static function adapt (func :Dynamic, ?args :Array<Dynamic>, ?owner :Dynamic) :Dynamic->Void
	{
		return function (?ignored :Dynamic) :Void {
			Reflect.callMethod(owner, func, args == null ? com.pblabs.util.Constants.EMPTY_ARRAY : args);
		}
	}
}
