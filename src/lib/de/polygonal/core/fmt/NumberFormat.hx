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

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.Bits;

/**
 * <p>Various utility functions for formatting numbers.</p>
 */
class NumberFormat
{
	static var _hexLUT = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];
	
	/**
	 * Returns a string representation of the unsigned integer <code>x</code> in binary notation.
	 * @param byteDelimiter a character to insert between bytes. The default value is an empty string.
	 */
	public static function toBin(x:Int, byteDelimiter = "", leadingZeros = false):String
	{
		var n = Limits.INT_BITS - Bits.nlz(x);
		var s = ((x & 1) > 0) ? "1" : "0"; 
		x >>= 1;
		for (i in 1...n)
		{
			s = (((x & 1) > 0) ? "1" : "0") + ((i & 7 == 0) ? byteDelimiter : "") + s;
			x >>= 1;
		}
		
		if (leadingZeros)
			for (i in 0...Limits.INT_BITS - n)
				s = "0" + s;
		return s;
	}
	
	/**
	 * Returns a string representation of the unsigned integer <code>x</code> in hexadecimal notation.
	 */
	public static function toHex(x:Int):String
	{
		if (x == 0) return "0";
		var s = "";
		var a = _hexLUT;
		while (x != 0)
		{
			s = a[x & 0xf] + s;
			x >>>= 4;
		}
		return s;
	}
	
	/**
	 * Returns a string representation of the number in octadecimal notation.
	 */
	public static function toOct(x:Int):String
	{
		var s = "";
		var t = x;
		while (t > 0)
		{
			var r = t & 7;
			s = r + s;
			t >>= 3;
		}
		return s;
	}
	
	/**
	 * Same as <em>int.toString(radix)</em> in ActionScript 3.0.
	 */
	public static function toRadix(x:Int, radix:Int):String
	{
		var s = "";
		var t = x;
		while (t > 0)
		{
			var r = t % radix;
			s = r + s;
			t = cast (t / radix);
		}
		return s;
	}
	
	/**
	 * Returns a string representation of the number <code>x</code> in fixed-point notation.
	 * @param decimalPlaces the number of decimal places.
	 */
	public static function toFixed(x:Float, decimalPlaces:Int):String
	{
		if (Math.isNaN(x))
			return "NaN";
		else
		{
			var t = Mathematics.exp(10, decimalPlaces);
			var s = Std.string(Std.int(x * t) / t);
			var i = s.indexOf(".");
			if (i != -1)
			{
				for (i in s.substr(i + 1).length...decimalPlaces)
					s += "0";
			}
			else
			{
				s += ".";
				for (i in 0...decimalPlaces)
					s += "0";
			}
			return s;
		}
	}
	
	/**
	 * Converts <code>x</code> measured in seconds to MM:SS.
	 */
	public static function toMMSS(x:Float):String
	{
		x = Std.int(x * 1000);
		var ms = x % 1000;
		var r = (x - ms) / 1000;
		var tmp = r % 60;
		return (("0" + ((r - tmp) / 60)).substr(-2)) + ":" + ("0" + tmp).substr(-2);
	}
	
	/**
	 * Groups the digits in the input number by using a thousands separator.<br/>
	 * E.g. the number 1024 is converted to the string '1.024'.
	 * @param thousandsSeparator a character to use as a thousands separator. The default value is ".".
	 */
	public static function groupDigits(x:Int, ?thousandsSeparator = "."):String
	{
		var n:Float = x;
		var c = 0;
		while (n > 1)
		{
			n /= 10;
			c++;
		}
		
		c = cast c / 3;
		
		var source = Std.string(x);
		
		if (c == 0)
			return source;
		else
		{
			var target = "";
			
			var i = 0;
			var j = source.length - 1;
			while (j >= 0)
			{
				if (i == 3)
				{
					target = source.charAt(j--) + thousandsSeparator + target;
					i = 0;
					c--;
				}
				else
					target = source.charAt(j--) + target;
				i++;
			}
			
			return target;
		}
	}
	
	/**
	 * Euro cent to Euro conversion.
	 * @param decimalSeparator a character to use as a decimal separator. The default value is ",".
	 * @param thousandsSeparator a character to use as a thousands separator. The default value is ".".
	 */
	public static function centToEuro(x:Int, ?decimalSeparator = ",", ?thousandsSeparator = "."):String	
	{
		var euro = Std.int(x / 100);
		if (euro == 0)
		{
			if (x < 10)
				return "0" + decimalSeparator + "0" + x;
			else
				return "0" + decimalSeparator + x;
		}
		else 
		{
			var str:String;
			var cent = x - euro * 100;	
			if (cent < 10)
				str = decimalSeparator + "0" + cent;
			else
				str = decimalSeparator + cent;
			if (euro >= 1000)
			{
				var num = euro;
				var add;
				while ( num >= 1000)
				{
					num = Std.int(euro / 1000);	
					add = euro - num * 1000; 
					if (add < 10)
						str = thousandsSeparator + "00" + add + str;
					else
					if (add < 100)
						str = thousandsSeparator + "0" + add + str; 
					else
						str = thousandsSeparator + add + str;
					euro = num;
				}		
				return str = num + str;
			}
			else
				str =  euro + str;
			return str;
		}
	}
}