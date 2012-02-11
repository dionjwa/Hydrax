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
package de.polygonal.core.math;

/**
 * <p>Various math functions and constants.</p>
 */
class Mathematics
{
	/**
	 * IEEE 754 NAN.
	 */
	#if !flash
	inline public static var NaN = Math.NaN;
	#else
	inline public static var NaN = .0 / .0;
	#end
	/**
	 * IEEE 754 positive infinity.
	 */
	#if !flash
	inline public static var POSITIVE_INFINITY = Math.POSITIVE_INFINITY;
	#else
	inline public static var POSITIVE_INFINITY = 1. / .0;
	#end
	/**
	 * IEEE 754 negative infinity.
	 */
	#if !flash
	inline public static var NEGATIVE_INFINITY = Math.NEGATIVE_INFINITY;
	#else
	inline public static var NEGATIVE_INFINITY = -1. / .0;
	#end
	
	/**
	 * Value below <code>ZERO_TOLERANCE</code> is treated as zero.
	 */
	inline public static var ZERO_TOLERANCE = 1e-08;
	
	/**
	 * Multiply value by this constant to convert from radians to degrees.
	 */
	inline public static var RAD_DEG = 180 / PI;
	
	/**
	 * Multiply value by this constant to convert from degrees to radians.
	 */
	inline public static var DEG_RAD = PI / 180;
	
	/**
	 * The natural logarithm of 2.
	 */
	inline public static var LN2 = 0.6931471805599453;
	
	/**
	 * PI / 2.
	 */
	inline public static var PIHALF = 1.5707963267948966;
	
	/**
	 * PI.
	 */
	inline public static var PI = 3.141592653589793;
	
	/**
	 * 2 * PI.
	 */
	inline public static var PI2 = 6.283185307179586;
	
	/**
	 * Default system epsilon.
	 */
	inline public static var EPS = 1e-6;
	
	/**
	 * The square root of 2.
	 */
	inline public static var SQRT2 = 1.414213562373095;
	
	#if (flash10 && alchemy)
	/**
	 * Returns the 32-bit integer representation of a IEEE 754 single precision floating point.
	 */
	inline public static function floatToInt(x:Float):Int
	{
		flash.Memory.setFloat(0, x);
		return flash.Memory.getI32(0);
	}
	
	/**
	 * Returns the IEEE 754 single precision floating point representation of a 32-bit integer.
	 */
	inline public static function intToFloat(x:Int):Float
	{
		flash.Memory.setI32(0, x);
		return flash.Memory.getFloat(0);
	}
	#end
	
	/**
	 * Converts <code>deg</code> to radians.
	 */
	inline public static function toRad(deg:Float):Float
	{
		return deg * Mathematics.DEG_RAD;
	}
	
	/**
	 * Converts <code>rad</code> to degrees.
	 */
	inline public static function toDeg(rad:Float):Float
	{
		return rad * Mathematics.RAD_DEG;
	}
	
	/**
	 * Returns min(<code>x</code>, <code>y</code>).
	 */
	inline public static function min(x:Int, y:Int):Int
	{
		return x < y ? x : y;
	}
	
	/**
	 * Returns max(<code>x</code>, <code>y</code>).
	 */
	inline public static function max(x:Int, y:Int):Int
	{
		return x > y ? x : y;
	}
	
	/**
	 * Returns the absolute value of <code>x</code>.
	 */
	inline public static function abs(x:Int):Int
	{
		return x < 0 ? -x : x;
	}
	
	/**
	 * Returns the sign of <code>x</code>.<br/>
	 * <code>sgn</code>(0) = 0.
	 */
	inline public static function sgn(x:Int):Int
	{
		return (x > 0) ? 1 : (x < 0 ? -1 : 0);
	}
	
	/**
	 * Clamps <code>x</code> to the interval &#091;<code>min</code>, <code>max</code>&#093; so <code>min</code> <= <code>x</code> <= <code>max</code>.
	 */
	inline public static function clamp(x:Int, min:Int, max:Int):Int
	{
		return (x < min) ? min : (x > max) ? max : x;
	}
	
	/**
	 * Clamps <code>x</code> to the interval &#091;<code>-i</code>, <code>+i</code>&#093; so <code>-i</code> <= <code>x</code> <= <code>i</code>.
	 */
	inline public static function clampSym(x:Int, i:Int):Int
	{
		return (x < -i) ? -i : (x > i) ? i : x;
	}
	
	/**
	 * Wraps <code>x</code> to the interval &#091;<code>min</code>, <code>max</code>&#093; so <code>min</code> <= <code>x</code> <= <code>max</code>.
	 */
	inline public static function wrap(x:Int, min:Int, max:Int):Int
	{
		return x < min ? (x - min) + max + 1: ((x > max) ? (x - max) + min - 1: x);
	}
	
	/**
	 * Fast version of <em>Math.min</em>(<code>x</code>, <code>y</code>).
	 */
	inline public static function fmin(x:Float, y:Float):Float
	{
		return x < y ? x : y;
	}
	
	/**
	 * Fast version of <em>Math.max</em>(<code>x</code>, <code>y</code>).
	 */
	inline public static function fmax(x:Float, y:Float):Float
	{
		return x > y ? x : y;
	}
	
	/**
	 * Fast version of <em>Math.abs</em>(<code>x</code>).
	 */
	inline public static function fabs(x:Float):Float
	{
		return x < 0 ? -x : x;
	}
	
	/**
	 * Extracts the sign of <code>x</code>.<br/>
	 * <code>fsgn</code>(0) = 0.
	 */
	inline public static function fsgn(x:Float):Int
	{
		return (x > 0.) ? 1 : (x < 0. ? -1 : 0);
	}
	
	/**
	 * Clamps <code>x</code> to the interval &#091;<code>min</code>, <code>max</code>&#093; so <code>min</code> <= <code>x</code> <= <code>max</code>.
	 */
	inline public static function fclamp(x:Float, min:Float, max:Float):Float
	{
		return (x < min) ? min : (x > max) ? max : x;
	}
	
	/**
	 * Clamps <code>x</code> to the interval &#091;<code>-i</code>, <code>+i</code>&#093; so -<code>i</code> <= <code>x</code> <= <code>i</code>.
	 */
	inline public static function fclampSym(x:Float, i:Float):Float
	{
		return (x < -i) ? -i : (x > i) ? i : x;
	}
	
	/**
	 * Wraps <code>x</code> to the interval &#091;<code>min</code>, <code>max</code>&#093; so <code>min</code> <= <code>x</code> <= <code>max</code>.
	 */
	inline public static function fwrap(value:Float, lower:Float, upper:Float):Float
	{
		var t:Int = cast ((value - lower) / (upper - lower));
		return value - (t * (upper - lower));
	}

	/**
	 * Returns true if the sign of <code>x</code> and <code>y</code> is equal.
	 */
	inline public static function eqSgn(x:Int, y:Int):Bool
	{
		return (x ^ y) >= 0;
	}
	
	/**
	 * Returns true if <code>x</code> is even.
	 */
	inline public static function isEven(x:Int):Bool
	{
		return (x & 1) == 0;
	}
	
	/**
	 * Returns true if <code>x</code> is a power of two.
	 */
	inline public static function isPow2(x:Int):Bool
	{
		return x > 0 && (x & (x - 1)) == 0;
	}
	
	/**
	 * Linear interpolation over interval &#091;<code>a</code>, <code>b</code>&#093; with <code>t</code> = &#091;0, 1&#093;.
	 */
	inline public static function lerp(a:Float, b:Float, t:Float):Float
	{
		return a + (b - a) * t;
	}
	
	/**
	 * Spherically interpolates between two angles.<br/>
	 * See <a href="http://www.paradeofrain.com/2009/07/interpolating-2d-rotations/" target="_blank">http://www.paradeofrain.com/2009/07/interpolating-2d-rotations/</a>.
	 */
	inline public static function slerp(a:Float, b:Float, t:Float)
	{
		var m = Math;
		
        var c1 = m.sin(a * .5);
        var r1 = m.cos(a * .5);
		var c2 = m.sin(b * .5);
        var r2 = m.cos(b * .5);
        
       var c = r1 * r2 + c1 * c2;
        
        if (c < 0.)
		{
			if ((1. + c) > Mathematics.EPS)
			{
				var o = m.acos(-c);
				var s = m.sin(o);
				var s0 = m.sin((1 - t) * o) / s;
				var s1 = m.sin(t * o) / s;
				return m.atan2(s0 * c1 - s1 * c2, s0 * r1 - s1 * r2) * 2.;
			}
			else
			{
				var s0 = 1 - t;
				var s1 = t;
				return m.atan2(s0 * c1 - s1 * c2, s0 * r1 - s1 * r2) * 2;
			}
		}
		else
		{
			if ((1 - c) > Mathematics.EPS)
			{
				var o = m.acos(c);
				var s = m.sin(o);
				var s0 = m.sin((1 - t) * o) / s;
				var s1 = m.sin(t * o) / s;
				return m.atan2(s0 * c1 + s1 * c2, s0 * r1 + s1 * r2) * 2.;
			}
			else
			{
				var s0 = 1 - t;
				var s1 = t;
				return m.atan2(s0 * c1 + s1 * c2, s0 * r1 + s1 * r2) * 2;
			}
		}
	}
	
	/**
	 * Calculates the next highest power of 2 of <code>x</code>.
	 */
	inline public static function nextPow2(x:Int):Int
	{
		var t = x;
		t |= (t >> 0x01);
		t |= (t >> 0x02);
		t |= (t >> 0x03);
		t |= (t >> 0x04);
		t |= (t >> 0x05);
		return t + 1;
	}
	
	/**
	 * Fast integer exponentiation for base <code>a</code> and exponent <code>n</code>.
	 */
	inline public static function exp(a:Int, n:Int):Int
	{
		var t = 1;
		var r = 0;
		while (true)
		{
			if (n & 1 != 0) t = a * t;
			n >>= 1;
			if (n == 0)
			{
				r = t;
				break;
			}
			else
				a *= a;
		}
		return r;
	}
	
	/**
	 * Rounds <code>x</code> to the iterval <code>y</code>.
	 */
	inline public static function roundTo(x:Float, y:Float):Float
	{
		return round(x / y) * y;
	}
	
	/**
	 * Fast version of <em>Math.round</em>(<code>x</code>).
	 */
	inline public static function round(x:Float):Int
	{
		return cast (x > 0 ? x + .5 : x < 0 ? x - .5 : 0);
	}
	
	/**
	 * Fast version of <em>Math.ceil</em>(<code>x</code>).
	 */
	inline public static function ceil(x:Float):Int
	{
		var f:Int = cast x;
		if (x == f) return f;
		else
		{
			x += 1;
			var f:Int = cast x;
			if (x < 0 && f != x) f--;
			return f;
		}
	}
	
	/**
	 * Fast version of <em>Math.floor</em>(<code>x</code>).
	 */
	inline public static function floor(x:Float):Int
	{
		var f:Int = cast x;
		if (x < 0 && f != x) f--;
		return f;
	}
	
	/**
	 * Computes the 'quake-style' fast inverse square root of <code>x</code>.
	 */
	inline public static function invSqrt(x:Float):Float
	{
		#if (flash10 && alchemy)
		var xt = x;
		var half = .5 * xt;
		var i = floatToInt(xt);
		i = 0x5f3759df - (i >> 1);
		var xt = intToFloat(i);
		return xt * (1.5 - half * xt * xt);
		#else
		return 1 / Math.sqrt(x);
		#end
	}
	
	/**
	 * Compares <code>x</code> and <code>y</code> using an absolute tolerance of <code>eps</code>.
	 */
	inline public static function cmpAbs(x:Float, y:Float, eps:Float):Bool
	{
		var d = x - y;
		return d > 0 ? d < eps : -d < eps;
	}
	
	/**
	 * Compares <code>x</code> to zero using an absolute tolerance of <code>eps</code>.
	 */
	inline public static function cmpZero(x:Float, eps:Float):Bool
	{
		return x > 0 ? x < eps : -x < eps;
	}
	
	/**
	 * Snaps <code>x</code> to the grid <code>y</code>.
	 */
	inline public static function snap(x:Float, y:Float):Float
	{
		return (Mathematics.floor((x + y * .5) / y));
	}
	
	/**
	 * Returns true if <code>min</code> <= <code>x</code> <= <code>max</code>.
	 */
	inline public static function inRange(x:Float, min:Float, max:Float):Bool
	{
		return x >= min && x <= max;
	}
	
	/**
	 * Wraps an angle <code>x</code> to the range -PI...PI.
	 */
	inline public static function wrapToPI(x:Float):Float
	{
		x += Mathematics.PI;
		return (x - Mathematics.PI2 * Math.floor(x / Mathematics.PI2)) - Mathematics.PI;
	}
	
	/**
	 * Wraps an angle <code>x</code> to the range 0...2*PI.
	 */
	inline public static function wrapToPI2(x:Float):Float
	{
		return (x - Mathematics.PI2 * Math.floor(x / Mathematics.PI2));
	}
	
	/**
	 * Computes the greatest common divisor of <code>x</code> and <code>y</code>.<br/>
	 * See <a href="http://www.merriampark.com/gcd.htm" target="_blank">http://www.merriampark.com/gcd.htm</a>.
	 */
	inline public static function gcd(x:Int, y:Int):Int
	{
		var d = 0;
		var r = 0;
		x = Mathematics.abs(x);
		y = Mathematics.abs(y);
		while (true)
		{
			if (y == 0)
			{
				d = x;
				break;
			}
			else
			{
				r = x % y;
				x = y;
				y = r;
			}
		}
		return d;
	}
	
	/**
	 * Removes excess floating point decimal precision from <code>x</code>.
	 */
	inline public static function maxPrecision(x:Float, precision:Int):Float
	{
		if (x == 0)
			return x;
		else
		{
			var correction = 10;
			for (i in 0...precision - 1) correction *= 10;
			return round(correction * x) / correction;
		}
	}
	
	/**
	 * Converts the boolean expression <code>x</code> to an integer.
	 * @return 1 if <code>x</code> is true and zero if <code>x</code> is false.
	 */
	inline public static function ofBool(x:Bool):Int
	{
		return (x ? 1 : 0);
	}
}