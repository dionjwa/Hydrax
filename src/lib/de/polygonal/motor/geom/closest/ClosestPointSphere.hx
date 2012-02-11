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
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Computes the point on (or in) a two-dimensional sphere.
 */
class ClosestPointSphere
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on (or in) <i>S</i>, closest to <i>p</i>.
	 * @param q Returns the result.
	 */
	inline public static function find2(p:Vec2, S:Sphere2, q:Vec2):Void
	{
		find5(p.x, p.y, S.c.x, S.c.y, S.r, q);
	}
	
	/**
	 * Given point (<i>px</i>,<i>py</i>), computes the point <i>q</i> on (or in) <i>s</i>, closest to (<i>px</i>,<i>py</i>).
	 * @param q Returns the result.
	 */
	inline public static function find5(px:Float, py:Float, sx:Float, sy:Float, r:Float, q:Vec2):Void
	{
		var dx = px - sx;
		var dy = py - sy;
		
		var lengthSq = dx * dx + dy * dy;
		if (lengthSq < r * r)
		{
			q.x = px;
			q.y = py;
		}
		else
		{
			var length = Math.sqrt(lengthSq);
			q.x = sx + dx / length * r;
			q.y = sy + dy / length * r;
		}
	}
}