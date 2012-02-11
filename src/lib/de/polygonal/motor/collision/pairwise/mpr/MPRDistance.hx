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
package de.polygonal.motor.collision.pairwise.mpr;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.geom.distance.DistancePointSegment;
import de.polygonal.core.math.Vec2;

/**
 * Implementation of the MPR algorithm (Minkowski Portal Refinement) for computing the minimum
 * distance between two convex polygons (fast alternative to VCLIP/GJK).
 * @see <a href="http://xenocollide.snethen.com/mpr2d.html" target="_blank">http://xenocollide.snethen.com/mpr2d.html</a>
 */
class MPRDistance
{
	inline static var CW  = 1;
	inline static var CCW =-1;
	
	public var normal:Vec2;
	
	var _vTmp:Vec2;
	
	public function new()
	{
		normal = new Vec2();
		_vTmp = new Vec2();
	}
	
	public function distance(shape1:AbstractShape, shape2:AbstractShape):Float
	{
		/*///////////////////////////////////////////////////////
		// PORTAL DISCOVERY
		///////////////////////////////////////////////////////*/
		
		//obtain a point that we know lies somewhere deep within B–A. we can obtain such a point by
		//subtracting any point deep within A from any point deep within B. the geometric centers of
		//A and B are excellent choices.
		
		//deep point inside B–A.
		var v0x = shape1.x - shape2.x;
		var v0y = shape1.y - shape2.y;
		if (Vec2Util.dot4(v0x, v0y, v0x, v0y) < Mathematics.EPS) v0x = Mathematics.EPS;
		
		//we construct a normal that originates at the interior point and points towards the origin (-v0x, -v0y).
		//find the support point in the direction of this ray; we get the first support point.
		//find support with respect to direction (-v0x, -v0y)
		var node1 = shape1.BSPNode; while (node1.R != null) node1 = Vec2Util.perpDot4(node1.N.x, node1.N.y, v0x, v0y) <= 0. ? node1.R : node1.L;
		var node2 = shape2.BSPNode; while (node2.R != null) node2 = Vec2Util.perpDot4(node2.N.x, node2.N.y, v0x, v0y) >= 0. ? node2.R : node2.L;
		var v1x = node1.V.x - node2.V.x;
		var v1y = node1.V.y - node2.V.y;
		
		//we construct a ray that is perpendicular to the line between the support just discovered (v1x, v1y)
		//and the interior point (v0x, v0y). there are two choices for this ray, one for each side of the line
		//segment. we choose the ray that lies on the same side of the segment as the origin.
		
		var winding;
		
		//perp(v1 - v0)
		var nx = v1y - v0y;
		var ny =-v1x + v0x;
		if (Vec2Util.dot4(v0x, v0y, nx, ny) <= .0)
			winding = CCW;
		else
		{
			winding = CW;
			nx = -nx;
			ny = -ny;
		}
		
		//we use this ray to find a second support point on the surface of B–A.
		//we get the second support point.
		//find support with respect to direction (nx, ny)
		node1 = shape1.BSPNode; while (node1.R != null) node1 = Vec2Util.perpDot4(node1.N.x, node1.N.y, nx, ny) >= 0. ? node1.R : node1.L;
		node2 = shape2.BSPNode; while (node2.R != null) node2 = Vec2Util.perpDot4(node2.N.x, node2.N.y, nx, ny) <= 0. ? node2.R : node2.L;
		var v2x = node1.V.x - node2.V.x;
		var v2y = node1.V.y - node2.V.y;
		
		//we now have three points (v0, v1, v2), which form an angle.
		//the origin lies somewhere within this angle. next we create a line segment between the two
		//support points. this line segment is called a portal, because the origin ray must pass
		//through the line segment on its way to the origin.
		
		//build outward pointing normal of the portal (v1-v2).
		if (winding == CW)
		{
			//perp(v2 - v1)
			nx = v2y - v1y;
			ny =-v2x + v1x;
		}
		else
		{
			//-perp(v2 - v1)
			nx =-v2y + v1y;
			ny = v2x - v1x;
		}
		
		/*///////////////////////////////////////////////////////
		// PORTAL REFINEMENT
		///////////////////////////////////////////////////////*/
		
		var hit = false;
		var sep = .0;
		
		#if debug
		var iterations = 0;
		#end
		
		while (true)
		{
			#if debug
			de.polygonal.core.util.Assert.assert(iterations++ < 100, "iterations++ < 100");
			#end
			
			//if the origin lies on the same side of the portal as the interior point, then it lies
			//within the triangle (v0, v1, v2), and must therefore lie within B–A.
			if (Vec2Util.dot4(v1x, v1y, nx, ny) >= .0)
			{
				//shapes are intersecting; quit
				break;
			}
			
			//the point lies on the outside of the portal, so the algorithm continues...
			//we construct a normal perpendicular to the portal, pointing away from the interior.
			//we use this normal to obtain a third support point on the surface of B–A.
			node1 = shape1.BSPNode; while (node1.R != null) node1 = Vec2Util.perpDot4(node1.N.x, node1.N.y, nx, ny) >= 0. ? node1.R : node1.L;
			node2 = shape2.BSPNode; while (node2.R != null) node2 = Vec2Util.perpDot4(node2.N.x, node2.N.y, nx, ny) <= 0. ? node2.R : node2.L;
			var v3x = node1.V.x - node2.V.x;
			var v3y = node1.V.y - node2.V.y;
			
			//v3 is on or very close to the portal (v1, v2); terminate algorithm
			if (Mathematics.fabs(Vec2Util.dot4(v3x - v1x, v3y - v1y, nx, ny)) < Mathematics.EPS)
			{
				//compute minimum distance
				sep = DistancePointSegment.find6(.0, .0, v1x, v1y, v2x, v2y);
				normal.x = nx;
				normal.y = ny;
				break;
			}
			
			//the three support points form a triangle. we know the origin ray passes through the
			//interior edge of this triangle, because it is a portal. it therefore must exit through
			//one of the outer edges. to determine which edge it passes through, we construct a segment
			//between the new support point and the interior point. if the origin lies on one side of
			//the segment, the origin ray must pass through the outer edge that lies on the same side
			//of the segment. if the origin lies on the other side, the origin ray must pass through
			//the other outer edge.
			
			//true if origin left of ray v0->v3
			var isLeft = Vec2Util.perpDot4(v0x, v0y, v3x - v0x, v3y - v0y) < .0;
			
			//the outer edge that passes the test becomes the new portal, and we discard the unused support point.
			//current direction is CW
			if (winding == CW)
			{
				if (isLeft)
				{
					//flip direction
					winding = CCW;
					
					v2x = v1x;
					v2y = v1y;
					
					v1x = v3x;
					v1y = v3y;
					
					//new portal normal -perp(v2 - v1)
					nx =-v2y + v1y;
					ny = v2x - v1x;
				}
				else
				{
					//no change in winding
					v1x = v3x;
					v1y = v3y;
					
					//new portal normal perp(v2 - v1)
					nx = v2y - v1y;
					ny =-v2x + v1x;
				}
			}
			//current direction is CCW
			else
			{
				if (isLeft)
				{
					//no change in winding
					v1x = v3x;
					v1y = v3y;
					
					//new portal normal -perp(v2 - v1)
					nx =-v2y + v1y;
					ny = v2x - v1x;
				}
				else
				{
					//flip direction
					winding = CW;
					
					v2x = v1x;
					v2y = v1y;
					
					v1x = v3x;
					v1y = v3y;
					
					//new portal normal perp(v2 - v1)
					nx = v2y - v1y;
					ny =-v2x + v1x;
				}
			}
		}
		
		return sep;
	}
}