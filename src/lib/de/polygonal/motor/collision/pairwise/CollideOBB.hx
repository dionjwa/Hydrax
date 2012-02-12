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

class CollideOBB extends ClipCollider
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
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var T1 = s1.TWorld;
		var T2 = s2.TWorld;
		
		//try early out by using previous separating line
		if (_hint > 0)
		{
			switch (_hint)
			{
				case HINT_SHAPE1 | HINT_X_AXIS:
					if (_separation(s1.v3, s1.n3, _xSupportMin(T1, T2, s2)) > 0) return;
				
				case HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP:
					if (_separation(s1.v1, s1.n1, _xSupportMax(T1, T2, s2)) > 0) return;
				
				case HINT_SHAPE1:
					if (_separation(s1.v0, s1.n0, _ySupportMin(T1, T2, s2)) > 0) return;
				
				case HINT_SHAPE1 | HINT_FLIP:
					if (_separation(s1.v2, s1.n2, _ySupportMax(T1, T2, s2)) > 0) return;
				
				case HINT_SHAPE2 | HINT_X_AXIS:
					if (_separation(s2.v3, s2.n3, _xSupportMin(T2, T1, s1)) > 0) return;
				
				case HINT_SHAPE2 | HINT_X_AXIS | HINT_FLIP:
					if (_separation(s2.v1, s2.n1, _xSupportMax(T2, T1, s1)) > 0) return;
				
				case HINT_SHAPE2:
					if (_separation(s2.v0, s2.n0, _ySupportMin(T2, T1, s1)) > 0) return;
				
				case HINT_SHAPE2 | HINT_FLIP:
					if (_separation(s2.v2, s2.n2, _ySupportMax(T2, T1, s1)) > 0) return;
			}
		}
		
		//invalidate hint
		_hint = 0;
		
		var smin, smax;
		
		//the support mapping functions transforms the potential separating line (x/y axis) in world
		//coordinates of one shape to the local coordinates of the other shape:
		//DLocal = Dworld * R2^T (D=separating line direction, R=2x2 rotation matrix)
		//x-axis:
		//m11 * 0 + m12 * 1 -> x-axis x coordinate
		//m21 * 0 + m22 * 1 -> x-axis y coordinate
		//y-axis:
		//m11 * 1 + m12 * 0 -> x-axis x coordinate
		//m21 * 1 + m22 * 0 -> x-axis y coordinate
		
		//check if projection interval of OBB 2 intersects OBB 1 along separating line
		//using OBB 1 edge normals as support direction
		
		//find minimum separation along x-axis
		//shape 1 local x-axis as separating line
		if (_xLocalx(T1, T2) > 0)
		{
			if (_xLocaly(T1, T2) > 0)
			{
				smin = s2.v2;
				smax = s2.v0;
			}
			else
			{
				smin = s2.v1;
				smax = s2.v3;
			}
		}
		else
		{
			if (_xLocaly(T1, T2) > 0)
			{
				smin = s2.v3;
				smax = s2.v1;
			}
			else
			{
				smin = s2.v0;
				smax = s2.v2;
			}
		}
		
		//positive direction
		var p = s1.v3;
		var d = s1.n3;
		var depth = d.x * (smin.x - p.x) + d.y * (smin.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_X_AXIS;
			manifold.pointCount = 0;
			return;
		}
		var sep = depth;
		var refEdgeNormal = d;
		var refEdgeVertex = p;
		var supportVertex = smin;
		
		//negative direction
		p = s1.v1;
		d = s1.n1;
		depth = d.x * (smax.x - p.x) + d.y * (smax.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = smax;
		}
		
		//find minimum separation along y-axis
		//shape 1 local y-axis as separating line
		if (_yLocalx(T1, T2) > 0)
		{
			if (_yLocaly(T1, T2) > 0)
			{
				smin = s2.v2;
				smax = s2.v0;
			}
			else
			{
				smin = s2.v1;
				smax = s2.v3;
			}
		}
		else
		{
			if (_yLocaly(T1, T2) > 0)
			{
				smin = s2.v3;
				smax = s2.v1;
			}
			else
			{
				smin = s2.v0;
				smax = s2.v2;
			}
		}
		
		//positive direction
		p = s1.v0;
		d = s1.n0;
		depth = d.x * (smin.x - p.x) + d.y * (smin.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = smin;
		}
		
		//negative direction
		p = s1.v2;
		d = s1.n2;
		depth = d.x * (smax.x - p.x) + d.y * (smax.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_FLIP;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = smax;
		}
		
		//check if projection interval of OBB 1 intersects OBB 2 along separating line
		//using OBB 2 edge normals as support direction
		
		var flip = 0;
		
		//find minimum separation along x-axis
		//shape 2 local x-axis as separating line
		if (_xLocalx(T2, T1) > 0)
		{
			if (_xLocaly(T2, T1) > 0)
			{
				smin = s1.v2;
				smax = s1.v0;
			}
			else
			{
				smin = s1.v1;
				smax = s1.v3;
			}
		}
		else
		{
			if (_xLocaly(T2, T1) > 0)
			{
				smin = s1.v3;
				smax = s1.v1;
			}
			else
			{
				smin = s1.v0;
				smax = s1.v2;
			}
		}
		
		//positive direction
		p = s2.v3;
		d = s2.n3;
		depth = d.x * (smin.x - p.x) + d.y * (smin.y - p.y);
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
			refEdgeVertex = p;
			supportVertex = smin;
			flip = 1;
		}
		
		//negative direction
		p = s2.v1;
		d = s2.n1;
		depth = d.x * (smax.x - p.x) + d.y * (smax.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2 | HINT_X_AXIS | HINT_FLIP;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ex)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = smax;
			flip = 1;
		}
		
		//find minimum separation along x-axis
		//shape 2 local y-axis as separating line
		if (_yLocalx(T2, T1) > 0)
		{
			if (_yLocaly(T2, T1) > 0)
			{
				smin = s1.v2;
				smax = s1.v0;
			}
			else
			{
				smin = s1.v1;
				smax = s1.v3;
			}
		}
		else
		{
			if (_yLocaly(T2, T1) > 0)
			{
				smin = s1.v3;
				smax = s1.v1;
			}
			else
			{
				smin = s1.v0;
				smax = s1.v2;
			}
		}
		
		//positive direction
		p = s2.v0;
		d = s2.n0;
		depth = d.x * (smin.x - p.x) + d.y * (smin.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ey)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = smin;
			flip = 1;
		}
		
		//negative direction
		p = s2.v2;
		d = s2.n2;
		depth = d.x * (smax.x - p.x) + d.y * (smax.y - p.y);
		if (depth > 0)
		{
			_hint = HINT_SHAPE2 | HINT_FLIP;
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ey)
		{
			sep = depth;
			refEdgeNormal = d;
			refEdgeVertex = p;
			supportVertex = smax;
			flip = 1;
		}
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal);
	}
	
	//transforms source direction in world space to target direction in local space
	
	inline static function _xLocalx(source:Mat32, target:Mat32):Float { return target.mul22Tx(source.m11, source.m21); }
	inline static function _xLocaly(source:Mat32, target:Mat32):Float { return target.mul22Ty(source.m11, source.m21); }
	inline static function _yLocalx(source:Mat32, target:Mat32):Float { return target.mul22Tx(source.m12, source.m22); }
	inline static function _yLocaly(source:Mat32, target:Mat32):Float { return target.mul22Ty(source.m12, source.m22); }
	
	//find support vertex on shape s using T1 as support direction
	
	inline static function _xSupportMin(T1:Mat32, T2:Mat32, s:AbstractShape):Vertex
	{
		if (_xLocalx(T1, T2) > 0)
		{
			if (_xLocaly(T1, T2) > 0)
				return s.v2;
			else
				return s.v1;
		}
		else
		{
			if (_xLocaly(T1, T2) > 0)
				return s.v3;
			else
				return s.v0;
		}
	}
	
	inline static function _xSupportMax(T1:Mat32, T2:Mat32, s:AbstractShape):Vertex
	{
		if (_xLocalx(T1, T2) > 0)
		{
			if (_xLocaly(T1, T2) > 0)
				return s.v0;
			else
				return s.v3;
		}
		else
		{
			if (_xLocaly(T1, T2) > 0)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _ySupportMin(T1:Mat32, T2:Mat32, s:AbstractShape):Vertex
	{
		if (_yLocalx(T1, T2) > 0)
		{
			if (_yLocaly(T1, T2) > 0)
				return s.v2;
			else
				return s.v1;
		}
		else
		{
			if (_yLocaly(T1, T2) > 0)
				return s.v3;
			else
				return s.v0;
		}
	}
	
	inline static function _ySupportMax(T1:Mat32, T2:Mat32, s:AbstractShape):Vertex
	{
		if (_yLocalx(T1, T2) > 0)
		{
			if (_yLocaly(T1, T2) > 0)
				return s.v0;
			else
				return s.v3;
		}
		else
		{
			if (_yLocaly(T1, T2) > 0)
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