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
package de.polygonal.motor.geom.closest;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;

/**
 * Computes the point on (or in) a convex polygon closest to a given point.
 */
class ClosestPointPoly
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on (or in) the polygon defined
	 * by vertices in <i>vertexList</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find2(p:Vec2, vertexList:Array<Vec2>, q:Vec2):Void
	{
		find3(p.x, p.y, vertexList, q);
	}
	
	/**
	 * Given point (<i>px</i>,<i>py</i>), computes the point <i>q</i> on (or in) the polygon defined
	 * by the vertices <i>vertexList</i> closest to (<i>px</i>,<i>py</i>).
	 * @param q Stores the result.
	 */
	inline public static function find3(px:Float, py:Float, vertexList:Array<Vec2>, q:Vec2):Void
	{
		var v0, v1, ex, ey, tx, ty, d, t, dSq;
		var v0x, v0y, v1x, v1y;
		var minSq = -1.;
		var k = vertexList.length;
		var j = k - 1;
		
		var inside = true;
		
		for (i in 0...k)
		{
			v0 = vertexList[i];
			v1 = vertexList[i == j ? 0 : i + 1];
			v0x = v0.x;
			v0y = v0.y;
			v1x = v1.x;
			v1y = v1.y;
			ex = v0x - v1x;
			ey = v0y - v1y;
			d = (px - v1x) * ex + (py - v1y) * ey;
			if (d < .0) continue;
			
			if (inside)
			{
				if ((px - v0x) * (v1y - v0y) + (py - v0y) * (-v1x + v0x) > 0)
					inside = false;
			}
			
			t = Mathematics.fclamp(d / (ex * ex + ey * ey), .0, 1.);
			tx = v1x + ex * t;
			ty = v1y + ey * t;
			dSq = (px - tx) * (px - tx) + (py - ty) * (py - ty);
			if (dSq < minSq || minSq < .0)
			{
				minSq = dSq;
				q.x = tx;
				q.y = ty;
			}
		}
		
		if (inside)
		{
			q.x = px;
			q.y = py;
		}
	}
}