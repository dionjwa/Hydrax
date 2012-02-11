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
 * Tests if two spheres intersect at some time in the future given the motion of both spheres.
 */
class IntersectMovingSphereSphere
{
	/**
	 * Computes the time of collision of two moving spheres <i>S1</i> and <i>S2</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating a future time at which both spheres intersect.
	 * @param v0 The motion of sphere <i>S1</i>.
	 * @param v1 The motion of sphere <i>S2</i>.
	 */
	inline public static function find4(S1:Sphere2, S2:Sphere2, v0:Vec2, v1:Vec2):Float
	{
		return find10(S1.c.x, S1.c.y, S1.r, S2.c.x, S2.c.y, S2.r, v0.x, v0.y, v1.x, v1.y);
	}
	
	/**
	 * Computes the time of collision of two moving spheres (center: (<i>s1x</i>,<i>s1y</i>)/(<i>s2x</i>,<i>s2y</i>), radius: <i>s1r</i>/<i>s2r</i>).
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating a future time at which both spheres intersect.
	 * @param v1x The motion of sphere #1, x component.
	 * @param v1y The motion of sphere #1, y component.
	 * @param v2x The motion of sphere #2, x component.
	 * @param v2y The motion of sphere #2, y component.
	 */
	inline public static function find10(s1x:Float, s1y:Float, r1r:Float, s2x:Float, s2y:Float, s2r:Float,
		v0x:Float, v0y:Float, v1x:Float, v1y:Float):Float
	{
		var sx = s2x - s1x;
		var sy = s2y - s1y;
		
		var vx = v1x - v0x;
		var vy = v1y - v0y;
		
		var r = s2r + r1r;
		var c = (sx * sx + sy * sy) - (r * r);
		if (c < .0)
			return .0;
		else
		{
			var a = vx * vx + vy * vy;
			if 	(a < Mathematics.EPS)
				return -1.;
			else
			{
				var b = vx * sx + vy * sy;
				if (b >= .0) return -1.;
				else
				{
					var d = b * b - a * c;
					if (d < 0.) return -1.;
					else
						return (-b - Math.sqrt(d)) / a;
				}
			}
		}
	}
}