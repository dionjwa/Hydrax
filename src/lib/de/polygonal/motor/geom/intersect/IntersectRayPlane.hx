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
import de.polygonal.motor.geom.primitive.Ray2;

/**
 * Intersecting ray against plane (constant-normal form).
 */
class IntersectRayPlane
{
	/** Returns true if the ray <i>R</i> = p + t*d, |d| = 1 intersects the plane <i>P</i>. */
	inline public static function test2(R:Ray2, P:Plane2):Bool
	{
		return test4(R.p, R.d, P.n, P.d);
	}
	
	/**
	 * Returns true if the ray r = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 intersects
	 * the plane with normal <i>n</i> and distance from the origin <i>o</i>.
	 */
	inline public static function test4(p:Vec2, d:Vec2, n:Vec2, o:Float):Bool
	{
		return test7(p.x, p.y, d.x, d.y, n.x, n.y, o);
	}
	
	/**
	 * Returns true if the ray r = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |(<i>dx</i>,<i>dy</i>)| = 1 intersects
	 * the plane with normal (<i>nx</i>,<i>ny</i>) and distance from origin <i>o</i>.
	 */
	inline public static function test7(px:Float, py:Float, dx:Float, dy:Float, nx:Float, ny:Float, o:Float):Bool
	{
		return ((o - (nx * px + ny * py)) / (nx * dx + ny * dy)) >= .0;
	}
	
	/**
	 * Intersecting ray <i>R</i> = p + t*d, |d| = 1 against plane <i>P</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the ray does not intersect the plane.
	 */
	inline public static function find2(R:Ray2, P:Plane2, q:Vec2):Float
	{
		return find4(R.p, R.d, P.n, P.d, q);
	}
	
	/**
	 * Intersecting ray r = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 against plane with normal <i>n</i>
	 * and distance from origin <i>o</i>.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the ray does not intersect the plane.
	 */
	inline public static function find4(p:Vec2, d:Vec2, n:Vec2, o:Float, q:Vec2):Float
	{
		return find7(p.x, p.y, d.x, d.y, n.x, n.y, o, q);
	}
	
	/**
	 * Intersecting ray r = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |(<i>dx</i>,<i>dy</i>)| = 1 against
	 * plane with normal (<i>nx</i>,<i>ny</i>) and distance from origin <i>o</i.
	 * @param q Stores the point of intersection.
	 * @return The t value of intersection. t is minus one if the ray does not intersect the plane.
	 */
	inline public static function find7(px:Float, py:Float, dx:Float, dy:Float, nx:Float, ny:Float, o:Float, q:Vec2):Float
	{
		var t = (o - (nx * px + ny * py)) / (nx * dx + ny * dy);
		if (t >= .0)
		{
			q.x = px + t * dx;
			q.y = py + t * dy;
			return t;
		}
		else
			return -1.;
	}
}