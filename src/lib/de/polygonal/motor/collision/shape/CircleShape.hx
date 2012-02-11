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
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.geom.closest.ClosestPointSphere;
import de.polygonal.motor.geom.inside.PointInsideSphere;
import de.polygonal.motor.data.CircleData;
import de.polygonal.motor.data.MassData;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;

using de.polygonal.ds.BitFlags;

class CircleShape extends AbstractShape
{
	public function new(data:CircleData, world:World, settings:Settings)
	{
		super(data, world, settings);
		
		type = ShapeType.CIRCLE;
		ex = ey = radius = data.radius;
		setf(AbstractShape.AABB_FIT_SPHERE);
	}
	
	override public function computeMass():MassData
	{
		var rSq = radius * radius;
		
		var data = new MassData();
		data.mass = density * Mathematics.PI * rSq;
		TLocal.getPositionFromLocalToParentMatrix(data.center);
		data.I = (data.mass * .5 * rSq) + (data.mass * Vec2Util.dot2(data.center, data.center));
		
		return data;
	}
	
	override public function computeSweptAABB(aabb:AABB2, T1:Mat32, T2:Mat32):Void
	{
		var r = radius;
		
		var lx = TLocal.tx;
		var ly = TLocal.ty;
		
		var p1x = T1.mulx(lx, ly);
		var p1y = T1.muly(lx, ly);
		
		if (T1 == T2)
			aabb.set4(p1x - r, p1y - r, p1x + r, p1y + r);
		else
		{
			var p2x = T2.mulx(lx, ly);
			var p2y = T2.muly(lx, ly);
			
			if (p1x < p2x)
				if (p1y < p2y)
					aabb.set4(p1x - r, p1y - r, p2x + r, p2y + r);
				else
					aabb.set4(p1x - r, p2y - r, p2x + r, p1y + r);
			else
				if (p1y < p2y)
					aabb.set4(p2x - r, p1y - r, p1x + r, p2y + r);
				else
					aabb.set4(p2x - r, p2y - r, p1x + r, p1y + r);
		}
	}
	
	override public function updateSweepRadius(localCenter:Vec2):Void
	{
		var dx = localCenter.x - TLocal.tx;
		var dy = localCenter.y - TLocal.ty;
		var r1 = Math.sqrt(dx * dx + dy * dy);
		sweepRadius = r1 + radius - _settings.toiSlop;
	}
	
	override public function closestPoint(p:Vec2, q:Vec2):Vec2
	{
		ClosestPointSphere.find5(p.x, p.y, x, y, radius, q);
		return q;
	}
	
	override public function containsPoint(p:Vec2):Bool
	{
		return PointInsideSphere.test5(p.x, p.y, x, y, radius);
	}
	
	override public function syncFeatures(?T:Mat32):Void {}
	
	override function _computeAABB(aabb:AABB2, T:Mat32):Void
	{
		var px = T.mulx(TLocal.tx, TLocal.ty);
		var py = T.muly(TLocal.tx, TLocal.ty);
		
		aabb.minX = px - radius;
		aabb.minY = py - radius;
		aabb.maxX = px + radius;
		aabb.maxY = py + radius;
	}
}