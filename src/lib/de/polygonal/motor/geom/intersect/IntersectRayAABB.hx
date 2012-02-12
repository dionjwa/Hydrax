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
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.geom.primitive.Ray2;

using de.polygonal.core.math.Mathematics;

//TODO touching contact?

/**
 * <p>Intersecting a ray R(t) = p + t * d, |d| = 1 against an axis-aligned bounding box (AABB) defined by a min-max representation.</p>
 * <p>Edge id's:</p>
 * <pre>
 *     |   e0   |
 * ----+--------+ ----
 *  e1 |  AABB  | e3
 * ----+--------+ ----
 *     |   e2   |
 * </pre>
 */
class IntersectRayAABB
{
	/** Returns true if the ray <code>R</code> intersects the AABB <code>A</code>. */
	inline public static function test2(R:Ray2, A:AABB2):Bool
	{
		return test3(R.p, R.d, A);
	}
	
	/** Returns true if the ray R(t) = <code>p</code> + t * <code>d</code>, |<code>d</code>| = 1 intersects the AABB <code>A</code>. */
	inline public static function test3(p:Vec2, d:Vec2, A:AABB2):Bool
	{
		return test5(p.x, p.y, d.x, d.y, A);
	}
	
	/** Returns true if the ray R(t) = (<code>px</code>,<code>py</code>) + t * (<code>dx</code>,<code>dy</code>), |<code>d</code>| = 1 intersects the AABB <code>A</code>. */
	inline public static function test5(px:Float, py:Float, dx:Float, dy:Float, A:AABB2):Bool
	{
		var tmin = .0;
		var tmax = Mathematics.POSITIVE_INFINITY;
		
		//start with x-slab
		if (dx.fabs() < Mathematics.EPS)
		{
			//ray parallel to slab;
			//no hit possible if origin outside slab
			if (px < A.minX)
				return false;
			else
			if (px > A.maxX)
				return false;
			else
			{
				//repeat with y-slab
				if (dy.fabs() < Mathematics.EPS)
				{
					if (py < A.minY)
						return false;
					else
					if (py > A.maxY)
						return false;
					else
						return true;
				}
				else
				{
					var t1 = (A.minY - py) / dy;
					var t2 = (A.maxY - py) / dy;
					
					if (t1 > t2)
					{
						if (t2 > tmin) tmin = t2;
						if (t1 < tmax) tmax = t1;
						if (tmin > tmax)
							return false;
						else
							return true;
					}
					else
					{
						if (t1 > tmin) tmin = t1;
						if (t2 < tmax) tmax = t2;
						if (tmin > tmax)
							return false;
						else
							return true;
					}
				}
			}
		}
		else
		{
			//slab intersection with near and far slab plane
			var t1 = (A.minX - px) / dx;
			var t2 = (A.maxX - px) / dx;
			
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
					//repeat with y-slab
					if (dy.fabs() < Mathematics.EPS)
					{
						if (py < A.minY)
							return false;
						else
						if (py > A.maxY)
							return false;
						else
							return true;
					}
					else
					{
						var t1 = (A.minY - py) / dy;
						var t2 = (A.maxY - py) / dy;
						
						if (t1 > t2)
						{
							if (t2 > tmin) tmin = t2;
							if (t1 < tmax) tmax = t1;
							if (tmin > tmax)
								return false;
							else
								return true;
						}
						else
						{
							if (t1 > tmin) tmin = t1;
							if (t2 < tmax) tmax = t2;
							if (tmin > tmax)
								return false;
							else
								return true;
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
					//repeat with y-slab
					if (dy.fabs() < Mathematics.EPS)
					{
						if (py < A.minY)
							return false;
						else
						if (py > A.maxY)
							return false;
						else
							return true;
					}
					else
					{
						var t1 = (A.minY - py) / dy;
						var t2 = (A.maxY - py) / dy;
						
						if (t1 > t2)
						{
							if (t2 > tmin) tmin = t2;
							if (t1 < tmax) tmax = t1;
							if (tmin > tmax)
								return false;
							else
								return true;
						}
						else
						{
							if (t1 > tmin) tmin = t1;
							if (t2 < tmax) tmax = t2;
							if (tmin > tmax)
								return false;
							else
								return true;
						}
					}
				}
			}
		}
	}
	
	/**
	 * Returns true if the ray <code>R</code> intersects the AABB <code>A</code>.<br/>
	 * Computes the t values of intersection (<em>t0, t1</em>) and the edge ids of intersection (<em>e0, e1</em>), which are stored in <code>out</code>.
	 * @param out stores clipping information.
	 */
	inline public static function find2(R:Ray2, A:AABB2, out:ClipInfo):Bool
	{
		return find3(R.p, R.d, A, out);
	}
	
	/**
	 * Returns true if the ray R(t) = <code>p</code> + t * <code>d</code>, |<code>d</code>| = 1 intersects the AABB <code>A</code>.<br/>
	 * Computes the t values of intersection (<em>t0, t1</em>) and the edge ids of intersection (<em>e0, e1</em>), which are stored in <code>out</code>.
	 * @param out stores clipping information.
	 */
	inline public static function find3(p:Vec2, d:Vec2, A:AABB2, out:ClipInfo, ?inflate = .0):Bool
	{
		return find5(p.x, p.y, d.x, d.y, A, out, inflate);
	}
	
	/**
	 * Returns true if the ray R(t) = (<code>px</code>,<code>py</code>) + t * (<code>dx</code>,<code>dy</code>), |<code>d</code>| = 1 intersects the AABB <code>A</code>.<br/>
	 * Computes the t values of intersection (<em>t0, t1</em>) and the edge ids of intersection (<em>e0, e1</em>), which are stored in <code>out</code>.
	 * @param out stores clipping information.
	 */
	inline public static function find5(px:Float, py:Float, dx:Float, dy:Float, A:AABB2, out:ClipInfo, ?inflate = .0):Bool
	{
		return find8(px, py, dx, dy, A.minX, A.minY, A.maxX, A.maxY, out, inflate);
	}
	
	/**
	 * Returns true if the ray R(t) = (<code>px</code>,<code>py</code>) + t * (<code>dx</code>,<code>dy</code>), |<code>d</code>| = 1 intersects the AABB
	 * defined by a min-max representation with min=(<code>minX</code>,<code>minY</code>) and max=(<code>maxX</code>,<code>maxY</code>).<br/>
	 * Computes the t values of intersection (<em>t0, t1</em>) and the edge ids of intersection (<em>e0, e1</em>), which are stored in <code>out</code>.
	 * @param out stores clipping information.
	 */
	inline public static function find8(px:Float, py:Float, dx:Float, dy:Float,
		minX:Float, minY:Float, maxX:Float, maxY:Float,
		out:ClipInfo, ?inflate = .0):Bool
	{
		var tmin = .0;
		var tmax = Mathematics.POSITIVE_INFINITY;
		
		//start with x-slab
		if (dx.fabs() < Mathematics.EPS)
		{
			//ray parallel to slab;
			//no hit possible if origin outside slab
			if (px < minX - inflate)
				return false;
			else
			if (px > maxX + inflate)
				return false;
			else
			{
				//repeat with y-slab
				if (dy.fabs() < Mathematics.EPS)
				{
					if (py < minY - inflate)
						return false;
					else
					if (py > maxY + inflate)
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
					var t1 = (minY - inflate - py) / dy;
					var t2 = (maxY + inflate - py) / dy;
					
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
			var t1 = (minX - inflate - px) / dx;
			var t2 = (maxX + inflate - px) / dx;
			
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
					out.e0 = 3;
					out.e1 = 1;
					
					//repeat with y-slab
					if (dy.fabs() < Mathematics.EPS)
					{
						if (py < minY - inflate)
							return false;
						else
						if (py > maxY + inflate)
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
						var t1 = (minY - inflate - py) / dy;
						var t2 = (maxY + inflate - py) / dy;
						
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
					out.e0 = 1;
					out.e1 = 3;
					
					//repeat with y-slab
					if (dy.fabs() < Mathematics.EPS)
					{
						if (py < minY - inflate)
							return false;
						else
						if (py > maxY + inflate)
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
						var t1 = (minY - inflate - py) / dy;
						var t2 = (maxY + inflate - py) / dy;
						
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
