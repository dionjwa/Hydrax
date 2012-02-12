/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.core.util;

class Instance
{
	#if flash
	public static function create<T>(C:Class<T>, ?args:Array<Dynamic>):T untyped
	{
		if (args == null)
			return __new__(C);
		else
		{
			return
			switch (args.length)
			{
				case  0: __new__(C);
				case  1: __new__(C, args[0]);
				case  2: __new__(C, args[0], args[1]);
				case  3: __new__(C, args[0], args[1], args[2]);
				case  4: __new__(C, args[0], args[1], args[2], args[3]);
				case  5: __new__(C, args[0], args[1], args[2], args[3], args[4]);
				case  6: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5]);
				case  7: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
				case  8: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
				case  9: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
				case 10: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
				case 11: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
				case 12: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11]);
				case 13: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12]);
				case 14: __new__(C, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13]);
				default: throw "too many arguments";
			}
		}
	}
	
	public static function createEmpty<T>(C:Class<T>):T untyped
	{
		try
		{
			flash.Boot.skip_constructor = true;
			var t = __new__(C);
			flash.Boot.skip_constructor = false;
			return t;
		}
		catch (e:Dynamic)
		{
			flash.Boot.skip_constructor = false;
			throw e;
		}
		return null;
	}
	#else
	inline public static function create<T>(C:Class<T>, ?args:Array<Dynamic>):T
	{
		if (args == null) args = [];
		return Type.createInstance(C, args);
	}
	inline public static function createEmpty<T>(C:Class<T>):T
	{
		return Type.createEmptyInstance(C);
	}
	#end
}