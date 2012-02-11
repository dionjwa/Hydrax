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

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

class CollidePolyCircle implements Collider
{
	var _p:Vertex;
	var _d:Vertex;
	
	var _eps:Float;
	
	public function new(settings:Settings)
	{
		_eps = settings.eps;
	}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		_p = shape1.worldVertexChain;
		_d = shape1.worldNormalChain;
	}
	
	public function free():Void
	{
		_p = null;
		_d = null;
	}
	
	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		s1.syncFeatures();
		
		//try early out by using previous separating line
		var pv = _p;
		var pn = _d;
		
		var n:Vertex = null;
		var p:Vertex = null;
		
		var cx  = s2.x;
		var cy  = s2.y;
		var r   = s2.radius;
		var sep = Mathematics.NEGATIVE_INFINITY;
		
		for (i in 0...s1.vertexCount)
		{
			var s = pn.x * (cx - pv.x) + pn.y * (cy - pv.y);
			if (s > r)
			{
				manifold.pointCount = 0;
				
				//remember separating axis for subsequent tests
				_p = pv;
				_d = pn;
				return;
			}
			
			//track minimum distance
			if (s > sep)
			{
				sep = s;
				n = pn;
				p = pv;
			}
			
			pv = pv.next;
			pn = pn.next;
		}
		
		if (sep < _eps)
		{
			//deep penetration
			manifold.pointCount = 1;
			manifold.ncoll.x = n.x;
			manifold.ncoll.y = n.y;
			
			var cp = manifold.mp1;
			cp.id = ContactID.setIncEdge(ContactID.NULL_VALUE, n.i);
			cp.sep = sep - r;
			cp.x = cx - r * n.x;
			cp.y = cy - r * n.y;
			s1.TBody.mulT(cp, cp.lp1);
			s2.TBody.mulT(cp, cp.lp2);
			return;
		}
		
		var e = p.edge;
		if (e.length < _eps)
		{
			//short edge
			var dx = cx - p.x;
			var dy = cy - p.y;
			var dist = dx * dx + dy * dy;
			if (dist > r * r)
			{
				manifold.pointCount = 0;
				return;
			}
			
			dist = Math.sqrt(dist);
			dx /= dist;
			dy /= dist;
			
			manifold.pointCount = 1;
			manifold.ncoll.x = dx;
			manifold.ncoll.y = dy;
			
			var cp = manifold.mp1;
			cp.id = ContactID.setIncEdge(ContactID.NULL_VALUE, n.i);
			cp.sep = dist - r;
			cp.x = cx - r * dx;
			cp.y = cy - r * dy;
			s1.TBody.mulT(cp, cp.lp1);
			s2.TBody.mulT(cp, cp.lp2);
			return;
		}
		
		//project contact point on edge
		var d = e.dir;
		var px = p.x, ex = s1.TWorld.mul22x(d.x, d.y);
		var py = p.y, ey = s1.TWorld.mul22y(d.x, d.y);
		
		var cp = manifold.mp1;
		
		var u = (cx - px) * ex + (cy - py) * ey;
		if (u <= 0)
		{
			cp.id = ContactID.setIncVert(ContactID.NULL_VALUE, p.i);
		}
		else
		if (u >= e.length)
		{
			p = p.next;
			px = p.x;
			py = p.y;
			cp.id = ContactID.setIncVert(ContactID.NULL_VALUE, p.i);
			
		}
		else
		{
			px = ex * u + px;
			py = ey * u + py;
			cp.id = ContactID.setRefEdge(ContactID.NULL_VALUE, p.i);
		}
		
		var dx = cx - px;
		var dy = cy - py;
		var dist = dx * dx + dy * dy;
		if (dist > r * r)
		{
			manifold.pointCount = 0;
			return;
		}
		dist = Math.sqrt(dist);
		dx /= dist;
		dy /= dist;
		
		manifold.pointCount = 1;
		manifold.ncoll.x = dx;
		manifold.ncoll.y = dy;
		
		cp.sep = dist - r;
		
		//position of contact point in world space
		cp.x = cx - r * dx;
		cp.y = cy - r * dy;
		
		//position in object space
		s1.TBody.mulT(cp, cp.lp1);
		s2.TBody.mulT(cp, cp.lp2);
	}
}