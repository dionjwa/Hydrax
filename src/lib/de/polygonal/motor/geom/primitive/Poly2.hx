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
package de.polygonal.motor.geom.primitive;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.shape.feature.Edge;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.core.math.Mat32;

enum PolygonType
{
	NotConvex;
	NotConvexDegenerate;
	ConvexCCW;
	ConvexCW;
	ConvexDegenerate;
}

/**
 * A two-dimensional convex polygon in clockwise order.
 */
class Poly2
{
	/**
	 * Determine polygon type.<br/>
	 * C code from the article "Testing the Convexity of a Polygon" by Peter Schorn and Frederick Fisher,
	 * (schorn@inf.ethz.ch, fred@kpc.com) in "Graphics Gems IV", Academic Press, 1994
	 */
	public static function classify(vertexList:Array<Vec2>):PolygonType
	{
		var nvert = vertexList.length;
		if  (nvert < 3) return ConvexDegenerate;
		
		var iread, curDir, thisDir, dirChanges = 0, angleSign = 0;
		
		var pSecond = null, pThird, pSaveSecond;
		var dprev   = new Vec2();
		var dcur    = new Vec2();
		var cross;
		
		iread = 1;
		while (true)
		{
			pSecond = vertexList[iread++];
			dprev.x = pSecond.x - vertexList[0].x;
			dprev.y = pSecond.y - vertexList[0].y;
			if (dprev.x != 0 || dprev.y != 0) break;
			if (iread >= nvert) return ConvexDegenerate;
		}
		
		pSaveSecond = pSecond;
		var curDir = (dprev.x > 0) ? -1 : (dprev.x < 0) ?  1 : (dprev.y > 0) ? -1 : (dprev.y < 0) ?  1 : 0;
		
		while (iread < nvert)
		{
			pThird = vertexList[iread++];
			dcur.x = pThird.x - pSecond.x;
			dcur.y = pThird.y - pSecond.y;
			if (dcur.x == .0 && dcur.y == .0) continue;
			thisDir = (dcur.x > 0) ? -1 : (dcur.x < 0) ?  1 : (dcur.y > 0) ? -1 : (dcur.y < 0) ?  1 : 0;
			if (thisDir == -curDir) ++dirChanges;
			curDir = thisDir;
			cross = Vec2Util.perpDot2(dprev, dcur);
			if (cross > 0)
			{
				if (angleSign == -1) return NotConvex;
				angleSign = 1;
			}
			else
			if (cross < 0)
			{
				if (angleSign == 1) return NotConvex;
				angleSign = -1;
			}
			pSecond = pThird;
			dprev.x = dcur.x;
			dprev.y = dcur.y;
		}
		
		pThird = vertexList[0];
		dcur.x = pThird.x - pSecond.x;
		dcur.y = pThird.y - pSecond.y;
		if (((dcur.x > 0) ? -1 : (dcur.x < 0) ?  1 : (dcur.y > 0) ? -1 : (dcur.y < 0) ?  1 : 0) != 0)
		{
			thisDir = (dcur.x > 0) ? -1 : (dcur.x < 0) ?  1 : (dcur.y > 0) ? -1 : (dcur.y < 0) ?  1 : 0;
			if (thisDir == -curDir) ++dirChanges;
			curDir = thisDir;
			cross = Vec2Util.perpDot2(dprev, dcur);
			if (cross > 0)
			{
				if (angleSign == -1) return NotConvex;
				angleSign = 1;
			}
			else
			if (cross < 0)
			{
				if (angleSign == 1) return NotConvex;
				angleSign = -1;
			}
			pSecond = pThird;
			dprev.x = dcur.x;
			dprev.y = dcur.y;
		}
		
		dcur.x = pSaveSecond.x - pSecond.x;
		dcur.y = pSaveSecond.y - pSecond.y;
		
		thisDir = (dcur.x > 0) ? -1 : (dcur.x < 0) ?  1 : (dcur.y > 0) ? -1 : (dcur.y < 0) ?  1 : 0;
		if (thisDir == -curDir) ++dirChanges;
		curDir = thisDir;
		cross = Vec2Util.perpDot2(dprev, dcur);
		if (cross > 0)
		{
			if (angleSign == -1) return NotConvex;
			angleSign = 1;
		}
		else
		if (cross < 0)
		{
			if (angleSign == 1) return NotConvex;
			angleSign = -1;
		}
		pSecond = pThird;
		dprev.x = dcur.x;
		dprev.y = dcur.y;
		
		if (dirChanges > 2)
			return angleSign != 0 ? NotConvex : NotConvexDegenerate;
		if (angleSign < 0) return ConvexCCW;
		if (angleSign > 0) return ConvexCW;
		return ConvexDegenerate;
	}
	
	/** Computes the polygon centroid and returns the area. */
	public static function computeCentroidAndArea(vertexList:Array<Vec2>, out:Vec2):Float
	{
		var k = vertexList.length;
		var cx = .0, cy = .0, area = .0;
		for (i in 0...k - 1)
		{
			var v2 = vertexList[i];
			var v3 = vertexList[i + 1];
			var triArea = .5 * Vec2Util.perpDot2(v2, v3);
			area += triArea;
			cx += triArea * (1 / 3) * (v2.x + v3.x);
			cy += triArea * (1 / 3) * (v2.y + v3.y);
		}
		
		var v2 = vertexList[k - 1];
		var v3 = vertexList[0];
		var triArea = .5 * Vec2Util.perpDot2(v2, v3);
		area += triArea;
		cx += triArea * (1 / 3) * (v2.x + v3.x);
		cy += triArea * (1 / 3) * (v2.y + v3.y);
		
		out.x = cx / area;
		out.y = cy / area;
		
		return area;
	}
	
	/**
	 * Computes the signed area of a convex polygon. The area is positive for polygons in clockwise
	 * order (CW) and negative for polygons in counterclockwise order (CCW).
	 */
	public static function computeArea(vertexList:Array<Vec2>):Float
	{
		var v0 = vertexList[0];
		var v1 = v0;
		var v2 = vertexList[1];
		var area = .5 * Vec2Util.perpDot2(v1, v2);
		for (i in 1...vertexList.length - 1)
		{
			v1 = v2;
			v2 = vertexList[i + 1];
			area += .5 * Vec2Util.perpDot2(v1, v2);
		}
		area += .5 * Vec2Util.perpDot2(v2, v0);
		return area;
	}
	
	public static function createBlob(numSides:Int, radius:Float):Poly2
	{
		var span = Mathematics.PI2 / numSides;
		var vertexList = new Array<Vec2>();
		for (i in 0...numSides)
		{
			var x = Math.cos(i * span) * radius;
			var y = Math.sin(i * span) * radius;
			vertexList[i] = new Vec2(x, y);
		}
		
		return new Poly2(vertexList);
	}
	
	/** Circular doubly linked list of vertex features in world space. */
	public var worldVertexChain(default, null):Vertex;
	
	/** Circular doubly linked list of shape normals in world space. */
	public var worldNormalChain(default, null):Vertex;
	
	/** Circular doubly linked list of vertex features in local space. */
	public var localVertexChain(default, null):Vertex;
	
	/** Circular doubly linked list of shape normals in local space. */
	public var localNormalChain(default, null):Vertex;
	
	/** The shape vertex count. */
	public var vertexCount(default, null):Int;
	
	/** Local->World transform. */
	var _T:Mat32;
	
	public function new(vertexList:Array<Vec2>)
	{
		_T = new Mat32();
		
		vertexCount = vertexList.length;
		
		localVertexChain = _initEmptyVertexChain(vertexCount);
		worldVertexChain = _initEmptyVertexChain(vertexCount);
		
		localNormalChain = _initEmptyVertexChain(vertexCount);
		worldNormalChain = _initEmptyVertexChain(vertexCount);
		
		var v = localVertexChain;
		for (i in 0...vertexCount)
		{
			v.x = vertexList[i].x;
			v.y = vertexList[i].y;
			v = v.next;
		}
		
		//setup a circular doubly linked list for storing edge features
		var wn = worldNormalChain;
		var wv = worldVertexChain;
		
		var mn = localNormalChain;
		var v0 = localVertexChain;
		var v1 = v0.next;
		
		var m = Math;
		for (i in 0...vertexCount)
		{
			var ex = v1.x - v0.x;
			var ey = v1.y - v0.y;
			var norm = m.sqrt(ex * ex + ey * ey);
			ex /= norm;
			ey /= norm;
			var dir = new Vec2(ex, ey);
			
			var nx = ey;
			var ny =-ex;
			
			mn.x = nx;
			mn.y = ny;
			mn = mn.next;
			
			var e = new Edge();
			e.a = v0;
			e.b = v0.next;
			e.dir = dir;
			e.normal = mn;
			e.extent = norm / 2;
			e.length = norm;
			
			v0.edge = e;
			v0 = v1;
			v1 = v0.next;
			
			e = new Edge();
			e.a = wv;
			e.b = wv.next;
			e.dir = dir;
			e.normal = wn;
			e.extent = norm / 2;
			e.length = norm;
			
			wv.edge = e;
			wv = wv.next;
			wn = wn.next;
		}
		
		var v = localVertexChain;
		for (i in 0...vertexCount)
		{
			v.edge.next = v.next.edge;
			v.edge.prev = v.prev.edge;
			v = v.next;
		}
		v = worldVertexChain;
		for (i in 0...vertexCount)
		{
			v.edge.next = v.next.edge;
			v.edge.prev = v.prev.edge;
			v = v.next;
		}
		
		transform(0, 0, 0);
	}
	
	public function free():Void
	{
		worldVertexChain.free();
		worldNormalChain.free();
		localVertexChain.free();
		localNormalChain.free();
		
		worldVertexChain = null;
		worldNormalChain = null;
		localVertexChain = null;
		localNormalChain = null;
		_T               = null;
	}
	
	public var x(_xGetter, _xSetter):Float;
	inline function _xGetter():Float { return _T.tx; }
	inline function _xSetter(x:Float):Float
	{
		_T.tx = x;
		return x;
	}
	
	public var y(_yGetter, _ySetter):Float;
	inline function _yGetter():Float { return _T.ty; }
	inline function _ySetter(x:Float):Float
	{
		_T.ty = x;
		return x;
	}
	
	public function getWorldVertices(out:Array<Vec2>):Void
	{
		var v = worldVertexChain, v0 = v;
		var t;
		
		var i = 0;
		do
		{
			t = out[i++];
			t.x = v.x;
			t.y = v.y;
			v = v.next;
		}
		while (v != v0);
	}
	
	public function transform(x:Float, y:Float, r:Float):Void
	{
		_T.setupLocalToParent(x, y, r);
		
		var lv = localVertexChain, v0 = lv;
		var wv = worldVertexChain;
		
		var ln = localNormalChain;
		var wn = worldNormalChain;
		
		var c = Math.cos(r);
		var s = Math.sin(r);
		
		do
		{
			wv.x = x + (lv.x * c - lv.y * s);
			wv.y = y + (lv.x * s + lv.y * c);
			
			wv = wv.next;
			lv = lv.next;
			
			wn.x = ln.x * c - ln.y * s;
			wn.y = ln.x * s + ln.y * c;
			
			wn = wn.next;
			ln = ln.next;
		}
		while (lv != v0);
	}
	
	public function transformMatrix(T:Mat32):Void
	{
		var lv = localVertexChain, v0 = lv;
		var wv = worldVertexChain;
		
		var ln = localNormalChain;
		var wn = worldNormalChain;
		
		do
		{
			T.mul(lv, wv);
			
			wv = wv.next;
			lv = lv.next;
			
			T.mul22(ln, wn);
			
			wn = wn.next;
			ln = ln.next;
		}
		while (lv != v0);
	}
	
	inline public function getWorldPoint(x:Float, y:Float, out:Vec2):Void
	{
		out.x = _T.mulx(x, y);
		out.y = _T.muly(x, y);
	}
	
	inline public function getLocalPoint(x:Float, y:Float, out:Vec2):Void
	{
		out.x = _T.mulTx(x, y);
		out.y = _T.mulTy(x, y);
	}
	
	public function getBound(a:AABB2):AABB2
	{
		var wv = worldVertexChain, v0 = wv;
		
		var minX = wv.x;
		var minY = wv.y;
		
		var maxX = wv.x;
		var maxY = wv.y;
		
		do
		{
			if (wv.x < minX) minX = wv.x;
			else
			if (wv.x > maxX) maxX = wv.x;
			
			if (wv.y < minY) minY = wv.y;
			else
			if (wv.y > maxY) maxY = wv.y;
			
			wv = wv.next;
		}
		while (wv != v0);
		
		a.set4(minX, minY, maxX, maxY);
		return a;
	}
	
	function _initEmptyVertexChain(size:Int)
	{
		var v = new Vertex();
		var w = v;
		w.head = true;
		
		for (i in 1...size)
		{
			var v0 = w;
			var v1 = new Vertex();
			v1.i = i;
			v0.next = v1;
			v1.prev = v0;
			w = w.next;
		}
		
		w.tail = true;
		w.next = v;
		v.prev = w;
		
		return v;
	}
}