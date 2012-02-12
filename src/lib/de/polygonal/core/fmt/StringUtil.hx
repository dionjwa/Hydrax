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
package de.polygonal.core.fmt;

import de.polygonal.core.fmt.ASCII;

/**
 * <p>Various utility functions for formatting numbers.</p>
 */
class StringUtil
{
	/**
	 * Returns true if the string <code>x</code> consists of whitespace characters only.
	 */
	public static function isWhite(x:String):Bool
	{
		return ~/\S/.match(x) == false;
	}
	
	/**
	 * Reverses the string <code>x</code>.
	 */
	public static function reverse(x:String):String
	{
		var t = "";
		var i = x.length;
		while (--i >= 0) t += x.charAt(i);
		return t;
	}
	
	/**
	 * Appends (or prepends if <code>reverse</code> is true) an ellipsis (...) to <code>x</code> if <code>x</code>.length > <code>maxCharCount</code>.
	 */
	public static function ellipsis(x:String, maxCharCount:Int, inverse:Bool):String
	{
		#if debug
		de.polygonal.core.util.Assert.assert(maxCharCount > 2, "maxCharCount > 2");
		#end
		
		var k = x.length;
		if (k > maxCharCount)
		{
			if (inverse)
				return "..." + x.substr(k + 3 - maxCharCount);
			else
				return x.substr(0, maxCharCount - 3) + "...";
		}
		else
			return x;
	}
	
	/**
	 * Prepends <code>n</code> - <code>x</code>.length zeros to the string <code>x</code>.
	 */
	public static function fill0(x:String, n:Int):String
	{
		var s = "";
		for (i in 0...n - x.length) s += '0';
		return s + x;
	}
	
	/**
	 * Converts the string <code>x</code> in binary format into a decimal number.
	 */
	public static function parseBin(x:String):Int
	{
		var b = 0;
		var j = 0;
		var i = x.length;
		while (i-- > 0)
		{
			var s = x.charAt(i);
			if (s == '0')
				j++;
			else
			if (s == '1')
			{
				b += 1 << j;
				j++;
			}
		}
		return b;
	}
	
	/**
	 * Converts the string <code>x</code> in hexadecimal format into a decimal number.
	 */
	public static function parseHex(x:String):Int
	{
		var h = 0;
		var j = 0;
		var i = x.length;
		while (i-- > 0)
		{
			var c = x.charCodeAt(i);
			if (c == 88 || c == 120) break;
			
			if (ASCII.isDigit(c))
			{
				h += (c - ASCII.ZERO) * (1 << j);
				j += 4;
			}
			else
			if (c >= ASCII.A && c <= ASCII.F)
			{
				h += (c - ASCII.F + 15) * (1 << j);
				j += 4;
			}
			else
			if (c >= ASCII.a && c <= ASCII.f)
			{
				h += (c - ASCII.f + 15) * (1 << j);
				j += 4;
			}
		}
		return h;
	}
	
	/**
	 * Returns the unqualified class name of <code>x</code>.
	 */
	public static function getUnqualifiedClassName(x:Dynamic):String
	{
		if (Std.is(x, Class))
		{
			var s = Type.getClassName(x);
			return s.substr(s.lastIndexOf('.') + 1);
		}
		else
		if (Type.getClass(x) != null)
			return getUnqualifiedClassName(Type.getClass(x));
		else
			return "";
	}
	
	/**
	 * Extracts the package name from <code>x</code>.
	 */
	public static function getPackageName(x:Dynamic):String
	{
		if (Std.is(x, String))
		{
			var s:String = x;
			var i = s.lastIndexOf('.');
			if (i != -1)
				return s.substr(0, i);
			else
				return "";
		}
		else
		if (Std.is(x, Class))
		{
			var s = Type.getClassName(x);
			var i = s.lastIndexOf('.');
			if (i != -1)
				return s.substr(0, i);
			else
				return "";
		}
		else
		if (Type.getClass(x) != null)
			return getPackageName(Type.getClass(x));
		else
			throw "invalid argument";
	}
}