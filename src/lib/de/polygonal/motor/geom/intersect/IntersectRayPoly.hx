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
package de.polygonal.motor.geom.intersect;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.primitive.Poly2;
import de.polygonal.motor.geom.primitive.Ray2;

/**
 * Intersecting ray against poly.
 */
class IntersectRayPoly 
{
	/** Returns true if the ray <i>R</i> intersects the polygon <i>P</i>. */
	inline public static function test2(R:Ray2, P:Poly2, ?inflate = .0):Bool
	{
		return test3(R.p, R.d, P, inflate);
	}
	
	/** Returns true if the ray R(t) = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 intersects the poly <i>P</i>. */
	inline public static function test3(p:Vec2, d:Vec2, P:Poly2, ?inflate = .0):Bool
	{
		return test5(p.x, p.y, d.x, d.y, P, inflate);
	}
	
	/** Returns true if the ray R(t) = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |<i>d</i>| = 1 intersects the poly <i>P</i>. */
	inline public static function test5(px:Float, py:Float, dx:Float, dy:Float, P:Poly2, ?inflate = .0):Bool
	{
		var v0 = P.worldVertexChain;
		var n1 = P.worldNormalChain;
		var v1 = v0;
		
		var t0 = .0;
		var t1 = Mathematics.POSITIVE_INFINITY;
		
		var clip = true;
		
		do
		{
			var nx = n1.x;
			var ny = n1.y;
			
			var denom = Vec2Util.dot4(nx, ny, (v1.x + nx * inflate) - px, (v1.y + ny * inflate) - py);
			var numer = Vec2Util.dot4(nx, ny, dx, dy);
			
			if (Mathematics.fabs(numer) < Mathematics.EPS)
			{
				if (denom < .0)
				{
					clip = false;
					break;
				}
			}
			else
			{
				var tclip = denom / numer;
				
				if (numer < .0)
				{
					if (tclip > t1)
					{
						clip = false; 
						break;
					}
				}
				else
				{
					if (tclip < t0)
					{
						clip = false; 
						break;
					}
				}
			}
			
			v1 = v1.next;
			n1 = n1.next;
		}
		while (v1 != v0);
		
		return clip;
	}

	/**
	 * Returns true if a ray <i>R</i> intersects a poly <i>P</i>.
	 * Computes the t values of intersection (<i>t0, t1</i>) and the edges of intersection (<i>e0, e1</i>).
	 * @param out Stores clipping information.
	 */
	inline public static function find2(R:Ray2, P:Poly2, out:ClipInfo, ?inflate = .0):Bool
	{
		return find3(R.p, R.d, P, out, inflate);
	}
	
	/**
	 * Returns true if the ray R(t) = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 intersects the poly <i>P</i>.
	 * Computes the t values of intersection (<i>t0, t1</i>) and the edges of intersection (<i>e0, e1</i>).
	 * @param out Stores clipping information.
	 */
	inline public static function find3(p:Vec2, d:Vec2, P:Poly2, out:ClipInfo, ?inflate = .0):Bool
	{
		return find5(p.x, p.y, d.x, d.y, P, out, inflate);
	}
	
	/**
	 * Returns true if the ray R(t) = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |<i>d</i>| = 1 intersects the poly <i>P</i>.
	 * Computes the t values of intersection (<i>t0, t1</i>) and the edges of intersection (<i>e0, e1</i>).
	 * @param out Stores clipping information.
	 */
	inline public static function find5(px:Float, py:Float, dx:Float, dy:Float, P:Poly2, out:ClipInfo, ?inflate = .0):Bool
	{
		var v0 = P.worldVertexChain;
		var n1 = P.worldNormalChain;
		var v1 = v0;
		
		var t0 = .0;
		var t1 = Mathematics.POSITIVE_INFINITY;
		var e0 = null;
		var e1 = null;
		var q0, q1;
		
		var clip = true;
		
		do
		{
			var nx = n1.x;
			var ny = n1.y;
			
			var denom = Vec2Util.dot4(nx, ny, (v1.x + nx * inflate) - px, (v1.y + ny * inflate) - py);
			var numer = Vec2Util.dot4(nx, ny, dx, dy);
			
			//ray parallel to plane
			if (Mathematics.fabs(numer) < Mathematics.EPS)
			{
				//origin outside plane, no intersection
				if (denom < .0)
				{
					clip = false;
					break;
				}
			}
			else
			{
				var tclip = denom / numer;
				
				//near intersection
				if (numer < .0)
				{
					if (tclip > t1)
					{
						clip = false;
						break;
					}
					if (tclip > t0)
					{
						t0 = tclip;
						q0 = v1;
						e0 = v1;
						
						out.edge0 = v1.edge;
					}
				}
				//far intersection
				else
				{
					if (tclip < t0)
					{
						clip = false;
						break;
					}
					if (tclip < t1)
					{
						t1 = tclip;
						q1 = v1;
						e1 = v1;
						
						out.edge1 = v1.edge;
					}
				}
			}
			
			v1 = v1.next;
			n1 = n1.next;
		}
		while (v1 != v0);
		
		if (clip)
		{
			out.t0 = t0;
			out.t1 = t1;
			out.e0 = e0 != null ? e0.i : -1;
			out.e1 = e1 != null ? e1.i : -1;
		}
		
		return clip;
	}
}