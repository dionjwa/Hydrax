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
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Poly2;
import de.polygonal.motor.geom.primitive.Sphere2;

class IntersectMovingSpherePoly
{
	static var _clipResult = new ClipInfo();
	static var _vTmp = new Vec2();
	
	/**
	 * Returns true if a sphere <i>S</i> moving with velocity <i>v</i> hits a convex polygon <i>P</i>
	 * within a time interval of &#091;0,1&#093;.
	 */
	inline public static function test3(S:Sphere2, v:Vec2, P:Poly2):Bool
	{
		return test6(S.c.x, S.c.y, S.r, v.x, v.y, P);
	}
	
	/**
	 * Returns true if a sphere with center (<i>sx</i>,<i>sy</i>) and radius <i>r</i>, moving with velocity (<i>vx</i>,<i>vy</i>),
	 * hits a convex polygon within a time interval of &#091;0,1&#093;.
	 */
	inline public static function test6(sx:Float, sy:Float, r:Float, vx:Float, vy:Float, P:Poly2):Bool
	{
		var l = 1 / Vec2Util.length(vx, vy);
		var dx = vx * l;
		var dy = vy * l;
		
		if (IntersectRayPoly.find5(sx, sy, dx, dy, P, _clipResult, r))
		{
			var e0 = _clipResult.edge0;
			
			var qx = sx + _clipResult.t0 * dx;
			var qy = sy + _clipResult.t0 * dy;
			var ex = e0.b.x - e0.a.x;
			var ey = e0.b.y - e0.a.y;
			var ax = e0.a.x;
			var ay = e0.a.y;
			
			var t = Vec2Util.dot4(ex, ey, qx - ax, qy - ay);
			if (t < 0)
			{
				var u = e0.a;
				t = IntersectRaySphere.find7(sx, sy, dx, dy, u.x, u.y, r, _vTmp);
				if (t > 0)
				{
					if (t == .0)
						return false;
					else
						return t * l <= 1;
				}
				else
					return false;
			}
			else
			if (t > e0.length * e0.length)
			{
				var u = e0.b;
				t = IntersectRaySphere.find7(sx, sy, dx, dy, u.x, u.y, r, _vTmp);
				if (t > 0)
				{
					if (t == .0)
						return false;
					else
						return t * l <= 1;
				}
				else
					return false;
			}
			else
				return _clipResult.t0 * l <= 1;
		}
		else
			return false;
	}
	
	/** 
	 * Tests if a sphere <i>S</i> moving with velocity <i>v</i> hits a convex polygon <i>P</i>.
	 * Returns the time of collision and stores the contact point in <i>q</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating
	 * a future time at which the sphere would intersect the polygon assuming the same motion.
	 */
	inline public static function find3(S:Sphere2, v:Vec2, P:Poly2, q:Vec2):Float
	{
		return find6(S.c.x, S.c.y, S.r, v.x, v.y, P, q);
	}
	
	/** 
	 * Tests if a sphere with center (<i>sx</i>,<i>sy</i>) and radius <i>r</i>,
	 * moving with velocity <i>v</i>, hits a convex polygon <i>P</i>.
	 * Returns the time of collision and stores the contact point in <i>q</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating
	 * a future time at which the sphere would intersect the polygon assuming the same motion.
	 */
	inline public static function find6(sx:Float, sy:Float, r:Float, vx:Float, vy:Float, P:Poly2, q:Vec2):Float
	{
		var l = 1 / Vec2Util.length(vx, vy);
		var dx = vx * l;
		var dy = vy * l;
		
		if (IntersectRayPoly.find5(sx, sy, dx, dy, P, _clipResult, r))
		{
			var e0 = _clipResult.edge0;
			
			var qx = sx + _clipResult.t0 * dx;
			var qy = sy + _clipResult.t0 * dy;
			var ex = e0.b.x - e0.a.x;
			var ey = e0.b.y - e0.a.y;
			var ax = e0.a.x;
			var ay = e0.a.y;
			
			var t = Vec2Util.dot4(ex, ey, qx - ax, qy - ay);
			if (t < 0)
			{
				//hits vertex voronoi region of edge vertex a?
				var u = e0.a;
				t = IntersectRaySphere.find7(sx, sy, dx, dy, u.x, u.y, r, _vTmp);
				if (t > 0)
				{
					if (t == .0)
					{
						q.x = sx;
						q.y = sy;
						return .0;
					}
					else
					{
						q.x = _vTmp.x;
						q.y = _vTmp.y;
						return t * l;
					}
				}
				else
					return -1.;
			}
			else
			if (t > e0.length * e0.length)
			{
				//hits vertex voronoi region of edge vertex b?
				var u = e0.b;
				t = IntersectRaySphere.find7(sx, sy, dx, dy, u.x, u.y, r, _vTmp);
				if (t > 0)
				{
					if (t == .0)
					{
						q.x = sx;
						q.y = sy;
						return .0;
					}
					else
					{
						q.x = _vTmp.x;
						q.y = _vTmp.y;
						return t * l;
					}
				}
				else
					return -1.;
			}
			else
			{
				//hits edge voronoi region
				q.x = qx;
				q.y = qy;
				return _clipResult.t0 * l;
			}
		}
		else
			return -1.;
	}
}