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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

/**
 * SAT collision detection of convex polygons.
 * Based on Morgan Kaufmann "Game Physics" by David H Eberly
 * (Chapter 5, Collision Detection with Convex Polyhedra)
 */
class CollidePoly extends ClipCollider
{
	inline public static var SUPPORT_BSP           = 1;
	inline public static var SUPPORT_HILL_CLIMBING = 2;
	
	var _supportType:Int;
	
	var _s:AbstractShape;
	var _p:Vertex;
	var _d:Vertex;
	
	public function new(settings:Settings, supportType:Int)
	{
		super(settings);
		_supportType = supportType;
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		_p = shape1.worldVertexChain;
		_d = shape1.worldNormalChain;
		_s = shape2;
	}
	
	override public function free():Void
	{
		_p = null;
		_d = null;
		_s = null;
	}
	
	override public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		s1.syncFeatures();
		s2.syncFeatures();
		
		//try early out by using previous separating line
		if (manifold.pointCount == 0)
		{
			var dx = _d.x;
			var dy = _d.y;
			
			//first try cached separation axis
			//query bsp tree
			var node = _s.BSPNode;
			
			//perp(N) * d <= 0 if d is CW from N
			while (node.R != null) node = Vec2Util.perpDot4(node.N.x, node.N.y, dx, dy) <= 0 ? node.R : node.L;
			
			//separating axis found, early out
			if (_separation(_p, dx, dy, node.V) > 0) return;
		}
		
		var sep1 = Mathematics.NEGATIVE_INFINITY;
		var refEdgeNormal1 = null;
		var refEdgeVertex1 = null;
		var supportVertex1 = null;
		
		var sep2 = Mathematics.NEGATIVE_INFINITY;
		var refEdgeNormal2 = null;
		var refEdgeVertex2 = null;
		var supportVertex2 = null;
		
		var flip = 0;
		
		switch (_supportType)
		{
			case SUPPORT_BSP:
			
				//using BSP accelerated support mapping
				//test separation axis of shape 1 against shape 2
				
				//poly1 vertex chain in world coordinates
				var p = s1.worldVertexChain, p0 = p;
				
				//poly1 edge normals in world coordinates
				var d = s1.worldNormalChain;
				
				var dx, dy, s, depth;
				
				do
				{
					//iterate over edge normals (d), and find a support vertex along -d for each one
					//compute separation: dot(s-p, d)
					dx = d.x;
					dy = d.y;
					s = _supportBSPQuery(s2, dx, dy);
					depth = _separation(p, dx, dy, s);
					
					//separating hyperplane exists so no overlap possible
					if (depth > 0)
					{
						manifold.pointCount = 0;
						
						//remember separating axis for subsequent tests
						_s = s2;
						_p = p;
						_d = d;
						return;
					}
					
					//track minimum separation (depth is negative and goes towards zero)
					if (depth > sep1)
					{
						//take depth as new separation
						sep1 = depth;
						refEdgeNormal1 = d;
						refEdgeVertex1 = p;
						supportVertex1 = s;
					}
					
					p = p.next;
					d = d.next;
				}
				while (p != p0);
				
				//flip roles - test separation axis of shape 2 against shape 1
				
				p = s2.worldVertexChain;
				d = s2.worldNormalChain;
				
				var p0 = p;
				do
				{
					//compute separation: dot(s-p, d)
					dx = d.x;
					dy = d.y;
					s = _supportBSPQuery(s1, dx, dy);
					depth = _separation(p, dx, dy, s);
					
					if (depth > 0)
					{
						_s = s1;
						_p = p;
						_d = d;
						manifold.pointCount = 0;
						return;
					}
					
					if (depth > sep2)
					{
						sep2 = depth;
						refEdgeNormal2 = d;
						refEdgeVertex2 = p;
						supportVertex2 = s;
					}
					
					p = p.next;
					d = d.next;
				}
				while (p != p0);
			
			case SUPPORT_HILL_CLIMBING:
				var dx, dy, s, depth;
				
				//using hill climbing for support mapping
				var p = s1.worldVertexChain, p0 = p;
				var d = s1.worldNormalChain;
				
				do
				{
					dx = d.x;
					dy = d.y;
					s = _supportHillClimbing(s2.worldVertexChain, dx, dy); 
					depth = _separation(p, dx, dy, s);
					if (depth > 0)
					{
						_s = s2;
						_p = p;
						_d = d;
						manifold.pointCount = 0;
						return;
					}
					
					if (depth > sep1)
					{
						sep1 = depth;
						refEdgeNormal1 = d;
						refEdgeVertex1 = p;
						supportVertex1 = s;
					}
					
					p = p.next;
					d = d.next;
				}
				while (p != p0);
				
				//flip roles - test separation axis of shape 2 against shape 1
				
				p = s2.worldVertexChain;
				d = s2.worldNormalChain;
				
				var p0 = p;
				do
				{
					dx = d.x;
					dy = d.y;
					s = _supportHillClimbing(s1.worldVertexChain, dx, dy); 
					depth = _separation(p, dx, dy, s);
					if (depth > 0)
					{
						_s = s1;
						_p = p;
						_d = d;
						manifold.pointCount = 0;
						return;
					}
					
					if (depth > sep2)
					{
						sep2 = depth;
						refEdgeNormal2 = d;
						refEdgeVertex2 = p;
						supportVertex2 = s;
					}
					
					p = p.next;
					d = d.next;
				}
				while (p != p0);
		}
		
		//prefer shape 1 separation over shape 2 separation (prevents feature flip-flop for improved coherence)
		if (sep2 > (sep1 * _relTol) + _absTol)
			_clip(manifold, s1, s2, 1, refEdgeVertex2, supportVertex2, refEdgeNormal2);
		else
			_clip(manifold, s1, s2, 0, refEdgeVertex1, supportVertex1, refEdgeNormal1);
	}
	
	inline static function _supportBSPQuery(shape:AbstractShape, dx:Float, dy:Float):Vertex
	{
		//query bsp tree
		var node = shape.BSPNode;
		while (node.R != null) node = Vec2Util.perpDot4(node.N.x, node.N.y, dx, dy) <= 0 ? node.R : node.L;
		
		//return support vertex
		return node.V;
	}
	
	inline static function _supportHillClimbing(s:Vertex, dx:Float, dy:Float):Vertex
	{
		//compute separation for first vertex
		var min1 = Vec2Util.dot4(dx, dy, s.x, s.y);
		
		//go left/right by comparing separation of adjacent vertices
		while (true)
		{
			var min0 = Vec2Util.dot4(dx, dy, s.prev.x, s.prev.y);
			if (min0 < min1)
			{
				s = s.prev;
				min1 = min0;
				continue;
			}
			
			min0 = Vec2Util.dot4(dx, dy, s.next.x, s.next.y);
			if (min0 < min1)
			{
				s = s.next;
				min1 = min0;
				continue;
			}
			break;
		}
		
		//return support vertex
		return s;
	}
	
	inline static function _supportBruteForce(s:Vertex, dx:Float, dy:Float):Vertex
	{
		var tmin = Mathematics.POSITIVE_INFINITY;
		var smin = s, s0 = s;
		
		do
		{
			var t = Vec2Util.dot4(dx, dy, s.x, s.y);
			if (t < tmin)
			{
				tmin = t;
				smin = s;
			}
			
			s = s.next;
		}
		while (s != s0);
		
		return smin;
	}
	
	inline static function _separation(p:Vertex, dx:Float, dy:Float, s:Vertex):Float
	{
		return dx * (s.x - p.x) + dy * (s.y - p.y);
	}
}