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
package de.polygonal.core.math.random;

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;

/**
 * <p>Generates random numbers using the platform-specific <em>Math.random()</em> implementation.</p>
 */
class Random
{
	/**
	 * Returns a random integral number in the interval <arg>&#091;0, 0x7fffffff)</arg>.
	 */
	inline public static function rand():Int
	{
		return cast (frand() * Limits.INT32_MAX);
	}
	
	/**
	 * Returns a random integral number in the interval <arg>&#091;min, max&#093;</arg>.
	 */
	inline public static function randRange(min:Int, max:Int):Int
	{
		var l = min - .4999;
		var h = max + .4999;
		return Mathematics.round(l + (h - l) * frand());
	}
	
	/**
	 * Returns a random integral number in the interval <arg>&#091;-range, range&#093;</arg>.
	 */
	inline public static function randSym(range:Int):Float
	{
		return randRange(-range, range);
	}
	
	/**
	 * Returns a random real number in the interval <arg>&#091;0, 1)</arg>.
	 */
	inline public static function frand():Float
	{
		return Math.random();
	}
	
	/**
	 * Returns a random real number in the interval <arg>&#091;min, max)</arg>.
	 */
	inline public static function frandRange(min:Float, max:Float):Float
	{
		return min + (max - min) * frand();
	}
	
	/**
	 * Returns a random real number in the interval <arg>&#091;-range, range)</arg>.
	 */
	inline public static function frandSym(range:Float):Float
	{
		return frandRange(-range, range);
	}
}