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
import de.polygonal.motor.geom.primitive.Plane2;
import de.polygonal.motor.geom.primitive.Segment2;

/**
 * Intersecting segment against plane (constant-normal form).
 */
class IntersectSegmentPlane
{
	/** Returns true if the segment <i>S</i> intersects the plane <i>P</i>. */
	inline public static function test2(S:Segment2, P:Plane2):Bool
	{
		return test4(S.a, S.b, P.n, P.d);
	}
	
	/** Returns true if the segment from <i>a</i> to <i>b</i> intersects the plane with normal <i>n</i> and distance from origin <i>d.</i>.*/
	inline public static function test4(a:Vec2, b:Vec2, n:Vec2, d:Float):Bool
	{
		return test7(a.x, a.y, b.x, b.y, n.x, n.y, d);
	}
	
	/** 
	 * Returns true if the segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) intersects the plane
	 * with normal (<i>nx</i>,<i>ny</i>) and distance from origin <i>d.</i>.
	 */
	inline public static function test7(ax:Float, ay:Float, bx:Float, by:Float, nx:Float, ny:Float, d:Float):Bool
	{
		var abx = bx - ax;
		var aby = by - ay;
		var t = (d - (nx * ax + ny * ay)) / (nx * abx + ny * aby);
		return t >= .0 && t <= 1.;
	}
	
	/**
	 * Intersecting segment <i>S</i> against plane <i>P</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the ray does not intersect the plane.
	 */
	inline public static function find2(S:Segment2, P:Plane2, q:Vec2):Float
	{
		return find4(S.a, S.b, P.n, P.d, q);
	}
	
	/**
	 * Intersecting segment from <i>a</i> to <i>b</i> against plane with normal <i>n</i>
	 * and distance from origin <i>o</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the ray does not intersect the plane.
	 */
	inline public static function find4(a:Vec2, b:Vec2, n:Vec2, d:Float, q:Vec2):Float
	{
		return find7(a.x, a.y, b.x, b.y, n.x, n.y, d, q);
	}
	
	/**
	 * Intersecting segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) against
	 * plane with normal <i>n</i> and distance from origin <i>o</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the ray does not intersect the plane.
	 */
	inline public static function find7(ax:Float, ay:Float, bx:Float, by:Float, nx:Float, ny:Float, d:Float, q:Vec2):Float
	{
		var abx = bx - ax;
		var aby = by - ay;
		
		var t = (d - (nx * ax + ny * ay)) / (nx * abx + ny * aby);
		if (t >= .0 && t <= 1.)
		{
			q.x = ax + t * abx;
			q.y = ay + t * aby;
			return t;
		}
		else
			return -1.;
	}
}