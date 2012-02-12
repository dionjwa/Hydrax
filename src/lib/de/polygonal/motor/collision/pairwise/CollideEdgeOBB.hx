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
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.Settings;

using de.polygonal.ds.BitFlags;
using de.polygonal.motor.dynamics.contact.ContactID;

class CollideEdgeOBB extends ClipCollider
{
	var _infinite:Bool;
	var _doubleSided:Bool;
	var _disabled:Bool;
	
	public function new(settings:Settings)
	{
		super(settings);
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		if (shape1.hasf(AbstractShape.EDGE_INFINITE)) _infinite = true;
		if (shape1.hasf(AbstractShape.EDGE_DOUBLE_SIDED)) _doubleSided = true;
	}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		s1.syncFeatures();
		s2.syncFeatures();
		
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
	
	function _collideSingle(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.worldNormalChain;
		//distance edge->origin
		var d = Vec2Util.dot2(s1.n0, s1.v0);
		if ((s2.x * n.x) + (s2.y * n.y) - d < .0)
		{
			//behind plane, early out
			_disabled = true;
			manifold.pointCount = 0;
			return;
		}
		
		var flip = 0;
		
		//test separation axis of edge against obb
		var p = s1.worldVertexChain;
		var d = s1.worldNormalChain;
		var s = supportMin(s2, d, s2.TWorld);
		var depth = d.x * (s.x - p.x) + d.y * (s.y - p.y);
		if (depth > .0)
		{
			_disabled = false;
			manifold.pointCount = 0;
			return;
		}
		var sep = depth;
		var refEdgeNormal = d;
		var refEdgeVertex = p;
		var supportVertex = s;
		
		p = p.next;
		d = d.next;
		s = s.next.next;
		depth = d.x * (s.x - p.x) + d.y * (s.y - p.y);
		if (depth > 0)
		{
			_disabled = false;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = s;
		}
		
		//test separation axis of edge against obb
		var a = s1.worldVertexChain;
		var b = a.next;
		
		var ax = a.x, bx = b.x;
		var ay = a.y, by = b.y;
		
		p = s2.worldVertexChain.next;
		d = s2.worldNormalChain.next;
		
		var t = _absTol * s2.radius;
		
		if (ax * d.x + ay * d.y < bx * d.x + by * d.y)
		{
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
		}
		else
		{
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
		}
		
		p = s2.worldVertexChain;
		d = s2.worldNormalChain;
		if (ax * d.x + ay * d.y < bx * d.x + by * d.y)
		{
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
		}
		else
		{
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + t)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
		}
		
		if (_disabled)
		{
			manifold.pointCount = 0;
			return;
		}
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal);
	}
	
	function _collideDouble(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var flip = 0;
		
		//test separation axis of edge against obb
		var p = s1.v0;
		var d = s1.n0;
		var s = supportMin(s2, d, s2.TWorld);
		var depth = d.x * (s.x - p.x) + d.y * (s.y - p.y);
		if (depth > .0)
		{
			manifold.pointCount = 0;
			return;
		}
		var sep = depth;
		var refEdgeNormal = d;
		var refEdgeVertex = p;
		var supportVertex = s;
		
		p = s1.v1;
		d = s1.n1;
		s = s.next.next;
		depth = d.x * (s.x - p.x) + d.y * (s.y - p.y);
		if (depth > .0)
		{
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = s;
		}
		
		//test separation axis of obb against edge
		var a = s1.v0;
		var b = s1.v1;
		var ax = a.x, bx = b.x;
		var ay = a.y, by = b.y;
		
		//x-axis
		p = s2.worldVertexChain.next;
		d = s2.worldNormalChain.next;
		if (ax * d.x + ay * d.y < bx * d.x + by * d.y)
		{
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
		}
		else
		{
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
		}
		
		//y-axis
		p = s2.worldVertexChain;
		d = s2.worldNormalChain;
		if (ax * d.x + ay * d.y < bx * d.x + by * d.y)
		{
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
		}
		else
		{
			depth = d.x * (bx - p.x) + d.y * (by - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = b;
				flip = 1;
			}
			p = p.next.next;
			d = d.next.next;
			depth = d.x * (ax - p.x) + d.y * (ay - p.y);
			if (depth > .0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = a;
				flip = 1;
			}
		}
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal);
	}
	
	function _collideSingleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.n0;
		var s = supportMin(s2, n, s2.TWorld);
		//distance edge->origin
		var d = Vec2Util.dot2(s1.n0, s1.v0);
		var sep = s.x * n.x + s.y * n.y - d;
		if (sep > .0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.pointCount = 1;
		manifold.ncoll.x = n.x;
		manifold.ncoll.y = n.y;
		var mp = manifold.mp1;
		mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
		mp.sep = sep;
		mp.x = s.x;
		mp.y = s.y;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
		
		sep = s.prev.x * n.x + s.prev.y * n.y - d;
		if (sep < .0)
		{
			manifold.pointCount = 2;
			mp = manifold.mp2;
			mp.id = ContactID.NULL_VALUE.setIncEdge(s.prev.i);
			mp.sep = sep;
			mp.x = s.prev.x;
			mp.y = s.prev.y;
			s1.TBody.mulT(mp, mp.lp1);
			s2.TBody.mulT(mp, mp.lp2);
		}
		else
		{
			sep = s.next.x * n.x + s.next.y * n.y - d;
			if (sep < .0)
			{
				manifold.pointCount = 2;
				mp = manifold.mp2;
				mp.id = ContactID.NULL_VALUE.setIncEdge(s.next.i);
				mp.sep = sep;
				mp.x = s.next.x;
				mp.y = s.next.y;
				s1.TBody.mulT(mp, mp.lp1);
				s2.TBody.mulT(mp, mp.lp2);
			}
		}
	}
	
	function _collideDoubleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.n0;
		var s = null;
		
		//distance edge->origin
		var d = Vec2Util.dot2(s1.n0, s1.v0);
		
		var side = (s2.x * n.x) + (s2.y * n.y) - d;
		if (side > .0)
			s = supportMin(s2, n, s2.TWorld);
		else
		{
			s = supportMax(s2, n, s2.TWorld);
			n = s1.n1;
		}
		
		var sep = s.x * n.x + s.y * n.y - d;
		if (sep > .0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.pointCount = 1;
		manifold.ncoll.x = n.x;
		manifold.ncoll.y = n.y;
		
		var mp = manifold.mp1;
		mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
		mp.sep = sep;
		mp.x   = s.x;
		mp.y   = s.y;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
		
		var incEdgeNormal = s.edge.normal;
		var min = incEdgeNormal.x * n.x + incEdgeNormal.y * n.y;
		if ((incEdgeNormal.prev.x * n.x + incEdgeNormal.prev.y * n.y) < min)
		{
			s = s.prev;
			sep = s.x * n.x + s.y * n.y - d;
			if (sep < .0)
			{
				manifold.pointCount = 2;
				mp = manifold.mp2;
				mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
				mp.sep = sep;
				mp.x = s.x;
				mp.y = s.y;
				s1.TBody.mulT(mp, mp.lp1);
				s2.TBody.mulT(mp, mp.lp2);
			}
		}
		else
		{
			s = s.next;
			sep = s.x * n.x + s.y * n.y - d;
			if (sep < .0)
			{
				manifold.pointCount = 2;
				mp = manifold.mp2;
				mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
				mp.sep = sep;
				mp.x = s.x;
				mp.y = s.y;
				s1.TBody.mulT(mp, mp.lp1);
				s2.TBody.mulT(mp, mp.lp2);
			}
		}
	}
	
	inline function supportMin(s:AbstractShape, d:Vertex, R:Mat32):Vertex
	{
		if ((R.m11 * d.x + R.m21 * d.y) > .0)
			if ((R.m12 * d.x + R.m22 * d.y) > .0)
				return s.v2;
			else
				return s.v1;
		else
			if ((R.m12 * d.x + R.m22 * d.y) > .0)
				return s.v3;
			else
				return s.v0;
	}
	
	inline function supportMax(s:AbstractShape, d:Vertex, R:Mat32):Vertex
	{
		if ((R.m11 * d.x + R.m21 * d.y) > .0)
			if ((R.m12 * d.x + R.m22 * d.y) > .0)
				return s.v0;
			else
				return s.v3;
		else
			if ((R.m12 * d.x + R.m22 * d.y) > .0)
				return s.v1;
			else
				return s.v2;
	}
}