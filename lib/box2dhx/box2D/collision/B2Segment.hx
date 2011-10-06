/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/
package box2D.collision;
	
import box2D.common.math.B2Vec2;
// A manifold for two touching convex shapes.
class B2Segment
 {
	/// Ray cast against this segment with another segment.
	// Collision Detection in Interactive 3D Environments by Gino van den Bergen
	// From Section 3.4.1
	// x = mu1 * p1 + mu2 * p2
	// mu1 + mu2 = 1 && mu1 >= 0 && mu2 >= 0
	// mu1 = 1 - mu2;
	// x = (1 - mu2) * p1 + mu2 * p2
	//   = p1 + mu2 * (p2 - p1)
	// x = s + a * r (s := start, r := end - start)
	// s + a * r = p1 + mu2 * d (d := p2 - p1)
	// -a * r + mu2 * d = b (b := s - p1)
	// [-r d] * [a; mu2] = b
	// Cramer's rule:
	// denom = det[-r d];
	// a = det[b d] / denom
	// mu2 = det[-r b] / denom
	public function new() { 
	p1 = new B2Vec2();
	p2 = new B2Vec2();
	}
	
	/// Ray cast against this segment with another segment.
	// Collision Detection in Interactive 3D Environments by Gino van den Bergen
	// From Section 3.4.1
	// x = mu1 * p1 + mu2 * p2
	// mu1 + mu2 = 1 && mu1 >= 0 && mu2 >= 0
	// mu1 = 1 - mu2;
	// x = (1 - mu2) * p1 + mu2 * p2
	//   = p1 + mu2 * (p2 - p1)
	// x = s + a * r (s := start, r := end - start)
	// s + a * r = p1 + mu2 * d (d := p2 - p1)
	// -a * r + mu2 * d = b (b := s - p1)
	// [-r d] * [a; mu2] = b
	// Cramer's rule:
	// denom = det[-r d];
	// a = det[b d] / denom
	// mu2 = det[-r b] / denom
	public function TestSegment(lambda:Array<Float>, // float pointer
								normal:B2Vec2, // pointer
								segment:B2Segment, 
								maxLambda:Float) : Bool{
		//b2Vec2 s = segment.p1;
		var s:B2Vec2 = segment.p1;
		//b2Vec2 r = segment.p2 - s;
		var rX:Float = segment.p2.x - s.x;
		var rY:Float = segment.p2.y - s.y;
		//b2Vec2 d = p2 - p1;
		var dX:Float = p2.x - p1.x;
		var dY:Float = p2.y - p1.y;
		//b2Vec2 n = b2Cross(d, 1.0f);
		var nX:Float = dY;
		var nY:Float = -dX;
		
		var k_slop:Float = 100.0 * box2D.common.math.B2Math.MIN_VALUE;
		//var denom:Number = -b2Dot(r, n);
		var denom:Float = -(rX*nX + rY*nY);
		
		// Cull back facing collision and ignore parallel segments.
		if (denom > k_slop)
		{
			// Does the segment intersect the infinite line associated with this segment?
			//b2Vec2 b = s - p1;
			var bX:Float = s.x - p1.x;
			var bY:Float = s.y - p1.y;
			//var a:Number = b2Dot(b, n);
			var a:Float = (bX*nX + bY*nY);
			
			if (0.0 <= a && a <= maxLambda * denom)
			{
				var mu2:Float = -rY * bY + rY * bX;
				
				// Does the segment intersect this segment?
				if (-k_slop * denom <= mu2 && mu2 <= denom * (1.0 + k_slop))
				{
					a /= denom;
					//n.Normalize();
					var nLen:Float = Math.sqrt(nX*nX + nY*nY);
					nX /= nLen;
					nY /= nLen;
					//*lambda = a;
					lambda[0] = a;
					//*normal = n;
					normal.Set(nX, nY);
					return true;
				}
			}
		}
		
		return false;
	}
	
	public var p1:B2Vec2 ;	///< the starting point
	public var p2:B2Vec2 ;	///< the ending point
}