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
package de.polygonal.motor.geom.tri;

import de.polygonal.ds.ArrayUtil;
import de.polygonal.motor.geom.primitive.Sphere2;

using de.polygonal.core.math.Mathematics;

/**
 * <p>Delaunay Triangulation</p>
 * <p>Ported from p bourke's triangulate.c</p>
 * <p>See http://astronomy.swin.edu.au/~pbourke/terrain/triangulate/triangulate.c</p>
 */
class DelaunayTriangulation 
{
	inline public static var EPSILON = 0.000001;
	
	/**
	 * Delaunay triangulation of a set of points.
	 * @param pxyz an array of input vertices in the format [x0, y0, reserved, x1, y1, reserved, ...].<br/>
	 * The vertex array must be big enough to hold 3 more points and must the sorted in increasing x values.
	 * 
	 * @param v2 returns a list of triangle indices in the format [a0, b0, c0, a1, b1, c1, ...].<br/>
	 * Triangles are arranged in a consistent clockwise order.<br/>
	 * The length of the triangle array should be at least 3 times the number vertices.
	 */
	public static function triangulate(vertexList:Array<Float>, v2:Array<Int>)
	{
		var nv = Std.int(vertexList.length / 3) - 3;
		
		var trimax = 200;
		var emax   = 200;
		var status = 0;
		
		var xp, yp, x1, y1, x2, y2, x3, y3, xc, yc, r;
		var minX, maxX, minY, maxY, xmid, ymid;
		var dx, dy, dmax;
		
		var ntri = 0;
		
		trimax = nv << 2;
		var complete:Array<Bool> = ArrayUtil.alloc(trimax);
		for (ic in 0...trimax) complete[ic] = false;
		
		var edges:Array<Int> = ArrayUtil.alloc(emax * 2);
		ArrayUtil.fill(edges, -1, emax * 2);
		
		var a = vertexList;
		
		minX = a[0];
		minY = a[1];
		maxX = minX;
		maxY = minY;
		
		for (i in 1...nv)
		{
			if (a[i * 3 + 0] < minX) minX = a[i * 3 + 0];
			if (a[i * 3 + 0] > maxX) maxX = a[i * 3 + 0];
			if (a[i * 3 + 1] < minY) minY = a[i * 3 + 1];
			if (a[i * 3 + 1] > maxY) maxY = a[i * 3 + 1];
		}
		
		dx = maxX - minX;
		dy = maxY - minY;
		dmax = (dx > dy) ? dx : dy;
		xmid = (maxX + minX) * .5;
		ymid = (maxY + minY) * .5;
		
		a[(nv + 0) * 3 + 0] = xmid - 2. * dmax;
		a[(nv + 0) * 3 + 1] = ymid - dmax;
		a[(nv + 0) * 3 + 2] = 0.;
		a[(nv + 1) * 3 + 0] = xmid;
		a[(nv + 1) * 3 + 1] = ymid + 2. * dmax;
		a[(nv + 1) * 3 + 2] = 0.;
		a[(nv + 2) * 3 + 0] = xmid + 2. * dmax;
		a[(nv + 2) * 3 + 1] = ymid - dmax;
		a[(nv + 2) * 3 + 2] = 0.;
		
		v2[0] = nv;
		v2[1] = nv + 1;
		v2[2] = nv + 2;
		
		complete[0] = false;
		ntri = 1;
		
		var s = new Sphere2();
		
		var t1, t2;
		var nedge, inside;
		for (i in 0...nv)
		{
			xp = a[i * 3 + 0];
			yp = a[i * 3 + 1];
			nedge = 0;
			
			var j = 0;
			while (j < ntri)
			{
				if (complete[j])
				{
					j++;
					continue;
				}
				
				t1 = j * 3;
				
				x1 = a[(v2[t1 + 0]) * 3 + 0];
				y1 = a[(v2[t1 + 0]) * 3 + 1];
				x2 = a[(v2[t1 + 1]) * 3 + 0];
				y2 = a[(v2[t1 + 1]) * 3 + 1];
				x3 = a[(v2[t1 + 2]) * 3 + 0];
				y3 = a[(v2[t1 + 2]) * 3 + 1];
				
				inside = _circumCircle(xp, yp, x1, y1, x2, y2, x3, y3, s);
				xc = s.c.x;
				yc = s.c.y;
				r = s.r;
				
				if (xc + r < xp) complete[j] = true;
				
				if (inside)
				{
					if (nedge + 3 >= emax)
					{
						emax += 100;
						
						var edges_n:Array<Int> = ArrayUtil.alloc(emax * 2);
						ArrayUtil.fill(edges_n, -1);
						
						for (ii in 0...emax << 1)
							edges_n[ii] = edges[i];
						edges = edges_n;
					}
					
					edges[(nedge + 0) * 2 + 0] = v2[t1 + 0];
					edges[(nedge + 0) * 2 + 1] = v2[t1 + 1];
					edges[(nedge + 1) * 2 + 0] = v2[t1 + 1];
					edges[(nedge + 1) * 2 + 1] = v2[t1 + 2];
					edges[(nedge + 2) * 2 + 0] = v2[t1 + 2];
					edges[(nedge + 2) * 2 + 1] = v2[t1 + 0];
					
					nedge += 3;
					t2 = (ntri - 1) * 3;
					v2[t1 + 0] = v2[t2 + 0];
					v2[t1 + 1] = v2[t2 + 1];
					v2[t1 + 2] = v2[t2 + 2];
					
					complete[j] = complete[ntri - 1];
					ntri--;
					j--;
				}
				
				j++;
			}
			
			for (j in 0...nedge - 1)
			{
				for (k in j + 1...nedge)
				{
					t1 = j << 1;
					t2 = k << 1;
					
					if ((edges[t1 + 0] == edges[t2 + 1]) && (edges[t1 + 1] == edges[t2 + 0]))
					{
						edges[t1 + 0] = -1;
						edges[t1 + 1] = -1;
						edges[t2 + 0] = -1;
						edges[t2 + 1] = -1;
					}
					if ((edges[t1 + 0] == edges[t2 + 0]) && (edges[t1 + 1] == edges[t2 + 1]))
					{
						edges[t1 + 0] = -1;
						edges[t1 + 1] = -1;
						edges[t2 + 0] = -1;
						edges[t2 + 1] = -1;
					}
				}
			}
			
			for (j in 0...nedge)
			{
				t1 = j << 1;
				
				if (edges[t1 + 0] == -1 || edges[t1 + 1] == -1) continue;
				if (ntri >= trimax)
					return -1;
				
				t2 = ntri * 3;
				v2[t2 + 0] = edges[t1 + 0];
				v2[t2 + 1] = edges[t1 + 1];
				v2[t2 + 2] = i;
				complete[ntri] = false;
				ntri++;
			}
		}
		
		var i = 0;
		while (i < ntri)
		{
			t1 = i * 3;
			
			if (v2[t1 + 0] >= nv || v2[t1 + 1] >= nv || v2[t1 + 2] >= nv)
			{
				t2 = (ntri - 1) * 3;
				v2[t1 + 0] = v2[t2 + 0];
				v2[t1 + 1] = v2[t2 + 1];
				v2[t1 + 2] = v2[t2 + 2];
				ntri--;
				i--;
			}
			i++;
		}
		
		return ntri;
	}
	
	inline static function _circumCircle(xp:Float, yp:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, s:Sphere2)
	{
		//returns true if a point (xp, yp) is inside the circumcircle made up
		//of the points (x1, y1), (x2, y2), (x3, y3)
		//the circumcircle centre is returned in (xc, yc) and the radius r
		//note: a point on the edge is inside the circumcircle
		var m1, m2, mx1, mx2, my1, my2;
		var xc, yc;
		
		if ((y1 - y2).fabs() < EPSILON && (y2 - y3).fabs() < EPSILON)
			return false;
		else
		{
			if ((y2 - y1).fabs() < EPSILON)
			{
				m2  =-(x3 - x2) / (y3 - y2);
				mx2 = (x2 + x3) * .5;
				my2 = (y2 + y3) * .5;
				xc  = (x2 + x1) * .5;
				yc  = m2 * (xc - mx2) + my2;
			}
			else
			if ((y3 - y2).fabs() < EPSILON)
			{
				m1  =-(x2 - x1) / (y2 - y1);
				mx1 = (x1 + x2) * .5;
				my1 = (y1 + y2) * .5;
				xc  = (x3 + x2) * .5;
				yc  = m1 * (xc - mx1) + my1;	
			}
			else
			{
				m1  =-(x2 - x1) / (y2 - y1);
				m2  =-(x3 - x2) / (y3 - y2);
				mx1 = (x1 + x2) * .5;
				mx2 = (x2 + x3) * .5;
				my1 = (y1 + y2) * .5;
				my2 = (y2 + y3) * .5;
				xc  = (m1 * mx1 - m2 * mx2 + my2 - my1) / (m1 - m2);
				yc  = m1 * (xc - mx1) + my1;
			}
			
			var dx = x2 - xc;
			var dy = y2 - yc;
			var rsqr = dx * dx + dy * dy;
			var r = Math.sqrt(rsqr);
			
			dx = xp - xc;
			dy = yp - yc;
			var drsqr = dx * dx + dy * dy;
			
			s.c.x = xc;
			s.c.y = yc;
			s.r = r;
			
			return drsqr <= rsqr;
		}
	}
}
