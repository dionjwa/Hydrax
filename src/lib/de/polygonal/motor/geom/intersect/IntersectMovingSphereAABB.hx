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
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Tests if a moving sphere intersects a static axis-aligned bounding box. 
 */
class IntersectMovingSphereAABB
{
	static var _clipResult = new ClipInfo();
	static var _vTmp = new Vec2();
	
	/**
	 * Returns true if a sphere <i>S</i> moving with velocity <i>v</i> hits an AABB <i>A</i>
	 * within a time interval of &#091;0,1&#093;.
	 */
	inline public static function test3(v:Vec2, S:Sphere2, A:AABB2):Bool
	{
		return test8(v.x, v.y, S.c.x, S.c.y, S.r, A.minX, A.minY, A.maxX, A.maxY);
	}
	
	/**
	 * Returns true if a sphere with center (<i>sx</i>,<i>sy</i>) and radius <i>r</i> hits
	 * an AABB defined by a min-max representation with min=(<i>minX</i>,<i>minY</i>) and max=(<i>maxX</i>,<i>maxY</i>)
	 * within a time interval of &#091;0,1&#093;.
	 */
	inline public static function test8(vx:Float, vy:Float, sx:Float, sy:Float, r:Float, minX:Float, minY:Float, maxX:Float, maxY:Float):Bool
	{
		if (IntersectRayAABB.find8(sx, sy, vx, vy, minX, minY, maxX, maxY, _clipResult, r) && _clipResult.t0 <= 1)
		{
			var qx = sx + _clipResult.t0 * vx;
			var qy = sy + _clipResult.t0 * vy;
			
			var u = 0, v = 0;
			if (qx < minX) u |= 1;
			if (qx > maxX) v |= 1;
			if (qy < minY) u |= 2;
			if (qy > maxY) v |= 2;
			if (u | v == 3)
			{
				var l = 1 / Math.sqrt(Vec2Util.dot4(vx, vy, vx, vy));
				return IntersectRaySphere.find7(sx, sy, vx * l, vy * l,
					((v & 1) > 0) ? maxX : minX,
					((v & 2) > 0) ? maxY : minY, r, _vTmp) != -1;
			}
			else
				return true;
		}
		else
			return false;
	}
	
	/** 
	 * Tests if a sphere <i>S</i> moving with velocity <i>v</i> hits an AABB <i>A</i>.
	 * Returns the time of collision and stores the contact point in <i>q</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating
	 * a future time at which the sphere would intersect the AABB assuming the same motion.
	 */
	inline public static function find3(v:Vec2, S:Sphere2, A:AABB2, q:Vec2):Float
	{
		return find8(v.x, v.y, S.c.x, S.c.y, S.r, A.minX, A.minY, A.maxX, A.maxY, q);
	}
	
	/** 
	 * Tests if a sphere with center (<i>cx</i>,<i>cy</i>) and radius <i>r</i>, moving with velocity (<i>vx</i>,<i>vy</i>),
	 * hits an AABB defined by a min-max representation with min=(<i>minX</i>,<i>minY</i>) and max=(<i>maxX</i>,<i>maxY</i>).
	 * Returns the time of collision and stores the contact point in <i>q</i>.
	 * The collision time may lie beyond the interval &#091;0,1&#093; indicating
	 * a future time at which the sphere would intersect the AABB assuming the same motion.
	 */
	inline public static function find8(vx:Float, vy:Float, sx:Float, sy:Float, r:Float, minX:Float, minY:Float, maxX:Float, maxY:Float, q:Vec2):Float
	{
		if (IntersectRayAABB.find8(sx, sy, vx, vy, minX, minY, maxX, maxY, _clipResult, r))
		{
			var t = _clipResult.t0;
			var qx = sx + t * vx;
			var qy = sy + t * vy;
			
			var u = 0, v = 0;
			if (qx < minX) u |= 1;
			if (qx > maxX) v |= 1;
			if (qy < minY) u |= 2;
			if (qy > maxY) v |= 2;
			if (u | v == 3)
			{
				//ray hits vertex vr
				var l = 1 / Math.sqrt(Vec2Util.dot4(vx, vy, vx, vy));
				vx *= l;
				vy *= l;
				
				t = IntersectRaySphere.find7(sx, sy, vx, vy,
					((v & 1) > 0) ? maxX : minX,
					((v & 2) > 0) ? maxY : minY, r, _vTmp);
				if (t != -1)
				{
					q.x = sx + t * vx;
					q.y = sy + t * vy;
					return t * l;
				}
				else
					return -1.;
			}
			else
			{
				//ray hits edge vr
				q.x = sx + t * vx;
				q.y = sy + t * vy;
				return t;
			}
		}
		else
			return -1.;
	}
}