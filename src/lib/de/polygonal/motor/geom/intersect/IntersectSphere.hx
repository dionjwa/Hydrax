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
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Intersecting two-dimensional sphere against two-dimensional sphere.
 */
class IntersectSphere
{
	/** Returns true if the sphere <i>A</i> intersects the sphere <i>B</i>. */
	inline public static function test2(A:Sphere2, B:Sphere2):Bool
	{
		return test4(A.c, A.r, B.c, B.r);
	}
	
	/**
	 * Returns true if the sphere with center <i>ca</i> and radius <i>ra</i> intersects
	 * the sphere with center <i>cb</i> and radius <i>rb</i>.
	 */
	inline public static function test4(ca:Vec2, ra:Float, cb:Vec2, rb:Float):Bool
	{
		return test6(ca.x, ca.y, ra, cb.x, cb.y, rb);
	}
	
	/**
	 * Returns true if the sphere with center (<i>ax</i>,<i>ay</i>) and radius <i>ra</i> intersects
	 * the sphere with center (<i>bx</i>,<i>by</i>) and radius <i>rb</i>.
	 */
	inline public static function test6(ax:Float, ay:Float, ra:Float, bx:Float, by:Float, rb:Float):Bool
	{
		var dx = bx - ax;
		var dy = by - ay;
		var r2 = ra + rb;
		return dx * dx + dy * dy < r2 * r2;
	}
	
	inline public static function find7(ax:Float, ay:Float, ra:Float, bx:Float, by:Float, rb:Float, collideInfo:CollideInfo):Bool
	{
		var dx = bx - ax;
		var dy = by - ay;
		var dSqr = dx * dx + dy * dy;
		var r = ra + rb;
		if (dSqr > r * r)
			return false;
		else
		{
			if (dSqr < Mathematics.EPS)
			{
				collideInfo.normal.x = 0;
				collideInfo.normal.y = 1;
				collideInfo.MTD.x =-r;
				collideInfo.MTD.y = 0;
			}
			else
			{
				var d = Math.sqrt(dSqr);
				var t = 1 / d;
				dx = collideInfo.normal.x = t * dx;
				dy = collideInfo.normal.y = t * dy;
				collideInfo.MTD.x = dx * (d - r);
				collideInfo.MTD.y = dy * (d - r);
			}
			return true;
		}
	}
}