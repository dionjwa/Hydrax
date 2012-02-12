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
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

using de.polygonal.ds.BitFlags;
using de.polygonal.motor.dynamics.contact.ContactID;

class CollideEdgeAABB implements Collider
{
	var _infinite:Bool;
	var _doubleSided:Bool;
	var _disabled:Bool;
	
	var _relTol:Float;
	var _absTol:Float;
	
	public function new(settings:Settings)
	{
		_relTol = settings.relTolerance;
		_absTol = settings.absTolerance;
	}
	
	public function free():Void {}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		if (shape1.hasf(AbstractShape.EDGE_INFINITE)) _infinite = true;
		if (shape1.hasf(AbstractShape.EDGE_DOUBLE_SIDED)) _doubleSided = true;
	}
	
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
	
	function _collideSingle(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var n = s1.worldNormalChain;
		if ((s2.x * n.x) + (s2.y * n.y) - Vec2Util.dot2(s1.n0, s1.v0) < 0)
		{
			//behind plane, early out
			_disabled = true;
			manifold.pointCount = 0;
			return;
		}
		
		var flip = 0;
		
		var bound = s2.aabb;
		
		//test separation axis of edge against aabb
		var d = s1.n0;
		var s = _supportAABB(s2, d);
		var depth = d.x * (s.x - s1.v0.x) + d.y * (s.y - s1.v0.y);
		if (depth > 0)
		{
			_disabled = false;
			manifold.pointCount = 0;
			return;
		}
		var supportVertex = s;
		var refEdgeNormal = s1.n0;
		var sep = depth;
		
		//test separation axis of aabb against edge
		if (s1.v0.x < s1.v1.x)
		{
			//positive x-axis
			depth = s1.v0.x - bound.maxX;
			if (depth > 0)
			{
				_disabled = false;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n1;
				flip = 1;
			}
			
			//negative x-axis
			depth = bound.minX - s1.v1.x;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n3;
				flip = 1;
			}
		}
		else
		{
			//positive x-axis
			depth = s1.v1.x - bound.maxX;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n1;
				flip = 1;
			}
			
			//negative x-axis
			depth = bound.minX - s1.v0.x;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n1;
				flip = 1;
			}
		}
		
		if (s1.v0.y < s1.v1.y)
		{
			//positive y-axis
			depth = s1.v0.y - bound.maxY;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n2;
				flip = 1;
			}
			//negative y-axis
			depth = bound.minY - s1.v1.y;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n0;
				flip = 1;
			}
		}
		else
		{
			//positive y-axis
			depth = s1.v1.y - bound.maxY;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n2;
				flip = 1;
			}
			
			//negative y-axis
			depth = bound.minY - s1.v0.y;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_disabled = false;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n0;
				flip = 1;
			}
		}
		
		if (_disabled)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.pointCount = 1;
		manifold.ncoll.x = refEdgeNormal.x;
		manifold.ncoll.y = refEdgeNormal.y;
		var mp = manifold.mp1;
		mp.sep = sep;
		mp.x = supportVertex.x;
		mp.y = supportVertex.y;
		
		mp.id = ContactID.NULL_VALUE.setIncEdge(supportVertex.i);
		mp.id = mp.id.setFlip(flip);
		
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
	
	function _collideDouble(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var flip = 0;
		
		var bound = s2.aabb;
		
		//test separation axis of edge against aabb
		var d = s1.n0;
		var s = _supportAABB(s2, d);
		var depth = d.x * (s.x - s1.v0.x) + d.y * (s.y - s1.v0.y);
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		var supportVertex = s;
		var refEdgeNormal = s1.n0;
		var sep = depth;
		
		s = s.next.next;
		depth = d.x * (s1.v0.x - s.x) + d.y * (s1.v0.y - s.y);
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			supportVertex = s;
			refEdgeNormal = s1.n1;
		}
		
		//test separation axis of aabb against edge
		if (s1.v0.x < s1.v1.x)
		{
			//positive x-axis
			depth = s1.v0.x - bound.maxX;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n1;
				flip = 1;
			}
			
			//negative x-axis
			depth = bound.minX - s1.v1.x;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n3;
				flip = 1;
			}
		}
		else
		{
			//positive x-axis
			depth = s1.v1.x - bound.maxX;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n1;
				flip = 1;
			}
			
			//negative x-axis
			depth = bound.minX - s1.v0.x;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ex)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n3;
				flip = 1;
			}
		}
		
		if (s1.v0.y < s1.v1.y)
		{
			//positive y-axis
			depth = s1.v0.y - bound.maxY;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n2;
				flip = 1;
			}
			
			//negative y-axis
			depth = bound.minY - s1.v1.y;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n0;
				flip = 1;
			}
		}
		else
		{
			//positive y-axis
			depth = s1.v1.y - bound.maxY;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v1;
				refEdgeNormal = s2.n2;
				flip = 1;
			}
			
			//negative y-axis
			depth = bound.minY - s1.v0.y;
			if (depth > 0)
			{
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + _absTol * s2.ey)
			{
				sep = depth;
				supportVertex = s1.v0;
				refEdgeNormal = s2.n0;
				flip = 1;
			}
		}
		
		manifold.pointCount = 1;
		manifold.ncoll.x = refEdgeNormal.x;
		manifold.ncoll.y = refEdgeNormal.y;
		
		var mp = manifold.mp1;
		mp.sep = sep;
		mp.x = supportVertex.x;
		mp.y = supportVertex.y;
		
		mp.id = mp.id.setIncEdge(supportVertex.i);
		mp.id = mp.id.setFlip(flip);
		
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
	
	function _collideSingleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		//distance edge->origin
		var n = s1.n0;
		var d = Vec2Util.dot2(n, s1.v0);
		var s = _supportAABB(s2, n);
		var depth = n.x * s.x + n.y * s.y - d;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.pointCount = 1;
		manifold.ncoll.x = n.x;
		manifold.ncoll.y = n.y;
		
		var mp = manifold.mp1;
		mp.sep = depth;
		mp.x = s.x;
		mp.y = s.y;
		mp.id = ContactID.NULL_VALUE.setIncVert(s.i);
		
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
	
	function _collideDoubleInf(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		//distance edge->origin
		var d = Vec2Util.dot2(s1.n0, s1.v0);
		var n = s1.n0;
		var s = _supportAABB(s2, n);
		var depth1 = s1.n0.x * s.x + s1.n0.y * s.y - d;
		if (depth1 > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		var t = s.next.next;
		var depth2 = s1.n1.x * t.x + s1.n1.y * t.y + d;
		if (depth2 > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		
		if (depth2 > depth1)
		{
			manifold.pointCount = 1;
			manifold.ncoll.x = s1.n1.x;
			manifold.ncoll.y = s1.n1.y;
			var mp = manifold.mp1;
			mp.id = ContactID.NULL_VALUE.setIncVert(t.i);
			mp.sep = depth2;
			mp.x = s.next.next.x;
			mp.y = s.next.next.y;
			s1.TBody.mulT(mp, mp.lp1);
			s2.TBody.mulT(mp, mp.lp2);
		}
		else
		{
			manifold.pointCount = 1;
			manifold.ncoll.x = s1.n0.x;
			manifold.ncoll.y = s1.n0.y;
			var mp = manifold.mp1;
			mp.id = ContactID.NULL_VALUE.setIncVert(s.i);
			mp.sep = depth1;
			mp.x = s.x;
			mp.y = s.y;
			s1.TBody.mulT(mp, mp.lp1);
			s2.TBody.mulT(mp, mp.lp2);
		}
	}
	
	inline static function _supportAABB(s:AbstractShape, d:Vertex):Vertex
	{
		if (d.x < 0)
			if (d.y < 0)
				return s.v0;
			else
				return s.v3;
		else
			if (d.y < 0)
				return s.v1;
			else
				return s.v2;
	}
}