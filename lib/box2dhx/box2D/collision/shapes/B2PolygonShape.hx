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
package box2D.collision.shapes;

import box2D.common.math.B2XForm;
import box2D.common.math.B2Vec2;
import box2D.collision.B2Segment;
import box2D.common.math.B2Mat22;
import box2D.collision.B2AABB;
import box2D.collision.B2OBB;
import box2D.common.B2Settings;
import box2D.common.math.B2Math;


/// Convex polygon. The vertices must be in CCW order for a right-handed
/// coordinate system with the z-axis coming out of the screen.
class B2PolygonShape extends B2Shape {
	/// @see B2Shape::TestPoint
	
	/// @see B2Shape::TestPoint
	public override function TestPoint(xf:B2XForm, p:B2Vec2) : Bool{
		var tVec:B2Vec2;
		
		//b2Vec2 pLocal = b2MulT(xf.R, p - xf.position);
		var tMat:B2Mat22 = xf.R;
		var tX:Float = p.x - xf.position.x;
		var tY:Float = p.y - xf.position.y;
		var pLocalX:Float = (tX*tMat.col1.x + tY*tMat.col1.y);
		var pLocalY:Float = (tX*tMat.col2.x + tY*tMat.col2.y);
		
		for (i in 0...m_vertexCount)
		{
			//float32 dot = b2Dot(m_normals[i], pLocal - m_vertices[i]);
			tVec = m_vertices[i];
			tX = pLocalX - tVec.x;
			tY = pLocalY - tVec.y;
			tVec = m_normals[i];
			var dot:Float = (tVec.x * tX + tVec.y * tY);
			if (dot > 0.0)
			{
				return false;
			}
		}
		
		return true;
	}
	/// @see B2Shape::TestSegment
	public override function TestSegment( xf:B2XForm,
		lambda:Array<Float>, // float ptr
		normal:B2Vec2, // ptr
		segment:B2Segment,
		maxLambda:Float) : Bool
	{
		var lower:Float = 0.0;
		var upper:Float = maxLambda;
		
		var tX:Float;
		var tY:Float;
		var tMat:B2Mat22;
		var tVec:B2Vec2;
		
		//b2Vec2 p1 = b2MulT(xf.R, segment.p1 - xf.position);
		tX = segment.p1.x - xf.position.x;
		tY = segment.p1.y - xf.position.y;
		tMat = xf.R;
		var p1X:Float = (tX * tMat.col1.x + tY * tMat.col1.y);
		var p1Y:Float = (tX * tMat.col2.x + tY * tMat.col2.y);
		//b2Vec2 p2 = b2MulT(xf.R, segment.p2 - xf.position);
		tX = segment.p2.x - xf.position.x;
		tY = segment.p2.y - xf.position.y;
		tMat = xf.R;
		var p2X:Float = (tX * tMat.col1.x + tY * tMat.col1.y);
		var p2Y:Float = (tX * tMat.col2.x + tY * tMat.col2.y);
		//b2Vec2 d = p2 - p1;
		var dX:Float = p2X - p1X;
		var dY:Float = p2Y - p1Y;
		var index:Int = -1;
		
		for (i in 0...m_vertexCount)
		{
			// p = p1 + a * d
			// dot(normal, p - v) = 0
			// dot(normal, p1 - v) + a * dot(normal, d) = 0
			
			//float32 numerator = b2Dot(m_normals[i], m_vertices[i] - p1);
			tVec = m_vertices[i];
			tX = tVec.x - p1X;
			tY = tVec.y - p1Y;
			tVec = m_normals[i];
			var numerator:Float = (tVec.x*tX + tVec.y*tY);
			//float32 denominator = b2Dot(m_normals[i], d);
			var denominator:Float = (tVec.x*dX + tVec.y*dY);
			
			// Note: we want this predicate without division:
			// lower < numerator / denominator, where denominator < 0
			// Since denominator < 0, we have to flip the inequality:
			// lower < numerator / denominator <==> denominator * lower > numerator.
			
			if (denominator < 0.0 && numerator < lower * denominator)
			{
				// Increase lower.
				// The segment enters this half-space.
				lower = numerator / denominator;
				index = i;
			}
			else if (denominator > 0.0 && numerator < upper * denominator)
			{
				// Decrease upper.
				// The segment exits this half-space.
				upper = numerator / denominator;
			}
			
			if (upper < lower)
			{
				return false;
			}
		}
		
		//B2Settings.b2Assert(0.0 <= lower && lower <= maxLambda);
		
		if (index >= 0)
		{
			//*lambda = lower;
			lambda[0] = lower;
			//*normal = b2Mul(xf.R, m_normals[index]);
			tMat = xf.R;
			tVec = m_normals[index];
			normal.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
			normal.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
			return true;
		}
		
		return false;
	}
	/// @see B2Shape::ComputeAABB
	//
	static var s_computeMat:B2Mat22 = new B2Mat22();
	//
	public override function ComputeAABB(aabb:B2AABB, xf:B2XForm) : Void{
		var tMat:B2Mat22;
		var tVec:B2Vec2;
		
		var R:B2Mat22 = s_computeMat;
		//b2Mat22 R = b2Mul(xf.R, m_obb.R);
		tMat = xf.R;
		tVec = m_obb.R.col1;
		//R.col1 = b2MulMV(A, B.col1)
		R.col1.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		R.col1.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		//
		tVec = m_obb.R.col2;
		//R.col1 = b2MulMV(A, B.col2)
		R.col2.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		R.col2.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		
		//b2Mat22 absR = b2Abs(R);
		R.Abs();
		var absR:B2Mat22 = R;
		//b2Vec2 h = b2Mul(absR, m_obb.extents);
		tVec = m_obb.extents;
		var hX:Float = (absR.col1.x * tVec.x + absR.col2.x * tVec.y);
		var hY:Float = (absR.col1.y * tVec.x + absR.col2.y * tVec.y);
		//b2Vec2 position = xf.position + b2Mul(xf.R, m_obb.center);
		tMat = xf.R;
		tVec = m_obb.center;
		var positionX:Float = xf.position.x + (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		var positionY:Float = xf.position.y + (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		//aabb->lowerBound = position - h;
		aabb.lowerBound.Set(positionX - hX, positionY - hY);
		//aabb->upperBound = position + h;
		aabb.upperBound.Set(positionX + hX, positionY + hY);
	}
	/// @see B2Shape::ComputeSweptAABB
	//
	static var s_sweptAABB1:B2AABB = new B2AABB();
	static var s_sweptAABB2:B2AABB = new B2AABB();
	//
	public override function ComputeSweptAABB(	aabb:B2AABB,
		transform1:B2XForm,
		transform2:B2XForm) : Void
	{
		//b2AABB aabb1, aabb2;
		var aabb1:B2AABB = s_sweptAABB1;
		var aabb2:B2AABB = s_sweptAABB2;
		ComputeAABB(aabb1, transform1);
		ComputeAABB(aabb2, transform2);
		//aabb.lowerBound = b2Min(aabb1.lowerBound, aabb2.lowerBound);
		aabb.lowerBound.Set((aabb1.lowerBound.x < aabb2.lowerBound.x ? aabb1.lowerBound.x : aabb2.lowerBound.x),
							(aabb1.lowerBound.y < aabb2.lowerBound.y ? aabb1.lowerBound.y : aabb2.lowerBound.y));
		//aabb.upperBound = b2Max(aabb1.upperBound, aabb2.upperBound);
		aabb.upperBound.Set((aabb1.upperBound.x > aabb2.upperBound.x ? aabb1.upperBound.x : aabb2.upperBound.x),
							(aabb1.upperBound.y > aabb2.upperBound.y ? aabb1.upperBound.y : aabb2.upperBound.y));
	}
	/// @see B2Shape::ComputeMass
	//
	
	//
	public override function ComputeMass(massData:B2MassData) : Void{
		// Polygon mass, centroid, and inertia.
		// Let rho be the polygon density in mass per unit area.
		// Then:
		// mass = rho * Std.int(dA)
		// centroid.x = (1/mass) * rho * Std.int(x * dA)
		// centroid.y = (1/mass) * rho * Std.int(y * dA)
		// I = rho * Std.int((x*x + y*y) * dA)
		//
		// We can compute these integrals by summing all the integrals
		// for each triangle of the polygon. To evaluate the integral
		// for a single triangle, we make a change of variables to
		// the (u,v) coordinates of the triangle:
		// x = x0 + e1x * u + e2x * v
		// y = y0 + e1y * u + e2y * v
		// where 0 <= u && 0 <= v && u + v <= 1.
		//
		// We integrate u from [0,1-v] and then v from [0,1].
		// We also need to use the Jacobian of the transformation:
		// D = cross(e1, e2)
		//
		// Simplification: triangle centroid = (1/3) * (p1 + p2 + p3)
		//
		// The rest of the derivation is handled by computer algebra.
		
		//B2Settings.b2Assert(m_vertexCount >= 3);
		
		//b2Vec2 center; center.Set(0.0f, 0.0f);
		var centerX:Float = 0.0;
		var centerY:Float = 0.0;
		var area:Float = 0.0;
		var I:Float = 0.0;
		
		// pRef is the reference point for forming triangles.
		// It's location doesn't change the result (except for rounding error).
		//b2Vec2 pRef(0.0f, 0.0f);
		var p1X:Float = 0.0;
		var p1Y:Float = 0.0;
		/*#if 0
		// This code would put the reference point inside the polygon.
		for (int32 i = 0; i < m_vertexCount; ++i)
		{
			pRef += m_vertices[i];
		}
		pRef *= 1.0f / count;
		#endif*/
		
		var k_inv3:Float = 1.0 / 3.0;
		
		for (i in 0...m_vertexCount)
		{
			// Triangle vertices.
			//b2Vec2 p1 = pRef;
			//
			//b2Vec2 p2 = m_vertices[i];
			var p2:B2Vec2 = m_vertices[i];
			//b2Vec2 p3 = i + 1 < m_vertexCount ? m_vertices[i+1] : m_vertices[0];
			var p3:B2Vec2 = i + 1 < m_vertexCount ? m_vertices[Std.int(i+1)] : m_vertices[0];
			
			//b2Vec2 e1 = p2 - p1;
			var e1X:Float = p2.x - p1X;
			var e1Y:Float = p2.y - p1Y;
			//b2Vec2 e2 = p3 - p1;
			var e2X:Float = p3.x - p1X;
			var e2Y:Float = p3.y - p1Y;
			
			//float32 D = b2Cross(e1, e2);
			var D:Float = e1X * e2Y - e1Y * e2X;
			
			//float32 triangleArea = 0.5f * D;
			var triangleArea:Float = 0.5 * D;
			area += triangleArea;
			
			// Area weighted centroid
			//center += triangleArea * k_inv3 * (p1 + p2 + p3);
			centerX += triangleArea * k_inv3 * (p1X + p2.x + p3.x);
			centerY += triangleArea * k_inv3 * (p1Y + p2.y + p3.y);
			
			//float32 px = p1.x, py = p1.y;
			var px:Float = p1X;
			var py:Float = p1Y;
			//float32 ex1 = e1.x, ey1 = e1.y;
			var ex1:Float = e1X;
			var ey1:Float = e1Y;
			//float32 ex2 = e2.x, ey2 = e2.y;
			var ex2:Float = e2X;
			var ey2:Float = e2Y;
			
			//float32 intx2 = k_inv3 * (0.25f * (ex1*ex1 + ex2*ex1 + ex2*ex2) + (px*ex1 + px*ex2)) + 0.5f*px*px;
			var intx2:Float = k_inv3 * (0.25 * (ex1*ex1 + ex2*ex1 + ex2*ex2) + (px*ex1 + px*ex2)) + 0.5*px*px;
			//float32 inty2 = k_inv3 * (0.25f * (ey1*ey1 + ey2*ey1 + ey2*ey2) + (py*ey1 + py*ey2)) + 0.5f*py*py;
			var inty2:Float = k_inv3 * (0.25 * (ey1*ey1 + ey2*ey1 + ey2*ey2) + (py*ey1 + py*ey2)) + 0.5*py*py;
			
			I += D * (intx2 + inty2);
		}
		
		// Total mass
		massData.mass = m_density * area;
		
		// Center of mass
		//B2Settings.b2Assert(area > box2D.common.math.B2Math.MIN_VALUE);
		//center *= 1.0f / area;
		centerX *= 1.0 / area;
		centerY *= 1.0 / area;
		//massData->center = center;
		massData.center.Set(centerX, centerY);
		
		// Inertia tensor relative to the local origin.
		massData.I = m_density * I;
	}
	/// Get the oriented bounding box relative to the parent body.
	public function GetOBB() :B2OBB{
		return m_obb;
	}
	/// Get local centroid relative to the parent body.
	public function GetCentroid() :B2Vec2{
		return m_centroid;
	}
	/// Get the vertex count.
	public function GetVertexCount() : Int{
		return m_vertexCount;
	}
	/// Get the vertices in local coordinates.
	public function GetVertices() : Array<B2Vec2>{
		return m_vertices;
	}
	/// Get the core vertices in local coordinates. These vertices
	/// represent a smaller polygon that is used for time of impact
	/// computations.
	public function GetCoreVertices() : Array<B2Vec2>{
		return m_coreVertices;
	}
	
	/// Get the edge normal vectors. There is one for each vertex.
	public function GetNormals() : Array<B2Vec2>
	{
		return m_normals;
	}
	/// Get the first vertex and apply the supplied transform.
	public function GetFirstVertex(xf:B2XForm) :B2Vec2{
		return B2Math.b2MulX(xf, m_coreVertices[0]);
	}
	/// Get the centroid and apply the supplied transform.
	public function Centroid(xf:B2XForm) :B2Vec2{
		return B2Math.b2MulX(xf, m_centroid);
	}
	/// Get the support point in the given world direction.
	/// Use the supplied transform.
	var s_supportVec:B2Vec2 ;
	public function Support(xf:B2XForm, dX:Float, dY:Float) :B2Vec2{
		var tVec:B2Vec2;
		
		var tMat:B2Mat22;
		//b2Vec2 dLocal = b2MulT(xf.R, d);
		tMat = xf.R;
		var dLocalX:Float = (dX * tMat.col1.x + dY * tMat.col1.y);
		var dLocalY:Float = (dX * tMat.col2.x + dY * tMat.col2.y);
		
		var bestIndex:Int = 0;
		//var bestValue:Number = b2Dot(m_coreVertices[0], dLocal);
		tVec = m_coreVertices[0];
		var bestValue:Float = (tVec.x*dLocalX + tVec.y*dLocalY);
		for (i in 1...m_vertexCount)
		{
			//var value:Number = b2Dot(m_coreVertices[i], dLocal);
			tVec = m_coreVertices[i];
			var value:Float = (tVec.x*dLocalX + tVec.y*dLocalY);
			if (value > bestValue)
			{
				bestIndex = i;
				bestValue = value;
			}
		}
		
		//return B2Math.b2MulX(xf, m_coreVertices[bestIndex]);
		tMat = xf.R;
		tVec = m_coreVertices[bestIndex];
		s_supportVec.x = xf.position.x + (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		s_supportVec.y = xf.position.y + (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		return s_supportVec;
		
	}
	//--------------- Internals Below -------------------
	
	public function new(def:B2ShapeDef){
		super(def);
		m_obb = new B2OBB();
		m_vertices = new Array();
		m_normals = new Array();
		m_coreVertices = new Array();
		s_supportVec = new B2Vec2();
		
		
		//B2Settings.b2Assert(def.type == e_polygonShape);
		m_type = B2Shape.e_polygonShape;
		var poly:B2PolygonDef = cast( def,B2PolygonDef);
		
		// Get the vertices transformed into the body frame.
		m_vertexCount = poly.vertexCount;
		//B2Settings.b2Assert(3 <= m_vertexCount && m_vertexCount <= b2_maxPolygonVertices);
		
		var i:Int = 0;
		var i1:Int = i;
		var i2:Int = i;
		
		// Copy vertices.
		for (i in 0...m_vertexCount)
		{
			m_vertices[i] = poly.vertices[i].Copy();
		}
		
		// Compute normals. Ensure the edges have non-zero length.
		for (i in 0...m_vertexCount)
		{
			i1 = i;
			i2 = i + 1 < m_vertexCount ? i + 1 : 0;
			//b2Vec2 edge = m_vertices[i2] - m_vertices[i1];
			var edgeX:Float = m_vertices[i2].x - m_vertices[i1].x;
			var edgeY:Float = m_vertices[i2].y - m_vertices[i1].y;
			//B2Settings.b2Assert(edge.LengthSquared() > box2D.common.math.B2Math.MIN_VALUE * box2D.common.math.B2Math.MIN_VALUE);
			//m_normals[i] = b2Cross(edge, 1.0f); ^^ 
			var len:Float = Math.sqrt(edgeX*edgeX + edgeY*edgeY);
			//m_normals[i].Normalize();
			m_normals[i] = new B2Vec2(edgeY/len, -edgeX/len);
		}
		
		/*#ifdef _DEBUG
		// Ensure the polygon is convex.
		for (int32 i = 0; i < m_vertexCount; ++i)
		{
			for (int32 j = 0; j < m_vertexCount; ++j)
			{
				// Don't check vertices on the current edge.
				if (j == i || j == (i + 1) % m_vertexCount)
				{
					continue;
				}
				
				// Your polygon is non-convex (it has an indentation).
				// Or your polygon is too skinny.
				float32 s = b2Dot(m_normals[i], m_vertices[j] - m_vertices[i]);
				b2Assert(s < -b2_linearSlop);
			}
		}
		
		// Ensure the polygon is counter-clockwise.
		for (i = 1; i < m_vertexCount; ++i)
		{
			var cross:Number = B2Math.b2CrossVV(m_normals[Std.int(i-1)], m_normals[i]);
			
			// Keep asinf happy.
			cross = B2Math.b2Clamp(cross, -1.0, 1.0);
			
			// You have consecutive edges that are almost parallel on your polygon.
			var angle:Number = Math.asin(cross);
			//b2Assert(angle > b2_angularSlop);
			trace(angle > B2Settings.b2_angularSlop);
		}
		#endif*/
		
		// Compute the polygon centroid.
		m_centroid = ComputeCentroid(poly.vertices, poly.vertexCount);
		
		// Compute the oriented bounding box.
		ComputeOBB(m_obb, m_vertices, m_vertexCount);
		
		// Create core polygon shape by shifting edges inward.
		// Also compute the min/max radius for CCD.
		for (i in 0...m_vertexCount)
		{
			i1 = i - 1 >= 0 ? i - 1 : m_vertexCount - 1;
			i2 = i;
			
			//b2Vec2 n1 = m_normals[i1];
			var n1X:Float = m_normals[i1].x;
			var n1Y:Float = m_normals[i1].y;
			//b2Vec2 n2 = m_normals[i2];
			var n2X:Float = m_normals[i2].x;
			var n2Y:Float = m_normals[i2].y;
			//b2Vec2 v = m_vertices[i] - m_centroid;
			var vX:Float = m_vertices[i].x - m_centroid.x;
			var vY:Float = m_vertices[i].y - m_centroid.y;
			
			//b2Vec2 d;
			var dX:Float = (n1X*vX + n1Y*vY) - B2Settings.b2_toiSlop;
			var dY:Float = (n2X*vX + n2Y*vY) - B2Settings.b2_toiSlop;
			
			// Shifting the edge inward by b2_toiSlop should
			// not cause the plane to pass the centroid.
			
			// Your shape has a radius/extent less than b2_toiSlop.
			//B2Settings.b2Assert(d.x >= 0.0);
			//B2Settings.b2Assert(d.y >= 0.0);
			//var A:B2Mat22;
			//A.col1.x = n1.x; A.col2.x = n1.y;
			//A.col1.y = n2.x; A.col2.y = n2.y;
			//m_coreVertices[i] = A.Solve(d) + m_centroid;
			//float32 det = a11 * a22 - a12 * a21;
			var det:Float = 1.0/(n1X * n2Y - n1Y * n2X);
			//det = 1.0 / det;
			m_coreVertices[i] = new B2Vec2(	det * (n2Y * dX - n1Y * dY) + m_centroid.x, 
											det * (n1X * dY - n2X * dX) + m_centroid.y);
		}
	}
	public override function UpdateSweepRadius(center:B2Vec2) : Void{
		var tVec:B2Vec2;
		
		// Update the sweep radius (maximum radius) as measured from
		// a local center point.
		m_sweepRadius = 0.0;
		for (i in 0...m_vertexCount)
		{
			//b2Vec2 d = m_coreVertices[i] - center;
			tVec = m_coreVertices[i];
			var dX:Float = tVec.x - center.x;
			var dY:Float = tVec.y - center.y;
			dX = Math.sqrt(dX*dX + dY*dY);
			//m_sweepRadius = b2Max(m_sweepRadius, d.Length());
			if (dX > m_sweepRadius) m_sweepRadius = dX;
		}
	}
	// Local position of the polygon centroid.
	public var m_centroid:B2Vec2;
	public var m_obb:B2OBB ;
	public var m_vertices:Array<B2Vec2> ;
	public var m_normals:Array<B2Vec2> ;
	public var m_coreVertices:Array<B2Vec2> ;
	public var m_vertexCount:Int;
	
	
	
	
	public static function ComputeCentroid(vs:Array<B2Vec2>, count:Int) :B2Vec2
	{
		//B2Settings.b2Assert(count >= 3);
		
		//b2Vec2 c; c.Set(0.0f, 0.0f);
		var c:B2Vec2 = new B2Vec2();
		var area:Float = 0.0;
		
		// pRef is the reference point for forming triangles.
		// It's location doesn't change the result (except for rounding error).
		//b2Vec2 pRef(0.0f, 0.0f);
		var p1X:Float = 0.0;
		var p1Y:Float = 0.0;
	/*#if 0
		// This code would put the reference point inside the polygon.
		for (int32 i = 0; i < count; ++i)
		{
			pRef += vs[i];
		}
		pRef *= 1.0f / count;
	#endif*/
		
		var inv3:Float = 1.0 / 3.0;
		
		for (i in 0...count)
		{
			// Triangle vertices.
			//b2Vec2 p1 = pRef;
				// 0.0, 0.0
			//b2Vec2 p2 = vs[i];
			var p2:B2Vec2 = vs[i];
			//b2Vec2 p3 = i + 1 < count ? vs[i+1] : vs[0];
			var p3:B2Vec2 = i + 1 < count ? vs[i+1] : vs[0];
			
			//b2Vec2 e1 = p2 - p1;
			var e1X:Float = p2.x - p1X;
			var e1Y:Float = p2.y - p1Y;
			//b2Vec2 e2 = p3 - p1;
			var e2X:Float = p3.x - p1X;
			var e2Y:Float = p3.y - p1Y;
			
			//float32 D = b2Cross(e1, e2);
			var D:Float = (e1X * e2Y - e1Y * e2X);
			
			//float32 triangleArea = 0.5f * D;
			var triangleArea:Float = 0.5 * D;
			area += triangleArea;
			
			// Area weighted centroid
			//c += triangleArea * inv3 * (p1 + p2 + p3);
			c.x += triangleArea * inv3 * (p1X + p2.x + p3.x);
			c.y += triangleArea * inv3 * (p1Y + p2.y + p3.y);
		}
		
		// Centroid
		//beSettings.b2Assert(area > box2D.common.math.B2Math.MIN_VALUE);
		//c *= 1.0 / area;
		c.x *= 1.0 / area;
		c.y *= 1.0 / area;
		return c;
	}
	// http://www.geometrictools.com/Documentation/MinimumAreaRectangle.pdf
	public static function ComputeOBB(obb:B2OBB, vs:Array<B2Vec2>, count:Int) : Void
	{
		var i:Int;
		//B2Settings.b2Assert(count <= B2Settings.b2_maxPolygonVertices);
		var p:Array<B2Vec2> = new Array();
		for (i in 0...count)
		{
			p[i] = vs[i];
		}
		p[count] = p[0];
		
		var minArea:Float = box2D.common.math.B2Math.MAX_VALUE;
		
		i = 1;
		while (i <= count)
		{
			var root:B2Vec2 = p[Std.int(i-1)];
			//b2Vec2 ux = p[i] - root;
			var uxX:Float = p[i].x - root.x;
			var uxY:Float = p[i].y - root.y;
			//var length:Number = ux.Normalize();
			var length:Float = Math.sqrt(uxX*uxX + uxY*uxY);
			uxX /= length;
			uxY /= length;
			//B2Settings.b2Assert(length > box2D.common.math.B2Math.MIN_VALUE);
			//b2Vec2 uy(-ux.y, ux.x);
			var uyX:Float = -uxY;
			var uyY:Float = uxX;
			//b2Vec2 lower(FLT_MAX, FLT_MAX);
			var lowerX:Float = box2D.common.math.B2Math.MAX_VALUE;
			var lowerY:Float = box2D.common.math.B2Math.MAX_VALUE;
			//b2Vec2 upper(-FLT_MAX, -FLT_MAX);
			var upperX:Float = -box2D.common.math.B2Math.MAX_VALUE;
			var upperY:Float = -box2D.common.math.B2Math.MAX_VALUE;
			
			for (j in 0...count)
			{
				//b2Vec2 d = p[j] - root;
				var dX:Float = p[j].x - root.x;
				var dY:Float = p[j].y - root.y;
				//b2Vec2 r;
				//var rX:Number = b2Dot(ux, d);
				var rX:Float = (uxX*dX + uxY*dY);
				//var rY:Number = b2Dot(uy, d);
				var rY:Float = (uyX*dX + uyY*dY);
				//lower = b2Min(lower, r);
				if (rX < lowerX) lowerX = rX;
				if (rY < lowerY) lowerY = rY;
				//upper = b2Max(upper, r);
				if (rX > upperX) upperX = rX;
				if (rY > upperY) upperY = rY;
			}
			
			var area:Float = (upperX - lowerX) * (upperY - lowerY);
			if (area < 0.95 * minArea)
			{
				minArea = area;
				//obb->R.col1 = ux;
				obb.R.col1.x = uxX;
				obb.R.col1.y = uxY;
				//obb->R.col2 = uy;
				obb.R.col2.x = uyX;
				obb.R.col2.y = uyY;
				//b2Vec2 center = 0.5f * (lower + upper);
				var centerX:Float = 0.5 * (lowerX + upperX);
				var centerY:Float = 0.5 * (lowerY + upperY);
				//obb->center = root + b2Mul(obb->R, center);
				var tMat:B2Mat22 = obb.R;
				obb.center.x = root.x + (tMat.col1.x * centerX + tMat.col2.x * centerY);
				obb.center.y = root.y + (tMat.col1.y * centerX + tMat.col2.y * centerY);
				//obb->extents = 0.5f * (upper - lower);
				obb.extents.x = 0.5 * (upperX - lowerX);
				obb.extents.y = 0.5 * (upperY - lowerY);
			}
			++i;
		}
		
		//B2Settings.b2Assert(minArea < box2D.common.math.B2Math.MAX_VALUE);
	}
	
	
}