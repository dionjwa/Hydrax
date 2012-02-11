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

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

using de.polygonal.motor.dynamics.contact.ContactID;
using de.polygonal.ds.BitFlags;

class CollideEdgePoly extends ClipCollider
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
		var refEdgeNormal = s1.n0;
		var dx = refEdgeNormal.x;
		var dy = refEdgeNormal.y;
		
		if (Vec2Util.dot4(s2.x, s2.y, dx, dy) < 0)
		{
			//negative half-space
			_disabled = true;
			manifold.pointCount = 0;
			return;
		}
		
		//test separation axis of edge against poly
		var refEdgeVertex = s1.v0;
		var supportVertex = _supportBSPQuery(s2, dx, dy);
		var sep = Vec2Util.dot4(dx, dy, supportVertex.x - refEdgeVertex.x, supportVertex.y - refEdgeVertex.y);
		if (sep > 0)
		{
			_disabled = false;
			manifold.pointCount = 0;
			return;
		}
		
		var flip = 0;
		
		//test separation axis of poly against edge
		var a = s1.v0;
		var b = s1.v1;
		var ax = a.x, bx = b.x;
		var ay = a.y, by = b.y;
		
		var p = s2.worldVertexChain, p0 = p;
		var d = s2.worldNormalChain;
		
		do
		{
			dx = d.x;
			dy = d.y;
		
			if (ax * dx + ay * dy < bx * dx + by * dy)
			{
				var depth = dx * (ax - p.x) + dy * (ay - p.y);
				if (depth > 0)
				{
					manifold.pointCount = 0;
					_disabled = false;
					return;
				}
				if (depth > _relTol * sep + _absTol * p.edge.height)
				{
					sep = depth;
					refEdgeNormal = d;
					refEdgeVertex = p;
					supportVertex = a;
					flip = 1;
				}
			}
			else
			{
				var depth = dx * (bx - p.x) + dy * (by - p.y);
				if (depth > 0)
				{
					manifold.pointCount = 0;
					_disabled = false;
					return;
				}
				if (depth > _relTol * sep + _absTol * p.edge.height)
				{
					sep = depth;
					refEdgeNormal = d;
					refEdgeVertex = p;
					supportVertex = b;
					flip = 1;
				}
			}
			
			p = p.next;
			d = d.next;
		}
		while (p != p0);
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal);
	}
	
	function _collideDouble(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		//test separation axis of edge against poly
		//positive half-space
		var refEdgeVertex = s1.v0;
		var refEdgeNormal = s1.n0;
		var	dx = refEdgeNormal.x;
		var dy = refEdgeNormal.y;
		var supportVertex = _supportBSPQuery(s2, dx, dy);
		var depth = Vec2Util.dot4(dx, dy, supportVertex.x - refEdgeVertex.x, supportVertex.y - refEdgeVertex.y);
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		var sep = depth;
		
		//negative half-space
		var p = s1.v1;
		var d = s1.n1;
		dx = d.x;
		dy = d.y;
		var s = _supportBSPQuery(s2, dx, dy);
		depth = Vec2Util.dot4(dx, dy, s.x - p.x, s.y - p.y);
		if (depth > 0)
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
		
		var flip = 0;
		
		//test separation axis of poly against edge
		var a = s1.v0;
		var b = s1.v1;
		var ax = a.x, bx = b.x;
		var ay = a.y, by = b.y;
		
		p = s2.worldVertexChain; var p0 = p;
		d = s2.worldNormalChain;
		
		do
		{
			dx = d.x;
			dy = d.y;
			
			if (ax * dx + ay * d.y < bx * dx + by * dy)
			{
				depth = dx * (ax - p.x) + dy * (ay - p.y);
				if (depth > 0)
				{
					manifold.pointCount = 0;
					return;
				}
				if (depth > _relTol * sep + _absTol * p.edge.height)
				{
					sep = depth;
					refEdgeNormal = d;
					refEdgeVertex = p;
					supportVertex = a;
					flip = 1;
				}
			}
			else
			{
				depth = dx * (bx - p.x) + dy * (by - p.y);
				if (depth > 0)
				{
					manifold.pointCount = 0;
					return;
				}
				if (depth > _relTol * sep + _absTol * p.edge.height)
				{
					sep = depth;
					refEdgeNormal = d;
					refEdgeVertex = p;
					supportVertex = b;
					flip = 1;
				}
			}
			
			p = p.next;
			d = d.next;
		}
		while (p != p0);
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal);
	}
	
	function _collideSingleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.n0;
		var nx = n.x;
		var ny = n.y;
		var s = _supportBSPQuery(s2, nx, ny);
		
		var d = Vec2Util.dot2(s1.n0, s1.v0);
		
		var sep = Vec2Util.dot4(s.x, s.y, nx, ny) - d;
		if (sep > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.ncoll.x = nx;
		manifold.ncoll.y = ny;
		
		var mp = manifold.mp1;
		mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
		mp.sep = sep;
		mp.x = s.x;
		mp.y = s.y;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
		
		s = s.prev;
		sep = Vec2Util.dot4(s.x, s.y, nx, ny) - d;
		if (sep < 0)
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
		else
		{
			s = s.next.next;
			sep = Vec2Util.dot4(s.x, s.y, nx, ny) - d;
			if (sep < 0)
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
			else
				manifold.pointCount = 1;
		}
	}
	
	function _collideDoubleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.n0;
		var nx = n.x;
		var ny = n.y;
		
		//distance plane->origin
		var d = Vec2Util.dot2(s1.n0, s1.v0);
		
		if ((s2.x * nx) + (s2.y * ny) - d < 0)
		{
			//negative half-space
			nx = -nx;
			ny = -ny;
			d = -d;
		}
		
		var s = _supportBSPQuery(s2, nx, ny);
		var sep = Vec2Util.dot4(s.x, s.y, nx, ny) - d;
		if (sep > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.ncoll.x = nx;
		manifold.ncoll.y = ny;
		
		var mp = manifold.mp1;
		mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
		mp.sep = sep;
		mp.x = s.x;
		mp.y = s.y;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
		
		s = s.prev;
		sep = Vec2Util.dot4(s.x, s.y, nx, ny) - d;
		if (sep < 0)
		{
			manifold.pointCount = 2;
			mp = manifold.mp2;
			mp.sep = sep;
			mp.x = s.x;
			mp.y = s.y;
			mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
			s1.TBody.mulT(mp, mp.lp1);
			s2.TBody.mulT(mp, mp.lp2);
		}
		else
		{
			s = s.next.next;
			sep = Vec2Util.dot4(s.x, s.y, nx, ny) - d;
			if (sep < 0)
			{
				manifold.pointCount = 2;
				mp = manifold.mp2;
				mp.sep = sep;
				mp.x = s.x;
				mp.y = s.y;
				mp.id = ContactID.NULL_VALUE.setIncEdge(s.i);
				s1.TBody.mulT(mp, mp.lp1);
				s2.TBody.mulT(mp, mp.lp2);
			}
			else
				manifold.pointCount = 1;
		}
	}
	
	inline static function _supportBSPQuery(shape:AbstractShape, dx:Float, dy:Float):Vertex
	{
		var node = shape.BSPNode;
		while (node.R != null) node = Vec2Util.perpDot4(node.N.x, node.N.y, dx, dy) <= 0 ? node.R : node.L;
		return node.V;
	}
}