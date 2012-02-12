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
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * Intersecting axis-aligned bounding box against axis-aligned bounding box.
 */
class IntersectAABB
{
	/** Returns true if the AABB <i>A</i> intersects the AABB <i>B</i>. */
	inline public static function test2(A:AABB2, B:AABB2):Bool
	{
		if (A.minX >= B.maxX) return false;
		else
		if (A.maxX <= B.minX) return false;
		else
		if (A.minY >= B.maxY) return false;
		else
		if (A.maxY <= B.minY) return false;
		else
			return true;
	}
	
	/**
	 * Returns true if the AABB defined by the minimum and maximum coordinate values
	 * <i>min0</i>, <i>max0</i> intersects another AABB with the minimum and maximum
	 * coordinate values <i>min1</i>, <i>max1</i>.
	 */
	inline public static function test4(min0:Vec2, max0:Vec2, min1:Vec2, max1:Vec2):Bool
	{
		if (min0.x >= max1.x) return false;
		else
		if (max0.x <= min1.x) return false;
		else
		if (min0.y >= max1.y) return false;
		else
		if (max0.y <= min1.y) return false;
		else
			return true;
	}
	
	/**
	 * Returns true if the AABB defined by the minimum and maximum coordinate values
	 * (<i>minX0</i>,<i>minY0</i>), (<i>maxX0</i>,<i>maxY0</i>) intersects another AABB with the minimum and maximum
	 * coordinate values (<i>minX1</i>,<i>minY1</i>), (<i>maxX1</i>,<i>maxY1</i>).
	 */
	inline public static function test8
	(
		minX0:Float, minY0:Float, maxX0:Float, maxY0:Float,
		minX1:Float, minY1:Float, maxX1:Float, maxY1:Float):Bool
	{
		if (minX0 >= maxX1) return false;
		else
		if (maxX0 <= minX1) return false;
		else
		if (minY0 >= maxY1) return false;
		else
		if (maxY0 <= minY1) return false;
		else
			return true;
	}
	
	inline public static function find3(A:AABB2, B:AABB2, collideInfo:CollideInfo):Bool
	{
		return find10(A.minX, A.minY, A.maxX, A.maxY, B.minX, B.minY, B.maxX, B.maxY, collideInfo);
	}
	
	inline public static function find10
	(
		minX0:Float, minY0:Float, maxX0:Float, maxY0:Float,
		minX1:Float, minY1:Float, maxX1:Float, maxY1:Float,
		collideInfo:CollideInfo):Bool
	{
		if (minX0 > maxX1) return false;
		else
		if (maxX0 < minX1) return false;
		else
		if (minY0 > maxY1) return false;
		else
		if (maxY0 < minY1) return false;
		else
		{
			var d0 = maxX0 - minX1;
			var d1 = minX0 - maxX1;
			var mtdx = (d0 < 0 ? -d0 : d0) < (d1 < 0 ? -d1 : d1) ? d0 : d1;
			
			d0 = maxY0 - minY1;
			d1 = minY0 - maxY1;
			var mtdy = (d0 < 0 ? -d0 : d0) < (d1 < 0 ? -d1 : d1) ? d0 : d1;
			
			if ((mtdx < 0 ? -mtdx : mtdx) < (mtdy < 0 ? -mtdy : mtdy))
			{
				collideInfo.normal.x = mtdx < 0 ? -1 : 1;
				collideInfo.normal.y = 0;
				collideInfo.MTD.x = mtdx;
				collideInfo.MTD.y = 0;
			}
			else
			{
				collideInfo.normal.x = 0;
				collideInfo.normal.y = mtdy < 0 ? -1 : 1;
				collideInfo.MTD.x = 0;
				collideInfo.MTD.y = mtdy;
			}
			return true;
		}
	}
}