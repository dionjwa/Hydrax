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

/**
 * <p>Checks if a point is inside a triangle.</p>
 * <p>The winding (CW or CCW) has no effect on the result.</p>
 */
class PointInsideTriangle 
{
	/**
	 * Returns true if the point <code>p</code> is inside the triangle defined by the points {<code>a</code>, <code>b</code>, <code>c</code>}.<br/>
	 * A point touching the triangle is inside the triangle.
	 */
	inline public static function testTouching4(p:Vec2, a:Vec2, b:Vec2, c:Vec2):Bool
	{
		return test8(p.x, p.y, a.x, a.y, b.x, b.y, c.x, c.y);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the triangle defined by the points {(<code>ax</code>, <code>ay</code>), (<code>bx</code>, <code>by</code>), (<code>cx</code>, <code>cy</code>)}.<br/>
	 * A point touching the triangle is inside the triangle.
	 */
	inline public static function testTouching8(px:Float, py:Float, ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float):Bool
	{
		var v0x = cx - ax;
		var v0y = cy - ay;
		var v1x = bx - ax;
		var v1y = by - ay;
		var v2x = px - ax;
		var v2y = py - ay;
		
		var dot00 = v0x * v0x + v0y * v0y;
		var dot01 = v0x * v1x + v0y * v1y;
		var dot02 = v0x * v2x + v0y * v2y;
		var dot11 = v1x * v1x + v1y * v1y;
		var dot12 = v1x * v2x + v1y * v2y;
		
		var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
		var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
		var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
		return (u >= 0) && (v >= 0) && (u + v <= 1);
	}
	
	/**
	 * Returns true if the point <code>p</code> is inside the triangle defined by the points {<code>a</code>, <code>b</code>, <code>c</code>}.<br/>
	 * A point touching the triangle is outside the triangle.
	 */
	inline public static function test4(p:Vec2, a:Vec2, b:Vec2, c:Vec2):Bool
	{
		return test8(p.x, p.y, a.x, a.y, b.x, b.y, c.x, c.y);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the triangle defined by the points {(<code>ax</code>, <code>ay</code>), (<code>bx</code>, <code>by</code>), (<code>cx</code>, <code>cy</code>)}.<br/>
	 * A point touching the triangle is outside the triangle.
	 */
	inline public static function test8(px:Float, py:Float, ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float):Bool
	{
		var v0x = cx - ax;
		var v0y = cy - ay;
		var v1x = bx - ax;
		var v1y = by - ay;
		var v2x = px - ax;
		var v2y = py - ay;
		
		var dot00 = v0x * v0x + v0y * v0y;
		var dot01 = v0x * v1x + v0y * v1y;
		var dot02 = v0x * v2x + v0y * v2y;
		var dot11 = v1x * v1x + v1y * v1y;
		var dot12 = v1x * v2x + v1y * v2y;
		
		var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
		var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
		var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
		return (u > 0) && (v > 0) && (u + v < 1);
	}
	
}