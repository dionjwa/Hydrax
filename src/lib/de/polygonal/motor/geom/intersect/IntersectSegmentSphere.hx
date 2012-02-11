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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.Segment2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Intersecting segment against sphere.
 */
class IntersectSegmentSphere
{
	/** Returns true if the segment <i>A</i> intersects the sphere <i>B</i>. */
	inline public static function test2(A:Segment2, B:Sphere2):Bool
	{
		return test4(A.a, A.b, B.c, B.r);
	}
	
	/** Returns true if the segment from <i>a</i> to <i>b</i> intersects the sphere with center <i>c</i> and radius <i>r</i>. */
	inline public static function test4(a:Vec2, b:Vec2, c:Vec2, r:Float):Bool
	{
		return test7(a.x, a.y, b.x, b.y, c.x, c.y, r);
	}
	
	/**
	 * Returns true if the segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) intersects
	 * the sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i>.
	 */
	inline public static function test7(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, r:Float):Bool
	{
		var dx = bx - ax;
		var dy = by - ay;
		var tx = cx - ax;
		var ty = cy - ay;
		var t = Mathematics.fclamp((tx * dx + ty * dy) / (dx * dx + dy * dy), .0, 1.);
		dx = cx - (ax + t * dx);
		dy = cy - (ay + t * dy);
		return dx * dx + dy * dy <= r * r;
	}
	
	
	/**
	 * Intersecting segment <i>A</i> against sphere <i>B</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is zero if ray origin is inside sphere and minus one if the ray misses the sphere.
	 */
	inline public static function find2(A:Segment2, B:Sphere2, q:Vec2):Float
	{
		return find4(A.a, A.b, B.c, B.r, q);
	}
	
	/**
	 * Intersecting segment from <i>a</i> to <i>b</i> against sphere with center <i>c</i> and radius <i>r</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is zero if ray origin is inside sphere and minus one if the ray misses the sphere.
	 */
	inline public static function find4(a:Vec2, b:Vec2, c:Vec2, r:Float, q:Vec2):Float
	{
		return find7(a.x, a.y, b.x, b.y, c.x, c.y, r, q);
	}
	
	/**
	 * Intersecting segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) against sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is zero if ray origin is inside sphere and minus one if the ray misses the sphere.
	 */
	inline public static function find7(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, r:Float, q:Vec2):Float
	{
		var dx = bx - ax;
		var dy = by - ay;
		
		var m = Math;
		var l = m.sqrt(dx * dx + dy * dy);
		dx /= l;
		dy /= l;
		
		var mx = ax - cx;
		var my = ay - cy;
		var b = mx * dx + my * dy;
		var c = mx * mx + my * my - (r * r);
		
		if (c > 0 && b > 0)
			return -1.;
		else
		{
			var discr = b * b - c;
			if (discr < 0)
				return -1.;
			else
			{
				var t = -b - m.sqrt(discr);
				if (t < 0)
				{
					q.x = ax;
					q.y = ay;
					return 0.;
				}
				else
				{
					if (t <= l)
					{
						q.x = ax + t * dx;
						q.y = ay + t * dy;
						return t;
					}
					else
						return -1.;
				}
			}
		}
	}
}