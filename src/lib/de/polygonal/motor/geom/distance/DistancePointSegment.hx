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
import de.polygonal.motor.geom.primitive.Segment2;

/**
 * Computes the squared distance from a point to a segment.
 */
class DistancePointSegment
{
	/** Computes the squared distance between the point <i>p</i> and the segment <i>S</i>. */
	inline public static function find2(p:Vec2, S:Segment2):Float
	{
		return find3(p, S.a, S.b);
	}
	
	/** Computes the squared distance between the point <i>p</i> and the segment through <i>a</i> and <i>b</i>. */
	inline public static function find3(p:Vec2, a:Vec2, b:Vec2):Float
	{
		return find6(p.x, p.y, a.x, a.y, b.x, b.y);
	}
	
	/** Computes the squared distance between the point (<i>px</i>,<i>py</i>) and the segment through the points (<i>ax</i>,<i>ay</i>) and (<i>bx</i>,<i>by</i>).*/
	inline public static function find6(px:Float, py:Float, ax:Float, ay:Float, bx:Float, by:Float):Float
	{
		var bax = bx - ax;
		var bay = by - ay;
		var pax = px - ax;
		var pay = py - ay;
		
		var t = pax * bax + pay * bay;
		if (t < .0)
			return (pax * pax + pay * pay);
		else
		{
			var bpx = bx - px;
			var bpy = by - py;
			t = bpx * bax + bpy * bay;
			if (t < .0)
				return (bpx * bpx + bpy * bpy);
			else
			{
				t = pay * bax - pax * bay;
				return (t * t ) / (bax * bax + bay * bay);
			}
		}
	}
}