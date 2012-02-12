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
package de.polygonal.motor.collision.pairwise;

import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.dynamics.contact.ManifoldPoint;

class CollideAABBCircle implements Collider
{
	public function new() {}

	public function init(shape1:AbstractShape, shape2:AbstractShape):Void {}
	
	public function free():Void {}
	
	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var d = .0, r = s2.radius;
		var bound = s1.aabb;
		var vx = s2.x, minX = bound.minX, maxX = bound.maxX;
		var vy = s2.y, minY = bound.minY, maxY = bound.maxY;
		
		if (vx < minX)
		{
			d += (minX - vx) * (minX - vx);
			if (vy < minY)
			{
				//#---+
				//|   |
				//+---+
				d += (minY - vy) * (minY - vy);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					var n = manifold.ncoll;
					n.x = (vx - minX) / l;
					n.y = (vy - minY) / l;
					var cp = manifold.mp1;
					cp.id = ContactID.setIncVert(ContactID.NULL_VALUE, 2);
					cp.sep = l - r;
					setupContactPoint(cp, minX, minY, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			else
			if (vy > maxY)
			{
				//+---+
				//|   |
				//#---+
				d += (vy - maxY) * (vy - maxY);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					var n = manifold.ncoll;
					n.x = (vx - minX) / l;
					n.y = (vy - maxY) / l;
					var cp = manifold.mp1;
					cp.id = ContactID.setIncVert(ContactID.NULL_VALUE, 1);
					cp.sep = l - r;
					setupContactPoint(cp, minX, maxY, s1, s2);
					s2.TBody.mulT(cp, cp.lp2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			else
			{
				//+---+
				//#   |
				//+---+
				if (d <= r * r)
				{
					var n = manifold.ncoll;
					n.x =-1;
					n.y = 0;
					var cp = manifold.mp1;
					cp.id = ContactID.setRefEdge(ContactID.NULL_VALUE, 1);
					var l = minX - vx;
					cp.sep = l - r;
					setupContactPoint(cp, minX, vy, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
		}
		else
		if (vx > maxX)
		{
			d += (vx - maxX) * (vx - maxX);
			if (vy < minY)
			{
				//+---+
				//|   |
				//#---+
				d += (minY - vy) * (minY - vy);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					var n = manifold.ncoll;
					n.x = (vx - maxX) / l;
					n.y = (vy - minY) / l;
					var cp = manifold.mp1;
					cp.id = ContactID.setIncVert(ContactID.NULL_VALUE, 3);
					cp.sep = l - r;
					setupContactPoint(cp, maxX, minY, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			else
			if (vy > maxY)
			{
				//#---+
				//|   |
				//+---+
				d += (vy - maxY) * (vy - maxY);
				if (d <= r * r)
				{
					var l = Math.sqrt(d);
					var n = manifold.ncoll;
					n.x = (vx - maxX) / l;
					n.y = (vy - maxY) / l;
					var cp = manifold.mp1;
					cp.id = ContactID.setIncVert(ContactID.NULL_VALUE, 0);
					cp.sep = l - r;
					setupContactPoint(cp, maxX, maxY, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			else
			{
				//+---+
				//#   |
				//+---+
				if (d <= r * r)
				{
					var n = manifold.ncoll;
					n.x = 1;
					n.y = 0;
					var cp = manifold.mp1;
					var l = vx - maxX;
					cp.id = ContactID.setRefEdge(ContactID.NULL_VALUE, 3);
					cp.sep = l - r;
					setupContactPoint(cp, maxX, vy, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
		}
		else
		{
			if (vy < minY)
			{
				//+###+
				//|   |
				//+---+
				d += (minY - vy) * (minY - vy);
				if (d <= r * r)
				{
					var n = manifold.ncoll;
					n.x = 0;
					n.y =-1;
					var l = minY - vy;
					var cp = manifold.mp1;
					cp.id = ContactID.setRefEdge(ContactID.NULL_VALUE, 2);
					cp.sep = l - r;
					setupContactPoint(cp, vx, minY, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			else
			if (vy > maxY)
			{
				//+---+
				//|   |
				//+###+
				d += (maxY - vy) * (maxY - vy);
				if (d <= r * r)
				{
					var n = manifold.ncoll;
					n.x = 0;
					n.y = 1;
					var l = vy - maxY;
					var cp = manifold.mp1;
					cp.id = ContactID.setRefEdge(ContactID.NULL_VALUE, 0);
					cp.sep = l - r;
					setupContactPoint(cp, vx, maxY, s1, s2);
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			else
			{
				manifold.pointCount = 1;
				
				var cp = manifold.mp1;
				setupContactPoint(cp, vx, vy, s1, s2);
				cp.id = ContactID.NULL_VALUE;
				
				var dx, dy;
				
				if (vx - minX < maxX - vx)
				{
					dx = vx - minX;
					if (vy - minY < maxY - vy)
					{
						dy = vy - minY;
						
						if (dx < dy)
						{
							var n = manifold.ncoll;
							n.x =-1;
							n.y = 0;
							cp.sep = -dx - r;
						}
						else
						{
							var n = manifold.ncoll;
							n.x = 0;
							n.y =-1;
							cp.sep =-dy - r;
						}
					}
					else
					{
						dy = maxY - vy;
						if (dx < dy)
						{
							var n = manifold.ncoll;
							n.x =-1;
							n.y = 0;
							cp.sep =-dx - r;
						}
						else
						{
							var n = manifold.ncoll;
							n.x = 0;
							n.y = 1;
							cp.sep =-dy - r;
						}
					}
				}
				else
				{
					dx = maxX - vx;
					if (vy - minY < maxY - vy)
					{
						dy = vy - minY;
						
						if (dx < dy)
						{
							var n = manifold.ncoll;
							n.x = 1;
							n.y = 0;
							cp.sep =-dx - r;
						}
						else
						{
							var n = manifold.ncoll;
							n.x = 0;
							n.y =-1;
							cp.sep =-dy - r;
						}
					}
					else
					{
						dy = maxY - vy;
						if (dx < dy)
						{
							var n = manifold.ncoll;
							n.x = 1;
							n.y = 0;
							cp.sep =-dx - r;
						}
						else
						{
							var n = manifold.ncoll;
							n.x = 0;
							n.y = 1;
							cp.sep =-dy - r;
						}
					}
				}
			}
		}
	}
	
	inline function setupContactPoint(cp:ManifoldPoint, x:Float, y:Float, s1:AbstractShape, s2:AbstractShape):Void
	{
		cp.x = x;
		cp.y = y;
		cp.lp1.x = cp.x - s1.TBody.tx;
		cp.lp1.y = cp.y - s1.TBody.ty;
		s2.TBody.mulT(cp, cp.lp2);
	}
}