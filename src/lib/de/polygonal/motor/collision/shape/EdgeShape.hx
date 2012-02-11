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
package de.polygonal.motor.collision.shape;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.data.EdgeData;
import de.polygonal.motor.data.MassData;
import de.polygonal.motor.geom.closest.ClosestPointLine;
import de.polygonal.motor.geom.closest.ClosestPointSegment;
import de.polygonal.motor.geom.distance.DistancePointLine;
import de.polygonal.motor.geom.distance.DistancePointSegment;
import de.polygonal.core.math.Mat32;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;

using de.polygonal.ds.BitFlags;

//TODO define local transform for compound shapes
class EdgeShape extends AbstractShape
{
	var _coreVertex0:Vec2;
	var _coreVertex1:Vec2;
	
	public function new(data:EdgeData, world:World, settings:Settings)
	{
		super(data, world, settings);
		
		type = ShapeType.EDGE;
		
		if (data.infinite) setf(AbstractShape.EDGE_INFINITE);
		if (data.doubleSided) setf(AbstractShape.EDGE_DOUBLE_SIDED);
		
		vertexCount = 2;
		
		var a = data.a;
		var b = data.b;
		
		//bounding sphere radius
		var dx = a.x - b.x;
		var dy = a.y - b.y;
		radius = Math.sqrt(dx * dx + dy * dy) / 2;
		
		ex = radius;
		ey = radius;
		
		var vertexList = new Array<Vec2>();
		vertexList.push(a);
		vertexList.push(b);
		
		_setupFeatures(vertexList, new Vec2());
		
		var v = worldVertexChain;
		
		//cache endpoints vertices and normals for quick access
		v0 = worldVertexChain; v1 = v0.next;
		n0 = worldNormalChain; n1 = n0.next;
		
		//compute core shape
		var v = localVertexChain;
		var e = v.edge;
		
		_coreVertex0 = new Vec2();
		_coreVertex0.x = -_settings.toiSlop * (e.normal.x - e.dir.x) + v.x;
		_coreVertex0.y = -_settings.toiSlop * (e.normal.y - e.dir.y) + v.y;
		
		v = v.next;
		e = e.next;
		
		_coreVertex1 = new Vec2();
		_coreVertex1.x = -_settings.toiSlop * (e.normal.x - e.dir.x) + v.x;
		_coreVertex1.y = -_settings.toiSlop * (e.normal.y - e.dir.y) + v.y;
	}
	
	override public function computeMass():MassData
	{
		return new MassData();
	}
	
	override function _computeAABB(aabb:AABB2, T:Mat32):Void
	{
		//TODO inflate edge
		
		//var a = segment.a;
		//var b = segment.b;
		//
		//segment.getNormal(_tmp);
		//var nx = _tmp.x;
		//var ny = _tmp.y;
		//
		//var t = threshold;
		//
		//var v0x = a.x + nx * t + ny * t;
		//var v0y = a.y + ny * t - nx * t;
		//
		//var v1x = a.x - nx * t + ny * t;
		//var v1y = a.y - ny * t - nx * t;
		//
		//var v2x = b.x + nx * t - ny * t;
		//var v2y = b.y + ny * t + nx * t;
		//
		//var v3x = b.x - nx * t - ny * t;
		//var v3y = b.y - ny * t + nx * t;
		//
		//_bound.minX = v0x.fmin(v1x).fmin(v2x.fmin(v3x));
		//_bound.maxX = v0x.fmax(v1x).fmax(v2x.fmax(v3x));
		//_bound.minY = v0y.fmin(v1y).fmin(v2y.fmin(v3y));
		//_bound.maxY = v0y.fmax(v1y).fmax(v2y.fmax(v3y));
		//
		//b2Vec2 v1 = b2Mul(transform, m_v1);
		//b2Vec2 v2 = b2Mul(transform, m_v2);
		//aabb->lowerBound = b2Min(v1, v2);
		//aabb->upperBound = b2Max(v1, v2);

		if (hasf(AbstractShape.EDGE_INFINITE))
		{
			//clip plane against world bound
			
			var a = new Vec2();
			var b = new Vec2();
			
			T.mul(localVertexChain, a);
			T.mul(localVertexChain.next, b);
			
			if (_clip(aabb, a, b))
			{
				if (a.x < b.x)
				{
					aabb.minX = a.x;
					aabb.maxX = b.x;
				}
				else
				{
					aabb.minX = b.x;
					aabb.maxX = a.x;
				}
				
				if (a.y < b.y)
				{
					aabb.minY = a.y;
					aabb.maxY = b.y;
				}
				else
				{
					aabb.minY = b.y;
					aabb.maxY = a.y;
				}
				
				//avoid degenerated case
				if (aabb.intervalX < _settings.minAABBLineThickness)
				{
					var w = aabb.intervalX;
					aabb.minX -= _settings.minAABBLineThickness * .5 - w;
					aabb.maxX += _settings.minAABBLineThickness * .5 - w;
				}
				if (aabb.intervalY < _settings.minAABBLineThickness)
				{
					var h = aabb.intervalY;
					aabb.minY -= _settings.minAABBLineThickness * .5 - h;
					aabb.maxY += _settings.minAABBLineThickness * .5 - h;
				}
			}
			else
			{
				//plane does not Intersect world bound, freeze shape
			}
		}
		else
		{
			//TODO use tight bounding box
			//T = Mat32.concat(TLocal, T, _T);
			var v = localVertexChain;
			
			var x1 = T.mulx(v.x, v.y);
			var y1 = T.muly(v.x, v.y);
			
			v = v.next;
			
			var x2 = T.mulx(v.x, v.y);
			var y2 = T.muly(v.x, v.y);
			
			aabb.minX = Mathematics.fmin(x1, x2);
			aabb.minY = Mathematics.fmin(y1, y2);
			aabb.maxX = Mathematics.fmax(x1, x2);
			aabb.maxY = Mathematics.fmax(y1, y2);
			//aabb.minX = x - radius;
			//aabb.minY = y - radius;
			//aabb.maxX = x + radius;
			//aabb.maxY = y + radius;
		}
	}
	
	override public function computeSweptAABB(aabb:AABB2, T1:Mat32, T2:Mat32):Void
	{
		if (hasf(AbstractShape.EDGE_INFINITE)) return;
		
		var v = localVertexChain;
		
		var x11 = T1.mulx(v.x, v.y);
		var y11 = T1.muly(v.x, v.y);
		
		var x12 = T2.mulx(v.x, v.y);
		var y12 = T2.muly(v.x, v.y);
		
		v = v.next;
		
		var x21 = T1.mulx(v.x, v.y);
		var y21 = T1.muly(v.x, v.y);
		
		var x22 = T2.mulx(v.x, v.y);
		var y22 = T2.muly(v.x, v.y);
		
		aabb.minX = Mathematics.fmin(Mathematics.fmin(x11, x12), Mathematics.fmin(x21, x22));
		aabb.minY = Mathematics.fmin(Mathematics.fmin(y11, y12), Mathematics.fmin(y21, y22));
		aabb.maxX = Mathematics.fmax(Mathematics.fmax(x11, x12), Mathematics.fmin(x21, x22));
		aabb.maxY = Mathematics.fmax(Mathematics.fmax(y11, y12), Mathematics.fmin(y21, y22));
	}
	
	override public function updateSweepRadius(localCenter:Vec2):Void
	{
		var cx = localCenter.x;
		var cy = localCenter.y;
		
		var dx, dy, d1, d2;
		
		dx = _coreVertex0.x - cx;
		dy = _coreVertex0.y - cy;
		d1 = Vec2Util.dot4(dx, dy, dx, dy);
		
		dx = _coreVertex1.x - cx;
		dy = _coreVertex1.y - cy;
		d2 = Vec2Util.dot4(dx, dy, dx, dy);
		
		sweepRadius = Math.sqrt(Mathematics.fmax(d1, d2));
	}
	
	override public function closestPoint(p:Vec2, q:Vec2):Vec2
	{
		var px = p.x;
		var py = p.y;
		var lx = TWorld.mulTx(px, py);
		var ly = TWorld.mulTy(px, py);
		
		var a = localVertexChain;
		var b = a.next;
		
		if (hasf(AbstractShape.EDGE_INFINITE))
			ClosestPointLine.find6(lx, ly, a.x, a.y, b.x, b.y, q);
		else
			ClosestPointSegment.find6(lx, ly, a.x, a.y, b.x, b.y, q);
		
		TWorld.mul(q, q);
		return q;
	}
	
	override public function containsPoint(p:Vec2):Bool
	{
		var px = p.x;
		var py = p.y;
		var lx = TWorld.mulTx(px, py);
		var ly = TWorld.mulTy(px, py);
		
		var a = localVertexChain;
		var b = a.next;
		
		if (hasf(AbstractShape.EDGE_INFINITE))
			return DistancePointLine.find6(lx, ly, a.x, a.y, b.x, b.y) < _settings.eps;
		else
			return DistancePointSegment.find6(lx, ly, a.x, a.y, b.x, b.y) < _settings.eps;
		
		return false;
	}

	override public function syncFeatures(?T:Mat32):Void
	{
		if (T == null) T = TWorld;
		
		T.mul(localVertexChain, v0);
		T.mul(localVertexChain.next, v1);
		
		T.mul22(localNormalChain, n0);
		T.mul22(localNormalChain.next, n1);
	}

	function _clip(aabb:AABB2, cp1:Vec2, cp2:Vec2):Bool
	{
		//clip plane against world bound
		var d = worldVertexChain.edge.dir;
		var bound = _settings.worldBound;
		
		var tmin = Mathematics.NEGATIVE_INFINITY;
		var tmax = Mathematics.POSITIVE_INFINITY;
		
		var _x = .0;
		var _y = .0;
		
		if (Mathematics.fabs(d.x) < _settings.eps)
		{
			if (_x < bound.minX) return false;
			if (_x > bound.maxX) return false;
		}
		else
		{
			var t1 = (bound.minX - _x) / d.x;
			var t2 = (bound.maxX - _x) / d.x;
			
			if (t1 > t2)
			{
				var tmp = t1; t1 = t2; t2 = tmp;
			}
			
			if (t1 > tmin) tmin = t1;
			if (t2 < tmax) tmax = t2;
			if (tmin > tmax) return false;
		}
		
		if (Mathematics.fabs(d.y) < _settings.eps)
		{
			if (_y < bound.minY) return false;
			if (_y > bound.maxY) return false;
		}
		else
		{
			var t1 = (bound.minY - _y) / d.y;
			var t2 = (bound.maxY - _y) / d.y;
			
			if (t1 > t2)
			{
				var tmp = t1; t1 = t2; t2 = tmp;
			}
			
			if (t1 > tmin) tmin = t1;
			if (t2 < tmax) tmax = t2;
			if (tmin > tmax) return false;
		}
		
		cp1.x = _x + d.x * tmin;
		cp1.y = _y + d.y * tmin;
		cp2.x = _x + d.x * tmax;
		cp2.y = _y + d.y * tmax;
		return true;
	}
}