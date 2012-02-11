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
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.dynamics.contact.ManifoldPoint;
import de.polygonal.motor.Settings;

using de.polygonal.ds.BitFlags;

class ClipCollider implements Collider
{
	var _relTol:Float;
	var _absTol:Float;
	
	private function new(settings:Settings)
	{
		_relTol = settings.relTolerance;
		_absTol = settings.absTolerance;
	}
	
	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void {}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void {}
	
	public function free():Void {}
	
	function _clip(manifold:Manifold, s1:AbstractShape, s2:AbstractShape, flip:Int, refEdgeVert:Vertex, supportVert:Vertex, refEdgeNormal:Vertex, ?maxManifoldPoints = 2):Void
	{
		var refShape = flip == 1 ? s2 : s1;
		var x = refShape.x;
		var y = refShape.y;
		var nx = refEdgeNormal.x;
		var ny = refEdgeNormal.y;
		var incEdgeVert;
		var incEdgeIndex;
		var incEdgeNormal = supportVert.edge.normal;
		
		//{<-- find best incident edge
		var matchPrev = Vec2Util.dot4(incEdgeNormal.prev.x, incEdgeNormal.prev.y, nx, ny);
		var matchCurr = Vec2Util.dot4(incEdgeNormal.x, incEdgeNormal.y, nx, ny);
		
		//right/acute angle or previous vertex normal is more parallel to reference edge?
		if (matchCurr >= 0 || matchPrev < matchCurr)
		{
			//pick previous vertex
			incEdgeVert = supportVert.prev;
			incEdgeIndex = incEdgeNormal.prev.i;
		}
		else
		{
			//stick with current vertex
			incEdgeVert = supportVert;
			incEdgeIndex = incEdgeNormal.i;
		}
		
		var incVertIndex1 = incEdgeVert.i;
		var incVertIndex2 = incVertIndex1;
		//}-->
		
		//{<-- setup front&side clipping planes
		//front
		var front = Vec2Util.dot4(x, y, nx, ny) + refEdgeVert.edge.height;
		
		#if debug
		//validate precomputed height scalar
		var height = refEdgeVert.edge.height;
		var t = ((refEdgeVert.x - x) * nx + (refEdgeVert.y - y) * ny);
		de.polygonal.core.util.Assert.assert(Math.abs(height - t) < .001, "Math.abs(height - t) < .001: " + [height, t]);
		var front1 = (refEdgeVert.x - x) * nx + (refEdgeVert.y - y) * ny;
		var front2 = refEdgeVert.edge.height;
		de.polygonal.core.util.Assert.assert(Math.abs(front1 - front2) < .001, "Math.abs(front1 - front2) < .001");
		#end
		
		//side
		var side = Vec2Util.perpDot4(nx, ny, x, y);
		if (!refShape.hasf(AbstractShape.SYMMETRIC))
		{
			//transform offset vector from shape to body space
			var offset = refEdgeVert.edge.offset;
			var R = refShape.TBody;
			side += Vec2Util.perpDot4(nx, ny, R.mul22x(offset.x, offset.y), R.mul22y(offset.x, offset.y));
		}
		
		#if debug
		//validate precomputed offset vector
		var M = refShape.TBody;
		var offs = refEdgeVert.edge.offset;
		var side1 = Vec2Util.perpDot4
		(
			nx, ny,
			x + M.mul22x(offs.x, offs.y),
			y + M.mul22y(offs.x, offs.y)
		);
		
		var midx = refEdgeVert.x + (refEdgeVert.next.x - refEdgeVert.x) / 2;
		var midy = refEdgeVert.y + (refEdgeVert.next.y - refEdgeVert.y) / 2;
		var h = (midx - x) * nx + (midy - y) * ny;
		var offset = new Vec2((midx - x) - (nx * h), (midy - y) - (ny * h));
		var side2 = Vec2Util.perpDot4(nx, ny, x, y);
		if (!refShape.hasf(AbstractShape.SYMMETRIC))
			side2 += Vec2Util.perpDot4(nx, ny, M.mul22x(offs.x, offs.y), M.mul22y(offs.x, offs.y));
		de.polygonal.core.util.Assert.assert(Math.abs(side1 - side2) < .001, "Math.abs(side1 - side2) < .001 :" + [side1, side2]);
		#end
		//}-->
		
		//{clip edge against reference face side planes
		
		//edge half-width
		var edgeExt = refEdgeVert.edge.extent;
		
		//vertices of incident edge
		var x1 = incEdgeVert.x, x2 = incEdgeVert.next.x;
		var y1 = incEdgeVert.y, y2 = incEdgeVert.next.y;
		
		//clip points of incident edge
		var cv1x = x1, cv2x = x2;
		var cv1y = y1, cv2y = y2;
		
		//distance of both points to left side plane
		var dist1 = Vec2Util.perpDot4(x1, y1, nx, ny) + side - edgeExt;
		var dist2 = Vec2Util.perpDot4(x2, y2, nx, ny) + side - edgeExt;
		
		//points on different side of left side plane ?
		//due to clockwise ordering, support vertex x1,y1 is always closer to the right side plane
		if (dist1 * dist2 < 0)
		{
			//which one is in the negative half-space?
			var interp = dist1 / (dist1 - dist2);
			
			#if debug
			//left point should be always closer to left plane (CW)
			de.polygonal.core.util.Assert.assert(dist1 < 0, "dist1 < 0");
			#end
			
			//clip second point against left side plane
			cv2x = x1 + interp * (x2 - x1);
			cv2y = y1 + interp * (y2 - y1);
			
			incVertIndex2 = incEdgeVert.next.i;
			
			//first point in positive half-space of right side plane?
			dist1 = Vec2Util.perpDot4(x1, y1, -nx, -ny) - side - edgeExt;
			
			if (dist1 > 0)
			{
				//clip first point against right side plane
				dist2 = Vec2Util.perpDot4(x2, y2, -nx, -ny) - side - edgeExt;
				
				interp = dist1 / (dist1 - dist2);
				cv1x = x1 + interp * (x2 - x1);
				cv1y = y1 + interp * (y2 - y1);
				
				incVertIndex1 = incEdgeVert.prev.i;
			}
		}
		else
		{
			//both points in negative half-space of left side plane
			if (dist1 < 0)
			{
				#if debug
				de.polygonal.core.util.Assert.assert(dist1 < dist2, "dist1 < dist2");
				#end
				
				//on different sides of right side plane?
				var t = -side - edgeExt;
				dist1 = Vec2Util.perpDot4(x1, y1, -nx, -ny) + t;
				dist2 = Vec2Util.perpDot4(x2, y2, -nx, -ny) + t;
				
				if (dist1 * dist2 < 0)
				{
					//clip first point against right side plane
					var interp = dist1 / (dist1 - dist2);
					cv1x = cv1x + interp * (cv2x - cv1x);
					cv1y = cv1y + interp * (cv2y - cv1y);
					
					incVertIndex1 = incEdgeVert.prev.i;
				}
			}
			else
			{
				//both points in positive half-space of left side plane
				return;
			}
		}
		//}
		
		if (maxManifoldPoints == 1)
		{
			//{<-- output the manifold point with the deepest penetration
			var sep1 = Vec2Util.dot4(nx, ny, cv1x, cv1y) - front;
			var sep2 = Vec2Util.dot4(nx, ny, cv2x, cv2y) - front;
			
			if (sep1 <= 0)
			{
				if (flip == 1)
				{
					manifold.ncoll.x =-nx;
					manifold.ncoll.y =-ny;
				}
				else
				{
					manifold.ncoll.x = nx;
					manifold.ncoll.y = ny;
				}
				
				if (sep2 <= 0)
				{
					if (sep1 <= sep2)
					{
						outputManifoldPoint(s1, s2, manifold.mp1, sep1, cv1x, cv1y,
							ContactID.bake(refEdgeVert.i, incEdgeIndex, incVertIndex1, flip));
					}
					else
					{
						outputManifoldPoint(s1, s2, manifold.mp1, sep2, cv2x, cv2y,
							ContactID.bake(refEdgeVert.i, incEdgeIndex, incVertIndex2, flip));
					}
					manifold.pointCount = 1;
				}
				else
				{
					outputManifoldPoint(s1, s2, manifold.mp1, sep1, cv1x, cv1y,
						ContactID.bake(refEdgeVert.i, incEdgeIndex, incVertIndex1, flip));
					manifold.pointCount = 1;
				}
			}
			else
			if (sep2 <= 0)
			{
				if (flip == 1)
				{
					manifold.ncoll.x =-nx;
					manifold.ncoll.y =-ny;
				}
				else
				{
					manifold.ncoll.x = nx;
					manifold.ncoll.y = ny;
				}
				
				outputManifoldPoint(s1, s2, manifold.mp1, sep2, cv2x, cv2y,
					ContactID.bake(refEdgeVert.i, incEdgeIndex, incVertIndex1, flip));
				manifold.pointCount = 1;
			}
			else
				manifold.pointCount = 0;
			//}-->
		}
		else
		{
			//{<-- output a maximum of two manifold points
			//check if first clip point lies behind reference edge
			//two potential contact points
			var sep = Vec2Util.dot4(nx, ny, cv1x, cv1y) - front;
			if (sep <= 0)
			{
				if (flip == 1)
				{
					manifold.ncoll.x =-nx;
					manifold.ncoll.y =-ny;
				}
				else
				{
					manifold.ncoll.x = nx;
					manifold.ncoll.y = ny;
				}
				
				var id = ContactID.bake(refEdgeVert.i, incEdgeIndex, 0, flip);
				
				//output first contact point
				outputManifoldPoint(s1, s2, manifold.mp1, sep, cv1x, cv1y,
					ContactID.setIncVert(id, incVertIndex1));
				
				//second clip point behind reference edge?
				sep = Vec2Util.dot4(nx, ny, cv2x, cv2y) - front;
				if (sep <= 0)
				{
					//output second contact point
					outputManifoldPoint(s1, s2, manifold.mp2, sep, cv2x, cv2y,
						ContactID.setIncVert(id, incVertIndex2));
					
					manifold.pointCount = 2;
				}
				else
					manifold.pointCount = 1;
			}
			else
			{
				//check if second clip point lies behind reference edge
				//(one potential contact point only)
				sep = Vec2Util.dot4(nx, ny, cv2x, cv2y) - front;
				if (sep <= 0)
				{
					if (flip == 1)
					{
						manifold.ncoll.x =-nx;
						manifold.ncoll.y =-ny;
					}
					else
					{
						manifold.ncoll.x = nx;
						manifold.ncoll.y = ny;
					}
					
					//output first contact point
					outputManifoldPoint(s1, s2, manifold.mp1, sep, cv2x, cv2y, 
						ContactID.bake(refEdgeVert.i, incEdgeIndex, incVertIndex1, flip));
					
					manifold.pointCount = 1;
				}
				else
					manifold.pointCount = 0;
			}
			//}
		}
	}
	
	inline function outputManifoldPoint(s1:AbstractShape, s2:AbstractShape,
		mp:ManifoldPoint, sep:Float, x:Float, y:Float, id:Int)
	{
		mp.sep = sep;
		mp.x = x;
		mp.y = y;
		mp.id = id;
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
}