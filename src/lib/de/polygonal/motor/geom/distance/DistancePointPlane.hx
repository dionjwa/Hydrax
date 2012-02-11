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
package de.polygonal.motor.geom.distance;

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Plane2;

/**
 * Computes the euclidean distance from a point to a plane.
 */
class DistancePointPlane
{
	/** Computes the euclidean distance between the point <i>p</i> and the segment <i>S</i>. */
	inline public static function find2(p:Vec2, P:Plane2):Float
	{
		return find3(p, P.n, P.d);
	}
	
	/**
	 * Computes the euclidean distance between the point <i>p</i> and the plane
	 * with normal <i>n</i> and distance from origin <i>d</i>.
	 */
	inline public static function find3(p:Vec2, n:Vec2, d:Float):Float
	{
		return find5(p.x, p.y, n.x, n.y, d);
	}
	
	/**
	 * Computes the euclidean distance between the point (<i>px</i>,<i>py</i>) and the plane with
	 * normal (<i>nx</i>,<i>ny</i>) and distance from origin <i>d</i>.
	 */
	inline public static function find5(px:Float, py:Float, nx:Float, ny:Float, d:Float):Float
	{
		return Vec2Util.dot4(px, py, nx, ny) - d;
	}
}