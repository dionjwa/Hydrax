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
package de.polygonal.motor.geom.intersect;

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.Segment2;

/**
 * Intersecting segment against segment.
 */
class IntersectSegment
{
	/** Returns true if the segment <i>A</i> intersects the segment <i>B</i>. */
	inline public static function test2(A:Segment2, B:Segment2):Bool
	{
		return test4(A.a, A.b, B.a, B.b);
	}
	
	/** Returns true if the segment from <i>a</i> to <i>b</i> intersects the segment from <i>c</i> to <i>d</i>. */
	inline public static function test4(a:Vec2, b:Vec2, c:Vec2, d:Vec2):Bool
	{
		return test8(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
	}
	
	/** Returns true if the segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) intersects the segment from (<i>cx</i>,<i>cy</i>) to (<i>dx</i>,<i>dy</i>). */
	inline public static function test8(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, dx:Float, dy:Float):Bool
	{
		var a1 = (ax - dx) * (by - dy) - (ay - dy) * (bx - dx);
		var a2 = (ax - cx) * (by - cy) - (ay - cy) * (bx - cx);
		if (a1 * a2 < .0)
		{
			var a3 = (cx - ax) * (dy - ay) - (cy - ay) * (dx - ax);
			var a4 = a3 + a2 - a1;
			return a3 * a4 < .0;
		}
		else
			return false;
	}
	
	/**
	 * Intersecting segment <i>A</i> against segment <i>B</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the segments are separated.
	 */
	inline public static function find2(A:Segment2, B:Segment2, q:Vec2):Float
	{
		return find4(A.a, A.b, B.a, B.b, q);
	}
	
	/**
	 * Intersecting segment from <i>a</i> to <i>b</i> against segment from <i>c</i> to <i>d</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the segments are separated.
	 */
	inline public static function find4(a:Vec2, b:Vec2, c:Vec2, d:Vec2, q:Vec2):Float
	{
		return find8(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y, q);
	}
	
	/**
	 * Intersecting segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) against
	 * segment from (<i>cx</i>,<i>cy</i>) to (<i>dx</i>,<i>dy</i>).
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the segments are separated.
	 */
	inline public static function find8(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, dx:Float, dy:Float, q:Vec2):Float
	{
		var a1 = (ax - dx) * (by - dy) - (ay - dy) * (bx - dx);
		var a2 = (ax - cx) * (by - cy) - (ay - cy) * (bx - cx);
		if (a1 * a2 < .0)
		{
			var a3 = (cx - ax) * (dy - ay) - (cy - ay) * (dx - ax);
			var a4 = a3 + a2 - a1;
			if (a3 * a4 < .0)
			{
				var t = a3 / (a3 - a4);
				q.x = ax + t * (bx - ax);
				q.y = ay + t * (by - ay);
				return t;
			}
			else
				return -1.;
		}
		else
			return -1.;
	}
}