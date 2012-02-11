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
import de.polygonal.motor.geom.primitive.Poly2;

/**
 * Checks if a point is inside a convex, clockwise polygon.
 */
class PointInsidePoly 
{
	/** Returns true if <i>p</i> is inside <i>poly</i>. */
	inline public static function test(p:Vec2, poly:Poly2):Bool
	{
		var x = p.x;
		var y = p.y;
		var b = true;
		var v = poly.worldVertexChain, v0 = v;
		do
		{
			var w = v.next;
			if ((x - v.x) * (w.y - v.y) + (y - v.y) * (-w.x + v.x) > 0)
			{
				b = false;
				break;
			}
			v = w;
		}
		while (v != v0);
		return b;
	}
	
	/** Returns true if <i>p</i> is inside the polygon defined by the vertices stored in <i>vertexList</i>. */
	inline public static function testArray2(p:Vec2, vertexList:Array<Vec2>):Bool
	{
		return testArray3(p.x, p.y, vertexList);
	}
	
	/** Returns true if the point (<i>px</i>,<i>py</i>) is inside the polygon defined by the vertices in <i>vertexList</i>. */
	inline public static function testArray3(px:Float, py:Float, vertexList:Array<Vec2>):Bool
	{
		var b = true;
		var k = vertexList.length;
		var j = k - 1;
		
		var v0, v1, v0x, v0y;
		
		for (i in 0...k)
		{
			v0 = vertexList[i];
			v1 = vertexList[i == j ? 0 : i + 1];
			v0x = v0.x;
			v0y = v0.y;
			if ((px - v0x) * (v1.y - v0y) + (py - v0y) * (-v1.x + v0x) > 0)
			{
				b = false;
				break;
			}
		}
		
		return b;
	}
}