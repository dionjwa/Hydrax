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

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.closest.ClosestPointAABB;
import de.polygonal.motor.geom.closest.ClosestPointOBB;
import de.polygonal.motor.geom.inside.PointInsideAABB;
import de.polygonal.motor.geom.inside.PointInsideOBB;
import de.polygonal.motor.geom.bsp.ConvexBSPNode;
import de.polygonal.motor.data.BoxData;
import de.polygonal.motor.data.MassData;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.World;

using de.polygonal.ds.BitFlags;

class BoxShape extends AbstractShape
{
	var _TTmp:Mat32;
	
	public function new(data:BoxData, world:World, settings:Settings)
	{
		super(data, world, settings);
		
		type = ShapeType.BOX;
		
		setf(AbstractShape.SYMMETRIC);
		
		if (data.isAxisAligned)
		{
			setf(AbstractShape.AXIS_ALIGNED | AbstractShape.AABB_FIT_SPHERE);
			data.r = 0;
		}
		
		//obb extent
		ex = data.width * .5;
		ey = data.height * .5;
		
		//minimum bounding sphere
		radius = Math.sqrt(Vec2Util.dot4(ex, ey, ex, ey));
		
		//initialize vertex chains and features
		_setupFeatures(data.getVertexList());
		
		//cache all 4 corner vertices and normals for quick access
		var v = worldVertexChain;
		v0 = v; v = v.next;
		v1 = v; v = v.next;
		v2 = v; v = v.next;
		v3 = v;
		
		v = worldNormalChain;
		n0 = v; v = v.next;
		n1 = v; v = v.next;
		n2 = v; v = v.next;
		n3 = v;
		
		if (hasf(AbstractShape.AXIS_ALIGNED))
		{
			//set shape normals once
			n0.x = 0;
			n0.y = 1;
			
			n1.x =-1;
			n1.y = 0;
			
			n2.x = 0;
			n2.y =-1;
			
			n3.x = 1;
			n3.y = 0;
		}
		
		//precompute BSP tree for accelerating support point queries
		_computeConvexBSP();
		
		//temporary transform
		_TTmp = new Mat32();
	}
	
	override public function free():Void
	{
		_TTmp = null;
		
		super.free();
	}
	
	override public function computeMass():MassData
	{
		var w = ex * 2;
		var h = ey * 2;
		
		var data = new MassData();
		data.mass = density * w * h;
		TLocal.getPositionFromLocalToParentMatrix(data.center);
		data.I = (data.mass / 12 * Vec2Util.dot4(w, h, w, h)) + (data.mass * Vec2Util.dot2(data.center, data.center));
		return data;
	}
	
	override public function updateSweepRadius(localCenter:Vec2):Void
	{
		var dx = localCenter.x - TLocal.tx;
		var dy = localCenter.y - TLocal.ty;
		var r = Math.sqrt(dx * dx + dy * dy);
		
		var ex1 = ex - _settings.toiSlop;
		var ey1 = ey - _settings.toiSlop;
		sweepRadius = r + Math.sqrt(Vec2Util.dot4(ex1, ey1, ex1, ey1));
	}
	
	override public function closestPoint(p:Vec2, q:Vec2):Vec2
	{
		if (hasf(AbstractShape.AXIS_ALIGNED))
		{
			ClosestPointAABB.find2(p, aabb, q);
			return q;
		}
		else
		{
			var T = TWorld;
			ClosestPointOBB.find10
			(
				p.x, p.y,
				T.tx, T.ty,
				ex, ey,
				T.m11, T.m12, T.m21, T.m22,
				q
			);
			return q;
		}
	}
	
	override public function containsPoint(p:Vec2):Bool
	{
		if (hasf(AbstractShape.AXIS_ALIGNED))
			return PointInsideAABB.test2(p, aabb);
		else
		{
			var T = TWorld;
			return PointInsideOBB.test10
			(
				p.x, p.y,
				T.tx, T.ty,
				ex, ey, 
				T.m11, T.m12, T.m21, T.m22
			);
		}
	}
	
	override public function syncFeatures(?T:Mat32):Void
	{
		//if (hasf(AbstractShape.FEATURES_SYNCED)) return;
		//setf(AbstractShape.FEATURES_SYNCED);
		
		if (T == null) T = TWorld;
		
		if (hasf(AbstractShape.AXIS_ALIGNED | AbstractShape.AABB_FIT_SPHERE))
		{
			//ignore rotation
			var tx = T.tx;
			var ty = T.ty;
			
			var t1 = tx + ex;
			var t2 = ty + ey;
			var t3 = tx - ex;
			var t4 = ty - ey;
			
			v0.x = t1;
			v0.y = t2;
			v1.x = t3;
			v1.y = t2;
			v2.x = t3;
			v2.y = t4;
			v3.x = t1;
			v3.y = t4;
		}
		else
		{
			var m11 = T.m11; var m12 = T.m12; var tx = T.tx;
			var m21 = T.m21; var m22 = T.m22; var ty = T.ty;
			
			var wx = m11 * ex; var hx = m12 * ey;
			var wy = m21 * ex; var hy = m22 * ey;
			
			var tmp1 = tx + wx;
			var tmp2 = tx - wx;
			var tmp3 = ty + wy;
			var tmp4 = ty - wy;
			
			v0.x = tmp1 + hx; n0.x = m12;
			v0.y = tmp3 + hy; n0.y = m22;
			
			v1.x = tmp2 + hx; n1.x =-m11;
			v1.y = tmp4 + hy; n1.y =-m21;
			
			v2.x = tmp2 - hx; n2.x =-m12;
			v2.y = tmp4 - hy; n2.y =-m22;
			
			v3.x = tmp1 - hx; n3.x = m11;
			v3.y = tmp3 - hy; n3.y = m21;
		}
	}
	
	override function _computeAABB(aabb:AABB2, T:Mat32):Void
	{
		if (hasf(AbstractShape.AXIS_ALIGNED))
		{
			aabb.minX = T.tx + TLocal.tx - ex;
			aabb.minY = T.ty + TLocal.ty - ey;
			aabb.maxX = T.tx + TLocal.tx + ex;
			aabb.maxY = T.ty + TLocal.ty + ey;
		}
		else
		{
			T = Mat32.concat(TLocal, T, _TTmp);
			
			//refit AABB to OBB
			aabb.set4(T.tx, T.ty, T.tx, T.ty);
			
			if (T.m11 > 0)
			{
				aabb.minX -= T.m11 * ex;
				aabb.maxX += T.m11 * ex;
			}
			else
			{
				aabb.minX += T.m11 * ex;
				aabb.maxX -= T.m11 * ex;
			}
			if (T.m12 > 0)
			{
				aabb.minX -= T.m12 * ey;
				aabb.maxX += T.m12 * ey;
			}
			else
			{
				aabb.minX += T.m12 * ey;
				aabb.maxX -= T.m12 * ey;
			}
			
			if (T.m21 > 0)
			{
				aabb.minY -= T.m21 * ex;
				aabb.maxY += T.m21 * ex;
			}
			else
			{
				aabb.minY += T.m21 * ex;
				aabb.maxY -= T.m21 * ex;
			}
			if (T.m22 > 0)
			{
				aabb.minY -= T.m22 * ey;
				aabb.maxY += T.m22 * ey;
			}
			else
			{
				aabb.minY += T.m22 * ey;
				aabb.maxY -= T.m22 * ey;
			}
		}
	}
	
	function _computeConvexBSP():Void
	{
		var node = new ConvexBSPNode<Vertex>();
		node.N = n0;
		node.I = 0;
		
		//root->left
		node.L = new ConvexBSPNode<Vertex>();
		node.L.N = n3;
		node.L.I = 3;
			
			//root->left->left
			node.L.L = new ConvexBSPNode<Vertex>();
			node.L.L.V = v3;
			node.L.L.I = 3;
			
			//root->left->right
			node.L.R = new ConvexBSPNode<Vertex>();
			node.L.R.V = v0;
			node.L.R.I = 0;
		
		//root->right
		node.R = new ConvexBSPNode<Vertex>();
		node.R.N = n1;
		node.R.I = 1;
			
			//root->right->left
			node.R.L = new ConvexBSPNode<Vertex>();
			node.R.L.V = v1;
			node.R.L.I = 1;
			
			//root->right->right
			node.R.R = new ConvexBSPNode<Vertex>();
			node.R.R.V = v2;
			node.R.R.I = 2;
		
		BSPNode = node;
	}
}