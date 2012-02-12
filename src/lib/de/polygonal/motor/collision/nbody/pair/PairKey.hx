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
package de.polygonal.motor.collision.nbody.pair;

import de.polygonal.core.math.Limits;

class PairKey
{
	inline public static function get16(a:Int, b:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(a != b, "a != b");
		de.polygonal.core.util.Assert.assert(a >= Limits.INT16_MIN && a <= Limits.INT16_MAX, "a >= Limits.INT16_MIN && a <= Limits.INT16_MAX");
		de.polygonal.core.util.Assert.assert(b >= Limits.INT16_MIN && b <= Limits.INT16_MAX, "b >= Limits.INT16_MIN && b <= Limits.INT16_MAX");
		#end
		
		if (a < b)
			return ((a + 0x8000) << 16) | (b + 0x8000);
		else
			return ((b + 0x8000) << 16) | (a + 0x8000);
	}
	
	inline public static function getU16(a:Int, b:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(a != b, "a != b");
		de.polygonal.core.util.Assert.assert(a >= 0 && a <= Limits.UINT16_MAX, "a >= 0 && a <= Limits.UINT16_MAX");
		de.polygonal.core.util.Assert.assert(b >= 0 && b <= Limits.UINT16_MAX, "b >= 0 && b <= Limits.UINT16_MAX");
		#end
		
		if (a < b)
			return (a << 16) | b;
		else
			return (b << 16) | a;
	}
}