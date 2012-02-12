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
import de.polygonal.ds.ArrayUtil;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.OBB2;

/**
 * Computes a minimum area bounding rectangle using brute-force fitting.<br/>
 * See <a href="http://www.geometrictools.com/Documentation/MinimumAreaRectangle.pdf" target="_blank">http://www.geometrictools.com/Documentation/MinimumAreaRectangle.pdf</a>
 */
class MinimumAreaRectangle
{
	static var _tmp1:Array<Vec2>;
	static var _tmp2:Array<Vec2>;
	
	/**
	 * @param vertexList a set of input vertices.
	 * @param convex set to true if the polyline already forms a convex hull (faster).
	 * @param obb stores the result.
	 * @param k the number of input vertices.
	 * @throws de.polygonal.core.util.AssertionError <code>k</code> out of bound (debug only).
	 */
	public static function find(vertexList:Array<Vec2>, convex:Bool, obb:OBB2, k = 0):Void
	{
		if (k == 0) k = vertexList.length;
		
		D.assert(k >= 3, "insufficient input vertices");
		
		if (k > 3)
		{
			if (!convex)
			{
				if (_tmp1 == null)
				{
					_tmp1 = new Array();
					_tmp2 = new Array();
				}
				
				ArrayUtil.copy(vertexList, _tmp1, 0, k);
				k = ChainHull.find(_tmp1, _tmp2, k);
				vertexList = _tmp2;
			}
		}
		
		var minArea = Mathematics.POSITIVE_INFINITY;
		var m = Math;
		
		for (i in 0...k)
		{
			var t = vertexList[i];
			var rx = t.x;
			var ry = t.y;
			
			var t = vertexList[i + 1 == k ? 0 : i + 1];
			var ux_x = t.x - rx;
			var ux_y = t.y - ry;
			
			var length = m.sqrt(ux_x * ux_x + ux_y * ux_y);
			if (length < Mathematics.EPS) continue;
			
			ux_x /= length;
			ux_y /= length;
			
			var uy_x =-ux_y;
			var uy_y = ux_x;
			
			var min_x = Mathematics.POSITIVE_INFINITY;
			var min_y = Mathematics.POSITIVE_INFINITY;
			var max_x = Mathematics.NEGATIVE_INFINITY;
			var max_y = Mathematics.NEGATIVE_INFINITY;
			
			for (j in 0...k)
			{
				var t = vertexList[j];
				var dx = t.x - rx;
				var dy = t.y - ry;
				
				var rx = ux_x * dx + ux_y * dy;
				var ry = uy_x * dx + uy_y * dy;
				
				min_x = Mathematics.fmin(min_x, rx);
				min_y = Mathematics.fmin(min_y, ry);
				
				max_x = Mathematics.fmax(max_x, rx);
				max_y = Mathematics.fmax(max_y, ry);
			}
			
			var area = (max_x - min_x) * (max_y - min_y);
			if (area < minArea)
			{
				minArea = area;
				
				obb.R.m11 = ux_x;
				obb.R.m21 = ux_y;
				
				obb.R.m12 = uy_x;
				obb.R.m22 = uy_y;
				
				var cx = .5 * (min_x + max_x);
				var cy = .5 * (min_y + max_y);
				
				obb.c.x = rx + obb.R.mulx(cx, cy);
				obb.c.y = ry + obb.R.muly(cx, cy);
				
				obb.e.x = .5 * (max_x - min_x);
				obb.e.y = .5 * (max_y - min_y);
			}
		}
	}
}