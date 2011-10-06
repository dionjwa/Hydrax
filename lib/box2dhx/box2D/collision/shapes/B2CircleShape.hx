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
import box2D.collision.B2AABB;
import box2D.common.math.B2Mat22;
import box2D.common.B2Settings;


class B2CircleShape extends B2Shape {
	/// @see B2Shape::TestPoint
	
	/// @see B2Shape::TestPoint
	public override function TestPoint(transform:B2XForm, p:B2Vec2) : Bool{
		//b2Vec2 center = transform.position + b2Mul(transform.R, m_localPosition);
		var tMat:B2Mat22 = transform.R;
		var dX:Float = transform.position.x + (tMat.col1.x * m_localPosition.x + tMat.col2.x * m_localPosition.y);
		var dY:Float = transform.position.y + (tMat.col1.y * m_localPosition.x + tMat.col2.y * m_localPosition.y);
		//b2Vec2 d = p - center;
		dX = p.x - dX;
		dY = p.y - dY;
		//return b2Dot(d, d) <= m_radius * m_radius;
		return (dX*dX + dY*dY) <= m_radius * m_radius;
	}
	/// @see B2Shape::TestSegment
	public override function TestSegment(	transform:B2XForm,
						lambda:Array<Float>, // float pointer
						normal:B2Vec2, // pointer
						segment:B2Segment,
						maxLambda:Float) :Bool
	{
		//b2Vec2 position = transform.position + b2Mul(transform.R, m_localPosition);
		var tMat:B2Mat22 = transform.R;
		var positionX:Float = transform.position.x + (tMat.col1.x * m_localPosition.x + tMat.col2.x * m_localPosition.y);
		var positionY:Float = transform.position.x + (tMat.col1.y * m_localPosition.x + tMat.col2.y * m_localPosition.y);
		
		//b2Vec2 s = segment.p1 - position;
		var sX:Float = segment.p1.x - positionX;
		var sY:Float = segment.p1.y - positionY;
		//float32 b = b2Dot(s, s) - m_radius * m_radius;
		var b:Float = (sX*sX + sY*sY) - m_radius * m_radius;
		
		// Does the segment start inside the circle?
		if (b < 0.0)
		{
			return false;
		}
		
		// Solve quadratic equation.
		//b2Vec2 r = segment.p2 - segment.p1;
		var rX:Float = segment.p2.x - segment.p1.x;
		var rY:Float = segment.p2.y - segment.p1.y;
		//float32 c =  b2Dot(s, r);
		var c:Float =  (sX*rX + sY*rY);
		//float32 rr = b2Dot(r, r);
		var rr:Float = (rX*rX + rY*rY);
		var sigma:Float = c * c - rr * b;
		
		// Check for negative discriminant and short segment.
		if (sigma < 0.0 || rr < box2D.common.math.B2Math.MIN_VALUE)
		{
			return false;
		}
		
		// Find the point of intersection of the line with the circle.
		var a:Float = -(c + Math.sqrt(sigma));
		
		// Is the intersection point on the segment?
		if (0.0 <= a && a <= maxLambda * rr)
		{
			a /= rr;
			//*lambda = a;
			lambda[0] = a;
			//*normal = s + a * r;
			normal.x = sX + a * rX;
			normal.y = sY + a * rY;
			normal.Normalize();
			return true;
		}
		
		return false;
	}
	/// @see B2Shape::ComputeAABB
	public override function ComputeAABB(aabb:B2AABB, transform:B2XForm) : Void{
		//b2Vec2 p = transform.position + b2Mul(transform.R, m_localPosition);
		var tMat:B2Mat22 = transform.R;
		var pX:Float = transform.position.x + (tMat.col1.x * m_localPosition.x + tMat.col2.x * m_localPosition.y);
		var pY:Float = transform.position.y + (tMat.col1.y * m_localPosition.x + tMat.col2.y * m_localPosition.y);
		aabb.lowerBound.Set(pX - m_radius, pY - m_radius);
		aabb.upperBound.Set(pX + m_radius, pY + m_radius);
	}
	/// @see B2Shape::ComputeSweptAABB
	public override function ComputeSweptAABB(	aabb:B2AABB,
							transform1:B2XForm,
							transform2:B2XForm) : Void
	{
		var tMat:B2Mat22;
		//b2Vec2 p1 = transform1.position + b2Mul(transform1.R, m_localPosition);
		tMat = transform1.R;
		var p1X:Float = transform1.position.x + (tMat.col1.x * m_localPosition.x + tMat.col2.x * m_localPosition.y);
		var p1Y:Float = transform1.position.y + (tMat.col1.y * m_localPosition.x + tMat.col2.y * m_localPosition.y);
		//b2Vec2 p2 = transform2.position + b2Mul(transform2.R, m_localPosition);
		tMat = transform2.R;
		var p2X:Float = transform2.position.x + (tMat.col1.x * m_localPosition.x + tMat.col2.x * m_localPosition.y);
		var p2Y:Float = transform2.position.y + (tMat.col1.y * m_localPosition.x + tMat.col2.y * m_localPosition.y);
		
		//b2Vec2 lower = b2Min(p1, p2);
		//b2Vec2 upper = b2Max(p1, p2);
		
		//aabb->lowerBound.Set(lower.x - m_radius, lower.y - m_radius);
		aabb.lowerBound.Set((p1X < p2X ? p1X : p2X) - m_radius, (p1Y < p2Y ? p1Y : p2Y) - m_radius);
		//aabb->upperBound.Set(upper.x + m_radius, upper.y + m_radius);
		aabb.upperBound.Set((p1X > p2X ? p1X : p2X) + m_radius, (p1Y > p2Y ? p1Y : p2Y) + m_radius);
	}
	/// @see B2Shape::ComputeMass
	public override function ComputeMass(massData:B2MassData) : Void{
		massData.mass = m_density * B2Settings.b2_pi * m_radius * m_radius;
		massData.center.SetV(m_localPosition);
		
		// inertia about the local origin
		//massData.I = massData.mass * (0.5 * m_radius * m_radius + b2Dot(m_localPosition, m_localPosition));
		massData.I = massData.mass * (0.5 * m_radius * m_radius + (m_localPosition.x*m_localPosition.x + m_localPosition.y*m_localPosition.y));
	}
	/// Get the local position of this circle in its parent body.
	public function GetLocalPosition() :B2Vec2{
		return m_localPosition;
	}
	/// Get the radius of this circle.
	public function GetRadius() : Float{
		return m_radius;
	}
	//--------------- Internals Below -------------------
	public function new(def:B2ShapeDef){
		
		super(def);
		m_localPosition = new B2Vec2();
		
		//B2Settings.b2Assert(def.type == e_circleShape);
		var circleDef:B2CircleDef = cast( def,B2CircleDef);
		
		m_type = B2Shape.e_circleShape;
		m_localPosition.SetV(circleDef.localPosition);
		m_radius = circleDef.radius;
		
	}
	public override function UpdateSweepRadius(center:B2Vec2) : Void{
		// Update the sweep radius (maximum radius) as measured from
		// a local center point.
		//b2Vec2 d = m_localPosition - center;
		var dX:Float = m_localPosition.x - center.x;
		var dY:Float = m_localPosition.y - center.y;
		dX = Math.sqrt(dX*dX + dY*dY); // length
		//m_sweepRadius = d.Length() + m_radius - b2_toiSlop;
		m_sweepRadius = dX + m_radius - B2Settings.b2_toiSlop;
	}
	// Local position in parent body
	public var m_localPosition:B2Vec2 ;
	public var m_radius:Float;
	
}