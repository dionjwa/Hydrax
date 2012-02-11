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

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * Computes the point on (or in) an axis aligned bounding box closest to a given point.
 */
class ClosestPointAABB
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on (or in) the AABB <i>A</i>, closest to <i>p</i>.
	 * @param q Returns the result.
	 */
	inline public static function find2(p:Vec2, A:AABB2, q:Vec2):Void
	{
		find6(p.x, p.y, A.minX, A.minY, A.maxX, A.maxY, q);
	}
	
	/**
	 * Given a point (<i>px</i>,<i>py</i>), computes the point <i>q</i> on (or in) the AABB defined
	 * by a min-max representation with minimum (<i>minX</i>,<i>minY</i>) and maximum (<i>maxX</i>,<i>maxY</i>).
	 * @param q Returns the result.
	 */
	inline public static function find6(px:Float, py:Float, minX:Float, minY:Float, maxX:Float, maxY:Float, q:Vec2):Void
	{
		if (px < minX) px = minX;
		if (px > maxX) px = maxX;
		if (py < minY) py = minY;
		if (py > maxY) py = maxY;
		q.x = px;
		q.y = py;
	}
}