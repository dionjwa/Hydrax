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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Segment2;

class DistanceSegmentSegment
{
	/** Computes the minimum squared distance between the segment <i>A</i> and the segment <i>B</i>. */
	inline public static function find2(A:Segment2, B:Segment2):Float
	{
		return find4(A.a, A.b, B.a, B.b);
	}
	
	/**
	 * Computes the minimum squared distance between the segment from <i>a1</i> to <i>a2</i>
	 * and the segment from <i>b1</i> to <i>b2</i>.
	 */
	inline public static function find4(a1:Vec2, a2:Vec2, b1:Vec2, b2:Vec2):Float
	{
		return find8(a1.x, a1.y, a2.x, a2.y, b1.x, b1.y, b2.x, b2.y);
	}
	
	/**
	 * Computes the minimum squared distance between the segment from (<i>ax1</i>,<i>ay1</i>) to (<i>ax2</i>,<i>ay2</i>)
	 * and the segment from (<i>bx1</i>,<i>by1</i>) to (<i>bx2</i>,<i>by2</i>).
	 */
	inline public static function find8(
		a1x:Float, a1y:Float, a2x:Float, a2y:Float,
		b1x:Float, b1y:Float, b2x:Float, b2y:Float):Float
	{
		var d1x = a2x - a1x;
		var d1y = a2y - a1y;
		
		var d2x = b2x - b1x;
		var d2y = b2y - b1y;
		
		var rx = a1x - b1x;
		var ry = a1y - b1y;
		
		var a = Vec2Util.dot4(d1x, d1y, d1x, d1y);
		var e = Vec2Util.dot4(d2x, d2y, d2x, d2y);
		var f = Vec2Util.dot4(d2x, d2y, rx, ry);
		
		var s, t, dx, dy;
		
		if (a <= Mathematics.EPS && e <= Mathematics.EPS)
		{
			s = t = .0;
			
			dx = a1x - b1x;
			dy = a1y - b1y;
			return Vec2Util.dot4(dx, dy, dx, dy);
		}
		else
		{
			if (a <= Mathematics.EPS)
			{
				s = .0;
				t = f / e;
				t = Mathematics.fclamp(t, 0, 1);
			}
			else
			{
				var c = Vec2Util.dot4(d1x, d1y, rx, ry);
				if (e <= Mathematics.EPS)
				{
					t = .0;
					s = Mathematics.fclamp(-c / a, 0, 1);
				}
				else
				{
					var b = Vec2Util.dot4(d1x, d1y, d2x, d2y);
					var denom = a * e - b * b;
					if (denom != .0)
						s = Mathematics.fclamp((b * f - c * e) / denom, 0, 1);
					else
						s = .0;
						
					t = (b * s + f) / e;
					if (t < .0)
					{
						t = .0;
						s = Mathematics.fclamp(-c / a, 0, 1);
					}
					else
					if (t > 1.)
					{
						t = 1.;
						s = Mathematics.fclamp((b - c) / a, 0, 1);
					}
				}
			}
			
			dx = (a1x + d1x * s) - (b1x + d2x * t);
			dy = (a1y + d1y * s) - (b1y + d2y * t);
			return Vec2Util.dot4(dx, dy, dx, dy);
		}
	}
}