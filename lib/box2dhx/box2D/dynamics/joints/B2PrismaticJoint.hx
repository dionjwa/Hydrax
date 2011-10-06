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
package box2D.dynamics.joints;



import box2D.common.math.B2Vec2;
import box2D.dynamics.B2TimeStep;
import box2D.common.math.B2Mat22;
import box2D.dynamics.B2Body;
import box2D.common.math.B2Math;
import box2D.common.B2Settings;

// Linear constraint (point-to-line)
// d = p2 - p1 = x2 + r2 - x1 - r1
// C = dot(ay1, d)
// Cdot = dot(d, cross(w1, ay1)) + dot(ay1, v2 + cross(w2, r2) - v1 - cross(w1, r1))
//      = -dot(ay1, v1) - dot(cross(d + r1, ay1), w1) + dot(ay1, v2) + dot(cross(r2, ay1), v2)
// J = [-ay1 -cross(d+r1,ay1) ay1 cross(r2,ay1)];
//
// Angular constraint
// C = a2 - a1 + a_initial
// Cdot = w2 - w1
// J = [0 0 -1 0 0 1];
// Motor/Limit linear constraint
// C = dot(ax1, d)
// Cdot = = -dot(ax1, v1) - dot(cross(d + r1, ax1), w1) + dot(ax1, v2) + dot(cross(r2, ax1), v2)
// J = [-ax1 -cross(d+r1,ax1) ax1 cross(r2,ax1)];
class B2PrismaticJoint extends B2Joint {
	
	public override function GetAnchor1():B2Vec2{
		return m_body1.GetWorldPoint(m_localAnchor1);
	}
	public override function GetAnchor2():B2Vec2{
		return m_body2.GetWorldPoint(m_localAnchor2);
	}
	public override function GetReactionForce() :B2Vec2
	{
		var tMat:B2Mat22 = m_body1.m_xf.R;
		//b2Vec2 ax1 = b2Mul(m_body1->m_xf.R, m_localXAxis1);
		var ax1X:Float = m_limitForce* (tMat.col1.x * m_localXAxis1.x + tMat.col2.x * m_localXAxis1.y);
		var ax1Y:Float = m_limitForce* (tMat.col1.y * m_localXAxis1.x + tMat.col2.y * m_localXAxis1.y);
		//b2Vec2 ay1 = b2Mul(m_body1->m_xf.R, m_localYAxis1);
		var ay1X:Float = m_force* (tMat.col1.x * m_localYAxis1.x + tMat.col2.x * m_localYAxis1.y);
		var ay1Y:Float = m_force* (tMat.col1.y * m_localYAxis1.x + tMat.col2.y * m_localYAxis1.y);
		
		//return m_limitForce * ax1 + m_force * ay1;
		return new B2Vec2( m_limitForce*ax1X + m_force*ay1X,  m_limitForce*ax1Y + m_force*ay1Y);
	}
	public override function GetReactionTorque() : Float
	{
		return m_torque;
	}
	
	/// Get the current joint translation, usually in meters.
	public function GetJointTranslation():Float{
		var b1:B2Body = m_body1;
		var b2:B2Body = m_body2;
		
		var tMat:B2Mat22;
		
		var p1:B2Vec2 = b1.GetWorldPoint(m_localAnchor1);
		var p2:B2Vec2 = b2.GetWorldPoint(m_localAnchor2);
		//var d:B2Vec2 = B2Math.SubtractVV(p2, p1);
		var dX:Float = p2.x - p1.x;
		var dY:Float = p2.y - p1.y;
		//b2Vec2 axis = b1->GetWorldVector(m_localXAxis1);
		var axis:B2Vec2 = b1.GetWorldVector(m_localXAxis1);
		
		//float32 translation = b2Dot(d, axis);
		var translation:Float = axis.x*dX + axis.y*dY;
		return translation;
	}
	
	/// Get the current joint translation speed, usually in meters per second.
	public function GetJointSpeed():Float{
		var b1:B2Body = m_body1;
		var b2:B2Body = m_body2;
		
		var tMat:B2Mat22;
		
		//b2Vec2 r1 = b2Mul(b1->m_xf.R, m_localAnchor1 - b1->GetLocalCenter());
		tMat = b1.m_xf.R;
		var r1X:Float = m_localAnchor1.x - b1.m_sweep.localCenter.x;
		var r1Y:Float = m_localAnchor1.y - b1.m_sweep.localCenter.y;
		var tX:Float =  (tMat.col1.x * r1X + tMat.col2.x * r1Y);
		r1Y = (tMat.col1.y * r1X + tMat.col2.y * r1Y);
		r1X = tX;
		//b2Vec2 r2 = b2Mul(b2->m_xf.R, m_localAnchor2 - b2->GetLocalCenter());
		tMat = b2.m_xf.R;
		var r2X:Float = m_localAnchor2.x - b2.m_sweep.localCenter.x;
		var r2Y:Float = m_localAnchor2.y - b2.m_sweep.localCenter.y;
		tX =  (tMat.col1.x * r2X + tMat.col2.x * r2Y);
		r2Y = (tMat.col1.y * r2X + tMat.col2.y * r2Y);
		r2X = tX;
		
		//b2Vec2 p1 = b1->m_sweep.c + r1;
		var p1X:Float = b1.m_sweep.c.x + r1X;
		var p1Y:Float = b1.m_sweep.c.y + r1Y;
		//b2Vec2 p2 = b2->m_sweep.c + r2;
		var p2X:Float = b2.m_sweep.c.x + r2X;
		var p2Y:Float = b2.m_sweep.c.y + r2Y;
		//var d:B2Vec2 = B2Math.SubtractVV(p2, p1);
		var dX:Float = p2X - p1X;
		var dY:Float = p2Y - p1Y;
		//b2Vec2 axis = b1->GetWorldVector(m_localXAxis1);
		var axis:B2Vec2 = b1.GetWorldVector(m_localXAxis1);
		
		var v1:B2Vec2 = b1.m_linearVelocity;
		var v2:B2Vec2 = b2.m_linearVelocity;
		var w1:Float = b1.m_angularVelocity;
		var w2:Float = b2.m_angularVelocity;
		
		//var speed:Number = B2Math.b2Dot(d, B2Math.b2CrossFV(w1, ax1)) + B2Math.b2Dot(ax1, B2Math.SubtractVV( B2Math.SubtractVV( B2Math.AddVV( v2 , B2Math.b2CrossFV(w2, r2)) , v1) , B2Math.b2CrossFV(w1, r1)));
		//var b2D:Number = (dX*(-w1 * ax1Y) + dY*(w1 * ax1X));
		//var b2D2:Number = (ax1X * ((( v2.x + (-w2 * r2Y)) - v1.x) - (-w1 * r1Y)) + ax1Y * ((( v2.y + (w2 * r2X)) - v1.y) - (w1 * r1X)));
		var speed:Float = (dX*(-w1 * axis.y) + dY*(w1 * axis.x)) + (axis.x * ((( v2.x + (-w2 * r2Y)) - v1.x) - (-w1 * r1Y)) + axis.y * ((( v2.y + (w2 * r2X)) - v1.y) - (w1 * r1X)));
		
		return speed;
	}
	
	/// Is the joint limit enabled?
	public function IsLimitEnabled() : Bool
	{
		return m_enableLimit;
	}
	/// Enable/disable the joint limit.
	public function EnableLimit(flag:Bool) : Void
	{
		m_enableLimit = flag;
	}
	/// Get the lower joint limit, usually in meters.
	public function GetLowerLimit() : Float
	{
		return m_lowerTranslation;
	}
	/// Get the upper joint limit, usually in meters.
	public function GetUpperLimit() : Float
	{
		return m_upperTranslation;
	}
	/// Set the joint limits, usually in meters.
	public function SetLimits(lower:Float, upper:Float) : Void
	{
		//B2Settings.b2Assert(lower <= upper);
		m_lowerTranslation = lower;
		m_upperTranslation = upper;
	}
	/// Is the joint motor enabled?
	public function IsMotorEnabled() : Bool
	{
		return m_enableMotor;
	}
	/// Enable/disable the joint motor.
	public function EnableMotor(flag:Bool) : Void
	{
		m_enableMotor = flag;
	}
	/// Set the motor speed, usually in meters per second.
	public function SetMotorSpeed(speed:Float) : Void
	{
		m_motorSpeed = speed;
	}
	/// Get the motor speed, usually in meters per second.
	public function GetMotorSpeed() :Float
	{
		return m_motorSpeed;
	}
	
	/// Set the maximum motor force, usually in N.
	public function SetMaxMotorForce(force:Float) : Void
	{
		m_maxMotorForce = force;
	}
	/// Get the current motor force, usually in N.
	public function GetMotorForce() : Float
	{
		return m_motorForce;
	}
	
	//--------------- Internals Below -------------------
	public function new(def:B2PrismaticJointDef){
		super(def);
		m_localAnchor1 = new B2Vec2();
		m_localAnchor2 = new B2Vec2();
		m_localXAxis1 = new B2Vec2();
		m_localYAxis1 = new B2Vec2();
		m_linearJacobian = new B2Jacobian();
		m_motorJacobian = new B2Jacobian();
		
		var tMat:B2Mat22;
		var tX:Float;
		var tY:Float;
		
		m_localAnchor1.SetV(def.localAnchor1);
		m_localAnchor2.SetV(def.localAnchor2);
		m_localXAxis1.SetV(def.localAxis1);
		
		//m_localYAxis1 = b2Cross(1.0f, m_localXAxis1);
		m_localYAxis1.x = -m_localXAxis1.y;
		m_localYAxis1.y = m_localXAxis1.x;
		
		m_refAngle = def.referenceAngle;
		
		m_linearJacobian.SetZero();
		m_linearMass = 0.0;
		m_force = 0.0;
		
		m_angularMass = 0.0;
		m_torque = 0.0;
		
		m_motorJacobian.SetZero();
		m_motorMass = 0.0;
		m_motorForce = 0.0;
		m_limitForce = 0.0;
		m_limitPositionImpulse = 0.0;
		
		m_lowerTranslation = def.lowerTranslation;
		m_upperTranslation = def.upperTranslation;
		m_maxMotorForce = def.maxMotorForce;
		m_motorSpeed = def.motorSpeed;
		m_enableLimit = def.enableLimit;
		m_enableMotor = def.enableMotor;
	}
	public override function InitVelocityConstraints(step:B2TimeStep) : Void{
		var b1:B2Body = m_body1;
		var b2:B2Body = m_body2;
		
		var tMat:B2Mat22;
		var tX:Float;
		
		// Compute the effective masses.
		//b2Vec2 r1 = b2Mul(b1->m_xf.R, m_localAnchor1 - b1->GetLocalCenter());
		tMat = b1.m_xf.R;
		var r1X:Float = m_localAnchor1.x - b1.m_sweep.localCenter.x;
		var r1Y:Float = m_localAnchor1.y - b1.m_sweep.localCenter.y;
		tX =  (tMat.col1.x * r1X + tMat.col2.x * r1Y);
		r1Y = (tMat.col1.y * r1X + tMat.col2.y * r1Y);
		r1X = tX;
		//b2Vec2 r2 = b2Mul(b2->m_xf.R, m_localAnchor2 - b2->GetLocalCenter());
		tMat = b2.m_xf.R;
		var r2X:Float = m_localAnchor2.x - b2.m_sweep.localCenter.x;
		var r2Y:Float = m_localAnchor2.y - b2.m_sweep.localCenter.y;
		tX =  (tMat.col1.x * r2X + tMat.col2.x * r2Y);
		r2Y = (tMat.col1.y * r2X + tMat.col2.y * r2Y);
		r2X = tX;
		
		//float32 invMass1 = b1->m_invMass, invMass2 = b2->m_invMass;
		var invMass1:Float = b1.m_invMass;
		var invMass2:Float = b2.m_invMass;
		//float32 invI1 = b1->m_invI, invI2 = b2->m_invI;
		var invI1:Float = b1.m_invI;
		var invI2:Float = b2.m_invI;
		
		// Compute point to line constraint effective mass.
		// J = [-ay1 -cross(d+r1,ay1) ay1 cross(r2,ay1)];
		//b2Vec2 ay1 = b2Mul(b1->m_xf.R, m_localYAxis1);
		tMat = b1.m_xf.R;
		var ay1X:Float = tMat.col1.x * m_localYAxis1.x + tMat.col2.x * m_localYAxis1.y;
		var ay1Y:Float = tMat.col1.y * m_localYAxis1.x + tMat.col2.y * m_localYAxis1.y;
		//b2Vec2 e = b2->m_sweep.c + r2 - b1->m_sweep.c;	// e = d + r1
		var eX:Float = b2.m_sweep.c.x + r2X - b1.m_sweep.c.x;
		var eY:Float = b2.m_sweep.c.y + r2Y - b1.m_sweep.c.y;
		
		//m_linearJacobian.Set(-ay1, -B2Math.b2Cross(e, ay1), ay1, B2Math.b2Cross(r2, ay1));
		m_linearJacobian.linear1.x = -ay1X; 
		m_linearJacobian.linear1.y = -ay1Y;
		m_linearJacobian.linear2.x = ay1X; 
		m_linearJacobian.linear2.y = ay1Y;
		m_linearJacobian.angular1 = -(eX * ay1Y - eY * ay1X); 
		m_linearJacobian.angular2 = r2X * ay1Y - r2Y * ay1X; 
		
		m_linearMass =	invMass1 + invI1 * m_linearJacobian.angular1 * m_linearJacobian.angular1 +
						invMass2 + invI2 * m_linearJacobian.angular2 * m_linearJacobian.angular2;
		//B2Settings.b2Assert(m_linearMass > box2D.common.math.B2Math.MIN_VALUE);
		m_linearMass = 1.0 / m_linearMass;
		
		// Compute angular constraint effective mass.
		m_angularMass = invI1 + invI2;
		if (m_angularMass > box2D.common.math.B2Math.MIN_VALUE)
		{
			m_angularMass = 1.0 / m_angularMass;
		}
		
		// Compute motor and limit terms.
		if (m_enableLimit || m_enableMotor)
		{
			// The motor and limit share a Jacobian and effective mass.
			//b2Vec2 ax1 = b2Mul(b1->m_xf.R, m_localXAxis1);
			tMat = b1.m_xf.R;
			var ax1X:Float = tMat.col1.x * m_localXAxis1.x + tMat.col2.x * m_localXAxis1.y;
			var ax1Y:Float = tMat.col1.y * m_localXAxis1.x + tMat.col2.y * m_localXAxis1.y;
			//m_motorJacobian.Set(-ax1, -b2Cross(e, ax1), ax1, b2Cross(r2, ax1));
			m_motorJacobian.linear1.x = -ax1X; m_motorJacobian.linear1.y = -ax1Y;
			m_motorJacobian.linear2.x = ax1X; m_motorJacobian.linear2.y = ax1Y;
			m_motorJacobian.angular1 = -(eX * ax1Y - eY * ax1X); 
			m_motorJacobian.angular2 = r2X * ax1Y - r2Y * ax1X; 
			
			m_motorMass =	invMass1 + invI1 * m_motorJacobian.angular1 * m_motorJacobian.angular1 +
							invMass2 + invI2 * m_motorJacobian.angular2 * m_motorJacobian.angular2;
			//B2Settings.b2Assert(m_motorMass > box2D.common.math.B2Math.MIN_VALUE);
			m_motorMass = 1.0 / m_motorMass;
			
			if (m_enableLimit)
			{
				//b2Vec2 d = e - r1;	// p2 - p1
				var dX:Float = eX - r1X;
				var dY:Float = eY - r1Y;
				//float32 jointTranslation = b2Dot(ax1, d);
				var jointTranslation:Float = ax1X * dX + ax1Y * dY;
				if (B2Math.b2Abs(m_upperTranslation - m_lowerTranslation) < 2.0 * B2Settings.b2_linearSlop)
				{
					m_limitState = B2Joint.e_equalLimits;
				}
				else if (jointTranslation <= m_lowerTranslation)
				{
					if (m_limitState != B2Joint.e_atLowerLimit)
					{
						m_limitForce = 0.0;
					}
					m_limitState = B2Joint.e_atLowerLimit;
				}
				else if (jointTranslation >= m_upperTranslation)
				{
					if (m_limitState != B2Joint.e_atUpperLimit)
					{
						m_limitForce = 0.0;
					}
					m_limitState = B2Joint.e_atUpperLimit;
				}
				else
				{
					m_limitState = B2Joint.e_inactiveLimit;
					m_limitForce = 0.0;
				}
			}
		}
		
		if (m_enableMotor == false)
		{
			m_motorForce = 0.0;
		}
		
		if (m_enableLimit == false)
		{
			m_limitForce = 0.0;
		}
		
		if (step.warmStarting)
		{
			//b2Vec2 P1 = step.dt * (m_force * m_linearJacobian.linear1 + (m_motorForce + m_limitForce) * m_motorJacobian.linear1);
			var P1X:Float = step.dt * (m_force * m_linearJacobian.linear1.x + (m_motorForce + m_limitForce) * m_motorJacobian.linear1.x);
			var P1Y:Float = step.dt * (m_force * m_linearJacobian.linear1.y + (m_motorForce + m_limitForce) * m_motorJacobian.linear1.y);
			//b2Vec2 P2 = step.dt * (m_force * m_linearJacobian.linear2 + (m_motorForce + m_limitForce) * m_motorJacobian.linear2);
			var P2X:Float = step.dt * (m_force * m_linearJacobian.linear2.x + (m_motorForce + m_limitForce) * m_motorJacobian.linear2.x);
			var P2Y:Float = step.dt * (m_force * m_linearJacobian.linear2.y + (m_motorForce + m_limitForce) * m_motorJacobian.linear2.y);
			//float32 L1 = step.dt * (m_force * m_linearJacobian.angular1 - m_torque + (m_motorForce + m_limitForce) * m_motorJacobian.angular1);
			var L1:Float = step.dt * (m_force * m_linearJacobian.angular1 - m_torque + (m_motorForce + m_limitForce) * m_motorJacobian.angular1);
			//float32 L2 = step.dt * (m_force * m_linearJacobian.angular2 + m_torque + (m_motorForce + m_limitForce) * m_motorJacobian.angular2);
			var L2:Float = step.dt * (m_force * m_linearJacobian.angular2 + m_torque + (m_motorForce + m_limitForce) * m_motorJacobian.angular2);
			
			//b1->m_linearVelocity += invMass1 * P1;
			b1.m_linearVelocity.x += invMass1 * P1X;
			b1.m_linearVelocity.y += invMass1 * P1Y;
			//b1->m_angularVelocity += invI1 * L1;
			b1.m_angularVelocity += invI1 * L1;
			
			//b2->m_linearVelocity += invMass2 * P2;
			b2.m_linearVelocity.x += invMass2 * P2X;
			b2.m_linearVelocity.y += invMass2 * P2Y;
			//b2->m_angularVelocity += invI2 * L2;
			b2.m_angularVelocity += invI2 * L2;
		}
		else
		{
			m_force = 0.0;
			m_torque = 0.0;
			m_limitForce = 0.0;
			m_motorForce = 0.0;
		}
		
		m_limitPositionImpulse = 0.0;
		
	}
	
	public override function SolveVelocityConstraints(step:B2TimeStep) : Void{
		var b1:B2Body = m_body1;
		var b2:B2Body = m_body2;
		
		var invMass1:Float = b1.m_invMass;
		var invMass2:Float = b2.m_invMass;
		var invI1:Float = b1.m_invI;
		var invI2:Float = b2.m_invI;
		
		var oldLimitForce:Float;
		
		// Solve linear constraint.
		var linearCdot:Float = m_linearJacobian.Compute(b1.m_linearVelocity, b1.m_angularVelocity, b2.m_linearVelocity, b2.m_angularVelocity);
		var force:Float = -step.inv_dt * m_linearMass * linearCdot;
		m_force += force;
		
		var P:Float = step.dt * force;
		//b1->m_linearVelocity += (invMass1 * P) * m_linearJacobian.linear1;
		b1.m_linearVelocity.x += (invMass1 * P) * m_linearJacobian.linear1.x;
		b1.m_linearVelocity.y += (invMass1 * P) * m_linearJacobian.linear1.y;
		//b1->m_angularVelocity += invI1 * P * m_linearJacobian.angular1;
		b1.m_angularVelocity += invI1 * P * m_linearJacobian.angular1;
		
		//b2->m_linearVelocity += (invMass2 * P) * m_linearJacobian.linear2;
		b2.m_linearVelocity.x += (invMass2 * P) * m_linearJacobian.linear2.x;
		b2.m_linearVelocity.y += (invMass2 * P) * m_linearJacobian.linear2.y;
		//b2.m_angularVelocity += invI2 * P * m_linearJacobian.angular2;
		b2.m_angularVelocity += invI2 * P * m_linearJacobian.angular2;
		
		// Solve angular constraint.
		var angularCdot:Float = b2.m_angularVelocity - b1.m_angularVelocity;
		var torque:Float = -step.inv_dt * m_angularMass * angularCdot;
		m_torque += torque;
		
		var L:Float = step.dt * torque;
		b1.m_angularVelocity -= invI1 * L;
		b2.m_angularVelocity += invI2 * L;
		
		// Solve linear motor constraint.
		if (m_enableMotor && m_limitState != B2Joint.e_equalLimits)
		{
			var motorCdot:Float = m_motorJacobian.Compute(b1.m_linearVelocity, b1.m_angularVelocity, b2.m_linearVelocity, b2.m_angularVelocity) - m_motorSpeed;
			var motorForce:Float = -step.inv_dt * m_motorMass * motorCdot;
			var oldMotorForce:Float = m_motorForce;
			m_motorForce = B2Math.b2Clamp(m_motorForce + motorForce, -m_maxMotorForce, m_maxMotorForce);
			motorForce = m_motorForce - oldMotorForce;
			
			P = step.dt * motorForce;
			//b1.m_linearVelocity += (invMass1 * P) * m_motorJacobian.linear1;
			b1.m_linearVelocity.x += (invMass1 * P) * m_motorJacobian.linear1.x;
			b1.m_linearVelocity.y += (invMass1 * P) * m_motorJacobian.linear1.y;
			//b1.m_angularVelocity += invI1 * P * m_motorJacobian.angular1;
			b1.m_angularVelocity += invI1 * P * m_motorJacobian.angular1;
			
			//b2->m_linearVelocity += (invMass2 * P) * m_motorJacobian.linear2;
			b2.m_linearVelocity.x += (invMass2 * P) * m_motorJacobian.linear2.x;
			b2.m_linearVelocity.y += (invMass2 * P) * m_motorJacobian.linear2.y;
			//b2->m_angularVelocity += invI2 * P * m_motorJacobian.angular2;
			b2.m_angularVelocity += invI2 * P * m_motorJacobian.angular2;
		}
		
		// Solve linear limit constraint.
		if (m_enableLimit && m_limitState != B2Joint.e_inactiveLimit)
		{
			var limitCdot:Float = m_motorJacobian.Compute(b1.m_linearVelocity, b1.m_angularVelocity, b2.m_linearVelocity, b2.m_angularVelocity);
			var limitForce:Float = -step.inv_dt * m_motorMass * limitCdot;
			
			if (m_limitState == B2Joint.e_equalLimits)
			{
				m_limitForce += limitForce;
			}
			else if (m_limitState == B2Joint.e_atLowerLimit)
			{
				oldLimitForce = m_limitForce;
				m_limitForce = B2Math.b2Max(m_limitForce + limitForce, 0.0);
				limitForce = m_limitForce - oldLimitForce;
			}
			else if (m_limitState == B2Joint.e_atUpperLimit)
			{
				oldLimitForce = m_limitForce;
				m_limitForce = B2Math.b2Min(m_limitForce + limitForce, 0.0);
				limitForce = m_limitForce - oldLimitForce;
			}
			
			P = step.dt * limitForce;
			//b1->m_linearVelocity += (invMass1 * P) * m_motorJacobian.linear1;
			b1.m_linearVelocity.x += (invMass1 * P) * m_motorJacobian.linear1.x;
			b1.m_linearVelocity.y += (invMass1 * P) * m_motorJacobian.linear1.y;
			//b1->m_angularVelocity += invI1 * P * m_motorJacobian.angular1;
			b1.m_angularVelocity += invI1 * P * m_motorJacobian.angular1;
			
			//b2->m_linearVelocity += (invMass2 * P) * m_motorJacobian.linear2;
			b2.m_linearVelocity.x += (invMass2 * P) * m_motorJacobian.linear2.x;
			b2.m_linearVelocity.y += (invMass2 * P) * m_motorJacobian.linear2.y;
			//b2->m_angularVelocity += invI2 * P * m_motorJacobian.angular2;
			b2.m_angularVelocity += invI2 * P * m_motorJacobian.angular2;
		}
	}
	
	
	
	public override function SolvePositionConstraints():Bool{
		
		var limitC:Float;
		var oldLimitImpulse:Float;
		
		var b1:B2Body = m_body1;
		var b2:B2Body = m_body2;
		
		var invMass1:Float = b1.m_invMass;
		var invMass2:Float = b2.m_invMass;
		var invI1:Float = b1.m_invI;
		var invI2:Float = b2.m_invI;
		
		var tMat:B2Mat22;
		var tX:Float;
		
		//b2Vec2 r1 = b2Mul(b1->m_xf.R, m_localAnchor1 - b1->GetLocalCenter());
		tMat = b1.m_xf.R;
		var r1X:Float = m_localAnchor1.x - b1.m_sweep.localCenter.x;
		var r1Y:Float = m_localAnchor1.y - b1.m_sweep.localCenter.y;
		tX =  (tMat.col1.x * r1X + tMat.col2.x * r1Y);
		r1Y = (tMat.col1.y * r1X + tMat.col2.y * r1Y);
		r1X = tX;
		//b2Vec2 r2 = b2Mul(b2->m_xf.R, m_localAnchor2 - b2->GetLocalCenter());
		tMat = b2.m_xf.R;
		var r2X:Float = m_localAnchor2.x - b2.m_sweep.localCenter.x;
		var r2Y:Float = m_localAnchor2.y - b2.m_sweep.localCenter.y;
		tX =  (tMat.col1.x * r2X + tMat.col2.x * r2Y);
		r2Y = (tMat.col1.y * r2X + tMat.col2.y * r2Y);
		r2X = tX;
		
		//b2Vec2 p1 = b1->m_sweep.c + r1;
		var p1X:Float = b1.m_sweep.c.x + r1X;
		var p1Y:Float = b1.m_sweep.c.y + r1Y;
		//b2Vec2 p2 = b2->m_sweep.c + r2;
		var p2X:Float = b2.m_sweep.c.x + r2X;
		var p2Y:Float = b2.m_sweep.c.y + r2Y;
		//b2Vec2 d = p2 - p1;
		var dX:Float = p2X - p1X;
		var dY:Float = p2Y - p1Y;
		//b2Vec2 ay1 = b2Mul(b1->m_xf.R, m_localYAxis1);
		tMat = b1.m_xf.R;
		var ay1X:Float = tMat.col1.x * m_localYAxis1.x + tMat.col2.x * m_localYAxis1.y;
		var ay1Y:Float = tMat.col1.y * m_localYAxis1.x + tMat.col2.y * m_localYAxis1.y;
		
		// Solve linear (point-to-line) constraint.
		//float32 linearC = b2Dot(ay1, d);
		var linearC:Float = ay1X*dX + ay1Y*dY;
		// Prevent overly large corrections.
		linearC = B2Math.b2Clamp(linearC, -B2Settings.b2_maxLinearCorrection, B2Settings.b2_maxLinearCorrection);
		var linearImpulse:Float = -m_linearMass * linearC;
		
		//b1->m_sweep.c += (invMass1 * linearImpulse) * m_linearJacobian.linear1;
		b1.m_sweep.c.x += (invMass1 * linearImpulse) * m_linearJacobian.linear1.x;
		b1.m_sweep.c.y += (invMass1 * linearImpulse) * m_linearJacobian.linear1.y;
		//b1->m_sweep.a += invI1 * linearImpulse * m_linearJacobian.angular1;
		b1.m_sweep.a += invI1 * linearImpulse * m_linearJacobian.angular1;
		//b1->SynchronizeTransform(); // updated by angular constraint
		
		//b2->m_sweep.c += (invMass2 * linearImpulse) * m_linearJacobian.linear2;
		b2.m_sweep.c.x += (invMass2 * linearImpulse) * m_linearJacobian.linear2.x;
		b2.m_sweep.c.y += (invMass2 * linearImpulse) * m_linearJacobian.linear2.y;
		//b2->m_sweep.a += invI2 * linearImpulse * m_linearJacobian.angular2;
		b2.m_sweep.a += invI2 * linearImpulse * m_linearJacobian.angular2;
		//b2->SynchronizeTransform(); // updated by angular constraint
		
		var positionError:Float = B2Math.b2Abs(linearC);
		
		// Solve angular constraint.
		var angularC:Float = b2.m_sweep.a - b1.m_sweep.a - m_refAngle;
		// Prevent overly large corrections.
		angularC = B2Math.b2Clamp(angularC, -B2Settings.b2_maxAngularCorrection, B2Settings.b2_maxAngularCorrection);
		var angularImpulse:Float = -m_angularMass * angularC;
		
		b1.m_sweep.a -= b1.m_invI * angularImpulse;
		b2.m_sweep.a += b2.m_invI * angularImpulse;
		b1.SynchronizeTransform();
		b2.SynchronizeTransform();
		
		var angularError:Float = B2Math.b2Abs(angularC);
		
		// Solve linear limit constraint.
		if (m_enableLimit && m_limitState != B2Joint.e_inactiveLimit)
		{
			
			//b2Vec2 r1 = b2Mul(b1->m_xf.R, m_localAnchor1 - b1->GetLocalCenter());
			tMat = b1.m_xf.R;
			r1X = m_localAnchor1.x - b1.m_sweep.localCenter.x;
			r1Y = m_localAnchor1.y - b1.m_sweep.localCenter.y;
			tX =  (tMat.col1.x * r1X + tMat.col2.x * r1Y);
			r1Y = (tMat.col1.y * r1X + tMat.col2.y * r1Y);
			r1X = tX;
			//b2Vec2 r2 = b2Mul(b2->m_xf.R, m_localAnchor2 - b2->GetLocalCenter());
			tMat = b2.m_xf.R;
			r2X = m_localAnchor2.x - b2.m_sweep.localCenter.x;
			r2Y = m_localAnchor2.y - b2.m_sweep.localCenter.y;
			tX =  (tMat.col1.x * r2X + tMat.col2.x * r2Y);
			r2Y = (tMat.col1.y * r2X + tMat.col2.y * r2Y);
			r2X = tX;
			
			//b2Vec2 p1 = b1->m_sweep.c + r1;
			p1X = b1.m_sweep.c.x + r1X;
			p1Y = b1.m_sweep.c.y + r1Y;
			//b2Vec2 p2 = b2->m_sweep.c + r2;
			p2X = b2.m_sweep.c.x + r2X;
			p2Y = b2.m_sweep.c.y + r2Y;
			//b2Vec2 d = p2 - p1;
			dX = p2X - p1X;
			dY = p2Y - p1Y;
			//b2Vec2 ax1 = b2Mul(b1->m_xf.R, m_localXAxis1);
			tMat = b1.m_xf.R;
			var ax1X:Float = tMat.col1.x * m_localXAxis1.x + tMat.col2.x * m_localXAxis1.y;
			var ax1Y:Float = tMat.col1.y * m_localXAxis1.x + tMat.col2.y * m_localXAxis1.y;
			
			//float32 translation = b2Dot(ax1, d);
			var translation:Float = (ax1X*dX + ax1Y*dY);
			var limitImpulse:Float = 0.0;
			
			if (m_limitState == B2Joint.e_equalLimits)
			{
				// Prevent large angular corrections
				limitC = B2Math.b2Clamp(translation, -B2Settings.b2_maxLinearCorrection, B2Settings.b2_maxLinearCorrection);
				limitImpulse = -m_motorMass * limitC;
				positionError = B2Math.b2Max(positionError, B2Math.b2Abs(angularC));
			}
			else if (m_limitState == B2Joint.e_atLowerLimit)
			{
				limitC = translation - m_lowerTranslation;
				positionError = B2Math.b2Max(positionError, -limitC);
				
				// Prevent large linear corrections and allow some slop.
				limitC = B2Math.b2Clamp(limitC + B2Settings.b2_linearSlop, -B2Settings.b2_maxLinearCorrection, 0.0);
				limitImpulse = -m_motorMass * limitC;
				oldLimitImpulse = m_limitPositionImpulse;
				m_limitPositionImpulse = B2Math.b2Max(m_limitPositionImpulse + limitImpulse, 0.0);
				limitImpulse = m_limitPositionImpulse - oldLimitImpulse;
			}
			else if (m_limitState == B2Joint.e_atUpperLimit)
			{
				limitC = translation - m_upperTranslation;
				positionError = B2Math.b2Max(positionError, limitC);
				
				// Prevent large linear corrections and allow some slop.
				limitC = B2Math.b2Clamp(limitC - B2Settings.b2_linearSlop, 0.0, B2Settings.b2_maxLinearCorrection);
				limitImpulse = -m_motorMass * limitC;
				oldLimitImpulse = m_limitPositionImpulse;
				m_limitPositionImpulse = B2Math.b2Min(m_limitPositionImpulse + limitImpulse, 0.0);
				limitImpulse = m_limitPositionImpulse - oldLimitImpulse;
			}
			
			//b1->m_sweep.c += (invMass1 * limitImpulse) * m_motorJacobian.linear1;
			b1.m_sweep.c.x += (invMass1 * limitImpulse) * m_motorJacobian.linear1.x;
			b1.m_sweep.c.y += (invMass1 * limitImpulse) * m_motorJacobian.linear1.y;
			//b1->m_sweep.a += invI1 * limitImpulse * m_motorJacobian.angular1;
			b1.m_sweep.a += invI1 * limitImpulse * m_motorJacobian.angular1;
			
			//b2->m_sweep.c += (invMass2 * limitImpulse) * m_motorJacobian.linear2;
			b2.m_sweep.c.x += (invMass2 * limitImpulse) * m_motorJacobian.linear2.x;
			b2.m_sweep.c.y += (invMass2 * limitImpulse) * m_motorJacobian.linear2.y;
			//b2->m_sweep.a += invI2 * limitImpulse * m_motorJacobian.angular2;
			b2.m_sweep.a += invI2 * limitImpulse * m_motorJacobian.angular2;
			
			b1.SynchronizeTransform();
			b2.SynchronizeTransform();
			
		}
		
		return positionError <= B2Settings.b2_linearSlop && angularError <= B2Settings.b2_angularSlop;
		
	}
	public var m_localAnchor1:B2Vec2 ;
	public var m_localAnchor2:B2Vec2 ;
	public var m_localXAxis1:B2Vec2 ;
	public var m_localYAxis1:B2Vec2 ;
	public var m_refAngle:Float;
	public var m_linearJacobian:B2Jacobian ;
	public var m_linearMass:Float;				// effective mass for point-to-line constraint.
	public var m_force:Float;
	
	public var m_angularMass:Float;			// effective mass for angular constraint.
	public var m_torque:Float;
	public var m_motorJacobian:B2Jacobian ;
	public var m_motorMass:Float;			// effective mass for motor/limit translational constraint.
	public var m_motorForce:Float;
	public var m_limitForce:Float;
	public var m_limitPositionImpulse:Float;
	public var m_lowerTranslation:Float;
	public var m_upperTranslation:Float;
	public var m_maxMotorForce:Float;
	public var m_motorSpeed:Float;
	
	public var m_enableLimit:Bool;
	public var m_enableMotor:Bool;
	public var m_limitState:Int;
}