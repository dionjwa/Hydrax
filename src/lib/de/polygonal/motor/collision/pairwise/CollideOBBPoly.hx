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
import de.polygonal.ds.Bits;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.collision.shape.ShapeType;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.Settings;

using de.polygonal.ds.Bits;

class CollideOBBPoly extends ClipCollider
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
		_p = shape1.v0;
		_d = shape1.n0;
	}
	
	override public function free():Void
	{
		_p = null;
		_d = null;
	}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(s1.type == ShapeType.BOX, "s1.type == ShapeType.OBB");
		de.polygonal.core.util.Assert.assert(s2.type == ShapeType.POLY, "s2.type == ShapeType.POLY");
		#end
		
		//try early out using previous separating line
		if (_hint != 0)
		{
			switch (_hint)
			{
				case HINT_SHAPE1 | HINT_X_AXIS:
					var dx = s1.n0.x;
					var dy = s1.n0.y;
					if (_separation(s1.v0, dx, dy, _supportBSPQuery(s2, dx, dy)) > 0) return;
				
				case HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP:
					var dx = s1.n1.x;
					var dy = s1.n1.y;
					if (_separation(s1.v1, dx, dy, _supportBSPQuery(s2, dx, dy)) > 0) return;
				
				case HINT_SHAPE1:
					var dx = s1.n2.x;
					var dy = s1.n2.y;
					if (_separation(s1.v2, dx, dy, _supportBSPQuery(s2, dx, dy)) > 0) return;
				
				case HINT_SHAPE1 | HINT_FLIP:
					var dx = s1.n3.x;
					var dy = s1.n3.y;
					if (_separation(s1.v3, dx, dy, _supportBSPQuery(s2, dx, dy)) > 0) return;
				
				case HINT_SHAPE2:
					var dx = _d.x;
					var dy = _d.y;
					if (_separation(_p, dx, dy, _supportOBB(s1.TBody, dx, dy, s1)) > 0) return;
			}
		}
		
		//invalidate hint
		_hint = 0;
		
		//check if projection interval of poly intersects OBB along separating line
		//using OBB edge normals as support direction
		
		//positive x-axis
		var p = s1.v0;
		var d = s1.n0;
		var dx = d.x;
		var dy = d.y;
		var s = _supportBSPQuery(s2, dx, dy);
		var depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_X_AXIS;
			_p = p;
			_d = d;
			manifold.pointCount = 0;
			return;
		}
		var sep = depth;
		var refEdgeNormal = d;
		var refEdgeVertex = p;
		var supportVertex = s;
		
		//negative x-axis
		p = s1.v1;
		d = s1.n1;
		dx = d.x;
		dy = d.y;
		s = _supportBSPQuery(s2, dx, dy);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_X_AXIS | HINT_FLIP;
			_p = p;
			_d = d;
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
		
		//positive y-axis
		p = s1.v2;
		d = s1.n2;
		dx = d.x;
		dy = d.y;
		s = _supportBSPQuery(s2, dx, dy);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1;
			_p = p;
			_d = d;
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
		
		//negative y-axis
		p = s1.v3;
		d = s1.n3;
		dx = d.x;
		dy = d.y;
		s = _supportBSPQuery(s2, dx, dy);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_hint = HINT_SHAPE1 | HINT_FLIP;
			_p = p;
			_d = d;
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
		
		//check if projection interval of OBB intersects poly along separating line
		//using poly edge normals as support direction
		
		var flip = 0;
		
		var T = s1.TBody;
		p = s2.worldVertexChain;
		d = s2.worldNormalChain;
		
		var p0 = p;
		do
		{
			dx = d.x;
			dy = d.y;
			s = _supportOBB(T, dx, dy, s1);
			depth = _separation(p, dx, dy, s);
			if (depth > 0)
			{
				_hint = HINT_SHAPE2;
				_p = p;
				_d = d;
				manifold.pointCount = 0;
				return;
			}
			if (depth > _relTol * sep + p.edge.height * _absTol)
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
		
		_clip(manifold, s1, s2, flip, refEdgeVertex, supportVertex, refEdgeNormal);
	}
	
	inline static function _supportOBB(T:Mat32, dx:Float, dy:Float, s:AbstractShape):Vertex
	{
		//poly direction in local space of OBB
		if (T.mul22Tx(dx, dy) < 0)
		{
			if (T.mul22Ty(dx, dy) < 0)
				return s.v0;
			else
				return s.v3;
		}
		else
		{
			if (T.mul22Ty(dx, dy) < 0)
				return s.v1;
			else
				return s.v2;
		}
	}
	
	inline static function _supportBSPQuery(s:AbstractShape, dx:Float, dy:Float):Vertex
	{
		//query bsp tree
		var node = s.BSPNode;
		while (node.R != null) node = Vec2Util.perpDot4(node.N.x, node.N.y, dx, dy) <= 0 ? node.R : node.L;
		
		//return support vertex
		return node.V;
	}
	
	inline static function _separation(p:Vertex, dx:Float, dy:Float, s:Vertex):Float
	{
		return dx * (s.x - p.x) + dy * (s.y - p.y);
	}
}