/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * Portions derived from polygonal code.  Polygonal license and copyright:
 *
 *							_/										  _/   
 *	   _/_/_/	  _/_/	_/  _/	_/	_/_/_/	_/_/	_/_/_/	_/	
 *	  _/	_/  _/	_/  _/  _/	_/  _/	_/  _/	_/  _/	_/  _/	 
 *	 _/	_/  _/	_/  _/  _/	_/  _/	_/  _/	_/  _/	_/  _/	  
 *	_/_/_/	  _/_/	_/	_/_/_/	_/_/_/	_/_/	_/	_/  _/	   
 *   _/							_/		_/								
 *  _/						_/_/	  _/_/
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
 ******************************************************************************/
package com.pblabs.util;

class MathUtil
{
	/** Min value, signed integer.   */
	inline public static var  INT32_MIN = 0x80000000;
	/** Max value, signed integer.   */
	inline public static var  INT32_MAX = 0x7fffffff;
	/** Max value, unsigned integer. */
	inline public static var UINT32_MAX = 0xffffffff;
	/** Math.PI constant. */
	inline public static var PI = 3.141592653589793;
	/** 2 * Math.PI constant. */
	inline public static var PI2 = 6.283185307179586;
	/** Multiply value by this to convert from radians to degrees. */
	inline public static var RAD_DEG = 180 / PI;
	/** Multiply value by this to convert from degrees to radians. */
	inline public static var DEG_RAD = PI / 180;
	/** Default square root of 2. */
	inline public static var SQROOT2 = 1.4142135623730951;
	
	/** Clamps the integer <i>x</i> to the interval &#091;<i>min</i>,<i>max</i>&#093; so <i>min</i> <= <i>x</i> <= <i>max</i>. */
	inline public static function clamp(x:Int, min:Int, max:Int):Int
	{
		return (x < min) ? min : (x > max) ? max : x;
	}
	
	/** Clamps a number to the interval &#091;<i>min</i>,<i>max</i>&#093; so <i>min</i> <= <i>x</i> <= <i>max</i>. */
	inline public static function fclamp(x:Float, min:Float, max:Float):Float
	{
		return (x < min) ? min : (x > max) ? max : x;
	}
	
	/** Fast replacement for Math.floor(<i>x</i>). */
	inline public static function floor(x:Float):Int
	{
		if (x > .0)
		{
			var t = Std.int(x + .5);
			return (t < x) ? t : t - 1;
		}
		else
		if (x < .0)
		{
			var t = Std.int(x - .5);
			return (t > x) ? t - 1 : t;
		}
		else
			return 0;
	}
	
	/** Converts <i>deg</i> to radians. */
	inline public static function toRad(deg:Float):Float
	{
		return deg * MathUtil.DEG_RAD;
	}
	
	/** Converts <i>rad</i> to degrees. */
	inline public static function toDeg(rad:Float):Float
	{
		return rad * MathUtil.RAD_DEG;
	}
	
	inline public static function upperPowerOf2 (v :Int) :Int
	{
		v--;
		v |= v >> 1;
		v |= v >> 2;
		v |= v >> 4;
		v |= v >> 8;
		v |= v >> 16;
		v++;
		return v;
	}
	
	
}
