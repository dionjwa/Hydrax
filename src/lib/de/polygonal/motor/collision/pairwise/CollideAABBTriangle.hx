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

import de.polygonal.ds.Bits;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.Settings;

class CollideAABBTriangle extends ClipCollider
{
	inline static var HINT_SHAPE1 = Bits.BIT_01;
	inline static var HINT_SHAPE2 = Bits.BIT_02;
	inline static var HINT_X_AXIS = Bits.BIT_03;
	inline static var HINT_FLIP   = Bits.BIT_04;
	
	var _hint:Int;
	var _p:Vertex;
	var _d:Vertex;
	
	public function new(settings:Settings)
	{
		super(settings);
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		_hint = 0;
		
		_p = shape2.worldVertexChain;
		_d = shape2.worldNormalChain;
	}
	
	override public function free():Void
	{
		_p = null;
		_d = null;
	}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		//try early out by using previous separating line
		if (_hint != 0)
		{
			switch (_hint)
			{
				case HINT_SHAPE1 | HINT_X_AXIS:
					if (_supportTriMinX(s2).x - s1.aabb.maxX > 0) return;
				
				case HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP:
					if (s1.aabb.minX - _supportTriMaxX(s2).x > 0) return;
				
				case HINT_SHAPE1:
					if (_supportTriMinY(s2).y - s1.aabb.maxX > 0) return;
				
				case HINT_SHAPE1 | HINT_FLIP:
					if (s1.aabb.minY - _supportTriMaxY(s2).y > 0) return;
				
				case HINT_SHAPE2:
					if (_separation(_p, _d, _supportAABB(s1, _d)) > 0) return;
			}
		}
		
		//invalidate hint
		_hint = 0;
		
		//check if projection interval of triangle intersects AABB along separating line
		//using AABB normals as support direction
		
		var aabb = s1.aabb;
		
		//positive x-axis
		var s = _supportTriMinX(s2);
		var depth = s.x - aabb.maxX;
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_X_AXIS;
			manifold.pointCount = 0;
			return;
		}
		var sep = depth;
		var refEdgeNormal = s1.n3;
		var refEdgeVertex = s1.v3;
		var supportVertex = s;
		
		//negative x-axis
		var s = (s.next.x > s.prev.x) ? s.next : s.prev;
		depth = aabb.minX - s.x;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			_hint = HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = s1.n1;
			refEdgeVertex = s1.v1;
			supportVertex = s;
		}
		
		//positive y-axis
		s = _supportTriMinY(s2);
		depth = s.y - aabb.maxY;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			_hint = HINT_SHAPE1;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = s1.n0;
			refEdgeVertex = s1.v0;
			supportVertex = s;
		}
		
		//negative y-axis
		s = (s.next.y > s.prev.y) ? s.next : s.prev;
		depth = aabb.minY - s.y;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			_hint = HINT_SHAPE1 | HINT_FLIP;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = s1.n2;
			refEdgeVertex = s1.v2;
			supportVertex = s;
		}
		
		//check if projection interval of AABB intersects triangle along separating line
		//using triangle normals as support direction
		
		var flip = 0;
		
		//vertex 1
		s = _supportAABB(s1, s2.n0);
		var depth = _separation(s2.v0, s2.n0, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2;
			_p = s2.v0;
			_d = s2.n0;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.v0.edge.height)
		{
			sep = depth;
			refEdgeNormal = s2.n0;
			refEdgeVertex = s2.v0;
			supportVertex = s;
			flip = 1;
		}
		
		//vertex2
		s = _supportAABB(s1, s2.n1);
		var depth = _separation(s2.v1, s2.n1, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2;
			_p = s2.v1;
			_d = s2.n1;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.v1.edge.height)
		{
			sep = depth;
			refEdgeNormal = s2.n1;
			refEdgeVertex = s2.v1;
			supportVertex = s;
			flip = 1;
		}
		
		//vertex3
		s = _supportAABB(s1, s2.n2);
		var depth = _separation(s2.v2, s2.n2, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2;
			_p = s2.v2;
			_d = s2.n2;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.v2.edge.height)
		{
			sep = depth;
			refEdgeNormal = s2.n2;
			refEdgeVertex = s2.v2;
			supportVertex = s;
			flip = 1;
		}
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal, 1);
	}
	
	inline static function _supportAABB(s:AbstractShape, d:Vertex):Vertex
	{
		if (d.x < 0)
		{
			if (d.y < 0)
				return s.v0;
			else
				return s.v3;
		}
		else
		{
			if (d.y < 0)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _supportTriMinX(s:AbstractShape):Vertex
	{
		if (s.v0.x < s.v1.x)
		{
			if (s.v0.x < s.v2.x)
				return s.v0;
			else
				return s.v2;
		}
		else
		{
			if (s.v1.x < s.v2.x)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _supportTriMaxX(s:AbstractShape):Vertex
	{
		if (s.v0.x > s.v1.x)
		{
			if (s.v0.x > s.v2.x)
				return s.v0;
			else
				return s.v2;
		}
		else
		{
			if (s.v1.x > s.v2.x)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _supportTriMinY(s:AbstractShape):Vertex
	{
		if (s.v0.y < s.v1.y)
		{
			if (s.v0.y < s.v2.y)
				return s.v0;
			else
				return s.v2;
		}
		else
		{
			if (s.v1.y < s.v2.y)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _supportTriMaxY(s:AbstractShape):Vertex
	{
		if (s.v0.y > s.v1.y)
		{
			if (s.v0.y > s.v2.y)
				return s.v0;
			else
				return s.v2;
		}
		else
		{
			if (s.v1.y > s.v2.y)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _separation(p:Vertex, d:Vertex, s:Vertex):Float
	{
		return d.x * (s.x - p.x) + d.y * (s.y - p.y);
	}
}