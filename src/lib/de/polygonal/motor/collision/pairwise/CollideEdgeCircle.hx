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

import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;

using de.polygonal.ds.BitFlags;
using de.polygonal.motor.dynamics.contact.ContactID;

class CollideEdgeCircle implements Collider
{
	var _infinite:Bool;
	var _doubleSided:Bool;
	var _disabled:Bool;
	
	public function new() {}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		if (shape1.hasf(AbstractShape.EDGE_INFINITE)) _infinite = true;
		if (shape1.hasf(AbstractShape.EDGE_DOUBLE_SIDED)) _doubleSided = true;
	}
	
	public function free():Void {}
	
	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		s1.syncFeatures();
		
		if (_infinite)
			if (_doubleSided)
				_collideDoubleInf(manifold, s1, s2);
			else
				_collideSingleInf(manifold, s1, s2);
		else
			if (_doubleSided)
				_collideDouble(manifold, s1, s2);
			else
				_collideSingle(manifold, s1, s2);
	}
	
	function _collideSingleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.worldNormalChain;
		var r = s2.radius;
		var d = (s2.x * n.x) + (s2.y * n.y) - Vec2Util.dot2(s1.n0, s1.v0);
		if (d <= r)
		{
			manifold.pointCount = 1;
			manifold.ncoll.x = n.x;
			manifold.ncoll.y = n.y;
			var mp = manifold.mp1;
			mp.x = s2.x - r * n.x;
			mp.y = s2.y - r * n.y;
			mp.sep = d - r;
			mp.id = ContactID.NULL_VALUE.setRefEdge(0);
			s1.TBody.mulT(mp, mp.lp1);
			s2.TBody.mulT(mp, mp.lp2);
		}
		else
			manifold.pointCount = 0;
	}
	
	function _collideDoubleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.worldNormalChain;
		var r = s2.radius;
		var d = (s2.x * n.x) + (s2.y * n.y) - Vec2Util.dot2(s1.n0, s1.v0);
		if (d > 0)
		{
			if (d <= r)
			{
				manifold.pointCount = 1;
				manifold.ncoll.x = n.x;
				manifold.ncoll.y = n.y;
				var mp = manifold.mp1;
				mp.id = ContactID.NULL_VALUE.setIncVert(0);
				mp.sep = d - r;
				mp.x = s2.x - r * n.x;
				mp.y = s2.y - r * n.y;
				s1.TBody.mulT(mp, mp.lp1);
				s2.TBody.mulT(mp, mp.lp2);
			}
		}
		else
		if (-d <= r)
		{
			manifold.pointCount = 1;
			manifold.ncoll.x = -n.x;
			manifold.ncoll.y = -n.y;
			
			var mp = manifold.mp1;
			mp.id = ContactID.NULL_VALUE.setIncVert(1);
			mp.sep = -r - d;
			mp.x = s2.x + r * n.x;
			mp.y = s2.y + r * n.y;
			s1.TBody.mulT(mp, mp.lp1);
			s2.TBody.mulT(mp, mp.lp2);
		}
		else
			manifold.pointCount = 0;
	}
	
	function _collideSingle(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.worldNormalChain;
		if ((s2.x * n.x) + (s2.y * n.y) - Vec2Util.dot2(s1.n0, s1.v0) < 0)
		{
			_disabled = true;
			manifold.pointCount = 0;
			return;
		}
		
		var a = s1.v0;
		var b = s1.v1;
		
		var ax = a.x, bx = b.x, px = s2.x;
		var ay = a.y, by = b.y, py = s2.y;
		
		var bax = bx - ax;
		var bay = by - ay;
		var pax = px - ax;
		var pay = py - ay;
		
		var r = s2.radius;
		
		var t = pax * bax + pay * bay;
		if (t < 0)
		{
			//Q beyond A, d2 = |AP|
			var nx = n.x;
			var ny = n.y;
			if (nx * pax + ny * pay < 0)
			{
				manifold.pointCount = 0;
				return;
			}
			
			var dSq = pax * pax + pay * pay;
			if (dSq > r * r)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			
			if (_disabled)
			{
				manifold.pointCount = 0;
				return;
			}
			
			var d = Math.sqrt(dSq);
			nx = pax / d;
			ny = pay / d;
			
			manifold.pointCount = 1;
			manifold.ncoll.x = nx;
			manifold.ncoll.y = ny;
			
			var mp = manifold.mp1;
			mp.id = ContactID.NULL_VALUE.setIncVert(0);
			mp.x = px - r * nx;
			mp.y = py - r * ny;
			mp.sep = d - r;
		}
		else
		{
			var bpx = bx - px;
			var bpy = by - py;
			t = bpx * bax + bpy * bay;
			var nx = n.x;
			var ny = n.y;
			
			if (nx * bpx + ny * bpy > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			
			if (t < 0)
			{
				//Q beyond B, d2 = |BP|
				var dSq = bpx * bpx + bpy * bpy;
				if (dSq > r * r)
				{
					_disabled = false;
					manifold.pointCount = 0;
					return;
				}
				
				if (_disabled)
				{
					manifold.pointCount = 0;
					return;
				}
				
				var d = Math.sqrt(dSq);
				nx = -bpx / d;
				ny = -bpy / d;
				
				manifold.pointCount = 1;
				manifold.ncoll.x = nx;
				manifold.ncoll.y = ny;
				
				var mp = manifold.mp1;
				mp.id = ContactID.NULL_VALUE.setIncVert(1);
				mp.x = px - r * nx;
				mp.y = py - r * ny;
				mp.sep = d - r;
			}
			else
			{
				//Q on AB, d2 = d1
				var a2 = pay * bax - pax * bay;
				if (a2 > 0)
				{
					manifold.pointCount = 0;
					return;
				}
				
				var dSq = (a2 * a2) / (bax * bax + bay * bay);
				if (dSq > r * r)
				{
					_disabled = false;
					manifold.pointCount = 0;
					return;
				}
				
				if (_disabled)
				{
					manifold.pointCount = 0;
					return;
				}
				
				var d = Math.sqrt(dSq);
				nx =-by + ay;
				ny = bx - ax;
				
				var mag = Math.sqrt(nx * nx + ny * ny) * ((nx * pax + ny * pay) < 0 ? -1 : 1);
				nx /= mag;
				ny /= mag;
				
				manifold.pointCount = 1;
				manifold.ncoll.x = nx;
				manifold.ncoll.y = ny;
				
				var mp = manifold.mp1;
				mp.id = ContactID.NULL_VALUE.setRefEdge(0);
				mp.x = px - r * nx;
				mp.y = py - r * ny;
				mp.sep = d - r;
			}
		}
		
		var mp = manifold.mp1;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
	
	function _collideDouble(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var a = s1.v0;
		var b = s1.v1;
		
		var ax = a.x, bx = b.x, px = s2.x;
		var ay = a.y, by = b.y, py = s2.y;
		
		var bax = bx - ax;
		var bay = by - ay;
		var pax = px - ax;
		var pay = py - ay;
		
		var r = s2.radius;
		
		var t = pax * bax + pay * bay;
		if (t < 0)
		{
			//Q beyond A, d2 = |AP|
			var dSq = pax * pax + pay * pay;
			if (dSq > r * r)
				manifold.pointCount = 0;
			else
			{
				var d = Math.sqrt(dSq);
				var nx = pax / d;
				var ny = pay / d;
				
				manifold.pointCount = 1;
				manifold.ncoll.x = nx;
				manifold.ncoll.y = ny;
				
				var mp = manifold.mp1;
				mp.id = ContactID.NULL_VALUE.setIncVert(0);
				mp.x = px - r * nx;
				mp.y = py - r * ny;
				mp.sep = d - r;
			}
		}
		else
		{
			var bpx = bx - px;
			var bpy = by - py;
			t = bpx * bax + bpy * bay;
			if (t < 0)
			{
				//Q beyond B, d2 = |BP|
				t = bpx * bax + bpy * bay;
				var dSq = bpx * bpx + bpy * bpy;
				if (dSq > r * r)
					manifold.pointCount = 0;
				else
				{
					var d = Math.sqrt(dSq);
					var nx = -bpx / d;
					var ny = -bpy / d;
					
					manifold.pointCount = 1;
					manifold.ncoll.x = nx;
					manifold.ncoll.y = ny;
					
					var mp = manifold.mp1;
					mp.id = ContactID.NULL_VALUE.setIncVert(1);
					mp.x = px - r * nx;
					mp.y = py - r * ny;
					mp.sep = d - r;
				}
			}
			else
			{
				//Q on AB, d2 = d1
				var a2 = pay * bax - pax * bay;
				var dSq = (a2 * a2) / (bax * bax + bay * bay);
				if (dSq > r * r)
					manifold.pointCount = 0;
				else
				{
					var d = Math.sqrt(dSq);
					var nx =-by + ay;
					var ny = bx - ax;
					
					manifold.pointCount = 1;
					var mag = Math.sqrt(nx * nx + ny * ny) * ((nx * pax + ny * pay) < 0 ? -1 : 1);
					nx /= mag;
					ny /= mag;
					
					manifold.ncoll.x = nx;
					manifold.ncoll.y = ny;
					
					var mp = manifold.mp1;
					mp.id = ContactID.NULL_VALUE.setRefEdge(0);
					mp.x = px - r * nx;
					mp.y = py - r * ny;
					mp.sep = d - r;
				}
			}
		}
		
		var mp = manifold.mp1;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
}