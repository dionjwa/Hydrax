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
package de.polygonal.motor.geom.bv;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Sphere2;

using de.polygonal.core.math.Mathematics;

class MinimumAreaCircle
{
	/**
	 * <p>Computes a bounding circle <code>sphere</code> from <code>vertices</code>.</p>
	 * <p>Fast approximation using an axis-aligned bounding box.</p>
	 * @param k the number of input vertices. If omitted, k is set to <code>vertices</code>.length.
	 */
	public static function findApproxA(vertices:Array<Vec2>, sphere:Sphere2, k = 0):Void
	{
		if (k == 0) k = vertices.length;
		
		var v = vertices[0];
		var vx = v.x;
		var vy = v.y;
		
		var minX = vx;
		var minY = vy;
		var maxX = vx;
		var maxY = vy;
		
		for (i in 1...k)
		{
			v = vertices[i];
			vx = v.x;
			vy = v.y;
			
			if (vx < minX) minX = vx;
			if (vy < minY) minY = vy;
			if (vx > maxX) maxX = vx;
			if (vy > maxY) maxY = vy;
		}
		
		var cx = (minX + maxX) * .5;
		var cy = (minY + maxY) * .5;
		
		var tx = (maxX - minX) * .5;
		var ty = (maxY - minY) * .5;
		
		sphere.r = tx + ty - tx.fmin(ty) * .5;
		sphere.c.x = cx;
		sphere.c.y = cy;
	}
	
	/**
	 * <p>Computes a bounding circle <code>sphere</code> from <code>vertices</code>.</p>
	 * <p>From "Graphics Gems II" (A fast bounding circle approximation by Jack Ritter).</p>
	 * @param k the number of input vertices. If omitted, k is set to <code>vertices</code>.length.
	 */
	public static function findApproxB(vertices:Array<Vec2>, sphere:Sphere2, k = 0):Void
	{
		if (k == 0) k = vertices.length;
		
		var v = vertices[0];
		var vx = v.x;
		var vy = v.y;
		
		var minX = vx;
		var maxX = vx;
		
		var minY = vy;
		var maxY = vy;
		
		var vminX = v;
		var vmaxX = v;
		var vminY = v;
		var vmaxY = v;
		
		for (i in 1...k)
		{
			v = vertices[i];
			vx = v.x;
			vy = v.y;
			
			if (vx < minX)
			{
				minX = vx;
				vminX = v;
			}
			else
			if (vx > maxX)
			{
				maxX = vx;
				vmaxX = v;
			}
			
			if (vy < minY)
			{
				minY = vy;
				vminY = v;
			}
			else
			if (vy > maxY)
			{
				maxY = vy;
				vmaxY = v;
			}
		}
		
		var dvx_x = vmaxX.x - vminX.x;
		var dvx_y = vmaxX.y - vminX.y;
		
		var dvy_x = vmaxY.x - vminY.x;
		var dvy_y = vmaxY.y - vminY.y;
		
		var dx2 = dvx_x * dvx_x + dvx_y * dvx_y;
		var dy2 = dvy_x * dvy_x + dvy_y * dvy_y;
		
		var cx, cy, r2;
		
		if (dx2 >= dy2)
		{                     
			cx = vminX.x + dvx_x * .5;
			cy = vminX.y + dvx_y * .5;
			
			var tx = vmaxX.x - cx;
			var ty = vmaxX.y - cy;
			r2 = tx * tx + ty * ty;
		}
		else
		{                                
			cx = vminY.x + dvy_x * .5;
			cy = vminY.y + dvy_y * .5;
			
			var tx = vmaxY.x - cx;
			var ty = vmaxY.y - cy;
			r2 = tx * tx + ty * ty;
		}
		
		var r = 1 / Mathematics.invSqrt(r2);
		
		var dist, dist2, t;
		
		for (i in 0...k)
		{
			v = vertices[i];
			vx = v.x - cx;
			vy = v.y - cy;
			
			dist2 = vx * vx + vy * vy;
			if (dist2 <= r2) continue;
			
			dist = 1 / Mathematics.invSqrt(dist2);
			
			r = (r + dist) * .5;
			r2 = r * r;
			
			t = ((dist - r) / dist);
			
			cx += t * vx;
			cy += t * vy;
		}
		
		sphere.r = r;
		sphere.c.x = cx;
		sphere.c.y = cy;
	}
	
	/**
	 * <p>Computes an exact bounding circle <code>sphere</code> from input <code>vertices</code>.</p>
	 * <p>From "Graphics Gems II" (Easy bounding circle (exact) by Jon Rokne).</p>
	 * @param k the number of input vertices. If omitted, k is set to <code>vertices</code>.length.
	 */
	public static function findExact(vertices:Array<Vec2>, sphere:Sphere2, k = 0):Void
	{
		if (k == 0) k = vertices.length;
		
		var m = Math;
		
		var v, dot, dotMax;
		var dx0, dy0, dx1, dy1;
		var px, py, qx, qy, rx = .0, ry = .0;
		var pi = 0, qi = 0, ri;
		
		var P:Vec2 = null;
		var Q:Vec2 = null;
		var R:Vec2 = null;
		
		//determine a point P with the smallest y value
		var minY = Mathematics.POSITIVE_INFINITY;
		for (i in 0...k)
		{
			v = vertices[i];
			if (v.y < minY)
			{
				P = v;
				minY = P.y;
				pi = i;
			}
		}
		
		px = P.x;
		py = P.y;
		
		//find a point Q such that the angle of the line segment PQ with the x axis is minimal
		dotMax = Mathematics.NEGATIVE_INFINITY;
		
		for (i in 0...k)
		{
			if (i == pi) continue;
			v = vertices[i];
			dx0 = v.x - px;
			dy0 = v.y - py;
			
			dot = dx0.fabs() / m.sqrt(Vec2Util.dot4(dx0, dy0, dx0, dy0));
			if (dot > dotMax)
			{
				dotMax = dot;
				Q = v;
				qi = i;
			}
		}
		
		qx = Q.x;
		qy = Q.y;
		
		for (i in 0...k)
		{
			dotMax = Mathematics.NEGATIVE_INFINITY;
			
			//find R such that the absolute value
			//of the angle PRQ is minimal
			for (j in 0...k)
			{
				if (j == pi) continue;
				if (j == qi) continue;
				
				v = vertices[j];
				
				dx0 = px - v.x; dy0 = py - v.y;
				dx1 = qx - v.x; dy1 = qy - v.y;
				
				dot = (dx0 * dx1 + dy0 * dy1) / (m.sqrt(Vec2Util.dot4(dx0, dy0, dx0, dy0)) * m.sqrt(Vec2Util.dot4(dx1, dy1, dx1, dy1)));
				if (dot > dotMax)
				{				
					dotMax = dot;
					R  = v;
					ri = j;
				}
			}
			rx = R.x;
			ry = R.y;
			
			//check for case 1 (angle PRQ is obtuse), the circle is determined
			//by two points, P and Q. radius = |(P-Q)/2|, center = (P+Q)/2
			if (dotMax < 0)
			{
				dx0 = px - qx;
				dy0 = py - qy;
				
				sphere.r = m.sqrt(((dx0 * dx0) * .25) + ((dy0 * dy0)  * .25));
				sphere.c.x = (px + qx) * .5;
				sphere.c.y = (py + qy) * .5;
				return;
			}
			
			//check if angle RPQ is acute
			dx0 = rx - px;
			dy0 = ry - py;
			
			dx1 = qx - px;
			dy1 = qy - py;
			
			dot = Vec2Util.dot4(dx0, dy0, dx1, dy1) / (m.sqrt(Vec2Util.dot4(dx0, dy0, dx0, dy0)) * m.sqrt(Vec2Util.dot4(dx1, dy1, dx1, dy1)));
			
			// if angle RPQ is 
			if (dot < 0)
			{
				P = R;
				px = rx;
				py = ry;
				continue;
			}
			
			// angle PQR is acute ?
			dx0 = px - qx;
			dy0 = py - qy;
			
			dx1 = rx - qx;
			dy1 = ry - qy;
			
			dot = (Vec2Util.dot4(dx0, dy0, dx1, dy1)) / (m.sqrt(Vec2Util.dot4(dx0, dy0, dx0, dy0)) * m.sqrt(Vec2Util.dot4(dx1, dy1, dx1, dy1)));
			
			if (dot < 0)
			{
				Q = R;
				qx = rx;
				qy = ry;
				continue;
			}
			
			//all angles in PQR are acute; quit
			break;
		}
		
		var mPQx = (px + qx) * .5;
		var mPQy = (py + qy) * .5;
		var mQRx = (qx + rx) * .5;
		var mQRy = (qy + ry) * .5;
		
		var numer = -(-mPQy * ry + mPQy * qy + mQRy * ry - mQRy * qy - mPQx * rx + mPQx * qx + mQRx * rx - mQRx *qx);
		var denom =  (-qx * ry + px * ry - px * qy + qy * rx - py * rx + py * qx);
		
		var t = numer / denom;
		
		var cx = -t * (qy - py) + mPQx;
		var cy =  t * (qx - px) + mPQy;
		
		dx0 = cx - px;
		dy0 = cy - py;
		
		sphere.r = m.sqrt(Vec2Util.dot4(dx0, dy0, dx0, dy0));
		sphere.c.x = -t * (qy - py) + mPQx;
		sphere.c.y =  t * (qx - px) + mPQy;
	}
}