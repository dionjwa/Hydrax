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
import de.polygonal.ds.ArrayUtil;
import de.polygonal.ds.BinaryTreeNode;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.data.MassData;
import de.polygonal.motor.data.PolyData;
import de.polygonal.motor.geom.bsp.ConvexBSP;
import de.polygonal.motor.geom.bsp.ConvexBSPNode;
import de.polygonal.motor.geom.bv.MinimumAreaRectangle;
import de.polygonal.motor.geom.closest.ClosestPointPoly;
import de.polygonal.motor.geom.inside.PointInsidePoly;
import de.polygonal.core.math.Mat22;
import de.polygonal.core.math.Mat32;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.geom.primitive.OBB2;
import de.polygonal.motor.geom.primitive.Poly2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;

using de.polygonal.ds.BitFlags;

class PolyShape extends AbstractShape
{
	//temporary transform used for PolyData.AABB_FIT_POLY
	var _TTmp:Mat32;
	
	//OBB for refitting AABB
	var _obb:OBB2;
	
	//extremal vertices along cardinal axis used for PolyData.AABB_FIT_POLY
	var _minX:Vertex; var _maxX:Vertex;
	var _minY:Vertex; var _maxY:Vertex;
	
	//shrunken core shape for computing sweep radius
	var _coreVertexChain:Vertex;
	
	//mainly used by closest point/containment computations.
	var _vertexList:Array<Vec2>;
	
	//shape area
	var _area:Float;
	
	public function new(data:PolyData, world:World, settings:Settings)
	{
		super(data, world, settings);
		
		type = ShapeType.POLY;
		
		setiff(AbstractShape.SYMMETRIC, data.symmetric);
		_vertexList = data.getVertexList();
		
		switch (data.boundingBoxFitType)
		{
			case PolyData.AABB_FIT_SPHERE:
				setf(AbstractShape.AABB_FIT_SPHERE);
			
			case PolyData.AABB_FIT_OBB:
				setf(AbstractShape.AABB_FIT_OBB);
			
			case PolyData.AABB_FIT_POLY_HILL_CLIMBING:
				setf(AbstractShape.AABB_FIT_POLY_HC);
			
			case PolyData.AABB_FIT_POLY_BRUTE_FORCE:
				setf(AbstractShape.AABB_FIT_POLY_BF);
		}
		
		//compute shape center and area
		var localCenter = new Vec2();
		_area = Poly2.computeCentroidAndArea(_vertexList, localCenter);
		
		#if debug
		de.polygonal.core.util.Assert.assert(_area > Mathematics.EPS, "area > Mathematics.EPSILON");
		#end
		
		if (Vec2Util.dot2(localCenter, localCenter) > Mathematics.EPS * Mathematics.EPS)
		{
			//shape origin doesn't coincide with shape center;
			//simplify by shifting the shape from the center to the origin...
			for (v in _vertexList)
			{
				v.x -= localCenter.x;
				v.y -= localCenter.y;
			}
			
			//and combine center offset with local transform
			var TCenter = new Mat32();
			TCenter.setupLocalToParent(localCenter.x, localCenter.y, 0);
			Mat32.concat(TCenter, TLocal, TLocal);
		}
		
		//set local transformation flag
		setiff(AbstractShape.HAS_LOCAL_TRANSFORM, TLocal.hasTranslation());
		
		//precompute minimum area oriented bounding box
		_obb = new OBB2();
		MinimumAreaRectangle.find(_vertexList, true, _obb);
		
		//bake down local transformation into OBB
		if (hasf(AbstractShape.HAS_LOCAL_TRANSFORM))
		{
			TLocal.mul(_obb.c, _obb.c);
			Mat22.concat(_obb.R, TLocal.getRotationMatrix(new Mat22()), _obb.R);	
		}
		
		//store shape extent
		ex = _obb.e.x;
		ey = _obb.e.y;
		
		//initialize vertex chains
		_setupFeatures(_vertexList, new Vec2());
		
		//compute core polygon shape
		_createCoreShape();
		
		//compute minimum bounding sphere relative to the centroid
		_computeMinimumBoundingSphere();
		
		//precompute BSP tree for accelerating support point queries
		_computeConvexBSP();
		
		//pick some initial potential extremal vertices
		_minX = worldVertexChain;
		_minY = worldVertexChain;
		_maxX = worldVertexChain;
		_maxY = worldVertexChain;
		
		_TTmp = new Mat32();
	}
	
	override public function free():Void
	{
		//TODO free
		super.free();
	}
	
	override public function computeMass():MassData
	{
		var cx = .0, cy = .0, I = .0;
		
		for (v in localVertexChain)
		{
			//apply local transformation to vertex chain
			var p1x = .0, p2x = TLocal.mulx(v.x, v.y), p3x = TLocal.mulx(v.next.x, v.next.y);
			var p1y = .0, p2y = TLocal.muly(v.x, v.y), p3y = TLocal.muly(v.next.x, v.next.y);
			
			var e1x = p2x - p1x;
			var e1y = p2y - p1y;
			
			var e2x = p3x - p1x;
			var e2y = p3y - p1y;
			
			var D = Vec2Util.perpDot4(e1x, e1y, e2x, e2y);
			
			var triangleArea = .5 * D;
			
			//area weighted centroid
			cx += triangleArea * (1 / 3) * (p1x + p2x + p3x);
			cy += triangleArea * (1 / 3) * (p1y + p2y + p3y);
			
			var intx2 = (1 / 3) * (.25 * (e1x * e1x + e2x * e1x + e2x * e2x) + (p1x * e1x + p1x * e2x)) + .5 * p1x * p1x;
			var inty2 = (1 / 3) * (.25 * (e1y * e1y + e2y * e1y + e2y * e2y) + (p1y * e1y + p1y * e2y)) + .5 * p1y * p1y;
			
			I += D * (intx2 + inty2);
		}
		
		var data = new MassData();
		data.mass = density * _area;
		data.center.x = cx / _area;
		data.center.y = cy / _area;
		data.I = density * I;
		if (hasf(AbstractShape.HAS_LOCAL_TRANSFORM))
		{
			var tx = TLocal.tx;
			var ty = TLocal.ty;
			data.I += data.mass * Vec2Util.dot4(tx, ty, tx, ty);
		}
		
		return data;
	}
	
	override function _computeAABB(aabb:AABB2, T:Mat32):Void
	{
		if (hasf(AbstractShape.AABB_FIT_SPHERE))
		{
			var x = TLocal.tx;
			var y = TLocal.ty;
			var t = x;
			var x = T.mulx(t, y);
			var y = T.muly(t, y);
			aabb.minX = x - radius;
			aabb.minY = y - radius;
			aabb.maxX = x + radius;
			aabb.maxY = y + radius;
		}
		else
		if (hasf(AbstractShape.AABB_FIT_OBB))
		{
			var c = _obb.c;
			var minX = T.mulx(c.x, c.y), maxX = minX;
			var minY = T.muly(c.x, c.y), maxY = minY;
			
			var R = _obb.R, t;
			
			t = T.mul22x(R.m11, R.m21);
			minX += t * (t > 0 ? -ex :  ex);
			maxX += t * (t > 0 ?  ex : -ex);
			
			t = T.mul22y(R.m11, R.m21);
			minX += t * (t > 0 ? -ey :  ey);
			maxX += t * (t > 0 ?  ey : -ey);
			
			t = T.mul22x(R.m12, R.m22);
			minY += t * (t > 0 ? -ex :  ex);
			maxY += t * (t > 0 ?  ex : -ex);
			
			t = T.mul22y(R.m12, R.m22);
			minY += t * (t > 0 ? -ey :  ey);
			maxY += t * (t > 0 ?  ey : -ey);
			
			aabb.set4(minX, minY, maxX, maxY);
		}
		else
		if (hasf(AbstractShape.AABB_FIT_POLY_HC))
		{
			if (hasf(AbstractShape.HAS_LOCAL_TRANSFORM))
				syncFeatures(Mat32.concat(TLocal, T, _TTmp));
			else
				syncFeatures(T);
			
			var min1 = _minX.x, min2;
			while (true)
			{
				min2 = _minX.prev.x;
				if (min2 < min1) { min1 = min2; _minX = _minX.prev; continue; }
				min2 = _minX.next.x;
				if (min2 < min1) { min1 = min2; _minX = _minX.next; continue; }
				break;
			}
			min1 = _maxX.x;
			while (true)
			{
				min2 = _maxX.prev.x;
				if (min2 > min1) { min1 = min2; _maxX = _maxX.prev; continue; }
				min2 = _maxX.next.x;
				if (min2 > min1) { min1 = min2; _maxX = _maxX.next; continue; }
				break;
			}
			min1 = _minY.y;
			while (true)
			{
				min2 = _minY.prev.y;
				if (min2 < min1) { min1 = min2; _minY = _minY.prev; continue; }
				min2 = _minY.next.y;
				if (min2 < min1) { min1 = min2; _minY = _minY.next; continue; }
				break;
			}
			min1 = _maxY.y;
			while (true)
			{
				min2 = _maxY.prev.y;
				if (min2 > min1) { min1 = min2; _maxY = _maxY.prev; continue; }
				min2 = _maxY.next.y;
				if (min2 > min1) { min1 = min2; _maxY = _maxY.next; continue; }
				break;
			}
			
			aabb.set4(_minX.x, _minY.y, _maxX.x, _maxY.y);
		}
		else
		if (hasf(AbstractShape.AABB_FIT_POLY_BF))
		{
			if (hasf(AbstractShape.HAS_LOCAL_TRANSFORM))
				syncFeatures(Mat32.concat(TLocal, T, _TTmp));
			else
				syncFeatures(T);
			
			aabb.minX = Mathematics.POSITIVE_INFINITY;
			aabb.minY = Mathematics.POSITIVE_INFINITY;
			aabb.maxX = Mathematics.NEGATIVE_INFINITY;
			aabb.maxY = Mathematics.NEGATIVE_INFINITY;
			var v = worldVertexChain;
			for (i in 0...vertexCount)
			{
				aabb.minX = Mathematics.fmin(aabb.minX, v.x);
				aabb.minY = Mathematics.fmin(aabb.minY, v.y);
				aabb.maxX = Mathematics.fmax(aabb.maxX, v.x);
				aabb.maxY = Mathematics.fmax(aabb.maxY, v.y);
				v = v.next;
			}
		}
	}
	
	override public function updateSweepRadius(localCenter:Vec2):Void
	{
		var r = .0;
		
		//localCenter is in body space, so convert to shape space
		var lx = TLocal.mulTx(localCenter.x, localCenter.y);
		var ly = TLocal.mulTy(localCenter.x, localCenter.y);
		
		var v = _coreVertexChain, v0 = v;
		do
		{
			var dx = v.x - lx;
			var dy = v.y - ly;
			
			r = Mathematics.fmax(r, dx * dx + dy * dy);
			v = v.next;
		}
		while (v != v0);
		
		sweepRadius = Math.sqrt(r);
	}
	
	override public function closestPoint(p:Vec2, q:Vec2):Vec2
	{
		var px = p.x;
		var py = p.y;
		var lx = TWorld.mulTx(px, py);
		var ly = TWorld.mulTy(px, py);
		ClosestPointPoly.find3(lx, ly, _vertexList, q);
		TWorld.mul(q, q);
		return q;
	}
	
	override public function containsPoint(p:Vec2):Bool
	{
		var px = p.x;
		var py = p.y;
		var lx = TWorld.mulTx(px, py);
		var ly = TWorld.mulTy(px, py);
		return PointInsidePoly.testArray3(lx, ly, _vertexList);
	}
	
	override public function syncFeatures(?T:Mat32):Void
	{
		//if (hasf(AbstractShape.FEATURES_SYNCED)) return; //TODO sync flag
		//setf(AbstractShape.FEATURES_SYNCED);
		
		if (T == null) T = TWorld;
		
		var wv = worldVertexChain;
		var wn = worldNormalChain;
		
		var mv = localVertexChain;
		var mn = localNormalChain;
		
		var wv0 = wv;
		do
		{
			T.mul(mv, wv);
			T.mul22(mn, wn);
			
			wv = wv.next;
			mv = mv.next;
			wn = wn.next;
			mn = mn.next;
		}
		while (wv != wv0);
	}
	
	function _createCoreShape():Void
	{
		//create core polygon shape by shifting edges inward
		var coreVertices = new Array<Vec2>();
		
		var n1 = localNormalChain.prev;
		var n2 = localNormalChain; 
		
		var slop = _settings.toiSlop;
		
		for (v in localVertexChain)
		{
			var vx = v.x;
			var vy = v.y;
			
			var dx = Vec2Util.dot4(n1.x, n1.y, vx, vy) - slop;
			var dy = Vec2Util.dot4(n2.x, n2.y, vx, vy) - slop;
			
			//shifting the edge inward by TOI_SLOP should
			//not cause the plane to pass the centroid
			//your shape has a radius/extent less than TOI_SLOP
			#if debug
			de.polygonal.core.util.Assert.assert(dx >= 0, "dx >= 0");
			de.polygonal.core.util.Assert.assert(dy >= 0, "dy >= 0");
			#end
			
			var det = 1 / (n1.x * n2.y - n1.y * n2.x);
			var tx = det * (n2.y * dx - n1.y * dy);
			var ty = det * (n1.x * dy - n2.x * dx);
			
			coreVertices.push(new Vec2(tx, ty));
			
			n1 = n1.next;
			n2 = n2.next;
		}
		
		_coreVertexChain = Vertex.ofArray(cast coreVertices);
	}
	
	function _computeMinimumBoundingSphere():Void
	{
		var rSq = Math.NEGATIVE_INFINITY;
		for (v in localVertexChain) rSq = Mathematics.fmax(rSq, Vec2Util.dot2(v, v));
		radius = Math.sqrt(rSq);
	}
	
	function _computeConvexBSP():Void
	{
		//cache up to 4 vertices
		var v = worldVertexChain;
		v0 = v; v = v.next;
		v1 = v; v = v.next;
		v2 = v; v = v.next;
		if (vertexCount == 4) v3 = v;
		
		v = worldNormalChain;
		n0 = v; v = v.next;
		n1 = v; v = v.next;
		n2 = v; v = v.next;
		if (vertexCount == 4) n3 = v;
		
		if (vertexCount == 3)
		{
			//bsp tree for triangles used by extremal search
			var node = new ConvexBSPNode<Vertex>();
			node.I = 0;
			node.N = n0;
			
			//root->left
			node.L = new ConvexBSPNode<Vertex>();
			node.L.I = 2;
			node.L.N = n2;
				
				//root->left->left
				node.L.L = new ConvexBSPNode<Vertex>();
				node.L.L.I = 2;
				node.L.L.V = v2;
				
				//root->left->right
				node.L.R = new ConvexBSPNode<Vertex>();
				node.L.R.I = 0;
				node.L.R.V = v0;
			
			//root->right
			node.R = new ConvexBSPNode<Vertex>();
			node.R.I = 1;
			node.R.N = n1;
			
				//root->right->left
				node.R.L = new ConvexBSPNode<Vertex>();
				node.R.L.I = 1;
				node.R.L.V = v1;
				
				//root->right->right
				node.R.R = new ConvexBSPNode<Vertex>();
				node.R.R.I = 2;
				node.R.R.V = v2;
			
			BSPNode = node;
		}
		else
		{
			var edgeList = new Array<Vec2>();
			for (v in localVertexChain) edgeList.push(v.edge.dir);
			var normalList = Vertex.toArray(localNormalChain);
			
			var tree = new ConvexBSP<Vertex>(vertexCount, cast normalList, cast edgeList).tree;
			
			var wn = worldNormalChain;
			var wv = worldVertexChain;
			
			var visit = function(node:BinaryTreeNode<ConvexBSPNode<Vertex>>, userData:Dynamic):Bool
			{
				var val = node.val;
				
				//store vertex/normal index
				val.N = wn.getAt(val.I);
				val.V = wv.getAt(val.I);
				
				//optimize node lookup
				if (node.hasL()) val.L = node.l.val;
				if (node.hasR()) val.R = node.r.val;
				return true;
			}
			tree.inorder(visit);
			
			//store root node
			BSPNode = tree.val;
		}
	}
}