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
import de.polygonal.motor.geom.primitive.Ray2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Intersecting ray against two-dimensional sphere.
 */
class IntersectRaySphere
{
	/** Returns true if the ray <i>R</i> = p + t*d, |d| = 1 intersects the sphere <i>S</i>. */
	inline public static function test2(R:Ray2, S:Sphere2):Bool
	{
		return test4(R.p, R.d, S.c, S.r);
	}
	
	/**
	 * Returns true if the ray r = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 intersects the sphere
	 * with center <i>c</i> and radius <i>r</i>.
	 */
	inline public static function test4(p:Vec2, d:Vec2, c:Vec2, r:Float):Bool
	{
		return test7(p.x, p.y, d.x, d.y, c.x, c.y, r);
	}
	
	/**
	 * Returns true if the ray r = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |(<i>dx</i>,<i>dy</i>)| = 1
	 * intersects the sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i>.
	 */
	inline public static function test7(px:Float, py:Float, dx:Float, dy:Float, cx:Float, cy:Float, r:Float):Bool
	{
		var mx = px - cx;
		var my = py - cy;
		var b = mx * dx + my * dy;
		var c = mx * mx + my * my - (r * r);
		if (c > 0 && b > 0)
			return false;
		else
		{
			var discr = b * b - c;
			if (discr < 0)
				return false;
			else
				return true;
		}
	}
	
	/**
	 * Intersecting ray <i>R</i> = p + t*d, |d| = 1 against sphere <i>S</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is zero if ray origin is inside sphere and minus one if the ray misses the sphere.
	 */
	inline public static function find2(R:Ray2, S:Sphere2, q:Vec2):Float
	{
		return find4(R.p, R.d, S.c, S.r, q);
	}
	
	/**
	 * Intersecting ray = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 against sphere with center <i>c</i> and radius <i>r</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is zero if ray origin is inside sphere and minus one if the ray misses the sphere.
	 */
	inline public static function find4(p:Vec2, d:Vec2, c:Vec2, r:Float, q:Vec2):Float
	{
		return find7(p.x, p.y, d.x, d.y, c.x, c.y, r, q);
	}
	
	/**
	 * Intersecting ray r = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |(<i>dx</i>,<i>dy</i>)| = 1 against
	 * sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is zero if ray origin is inside sphere and minus one if the ray misses the sphere.
	 */
	public static function find7(px:Float, py:Float, dx:Float, dy:Float, cx:Float, cy:Float, r:Float, q:Vec2):Float
	{
		var mx = px - cx;
		var my = py - cy;
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
				var t = -b - Math.sqrt(discr);
				if (t < 0)
				{
					q.x = px;
					q.y = py;
					return 0.;
				}
				else
				{
					q.x = px + t * dx;
					q.y = py + t * dy;
					return t;
				}
			}
		}
	}
}