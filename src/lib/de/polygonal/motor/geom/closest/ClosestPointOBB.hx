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
import de.polygonal.core.math.Mat22;
import de.polygonal.motor.geom.primitive.OBB2;

/**
 * Computes the point on (or in) an oriented bounding box (OBB) closest to a given point.
 */
class ClosestPointOBB 
{
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on (or in) the OBB <i>O</i>, closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find2(p:Vec2, O:OBB2, q:Vec2):Void
	{
		find4(p, O.c, O.e, O.R, q);
	}
	
	/**
	 * Given point <i>p</i>, computes the point <i>q</i> on (or in) the OBB defined by the
	 * center <i>c</i>, half-width extent <i>e</i> and rotation matrix <i>R</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find4(p:Vec2, c:Vec2, e:Vec2, R:Mat22, q:Vec2):Void
	{
		find10(p.x, p.y, c.x, c.y, e.x, e.y, R.m11, R.m12, R.m21, R.m22, q);
	}
	
	/**
	 * Given point (<i>px</i>,<i>py</i>), computes the point <i>q</i> on (or in) the OBB defined by the
	 * center (<i>cx</i>,<i>cy</i>), half-width extent (<i>ex</i>,<i>ey</i>) and rotation matrix with
	 * elements <i>r11, r12, r21, r22</i> closest to <i>p</i>.
	 * @param q Stores the result.
	 */
	inline public static function find10
	(
		px:Float, py:Float, cx:Float, cy:Float, ex:Float, ey:Float,
		r11:Float, r12:Float, r21:Float, r22:Float,
		q:Vec2):Void
	{
		var dx = px - cx;
		var dy = py - cy;
		var d = Mathematics.fclamp(dx * r11 + dy * r21, -ex, ex);
		cx += r11 * d;
		cy += r21 * d;
		var d = Mathematics.fclamp(dx * r12 + dy * r22, -ey, ey);
		cx += r12 * d;
		cy += r22 * d;
		q.x = cx;
		q.y = cy;
	}
}