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
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Plane2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Intersecting two-dimensional sphere against plane (constant-normal form).
 */
class IntersectSpherePlane
{
	/** Returns true if the sphere <i>S</i> intersects the plane <i>P</i>. */
	inline public static function test2(S:Sphere2, P:Plane2):Bool
	{
		return test4(S.c, S.r, P.n, P.d);
	}
	
	/**
	 * Returns true if the sphere with center <i>c</i> and radius <i>r</i> intersects
	 * the plane with normal <i>n</i> and distance from origin <i>d</i>.
	 */
	inline public static function test4(c:Vec2, r:Float, n:Vec2, d:Float):Bool
	{
		return test6(c.x, c.y, r, n.x, n.y, d);
	}
	
	/**
	 * Returns true if the sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i> intersects
	 * the plane with normal (<i>nx</i>,<i>ny</i>) and distance from origin <i>d</i>.
	 */
	inline public static function test6(cx:Float, cy:Float, r:Float, nx:Float, ny:Float, d:Float):Bool
	{
		return Mathematics.fabs(Vec2Util.dot4(cx, cy, nx, ny) - d) <= r;
	}
}