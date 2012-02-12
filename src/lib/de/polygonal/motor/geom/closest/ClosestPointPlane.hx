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
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Plane2;
import de.polygonal.motor.geom.primitive.Segment2;

/**
 * Computes the point on a segment closest to a given point.
 */
class ClosestPointPlane
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on the plane <i>P</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find2(p:Vec2, P:Plane2, q:Vec2):Void
	{
		find3(p, P.n, P.d, q);
	}
	
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on the plane with normal <i>n</i> and distance from
	 * origin <i>d</i> closest to <i>q</i>.
	 * @param q Stores the result.
	 */
	inline public static function find3(p:Vec2, n:Vec2, d:Float, q:Vec2):Void
	{
		find6(p.x, p.y, n.x, n.y, d, q);
	}
	
	/**
	 * Given point (<i>x</i>,<i>y</i>), computes the point <i>q</i> on the plane with normal (<i>nx</i>,<i>ny</i>)
	 * and distance from origin <i>d</i> closest to <i>q</i>.
	 * to (<i>bx</i>,<i>by</i>) closest to (<i>px</i>,<i>py</i>).
	 * @param q Stores the result.
	 */
	inline public static function find6(x:Float, y:Float, nx:Float, ny:Float, d:Float, q:Vec2):Void
	{
		var t = (Vec2Util.dot4(nx, ny, x, y) - d) / Vec2Util.dot4(nx, ny, nx, ny);
		q.x = x - t * nx;
		q.y = y - t * ny;
	}
}