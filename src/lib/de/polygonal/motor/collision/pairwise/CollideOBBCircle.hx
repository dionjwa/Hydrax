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
import de.polygonal.motor.collision.shape.ShapeType;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

class CollideOBBCircle implements Collider
{
	var _eps:Float;
	
	public function new(settings:Settings)
	{
		_eps = settings.eps;
	}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void {}
	
	public function free():Void {}

	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var T = s1.TWorld;
		var r = s2.radius;
		var cx = s2.x;
		var cy = s2.y;
		
		//transform circle position from world space to OBB local space
		var px = T.mulTx(cx, cy);
		var py = T.mulTy(cx, cy);
		
		var refEdge = ContactID.NULL_FEATURE;
		var incEdge = ContactID.NULL_FEATURE;
		
		//find closest point on box to circle & compute minimum distance
		var ex = s1.ex;
		var ey = s1.ey;
		
		//closest point
		var qx = .0;
		var qy = .0;
		
		//minimum distance
		var sqDist = .0;
		
		if (px <-ex)
		{
			var excess = px + ex;
			sqDist += excess * excess;
			refEdge = 1;
			incEdge = 1;
			qx -= ex;
		}
		else
		if (px > ex)
		{
			var excess = px - ex;
			sqDist += excess * excess;
			refEdge = 3;
			incEdge = 3;
			qx += ex;
		}
		else
			qx += px;
		
		if (py <-ey)
		{
			var excess = py + ey;
			sqDist += excess * excess;
			refEdge = 2;
			qy -= ey;
		}
		else
		if (py > ey)
		{
			var excess = py - ey;
			sqDist += excess * excess;
			refEdge = 0;
			qy += ey;
		}
		else
			qy += py;
		
		var sep = sqDist;
		if (sep >= r * r)
		{
			manifold.pointCount = 0;
			return;
		}
		
		//intersection
		manifold.pointCount = 1;
		var mp = manifold.mp1;
		
		var nx = .0;
		var ny = .0;
		
		if (sep <= _eps * _eps)
		{
			//deep intersection; pick MTD
			if (px > .0)
			{
				if (py > .0)
				{
					if (ex - px < ey - py)
					{
						nx = 1;
						ny = 0;
						mp.sep = r + ex - px;
						refEdge = 3;
					}
					else
					{
						nx = 0;
						ny = 1;
						mp.sep = r + ey - py;
						refEdge = 0;
					}
				}
				else
				{
					if (ex - px < ey + py)
					{
						nx = 1;
						ny = 0;
						mp.sep = r + ex - px;
						refEdge = 3;
					}
					else
					{
						nx = 0;
						ny =-1;
						mp.sep = r + ey + py;
						refEdge = 2;
					}
				}
			}
			else
			{
				if (py > .0)
				{
					if (ex + px < ey - py)
					{
						nx =-1;
						ny = 0;
						mp.sep = r + ex + px;
						refEdge = 1;
					}
					else
					{
						nx = 0;
						ny = 1;
						mp.sep = r + ey - py;
						refEdge = 0;
					}
				}
				else
				{
					if (ex + px < ey + py)
					{
						nx =-1;
						ny = 0;
						mp.sep = r + ex + px;
						refEdge = 1;
					}
					else
					{
						nx = 0;
						ny =-1;
						mp.sep = r + ey + py;
						refEdge = 2;
					}
				}
			}
			mp.sep = -mp.sep;
		}
		else
		{
			//collision normal
			nx = px - qx;
			ny = py - qy;
			var l = Math.sqrt(nx * nx + ny * ny);
			nx /= l;
			ny /= l;
			
			//separation
			mp.sep = -(r - Math.sqrt(sep));
		}
		
		//transform box collision normal from local to world space
		var n = manifold.ncoll;
		n.x = T.mul22x(nx, ny);
		n.y = T.mul22y(nx, ny);
		
		//position of contact point in world space
		mp.x = cx - n.x * r;
		mp.y = cy - n.y * r;
		
		//position of contact point in local space
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
		
		mp.id = ContactID.bake(refEdge, incEdge, ContactID.NULL_FEATURE, 0);
	}
}