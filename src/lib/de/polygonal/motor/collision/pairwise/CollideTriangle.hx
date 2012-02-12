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

import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

class CollideTriangle extends ClipCollider
{
	inline public static var HINT_SHAPE1 = 1;
	inline public static var HINT_SHAPE2 = 2;
	
	var _p:Vertex;
	var _d:Vertex;
	var _hint:Int;
	
	public function new(settings:Settings)
	{
		super(settings);
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		_hint = 0;
	}
	
	override public function free():Void
	{
		_p = null;
		_d = null;
	}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		s1.syncFeatures();
		s2.syncFeatures();
		
		//try early out using previous separating line
		if (_hint != 0)
		{
			var dx = _d.x;
			var dy = _d.y;
			
			if (_hint == HINT_SHAPE1)
			{
				if (_separation(_p, dx, dy, _support(dx, dy, s2.v0, s2.v1, s2.v2)) > 0)
					return;
			}
			else
			{
				if (_separation(_p, dx, dy, _support(dx, dy, s1.v0, s1.v1, s1.v2)) > 0)
					return;
			}
		}
		
		_hint = 0;
		
		var dx, dy;
		var v0, v1, v2;
		var p, d, s;
		
		//check if projection interval of shape2 intersects shape1 along separating line
		//using shape1 edge normals as support direction
		
		v0 = s2.v0;
		v1 = s2.v1;
		v2 = s2.v2;
		
		//separating line 1
		p = s1.v0;
		d = s1.n0;
		dx = d.x;
		dy = d.y;
		s = _support(dx, dy, v0, v1, v2);
		var depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_p = p;
			_d = d;
			_hint = HINT_SHAPE1;
			manifold.pointCount = 0;
			return;
		}
		var sep = depth;
		var refFaceNormal = d;
		var refFaceVertex = p;
		var supportVertex = s;
		
		//separating line 2
		p = s1.v1;
		d = s1.n1;
		dx = d.x;
		dy = d.y;
		s = _support(dx, dy, v0, v1, v2);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_p = p;
			_d = d;
			_hint = HINT_SHAPE1;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refFaceNormal = d;
			refFaceVertex = p;
			supportVertex = s;
		}
		
		//separating line 3
		p = s1.v2;
		d = s1.n2;
		dx = d.x;
		dy = d.y;
		s = _support(dx, dy, v0, v1, v2);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_p = p;
			_d = d;
			_hint = HINT_SHAPE1;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refFaceNormal = d;
			refFaceVertex = p;
			supportVertex = s;
		}
		
		//check if projection interval of shape1 intersects shape2 along separating line
		//using shape2 edge normals as support direction
		
		var flip = 0;
		
		v0 = s1.v0;
		v1 = s1.v1;
		v2 = s1.v2;
		
		//separating line 1
		p = s2.v0;
		d = s2.n0;
		dx = d.x;
		dy = d.y;
		s = _support(dx, dy, v0, v1, v2);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_p = p;
			_d = d;
			_hint = HINT_SHAPE2;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refFaceNormal = d;
			refFaceVertex = p;
			supportVertex = s;
			flip = 1;
		}
		
		//separating line 2
		p = s2.v1;
		d = s2.n1;
		dx = d.x;
		dy = d.y;
		s = _support(dx, dy, v0, v1, v2);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_p = p;
			_d = d;
			_hint = HINT_SHAPE2;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refFaceNormal = d;
			refFaceVertex = p;
			supportVertex = s;
			flip = 1;
		}
		
		//separating line 3
		p = s2.v2;
		d = s2.n2;
		dx = d.x;
		dy = d.y;
		s = _support(dx, dy, v0, v1, v2);
		depth = _separation(p, dx, dy, s);
		if (depth > 0)
		{
			_p = p;
			_d = d;
			_hint = HINT_SHAPE2;
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			refFaceNormal = d;
			refFaceVertex = p;
			supportVertex = s;
			flip = 1;
		}
		
		_clip(manifold, s1, s2, flip, refFaceVertex, supportVertex, refFaceNormal);
	}
	
	inline static function _support(dx:Float, dy:Float, v0:Vertex, v1:Vertex, v2:Vertex):Vertex
	{
		var min0 = v0.x * dx + v0.y * dy;
		var min1 = v1.x * dx + v1.y * dy;
		if (min1 < min0)
		{
			if (v2.x * dx + v2.y * dy < min1)
				return v2;
			else
				return v1;
		}
		else
		if (v2.x * dx + v2.y * dy < min0)
			return v2; 
		else
			return v0;
	}
	
	inline static function _separation(p:Vertex, dx:Float, dy:Float, s:Vertex):Float
	{
		return dx * (s.x - p.x) + dy * (s.y - p.y);
	}
}