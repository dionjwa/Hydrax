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
package de.polygonal.motor.geom.inside;

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Mat22;
import de.polygonal.motor.geom.primitive.OBB2;

/**
 * <p>Checks if a point is inside an OBB (oriented bounding box).</p>
 */
class PointInsideOBB
{
	/**
	 * Returns true if the point <code>p</code> is inside the OBB <code>O</code>.<br/>
	 * This includes a touching contact.
	 */
	inline public static function test2(p:Vec2, O:OBB2):Bool
	{
		return test4(p, O.c, O.e, O.R);
	}
	
	/**
	 * Returns true if the point <code>p</code> is inside the OBB defined by the center <code>c</code>, half-width extents <code>e</code> and rotation matrix <code>R</code>.<br/>
	 * This includes a touching contact.
	 */
	inline public static function test4(p:Vec2, c:Vec2, e:Vec2, R:Mat22):Bool
	{
		return test10(p.x, p.y, c.x, c.y, e.x, e.y, R.m11, R.m12, R.m21, R.m22);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the OBB with center (<code>cx</code>, <code>cy</code>), half-width extents (<code>ex</code>, <code>ey</code>) and rotation matrix with elements <code>r11</code>, <code>r12</code>, <code>r21</code>, <code>r22</code>.
	 * This includes a touching contact.
	 */
	inline public static function test10(px:Float, py:Float,
		cx:Float, cy:Float, ex:Float, ey:Float,
		r11:Float, r12:Float,
		r21:Float, r22:Float):Bool
	{
		var dx = px - cx;
		var dy = py - cy;
		
		var d = dx * r11 + dy * r21;
		if (d > ex)
			return false;
		else
		if (d <-ex)
			return false;
		else
		{
			var d = dx * r12 + dy * r22;
			if (d > ey)
				return false;
			else
			if (d <-ey)
				return false;
			else
				return true;
		}
	}
}