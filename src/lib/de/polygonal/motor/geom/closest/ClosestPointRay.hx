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
import de.polygonal.motor.geom.primitive.Ray2;

/**
 * Computes the point on a ray closest to a given point.
 */
class ClosestPointRay
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on the ray <i>R</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find2(p:Vec2, R:Ray2, q:Vec2):Float
	{
		return find3(p, R.p, R.d, q);
	}
	
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on the ray with origin <i>o</i>
	 * and direction <i>d</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find3(p:Vec2, o:Vec2, d:Vec2, q:Vec2):Float
	{
		return find6(p.x, p.y, o.x, o.y, d.x, d.y, q);
	}
	
	/**
	 * Given point (<i>px</i>,<i>py</i>), computes the point <i>q</i> on the ray with origin (<i>ox</i>,<i>oy</i>) and direction
	 * (<i>dx</i>,<i>dy</i>) closest to (<i>px</i>,<i>py</i>).
	 * @param q Stores the result.
	 */
	inline public static function find6(px:Float, py:Float, ox:Float, oy:Float, dx:Float, dy:Float, q:Vec2):Float
	{
		var t = ((px - ox) * dx + (py - oy) * dy);
		if (t <= .0)
		{
			q.x = ox;
			q.y = oy;
			return .0;
		}
		else
		{
			t /= (dx * dx + dy * dy);
			q.x = ox + t * dx;
			q.y = oy + t * dy;
			return t;
		}
	}
}