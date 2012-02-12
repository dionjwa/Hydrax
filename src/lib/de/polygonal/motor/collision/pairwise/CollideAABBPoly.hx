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
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

using de.polygonal.ds.Bits;

class CollideAABBPoly extends ClipCollider
{
	inline static var HINT_SHAPE1 = Bits.BIT_01;
	inline static var HINT_SHAPE2 = Bits.BIT_02;
	inline static var HINT_X_AXIS = Bits.BIT_03;
	inline static var HINT_FLIP   = Bits.BIT_04;
	
	var _hint:Int;
	var _minX:Vertex;
	var _maxX:Vertex;
	var _minY:Vertex;
	var _maxY:Vertex;
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
		
		_minX = shape2.worldVertexChain;
		_maxX = shape2.worldVertexChain;
		_minY = shape2.worldVertexChain;
		_maxY = shape2.worldVertexChain;
	}
	
	override public function free():Void
	{
		_p    = null;
		_d    = null;
		_minX = null;
		_maxX = null;
		_minY = null;
		_maxY = null;
	}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		//try early out by using previous separating line
		if (_hint != 0)
		{
			switch (_hint)
			{
				case HINT_SHAPE1 | HINT_X_AXIS:
					if (_xSupportMaxPoly(_maxX).x - s1.aabb.maxX > 0) return;
				
				case HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP:
					if (s1.aabb.minX - _xSupportMinPoly(_minX).x > 0) return;
				
				case HINT_SHAPE1:
					if (_ySupportMaxPoly(_maxY).y - s1.aabb.maxY > 0) return;
				
				case HINT_SHAPE1 | HINT_FLIP:
					if (s1.aabb.minY - _ySupportMinPoly(_minY).y > 0) return;
				
				case HINT_SHAPE2:
					if (_separation(_p, _d, _supportAABB(s2, _d)) > 0) return;
			}
		}
		
		//invalidate hint
		_hint = 0;
		
		//check if projection interval of polygon intersects AABB along separating line
		//using AABB normals as support direction
		
		var bound = s1.aabb;
		
		//basis vector [1,0]
		var s = _xSupportMaxPoly(_maxX);
		var depth = s.x - bound.maxX;
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
		
		//basis vector [-1,0]
		s = _xSupportMinPoly(_minX);
		depth = bound.minX - s.x;
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
		
		//basis vector [0,1]
		s = _ySupportMaxPoly(_maxY);
		depth = s.y - bound.maxY;
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
		
		//basis vector [0,-1]
		s = _ySupportMinPoly(_minY);
		depth = bound.minY - s.y;
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
		
		//check if projection interval of AABB intersects poly along separating line
		//using poly edge normals as support direction
		
		var flip = 0;
		
		var p = s2.worldVertexChain, p0 = p;
		var d = s2.worldNormalChain;
		var a = _absTol * s2.radius;
		
		do
		{
			s = _supportAABB(s1, d);
			depth = _separation(p, d, s);
			if (depth > 0)
			{
				manifold.pointCount = 0;
				_hint = HINT_SHAPE2;
				_p = p;
				_d = d;
				return;
			}
			if (depth > _relTol * sep + a)
			{
				sep = depth;
				refEdgeNormal = d;
				refEdgeVertex = p;
				supportVertex = s;
				flip = 1;
			}
			
			p = p.next;
			d = d.next;
		}
		while (p != p0);
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal, 1);
	}
	
	//find support vertex on poly along basis vectors using hill climbing
	
	inline static function _xSupportMinPoly(s:Vertex):Vertex
	{
		while (true)
		{
			if (s.prev.x > s.x) s = s.prev;
			else
			if (s.next.x > s.x) s = s.next;
			else break;
		}
		return s;
	}
	
	inline static function _xSupportMaxPoly(s:Vertex):Vertex
	{
		while (true)
		{
			if (s.prev.x < s.x) s = s.prev;
			else
			if (s.next.x < s.x) s = s.next;
			else break;
		}
		return s;
	}
	
	inline static function _ySupportMinPoly(s:Vertex):Vertex
	{
		while (true)
		{
			if (s.prev.y > s.y) s = s.prev;
			else
			if (s.next.y > s.y) s = s.next;
			else break;
		}
		return s;
	}
	
	inline static function _ySupportMaxPoly(s:Vertex):Vertex
	{
		while (true)
		{
			if (s.prev.y < s.y) s = s.prev;
			else
			if (s.next.y < s.y) s = s.next;
			else break;
		}
		return s;
	}
	
	//find support vertex on AABB along direction -d
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
	
	inline static function _separation(p:Vertex, d:Vertex, s:Vertex):Float { return d.x * (s.x - p.x) + d.y * (s.y - p.y); }
}