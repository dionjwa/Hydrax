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
package de.polygonal.motor.geom.closest;

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.Segment2;

/**
 * Computes the point on a segment closest to a given point.
 */
class ClosestPointSegment
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on the segment <i>S</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find2(p:Vec2, S:Segment2, q:Vec2):Float
	{
		return find3(p, S.a, S.b, q);
	}
	
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on the segment from <i>a</i> to <i>b</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find3(p:Vec2, a:Vec2, b:Vec2, q:Vec2):Float
	{
		return find6(p.x, p.y, a.x, a.y, b.x, b.y, q);
	}
	
	/**
	 * Given point (<i>px</i>,<i>py</i>), computes the point <i>q</i> on the segment from (<i>ax</i>,<i>ay</i>)
	 * to (<i>bx</i>,<i>by</i>) closest to (<i>px</i>,<i>py</i>).
	 * @param q Stores the result.
	 */
	inline public static function find6(px:Float, py:Float, ax:Float, ay:Float, bx:Float, by:Float, q:Vec2):Float
	{
		var avx = px - ax;
		var avy = py - ay;
		
		var abx = bx - ax;
		var aby = by - ay;
		
		var u = (avx * abx + avy * aby);
		if (u <= .0)
		{
			q.x = ax;
			q.y = ay;
			return .0;
		}
		else
		{
			var denom = abx * abx + aby * aby;
			if (u >= denom)
			{
				q.x = bx;
				q.y = by;
				return 1.;
			}
			else
			{
				u /= denom;
				q.x = ax + u * abx;
				q.y = ay + u * aby;
				return u;
			}
		}
	}
}