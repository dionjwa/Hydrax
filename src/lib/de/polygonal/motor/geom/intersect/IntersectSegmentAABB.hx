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
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.geom.primitive.Segment2;

using de.polygonal.core.math.Mathematics;

/**
 * <p>Intersecting segment against axis-aligned bounding box.</p>
 */
class IntersectSegmentAABB
{
	/**
	 * Returns true if the segment <code>S</code> intersects the AABB <code>A</code>.<br/>
	 * This includes a touching contact.
	 */
	inline public static function test2(S:Segment2, A:AABB2):Bool
	{
		return test5(S.a.x, S.a.y, S.b.x, S.b.y, A);
	}
	
	/**
	 * Returns true if the segment from (<code>ax</code>, <code>ay</code>) to (<code>bx</code>, <code>by</code>) intersects the AABB <code>A</code>.<br/>
	 * This includes a touching contact.
	 */
	inline public static function test5(ax:Float, ay:Float, bx:Float, by:Float, A:AABB2):Bool
	{
		return test8(ax, ay, bx, by, A.minX, A.minY, A.maxX, A.maxY);
	}
	
	/**
	 * Returns true if the segment from (<code>ax</code>, <code>ay</code>) to (<code>bx</code>, <code>by</code>) intersects the AABB defined by the minimum and maximum coordinate values (<code>minX</code>, <code>minY</code>), (<code>maxX</code>, <code>maxY</code>).<br/>
	 * This includes a touching contact.
	 */
	inline public static function test8(ax:Float, ay:Float, bx:Float, by:Float, minX:Float, minY:Float, maxX:Float, maxY:Float):Bool
	{
		var ex = maxX - minX;
		var ey = maxY - minY;
		var dx = bx - ax;
		var dy = by - ay;
		var mx = ax + bx - minX - maxX;
		var my = ay + by - minY - maxY;
		
		var adx = dx.fabs();
		if (mx.fabs() > ex + adx)
			return false;
		else
		{
			var ady = dy.fabs();
			if (my.fabs() > ey + ady)
				return false;
			else
				return (mx * dy - my * dx).fabs() <= ex * (ady + Mathematics.EPS) + ey * (adx + Mathematics.EPS);
		}
	}
	
	
	
	
	
	/**
	 * Returns true if the segment <code>S</code> intersects the AABB <code>A</code>.<br/>
	 * This excludes a touching contact.
	 */
	public static function testDisjointContact2(S:Segment2, A:AABB2):Bool
	{
		return testDisjointContact5(S.a.x, S.a.y, S.b.x, S.b.y, A);
	}
	
	/**
	 * Returns true if the segment from (<code>ax</code>, <code>ay</code>) to (<code>bx</code>, <code>by</code>) intersects the AABB <code>A</code>.<br/>
	 * This excludes a touching contact.
	 */
	public static function testDisjointContact5(ax:Float, ay:Float, bx:Float, by:Float, A:AABB2):Bool
	{
		return testDisjointContact8(ax, ay, bx, by, A.minX, A.minY, A.maxX, A.maxY);
	}
	
	/**
	 * Returns true if the segment from (<code>ax</code>, <code>ay</code>) to (<code>bx</code>, <code>by</code>) intersects the AABB defined by the minimum and maximum coordinate values (<code>minX</code>, <code>minY</code>), (<code>maxX</code>, <code>maxY</code>).<br/>
	 * This excludes a touching contact.
	 */
	public static function testDisjointContact8(ax:Float, ay:Float, bx:Float, by:Float, minX:Float, minY:Float, maxX:Float, maxY:Float):Bool
	{
		var tmin = .0;
		var tmax = 1.;
		
		var dx = bx - ax;
		var dy = by - ay;
		
		if (Mathematics.fabs(dx) < Mathematics.EPS)
		{
			if (ax <= minX || ax >= maxX) return false;
		}
		else
		{
			var t1 = (minX - ax) / dx;
			var t2 = (maxX - ax) / dx;
			if (t1 > t2)
			{
				var tmp = t1; t1 = t2; t2 = tmp;
			}
			tmin = Mathematics.fmax(tmin, t1);
			tmax = Mathematics.fmin(tmax, t2);
			
			if (tmin >= tmax) return false;
		}
		
		if (Mathematics.fabs(dy) < Mathematics.EPS)
		{
			if (ay <= minY || ay >= maxY) return false;
		}
		else
		{
			var t1 = (minY - ay) / dy;
			var t2 = (maxY - ay) / dy;
			if (t1 > t2)
			{
				var tmp = t1; t1 = t2; t2 = tmp;
			}
			tmin = Mathematics.fmax(tmin, t1);
			tmax = Mathematics.fmin(tmax, t2);
			
			if (tmin >= tmax) return false;
		}
		return true;
	}
	
	
	/**
	 * Returns true if the segment <code>S</code> intersects the AABB <code>A</code>.
	 * Computes the t values of intersection (t0, t1) and the edges of intersection (e0, e1).
	 * @param out Stores clipping information.
	 */
	inline public static function find2(S:Segment2, A:AABB2, out:ClipInfo, ?inflate = .0):Bool
	{
		return find5(S.a.x, S.a.y, S.b.x, S.b.y, A, out, inflate);
	}
	
	/**
	 * Returns true if the segment from (<code>ax</code>,<code>ay</code>) to (<code>bx</code>,<code>by</code>) intersects the AABB <code>A</code>.
	 * Computes the t values of intersection (t0, t1) and the edges of intersection (e0, e1).
	 * @param out Stores clipping information.
	 */
	inline public static function find5(ax:Float, ay:Float, bx:Float, by:Float, a:AABB2, out:ClipInfo, ?inflate = .0):Bool
	{
		return find8(ax, ay, bx, by, a.minX, a.minY, a.maxX, a.maxY, out, inflate);
	}
	
	/**
	 * Returns true if the segment from (<code>ax</code>,<code>ay</code>) to (<code>bx</code>,<code>by</code>) intersects
	 * the AABB defined by the minimum and maximum coordinate values
	 * (<code>minX</code>,<code>minY</code>), (<code>maxX</code>,<code>maxY</code>).
	 * Computes the t values of intersection (t0, t1) and the edges of intersection (e0, e1).
	 * @param out Stores the clipping information.
	 */
	inline public static function find8(ax:Float, ay:Float, bx:Float, by:Float,
		minX:Float, minY:Float, maxX:Float, maxY:Float,
		out:ClipInfo, ?inflate = .0):Bool
	{
		var dx = bx - ax;
		var dy = by - ay;
		
		var tmin = .0;
		var tmax = 1.;
		
		//start with x-slab
		if (dx.fabs() < Mathematics.EPS)
		{
			//ray parallel to slab;
			//no hit possible if origin outside slab
			if (ax < minX - inflate)
				return false;
			else
			if (ax > maxX + inflate)
				return false;
			else
			{
				//repeat with y-slab
				if (dy.fabs() < Mathematics.EPS)
				{
					if (ay < minY - inflate)
						return false;
					else
					if (ay > maxY + inflate)
						return false;
					else
					{
						out.t0 = tmin;
						out.t1 = tmax;
						return true;
					}
				}
				else
				{
					var t1 = (minY - inflate - ay) / dy;
					var t2 = (maxY + inflate - ay) / dy;
					
					if (t1 > t2)
					{
						if (t2 > tmin)
						{
							tmin = t2;
							out.e0 = 0;
						}
						if (t1 < tmax)
						{
							tmax = t1;
							out.e1 = 2;
						}
						if (tmin > tmax)
							return false;
						else
						{
							out.t0 = tmin;
							out.t1 = tmax;
							return true;
						}
					}
					else
					{
						if (t1 > tmin)
						{
							tmin = t1;
							out.e0 = 2;
						}
						if (t2 < tmax)
						{
							tmax = t2;
							out.e1 = 0;
						}
						if (tmin > tmax)
							return false;
						else
						{
							out.t0 = tmin;
							out.t1 = tmax;
							return true;
						}
					}
				}
			}
		}
		else
		{
			//slab intersection with near and far slab plane
			var t1 = (minX - inflate - ax) / dx;
			var t2 = (maxX + inflate - ax) / dx;
			
			//sort intersection
			if (t1 > t2)
			{
				//compute slab intersection intervals
				if (t2 > tmin) tmin = t2;
				if (t1 < tmax) tmax = t1;
				if (tmin > tmax)
					return false;
				else
				{
					out.e0 = t2 > .0 ? 3 : -1;
					out.e1 = t1 < 1. ? 1 : -1;
					
					//repeat with y-slab
					if (dy.fabs() < Mathematics.EPS)
					{
						if (ay < minY - inflate)
							return false;
						else
						if (ay > maxY + inflate)
							return false;
						else
						{
							out.t0 = tmin;
							out.t1 = tmax;
							return true;
						}
					}
					else
					{
						var t1 = (minY - inflate - ay) / dy;
						var t2 = (maxY + inflate - ay) / dy;
						
						if (t1 > t2)
						{
							if (t2 > tmin)
							{
								tmin = t2;
								out.e0 = 0;
							}
							if (t1 < tmax)
							{
								tmax = t1;
								out.e1 = 2;
							}
							if (tmin > tmax)
								return false;
							else
							{
								out.t0 = tmin;
								out.t1 = tmax;
								return true;
							}
						}
						else
						{
							if (t1 > tmin)
							{
								tmin = t1;
								out.e0 = 2;
							}
							if (t2 < tmax)
							{
								tmax = t2;
								out.e1 = 0;
							}
							if (tmin > tmax)
								return false;
							else
							{
								out.t0 = tmin;
								out.t1 = tmax;
								return true;
							}
						}
					}
				}
			}
			else
			{
				//compute slab intersection intervals
				if (t1 > tmin) tmin = t1;
				if (t2 < tmax) tmax = t2;
				if (tmin > tmax)
					return false;
				else
				{
					out.e1 = t2 < 1. ? 3 : -1;
					out.e0 = t1 > .0 ? 1 : -1;
					
					//repeat with y-slab
					if (dy.fabs() < Mathematics.EPS)
					{
						if (ay < minY - inflate)
							return false;
						else
						if (ay > maxY + inflate)
							return false;
						else
						{
							out.t0 = tmin;
							out.t1 = tmax;
							return true;
						}
					}
					else
					{
						var t1 = (minY - inflate - ay) / dy;
						var t2 = (maxY + inflate - ay) / dy;
						
						if (t1 > t2)
						{
							if (t2 > tmin)
							{
								tmin = t2;
								out.e0 = 0;
							}
							if (t1 < tmax)
							{
								tmax = t1;
								out.e1 = 2;
							}
							if (tmin > tmax)
								return false;
							else
							{
								out.t0 = tmin;
								out.t1 = tmax;
								return true;
							}
						}
						else
						{
							if (t1 > tmin)
							{
								tmin = t1;
								out.e0 = 2;
							}
							if (t2 < tmax)
							{
								tmax = t2;
								out.e1 = 0;
							}
							if (tmin > tmax)
								return false;
							else
							{
								out.t0 = tmin;
								out.t1 = tmax;
								return true;
							}
						}
					}
				}
			}
		}
	}
}
