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

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.geom.primitive.Sphere2;

/**
 * Intersecting two-dimensional sphere against axis-aligned bounding box.
 */
class IntersectSphereAABB
{
	/** Returns true if the sphere <i>S</i> intersects the AABB <i>A</i> */
	inline public static function test2(S:Sphere2, A:AABB2):Bool
	{
		return test7(S.c.x, S.c.y, S.r, A.minX, A.minY, A.maxX, A.maxY);
	}
	
	/**
	 * Returns true if the sphere with center (<i>cx</i>,<i>cy</i>) intersects
	 * the AABB defined by a min-max representation with min=(<i>minX</i>,<i>minY</i>) and max=(<i>maxX</i>,<i>maxY</i>).
	 */
	inline public static function test7(cx:Float, cy:Float, r:Float, minX:Float, minY:Float, maxX:Float, maxY:Float):Bool
	{
		var d = .0;
		
		if (cx < minX)
		{
			d += (minX - cx) * (minX - cx);
			if (cy < minY)
				return d + (minY - cy) * (minY - cy) <= r * r;
			else
			if (cy > maxY)
				return d + (cy - maxY) * (cy - maxY) <= r * r;
			else
				return d <= r * r;
		}
		else
		if (cx > maxX)
		{
			if (cy < minY)
				return d + (cx - maxX) * (cx - maxX) <= r * r;
			else
			if (cy > maxY)
				return d + (cy - maxY) * (cy - maxY) <= r * r;
			else
				return d <= r * r;
		}
		else
		{
			if (cy < minY)
				return d + (minY - cy) * (minY - cy) <= r * r;
			else
			if (cy > maxY)
				return d + (maxY - cy) * (maxY - cy) <= r * r;
			else
				return true;
		}
	}
	
	/**
	 * Computes the minimum separation distance between the sphere <i>S</i> and the AABB <i>A</i>.
	 * If intersecting, the distance is less than zero, otherwise greater than or equal to zero (touching).
	 * @param q Stores the contact point.
	 * @param n Stores the contact normal.
	 * @return The minimum separation distance.
	 */
	inline public static function find2(S:Sphere2, A:AABB2, q:Vec2, n:Vec2):Float
	{
		return find7(S.c.x, S.c.y, S.r, A.minX, A.minY, A.maxX, A.maxY, q, n);
	}
	
	/**
	 * Computes the minimum separation distance between the sphere with center (<i>cx</i>,<i>cy</i>) and radius
	 * <i>r</i> and the AABB defined by a min-max representation with min=(<i>minX</i>,<i>minY</i>) and max=(<i>maxX</i>,<i>maxY</i>).
	 * If intersecting, the distance is less than zero, otherwise greater than or equal to zero (touching).
	 * @param q Stores the contact point.
	 * @param n Stores the contact normal.
	 * @return The minimum separation distance.
	 */
	inline public static function find7(cx:Float, cy:Float, r:Float, minX:Float, minY:Float, maxX:Float, maxY:Float, q:Vec2, n:Vec2):Float
	{
		var d = .0;
		
		if (cx < minX)
		{
			d += (minX - cx) * (minX - cx);
			if (cy < minY)
			{
				//NW
				d += (minY - cy) * (minY - cy);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					q.x = minX;
					q.y = minY;
					n.x = (cx - minX) / l;
					n.y = (cy - minY) / l;
					return l - r;
				}
				else
					return 1.;
			}
			else
			if (cy > maxY)
			{
				//SW
				d += (cy - maxY) * (cy - maxY);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					n.x = (cx - minX) / l;
					n.y = (cy - maxY) / l;
					q.x = minX;
					q.y = maxY;
					return l - r;
				}
				else
					return 1.;
			}
			else
			{
				//W
				if (d <= r * r)
				{
					n.x =-1;
					n.y = 0;
					var l = minX - cx;
					q.x = minX;
					q.y = cy;
					return l - r;
				}
				else
					return 1.;
			}
		}
		else
		if (cx > maxX)
		{
			d += (cx - maxX) * (cx - maxX);
			if (cy < minY)
			{
				//NE
				d += (minY - cy) * (minY - cy);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					n.x = (cx - maxX) / l;
					n.y = (cy - minY) / l;
					q.x = maxX;
					q.y = minY;
					return l - r;
				}
				else
					return 1.;
			}
			else
			if (cy > maxY)
			{
				//SE
				d += (cy - maxY) * (cy - maxY);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					n.x = (cx - maxX) / l;
					n.y = (cy - maxY) / l;
					q.x = maxX;
					q.y = maxY;
					return l - r;
				}
				else
					return 1.;
			}
			else
			{
				//E
				if (d <= r * r)
				{
					n.x = 1;
					n.y = 0;
					var l = cx - maxX;
					q.x = maxX;
					q.y = cy;
					return l - r;
				}
				else
					return 1.;
			}
		}
		else
		{
			if (cy < minY)
			{
				//N
				d += (minY - cy) * (minY - cy);
				if (d <= r * r)
				{
					n.x = 0;
					n.y =-1;
					var l = minY - cy;
					q.x = cx;
					q.y = minY;
					return l - r;
				}
				else
					return 1.;
			}
			else
			if (cy > maxY)
			{
				//S
				d += (maxY - cy) * (maxY - cy);
				if (d <= r * r)
				{
					n.x = 0;
					n.y = 1;
					var l = cy - maxY;
					q.x = cx;
					q.y = maxY;
					return l - r;
				}
				else
					return 1.;
			}
			else
			{
				//DEEP
				q.x = cx;
				q.y = cy;
				
				var dx, dy;
				
				if (cx - minX < maxX - cx)
				{
					dx = cx - minX;
					if (cy - minY < maxY - cy)
					{
						dy = cy - minY;
						
						if (dx < dy)
						{
							n.x =-1;
							n.y = 0;
							return -dx - r;
						}
						else
						{
							n.x = 0;
							n.y =-1;
							return -dy - r;
						}
					}
					else
					{
						dy = maxY - cy;
						if (dx < dy)
						{
							n.x =-1;
							n.y = 0;
							return -dx - r;
						}
						else
						{
							n.x = 0;
							n.y = 1;
							return -dy - r;
						}
					}
				}
				else
				{
					dx = maxX - cx;
					if (cy - minY < maxY - cy)
					{
						dy = cy - minY;
						
						if (dx < dy)
						{
							n.x = 1;
							n.y = 0;
							return -dx - r;
						}
						else
						{
							n.x = 0;
							n.y =-1;
							return -dy - r;
						}
					}
					else
					{
						dy = maxY - cy;
						if (dx < dy)
						{
							n.x = 1;
							n.y = 0;
							return -dx - r;
						}
						else
						{
							n.x = 0;
							n.y = 1;
							return -dy - r;
						}
					}
				}
			}
		}
	}
}