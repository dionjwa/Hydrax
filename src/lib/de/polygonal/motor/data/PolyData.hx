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
package de.polygonal.motor.data;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.random.Random;
import de.polygonal.ds.DA;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.PolyShape;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.Poly2;
import de.polygonal.motor.Settings;

/**
 * A 'blueprint' for creating convex shapes.
 */
class PolyData extends ShapeData
{
	inline public static var AABB_FIT_SPHERE             = 1;
	inline public static var AABB_FIT_OBB                = 2;
	inline public static var AABB_FIT_POLY_HILL_CLIMBING = 3;
	inline public static var AABB_FIT_POLY_BRUTE_FORCE   = 4;
	
	/** AABB refit strategy. */
	public var boundingBoxFitType:Int;
	
	public var symmetric(default, null):Bool;
	
	var _vertexList:Array<Vec2>;
	
	public function new(density:Float, ?userData:Dynamic)
	{
		super(density, userData);
		boundingBoxFitType = AABB_FIT_OBB;
	}
	
	override public function getVertexList():Array<Vec2>
	{
		var tmp = new Array<Vec2>();
		for (v in _vertexList) tmp.push(new Vec2(v.x, v.y));
		return tmp;
	}
	
	public function setCustom(vertexList:Array<Float>, preflight = false):PolyData
	{
		if (preflight)
		{
			//validate user input
			var input = vertexList;
			
			if (input.length < 6) throw "malformed vertex chain: insufficient vertices";
			if (!Mathematics.isEven(input.length)) throw "malformed vertex chain: insufficient vertices";
			for (x in input)
			{
				if (Math.isNaN(x))
					throw "malformed vertex chain: found NaN";
			}
			
			var k = input.length >> 1;
			
			//build temporary vertex chain
			var chain = new Vertex(input[0], input[1]);
			var tmp:Array<Vec2> = cast [chain];
			var v0 = chain;
			
			var j = 2;
			for (i in 1...k)
			{
				var v1 = new Vertex(input[j], input[j + 1]);
				tmp.push(v1);
				j += 2;
				v0.next = v1;
				v0 = v1;
			}
			v0.next = chain;
			
			//classify polygon
			if (Poly2.classify(tmp) != PolygonType.ConvexCW)
				throw "invalid polygon type";
			
			//check for overlapping vertices
			var v0 = chain;
			for (i in 0...k - 1)
			{
				var v1 = v0.next;
				for (j in i + 1...k)
				{
					if ((v1.x - v0.x) * (v1.x - v0.x) + (v1.y - v0.y) * (v1.y - v0.y) < Mathematics.EPS)
						throw "malformed vertex chain: found overlapping vertices";
					v1 = v1.next;
				}
				v0 = v0.next;
			}
			
			//check for clockwise (CW) ordering
			var v0 = chain;
			var a = 0.0;
			for (i in 0...k)
			{
				var v1 = v0.next;
				a += v0.x * v1.y - v0.y * v1.x;
				v0 = v1;
			}
			if (a < 0) throw "malformed vertex chain: clockwise test failed";
			
			//check convexity (O(n^2))
			var v0 = chain;
			var v1 = v0.next;
			for (i in 0...k)
			{
				var ex = v1.x - v0.x;
				var ey = v1.y - v0.y;
				var n = v1.next;
				for (j in 0...k - 2)
				{
					if ((ex * (n.y - v0.y) - (n.x - v0.x) * ey ) < 0)
						throw "malformed vertex chain: convexity test failed";
					n = n.next;
				}
				v0 = v1;
				v1 = v0.next;
			}
		}
		
		_vertexList = new Array<Vec2>();
		var j = 0;
		for (i in 0...vertexList.length >> 1)
		{
			_vertexList.push(new Vec2(vertexList[j++], vertexList[j++]));
		}
		
		symmetric = false;
		
		return this;
	}
	
	public function setBox(w:Float, h:Float):PolyData
	{
		#if debug
		de.polygonal.core.util.Assert.assert(w > 0 && h > 0, "w > 0 && h > 0");
		#end
		
		var ex = w / 2;
		var ey = h / 2;
		
		_vertexList = new Array<Vec2>();
		_vertexList.push(new Vec2( ex, ey));
		_vertexList.push(new Vec2(-ex, ey));
		_vertexList.push(new Vec2(-ex,-ey));
		_vertexList.push(new Vec2( ex,-ey));
		
		symmetric = true;
		
		return this;
	}
	
	public function setCircle(numSides:Int, xRadius:Float, ?yRadius = .0):PolyData
	{
		#if debug
		de.polygonal.core.util.Assert.assert(numSides > 2 && xRadius > 0 && yRadius >= 0, "numSides > 2 && xRadius > 0 && yRadius >= 0");
		#end
		
		if (yRadius == 0) yRadius = xRadius;
		
		var span = Mathematics.PI2 / numSides;
		
		_vertexList = new Array<Vec2>();
		for (i in 0...numSides)
		{
			var x = Math.cos(i * span) * xRadius;
			var y = Math.sin(i * span) * yRadius;
			_vertexList.push(new Vec2(x, y));
		}
		
		symmetric = true;
		
		return this;
	}
	
	public function setCapsule(length:Float, capRadius1:Float, capRadius2:Float, capRes1:Int, capRes2:Int):PolyData
	{
		#if debug
		de.polygonal.core.util.Assert.assert(length > 0 && capRadius1 > 0 && capRadius2 > 0 && capRes1 > 1 && capRes2 > 1, "length > 0 && capRadius1 > 0 && capRadius2 > 0 && capRes1 > 1 && capRes2 > 1");
		#end
		
		var t1 = capRadius1;
		var t2 = capRadius2;
		var h2 = (length - t1 - t2);
		
		var span0 = Mathematics.PI / (capRes1 + 1);
		var span1 = Mathematics.PI / (capRes2 + 1);
		
		var data = new Array<Float>();
		
		var k;
		
		k = capRes1 + 1;
		for (i in 0...k + 1)
		{
			var x = Math.cos(i * span0) * t1;
			var y = Math.sin(i * span0) * t1 + h2;
			data.push(x);
			data.push(y);
		}
		
		k = capRes2 + 1;
		for (i in 0...k + 1)
		{
			var x = -Math.cos(i * span1) * t2;
			var y = -Math.sin(i * span1) * t2 - h2;
			data.push(x);
			data.push(y);
		}
		
		setCustom(data, true);
		
		return this;
	}
	
	public function setRandom(numSides:Int, xRadius:Float, ?yRadius = .0):PolyData
	{
		#if debug
		de.polygonal.core.util.Assert.assert(xRadius > 0 && yRadius >= 0 && numSides > 2, "xRadius > 0 && yRadius >= 0 && numSides > 2");
		#end
		
		if (yRadius == 0) yRadius = xRadius;
		
		var tmp = new DA<Vec2>();
		for (i in 0...numSides) tmp.pushBack(null);
		for (i in 0...numSides)
		{
			var p = new Vec2();
			p.x = Random.frandSym(1);
			p.y = Random.frandSym(1);
			p.unit();
			p.x *= xRadius;
			p.y *= yRadius;
			tmp.set(i, p);
		}
		
		tmp.sort(function (a:Vec2, b:Vec2):Int
		{
			var t0 = Math.atan2(a.y, a.x);
			var t1 = Math.atan2(b.y, b.x);
			return (t0 > t1) ? 1 : (t0 < t1) ? -1 : 0;
		});
		
		var data = new Array<Float>();
		for (i in 0...numSides)
		{
			data.push(tmp.get(i).x);
			data.push(tmp.get(i).y);
		}
		
		setCustom(data, true);
		
		return this;
	}
	
	public function shiftCentroidToLocalOrigin():Void
	{
		var c = new Vec2();
		Poly2.computeCentroidAndArea(_vertexList, c);
		for (v in _vertexList)
		{
			v.x -= c.x;
			v.y -= c.y;
		}
	}
	
	public function toString():String
	{
		var a = [];
		for (v in _vertexList)
		{
			a.push(de.polygonal.core.fmt.Sprintf.format("%.5f", [v.x]));
			a.push(de.polygonal.core.fmt.Sprintf.format("%.5f", [v.y]));
		}
		
		return '[' + a.join(',') + ']';
	}
	
	override public function clone():ShapeData
	{
		var copy = new PolyData(density);
		copy.symmetric = symmetric;
		copy.boundingBoxFitType = boundingBoxFitType;
		
		var tmp = new Array<Vec2>();
		for (v in _vertexList) tmp.push(new Vec2(v.x, v.y));
		
		copy._vertexList = tmp;
		copy._paste(this);
		return copy;
	}
	
	override public function getShapeClass():Class<AbstractShape>
	{
		return PolyShape;
	}
}