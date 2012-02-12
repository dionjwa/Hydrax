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
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.Settings;

using de.polygonal.ds.Bits;
using de.polygonal.ds.BitFlags;

class CollideAABBOBB extends ClipCollider
{
	inline static var HINT_SHAPE1 = Bits.BIT_01;
	inline static var HINT_SHAPE2 = Bits.BIT_02;
	inline static var HINT_X_AXIS = Bits.BIT_03;
	inline static var HINT_FLIP   = Bits.BIT_04;
	
	var _hint:Int;
	
	public function new(settings:Settings)
	{
		super(settings);
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		_hint = 0;
	}
	
	override public function free():Void {}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(s1.hasf(AbstractShape.AXIS_ALIGNED), "s1.hasf(AbstractShape.AXIS_ALIGNED)");
		#end
		
		var T2 = s2.TWorld;
		
		//try early out by using previous separating line
		if (_hint != 0)
		{
			switch (_hint)
			{
				case HINT_SHAPE1 | HINT_X_AXIS:
					if (_xSupportMinOBB(s2, T2).x - s1.aabb.maxX > 0) return;
				
				case HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP:
					if (s1.aabb.minX - _xSupportMaxOBB(s2, T2).x > 0) return;
				
				case HINT_SHAPE1:
					if (_ySupportMinOBB(s2, T2).y - s1.aabb.maxY > 0) return;
				
				case HINT_SHAPE1 | HINT_FLIP:
					if (s1.aabb.minY - _ySupportMaxOBB(s2, T2).y > 0) return;
				
				case HINT_SHAPE2 | HINT_X_AXIS:
					if (_separation(s2.v3, s2.n3, _supportAABB(s1, s2.n3)) > 0) return;
				
				case HINT_SHAPE2 | HINT_X_AXIS | HINT_FLIP:
					if (_separation(s2.v1, s2.n1, _supportAABB(s1, s2.n1)) > 0) return;
				
				case HINT_SHAPE2:
					if (_separation(s2.v0, s2.n0, _supportAABB(s1, s2.n0)) > 0) return;
				
				case HINT_SHAPE2 | HINT_FLIP:
					if (_separation(s2.v2, s2.n2, _supportAABB(s1, s2.n2)) > 0) return;
			}
		}
		
		//invalidate hint
		_hint = 0;
		
		var bound = s1.aabb;
		
		//check if projection interval of OBB intersects AABB along separating line
		//using AABB normals as support direction
		
		//basis vector [1,0]
		var s = _xSupportMinOBB(s2, T2);
		
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
		s = s.next.next;
		depth = bound.minX - s.x;
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP;
			manifold.pointCount = 0;
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
		s = _ySupportMinOBB(s2, T2);
		depth = s.y - s1.aabb.maxY;
		if (depth > 0)
		{
			_hint = HINT_SHAPE1;
			manifold.pointCount = 0;
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
		s = s.next.next;
		depth = s1.aabb.minY - s.y;
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_FLIP;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = s1.n2;
			refEdgeVertex = s1.v2;
			supportVertex = s;
		}
		
		//check if projection interval of AABB intersects OBB along separating line
		//using OBB normals as support direction
		
		var flip = 0;
		
		//OBB local [1,0]
		var d = s2.n3;
		s = _supportAABB(s1, d);
		depth = _separation(s2.v3, d, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2 | HINT_X_AXIS;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ex)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = s2.v3;
			supportVertex = s;
			flip = 1;
		}
		
		//OBB local [-1,0]
		d = d.next.next;
		s = s.next.next;
		depth = _separation(s2.v1, d, s);
		if (depth > 0)
		{
			manifold.pointCount = 0;
			_hint = HINT_SHAPE2 | HINT_X_AXIS | HINT_FLIP;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ex)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = s2.v1;
			supportVertex = s;
			flip = 1;
		}
		
		//OBB local [0,1]
		d = s2.n0;
		s = _supportAABB(s1, d);
		depth = _separation(s2.v0, d, s);
		if (depth > 0)
		{
			manifold.pointCount = 0;
			_hint = HINT_SHAPE2;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ey)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = s2.v0;
			supportVertex = s;
			flip = 1;
		}
		
		//OBB local [0,-1]
		d = d.next.next;
		s = s.next.next;
		depth = _separation(s2.v2, d, s);
		if (depth > 0)
		{
			manifold.pointCount = 0;
			_hint = HINT_SHAPE2 | HINT_FLIP;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ey)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = s2.v2;
			supportVertex = s;
			flip = 1;
		}
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal, 1);
	}
	
	//find support vertex on OBB along basis vectors
	
	inline static function _xSupportMinOBB(s:AbstractShape, T:Mat32):Vertex
	{
		if (T.m11 > 0)
			if (T.m12 > 0)
				return s.v2;
			else
				return s.v1;
		else
			if (T.m12 > 0)
				return s.v3;
			else
				return s.v0;
	}
	
	inline static function _xSupportMaxOBB(s:AbstractShape, T:Mat32):Vertex
	{
		if (T.m11 > 0)
			if (T.m12 > 0)
				return s.v0;
			else
				return s.v3;
		else
			if (T.m12 > 0)
				return s.v1;
			else
				return s.v2;
	}
	
	inline static function _ySupportMinOBB(s:AbstractShape, T:Mat32):Vertex
	{
		if (T.m21 > 0)
			if (T.m22 > 0)
				return s.v2;
			else
				return s.v1;
		else
			if (T.m22 > 0)
				return s.v3;
			else
				return s.v0;
	}
	
	inline static function _ySupportMaxOBB(s:AbstractShape, T:Mat32):Vertex
	{
		if (T.m21 > 0)
			if (T.m22 > 0)
				return s.v0;
			else
				return s.v3;
		else
			if (T.m22 > 0)
				return s.v1;
			else
				return s.v2;
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
	
	inline static function _separation(p:Vertex, d:Vertex, s:Vertex):Float
	{
		return d.x * (s.x - p.x) + d.y * (s.y - p.y);
	}
}