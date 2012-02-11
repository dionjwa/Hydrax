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
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * <p>Checks if a point is inside an AABB (axis-aligned bounding box).</p>
 */
class PointInsideAABB 
{
	/**
	 * Returns true if the point <code>p</code> is inside the AABB <code>A</code>.<br/>
	 * This includes a touching contact.
	 */
	inline public static function test2(p:Vec2, A:AABB2):Bool
	{
		return test3(p.x, p.y, A);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the AABB <code>A</code>.<br/>
	 * This includes a touching contact.
	 */
	inline public static function test3(px:Float, py:Float, A:AABB2):Bool
	{
		return test6(px, py, A.minX, A.minY, A.maxX, A.maxY);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the AABB defined by a min-max representation with minimum (<code>minX</code>, <code>minY</code>) and maximum (<code>maxX</code>, <code>maxY</code>).<br/>
	 * This includes a touching contact.
	 */
	inline public static function test6(px:Float, py:Float, minX:Float, minY:Float, maxX:Float, maxY:Float):Bool
	{
		return (px >= minX) && (px <= maxX) && (py >= minY) && (py <= maxY);
	}
	
	/**
	 * Returns true if the point <code>p</code> is inside the AABB <code>A</code>.<br/>
	 * This excludes a touching contact.
	 */
	inline public static function testDisjoint2(p:Vec2, A:AABB2):Bool
	{
		return test3(p.x, p.y, A);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the AABB <code>A</code>.<br/>
	 * This excludes a touching contact.
	 */
	inline public static function testDisjoint3(px:Float, py:Float, A:AABB2):Bool
	{
		return test6(px, py, A.minX, A.minY, A.maxX, A.maxY);
	}
	
	/**
	 * Returns true if the point (<code>px</code>, <code>py</code>) is inside the AABB defined by a min-max representation with minimum (<code>minX</code>, <code>minY</code>) and maximum (<code>maxX</code>, <code>maxY</code>).<br/>
	 * This excludes a touching contact.
	 */
	inline public static function testDisjoint6(px:Float, py:Float, minX:Float, minY:Float, maxX:Float, maxY:Float):Bool
	{
		return (px > minX) && (px < maxX) && (py > minY) && (py < maxY);
	}
}