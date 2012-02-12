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

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Segment2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Tests if a moving sphere intersects a line segment.
 */
class IntersectMovingSphereSegment
{
	/**
	 * Tests if a sphere <i>S</i> moving with velocity <i>v</i> hits a line segment <i>l</i>.
	 * @param q The contact point.
	 * @return The time of collision in the range &#091;0,1&#093; or -1 if the sphere misses the segment.
	 */
	inline public static function find3(S:Sphere2, L:Segment2, v:Vec2, q:Vec2):Float
	{
		return find5(S.c, S.r, L.a, L.b, v, q);
	}
	
	/**
	 * Tests if a sphere with center <i>c</i> and radius <i>r</i>, moving with velocity (<i>vx</i>,<i>vy</i>)
	 * hits a line segment from <i>a</i> to <i>b</i>.
	 * @param q The contact point.
	 * @return The time of collision in the range &#091;0,1&#093; or -1 if the sphere misses the segment.
	 */
	inline public static function find5(c:Vec2, r:Float, a:Vec2, b:Vec2, v:Vec2, q:Vec2):Float
	{
		return find9(c.x, c.y, r, a.x, a.y, b.x, b.y, v.x, v.y, q);
	}
	
	/**
	 * Tests if a sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i>, moving with velocity (<i>vx</i>,<i>vy</i>)
	 * hits a line segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>).
	 * @param q The contact point.
	 * @return The time of collision in the range &#091;0,1&#093; or -1 if the sphere misses the segment.
	 */
	public static function find9(cx:Float, cy:Float, r:Float, ax:Float, ay:Float, bx:Float, by:Float, vx:Float, vy:Float, q:Vec2):Float
	{
		#if debug
		de.polygonal.core.util.Assert.assert(!(ax == bx && ay == by), 'degenerate segment');
		de.polygonal.core.util.Assert.assert(Math.sqrt((bx - ax) * (bx - ax) + (by - ay) * (by - ay)) > Mathematics.EPS, 'degenerate segment');
		#end
		
		var dx = bx - ax;
		var dy = by - ay;
		
		var lSq = dx * dx + dy * dy;
		var l = Math.sqrt(lSq);
		var nx =-dy / l;
		var ny = dx / l;
		var d = nx * ax + ny * ay;
		
		var t1 = IntersectMovingSpherePlane.find8(cx, cy, r, nx, ny, d, vx, vy, q);
		if (t1 != -1 && t1 <= 1)
		{
			//collides somewhere in the future
			var u = q;
			var w = ((u.x - ax) * dx + (u.y - ay) * dy) / lSq;
			if (w < .0)
			{
				//ínitially intersecting with plane?
				if (t1 == .0)
				{
					//check distance to A; trying to avoid segment-sphere intersection test
					dx = cx - ax;
					dy = cy - ay;
					if ((dx * dx + dy * dy) < r * r)
					{
						q.x = ax;
						q.y = ay;
						return .0;
					}
					//intersection point outside AB on side of A
					else return _intersectVertex(cx, cy, vx, vy, ax, ay, r, q);
				}
				//intersection point outside AB on side of A
				else return _intersectVertex(cx, cy, vx, vy, ax, ay, r, q);
			}
			else
			if (w > 1.)
			{
				//ínitially intersecting with plane?
				if (t1 == .0)
				{
					//check distance to B trying to avoid segment-sphere intersection test
					var dx = cx - bx;
					var dy = cy - by;
					if ((dx * dx + dy * dy) < r * r)
					{
						q.x = bx;
						q.y = by;
						return .0;
					}
					//intersection point outside AB on side of B
					else return _intersectVertex(cx, cy, vx, vy, bx, by, r, q);
				}
				//intersection point outside AB on side of B
				else return _intersectVertex(cx, cy, vx, vy, bx, by, r, q);
			}
			else
			{
				//initially intersecting?
				if (t1 == .0)
				{
					q.x = ax + w * dx;
					q.y = ay + w * dy;
					return .0;
				}
				else	
				{
					//intersection point inside AB
					return t1;
				}
			}
		}
		else
			return -1.;
	}
	
	inline static function _intersectVertex(cx:Float, cy:Float, vx:Float, vy:Float, px:Float, py:Float, r:Float, q:Vec2):Float
	{
		var l = Vec2Util.length(vx, vy);
		var t = IntersectSegmentSphere.find7(cx, cy, cx + vx, cy + vy, px, py, r, q);
		if (t != -1)
		{
			t /= l; 
			q.x = px;
			q.y = py;
			return t;
		}
		else
			return -1.;
	}
}