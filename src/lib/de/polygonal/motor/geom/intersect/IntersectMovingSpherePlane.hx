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
import de.polygonal.motor.geom.primitive.Plane2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Tests if a moving sphere intersects a static plane.
 */
class IntersectMovingSpherePlane
{
	/**
	 * Returns true if a sphere <i>S</i> moving with velocity <i>v</i> hits a plane <i>P</i>
	 * within a time interval of &#091;0,1&#093;.
	 */
	inline public static function test3(S:Sphere2, P:Plane2, v:Vec2):Bool
	{
		return test8(S.c.x, S.c.y, S.r, P.n.x, P.n.y, P.d, v.x, v.y);
	}
	
	/**
	 * Returns true if a sphere with center (<i>sx</i>,<i>sy</i>) and moving with velocity (<i>vx</i>,<i>vy</i>) hits a plane
	 * with normal (<i>nx</i>,<i>ny</i>) and distance from origiin <i>d</i> within the time interval of &#091;0,1&#093;.
	 */
	inline public static function test8(sx:Float, sy:Float, r:Float, nx:Float, ny:Float, d:Float, vx:Float, vy:Float):Bool
	{
		var dist = (nx * sx + ny * sy) - d;
		
		if (Mathematics.fabs(dist) <= r)
			return false;
		else
		{
			var denom = nx * vx + ny * vy;
			if (denom * dist >= .0) return false;
			else
				return ((dist > .0 ? r : -r) - dist) / denom <= 1.;
		}
	}
	
	/**
	 * Tests if a sphere <i>S</i> moving with velocity <i>v</i> hits a plane <i>P</i>.
	 * Returns the time of collision and stores the contact point in <i>q</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating
	 * a future time at which the sphere would intersect the plane assuming the same motion.
	 */
	inline public static function find3(S:Sphere2, P:Plane2, v:Vec2, q:Vec2):Float
	{
		return find8(S.c.x, S.c.y, S.r, P.n.x, P.n.y, P.d, v.x, v.y, q);
	}
	
	/**
	 * Tests if a sphere with center (<i>sx</i>,<i>sy</i>) and radius <i>r</i>, moving with velocity (<i>vx</i>,<i>vy</i>),
	 * hits a plane with normal (<i>nx</i>,<i>ny</i>) and distance from origiin <i>d</i>.
	 * Returns the time of collision and stores the contact point in <i>q</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating
	 * a future time at which the sphere would intersect the plane assuming the same motion.
	 */
	inline public static function find8(sx:Float, sy:Float, r:Float, nx:Float, ny:Float, d:Float, vx:Float, vy:Float, q:Vec2):Float
	{
		//distance of sphere to plane center
		var dist = (nx * sx + ny * sy) - d;
		
		if (Mathematics.fabs(dist) <= r)
		{
			q.x = sx - nx * dist;
			q.y = sy - ny * dist;
			return 0.;
		}
		else
		{
			var denom = nx * vx + ny * vy;
			if (denom * dist >= .0)
			{
				//no intersection; sphere moving parallel or away from plane
				return -1.;
			}
			else
			{
				//sphere moving towards plane, intersecting in the future
				var r = dist > .0 ? r : -r;
				var t = (r - dist) / denom;
				q.x = sx + t * vx - r * nx;
				q.y = sy + t * vy - r * ny;
				return t;
			}
		}
	}
}