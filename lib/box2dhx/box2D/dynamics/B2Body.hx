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
package box2D.dynamics;

import box2D.dynamics.joints.B2JointEdge;


import box2D.collision.shapes.B2Shape;
import box2D.collision.shapes.B2ShapeDef;
import box2D.collision.shapes.B2MassData;
import box2D.common.math.B2Vec2;
import box2D.common.math.B2XForm;
import box2D.common.math.B2Sweep;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
/// A rigid body.
class B2Body
 {
	/// Creates a shape and attach it to this body.
	/// @param shapeDef the shape definition.
	/// @warning This function is locked during myCallbacks.
	
	/// Creates a shape and attach it to this body.
	/// @param shapeDef the shape definition.
	/// @warning This function is locked during myCallbacks.
	public function CreateShape(def:B2ShapeDef) :B2Shape
	{
		//B2Settings.b2Assert(m_world.m_lock == false);
		
		if (m_world.m_lock == true)
		{
			return null;
		}
		
		var s:B2Shape = B2Shape.Create(def, m_world.m_blockAllocator);
		
		s.m_next = m_shapeList;
		m_shapeList = s;
		++m_shapeCount;
		
		s.m_body = this;
		
		// Add the shape to the world's broad-phase.
		s.CreateProxy(m_world.m_broadPhase, m_xf);
		
		// Compute the sweep radius for CCD.
		s.UpdateSweepRadius(m_sweep.localCenter);
		
		return s;
	}
	/// Destroy a shape. This removes the shape from the broad-phase and
	/// therefore destroys any contacts associated with this shape. All shapes
	/// attached to a body are implicitly destroyed when the body is destroyed.
	/// @param shape the shape to be removed.
	/// @warning This function is locked during myCallbacks.
	
	public function DestroyShape(s:B2Shape) : Void
	{
		//B2Settings.b2Assert(m_world.m_lock == false);
		if (m_world.m_lock == true)
		{
			return;
		}
		
		//B2Settings.b2Assert(s.m_body == this);
		s.DestroyProxy(m_world.m_broadPhase);
		
		//B2Settings.b2Assert(m_shapeCount > 0);
		//B2Shape** node = &m_shapeList;
		var node:B2Shape = m_shapeList;
		var ppS:B2Shape = null; // Fix pointer-pointer stuff
		var found:Bool = false;
		while (node != null)
		{
			if (node == s)
			{
				if (ppS != null)
					ppS.m_next = s.m_next;
				else
					m_shapeList = s.m_next;
				//node = s.m_next;
				found = true;
				break;
			}
			
			ppS = node;
			node = node.m_next;
		}
		
		// You tried to remove a shape that is not attached to this body.
		//B2Settings.b2Assert(found);
		
		s.m_body = null;
		s.m_next = null;
		
		--m_shapeCount;
		
		B2Shape.Destroy(s, m_world.m_blockAllocator);
	}
	/// Set the mass properties. Note that this changes the center of mass position.
	/// If you are not sure how to compute mass properties, use SetMassFromShapes.
	/// The inertia tensor is assumed to be relative to the center of mass.
	/// @param massData the mass properties.
	public function SetMass(massData:B2MassData) : Void
	{
		var s:B2Shape;
		
		//B2Settings.b2Assert(m_world.m_lock == false);
		if (m_world.m_lock == true)
		{
			return;
		}
		
		m_invMass = 0.0;
		m_I = 0.0;
		m_invI = 0.0;
		
		m_mass = massData.mass;
		
		if (m_mass > 0.0)
		{
			m_invMass = 1.0 / m_mass;
		}
		
		if ((m_flags & B2Body.e_fixedRotationFlag) == 0)
		{
			m_I = massData.I;
		}
		
		if (m_I > 0.0)
		{
			m_invI = 1.0 / m_I;
		}
		
		// Move center of mass.
		m_sweep.localCenter.SetV(massData.center);
		//m_sweep.c0 = m_sweep.c = b2Mul(m_xf, m_sweep.localCenter);
		//b2MulMV(m_xf.R, m_sweep.localCenter);
		var tMat:B2Mat22 = m_xf.R;
		var tVec:B2Vec2 = m_sweep.localCenter;
		// (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y)
		m_sweep.c.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		// (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y)
		m_sweep.c.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		//return T.position + b2Mul(T.R, v);
		m_sweep.c.x += m_xf.position.x;
		m_sweep.c.y += m_xf.position.y;
		//m_sweep.c0 = m_sweep.c
		m_sweep.c0.SetV(m_sweep.c);
		
		// Update the sweep radii of all child shapes.
		s = m_shapeList;
		while (s != null)
		{
			s.UpdateSweepRadius(m_sweep.localCenter);
			s = s.m_next;
		}
		var oldType:Int = m_type;
		if (m_invMass == 0.0 && m_invI == 0.0)
		{
			m_type = e_staticType;
		}
		else
		{
			m_type = e_dynamicType;
		}
	
		// If the body type changed, we need to refilter the broad-phase proxies.
		if (oldType != m_type)
		{
			s = m_shapeList;
			while (s != null)
			{
				s.RefilterProxy(m_world.m_broadPhase, m_xf);
				s = s.m_next;
			}
		}
	}
	/// Compute the mass properties from the attached shapes. You typically call this
	/// after adding all the shapes. If you add or remove shapes later, you may want
	/// to call this again. Note that this changes the center of mass position.
	static var s_massData:B2MassData = new B2MassData();
	public function SetMassFromShapes() : Void
	{
		
		var s:B2Shape;
		
		//B2Settings.b2Assert(m_world.m_lock == false);
		if (m_world.m_lock == true)
		{
			return;
		}
		
		// Compute mass data from shapes. Each shape has its own density.
		m_mass = 0.0;
		m_invMass = 0.0;
		m_I = 0.0;
		m_invI = 0.0;
		
		//b2Vec2 center = b2Vec2_zero;
		var centerX:Float = 0.0;
		var centerY:Float = 0.0;
		var massData:B2MassData = s_massData;
		s = m_shapeList;
		while (s != null)
		{
			s.ComputeMass(massData);
			m_mass += massData.mass;
			//center += massData.mass * massData.center;
			centerX += massData.mass * massData.center.x;
			centerY += massData.mass * massData.center.y;
			m_I += massData.I;
			s = s.m_next;
		}
		
		// Compute center of mass, and shift the origin to the COM.
		if (m_mass > 0.0)
		{
			m_invMass = 1.0 / m_mass;
			centerX *= m_invMass;
			centerY *= m_invMass;
		}
		
		if (m_I > 0.0 && (m_flags & e_fixedRotationFlag) == 0)
		{
			// Center the inertia about the center of mass.
			//m_I -= m_mass * b2Dot(center, center);
			m_I -= m_mass * (centerX * centerX + centerY * centerY);
			//B2Settings.b2Assert(m_I > 0.0);
			m_invI = 1.0 / m_I;
		}
		else
		{
			m_I = 0.0;
			m_invI = 0.0;
		}
		
		// Move center of mass.
		m_sweep.localCenter.Set(centerX, centerY);
		//m_sweep.c0 = m_sweep.c = b2Mul(m_xf, m_sweep.localCenter);
		//b2MulMV(m_xf.R, m_sweep.localCenter);
		var tMat:B2Mat22 = m_xf.R;
		var tVec:B2Vec2 = m_sweep.localCenter;
		// (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y)
		m_sweep.c.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		// (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y)
		m_sweep.c.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		//return T.position + b2Mul(T.R, v);
		m_sweep.c.x += m_xf.position.x;
		m_sweep.c.y += m_xf.position.y;
		//m_sweep.c0 = m_sweep.c
		m_sweep.c0.SetV(m_sweep.c);
		
		// Update the sweep radii of all child shapes.
		s = m_shapeList;
		while (s != null)
		{
			s.UpdateSweepRadius(m_sweep.localCenter);
			s = s.m_next;
		}
		
		var oldType:Int = m_type;
		if (m_invMass == 0.0 && m_invI == 0.0)
		{
			m_type = e_staticType;
		}
		else
		{
			m_type = e_dynamicType;
		}
		
		// If the body type changed, we need to refilter the broad-phase proxies.
		if (oldType != m_type)
		{
			s = m_shapeList;
			while (s != null)
			{
				s.RefilterProxy(m_world.m_broadPhase, m_xf);
				s = s.m_next;
			}
		}
	}
	/// Set the position of the body's origin and rotation (radians).
	/// This breaks any contacts and wakes the other bodies.
	/// @param position the new world position of the body's origin (not necessarily
	/// the center of mass).
	/// @param angle the new world rotation angle of the body in radians.
	/// @return false if the movement put a shape outside the world. In this case the
	/// body is automatically frozen.
	public function SetXForm(position:B2Vec2, angle:Float) : Bool
	{
		
		var s:B2Shape;
		
		//B2Settings.b2Assert(m_world.m_lock == false);
		if (m_world.m_lock == true)
		{
			return true;
		}
		
		if (IsFrozen())
		{
			return false;
		}
		
		m_xf.R.Set(angle);
		m_xf.position.SetV(position);
		
		//m_sweep.c0 = m_sweep.c = b2Mul(m_xf, m_sweep.localCenter);
		//b2MulMV(m_xf.R, m_sweep.localCenter);
		var tMat:B2Mat22 = m_xf.R;
		var tVec:B2Vec2 = m_sweep.localCenter;
		// (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y)
		m_sweep.c.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		// (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y)
		m_sweep.c.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		//return T.position + b2Mul(T.R, v);
		m_sweep.c.x += m_xf.position.x;
		m_sweep.c.y += m_xf.position.y;
		//m_sweep.c0 = m_sweep.c
		m_sweep.c0.SetV(m_sweep.c);
		
		m_sweep.a0 = m_sweep.a = angle;
		
		var freeze:Bool = false;
		s = m_shapeList;
		while (s != null)
		{
			var inRange:Bool = s.Synchronize(m_world.m_broadPhase, m_xf, m_xf);
			
			if (inRange == false)
			{
				freeze = true;
				break;
			}
			s = s.m_next;
		}
		
		if (freeze == true)
		{
			m_flags |= e_frozenFlag;
			m_linearVelocity.SetZero();
			m_angularVelocity = 0.0;
			s = m_shapeList;
			while (s != null)
			{
				s.DestroyProxy(m_world.m_broadPhase);
				s = s.m_next;
			}
			
			// Failure
			return false;
		}
		
		// Success
		m_world.m_broadPhase.Commit();
		return true;
		
	}
	/// Get the body transform for the body's origin.
	/// @return the world transform of the body's origin.
	public function GetXForm() :B2XForm{
		return m_xf;
	}
	/// Get the world body origin position.
	/// @return the world position of the body's origin.
	public function GetPosition() :B2Vec2{
		return m_xf.position;
	}
	/// Get the angle in radians.
	/// @return the current world rotation angle in radians.
	public function GetAngle() : Float{
		return m_sweep.a;
	}
	/// Get the world position of the center of mass.
	public function GetWorldCenter() :B2Vec2{
		return m_sweep.c;
	}
	/// Get the local position of the center of mass.
	public function GetLocalCenter() :B2Vec2{
		return m_sweep.localCenter;
	}
	/// Set the linear velocity of the center of mass.
	/// @param v the new linear velocity of the center of mass.
	public function SetLinearVelocity(v:B2Vec2) : Void{
		m_linearVelocity.SetV(v);
	}
	/// Get the linear velocity of the center of mass.
	/// @return the linear velocity of the center of mass.
	public function GetLinearVelocity() :B2Vec2{
		return m_linearVelocity;
	}
	/// Set the angular velocity.
	/// @param omega the new angular velocity in radians/second.
	public function SetAngularVelocity(omega:Float) : Void{
		m_angularVelocity = omega;
	}
	/// Get the angular velocity.
	/// @return the angular velocity in radians/second.
	public function GetAngularVelocity() : Float{
		return m_angularVelocity;
	}
	/// Apply a force at a world point. If the force is not
	/// applied at the center of mass, it will generate a torque and
	/// affect the angular velocity. This wakes up the body.
	/// @param force the world force vector, usually in Newtons (N).
	/// @param point the world position of the point of application.
	public function ApplyForce(force:B2Vec2, point:B2Vec2) : Void{
		if (IsSleeping())
		{
			WakeUp();
		}
		//m_force += force;
		m_force.x += force.x;
		m_force.y += force.y;
		//m_torque += b2Cross(point - m_sweep.c, force);
		m_torque += ((point.x - m_sweep.c.x) * force.y - (point.y - m_sweep.c.y) * force.x);
	}
	/// Apply a torque. This affects the angular velocity
	/// without affecting the linear velocity of the center of mass.
	/// This wakes up the body.
	/// @param torque about the z-axis (out of the screen), usually in N-m.
	public function ApplyTorque(torque:Float) : Void{
		if (IsSleeping())
		{
			WakeUp();
		}
		m_torque += torque;
	}
	/// Apply an impulse at a point. This immediately modifies the velocity.
	/// It also modifies the angular velocity if the point of application
	/// is not at the center of mass. This wakes up the body.
	/// @param impulse the world impulse vector, usually in N-seconds or kg-m/s.
	/// @param point the world position of the point of application.
	public function ApplyImpulse(impulse:B2Vec2, point:B2Vec2) : Void{
		if (IsSleeping())
		{
			WakeUp();
		}
		//m_linearVelocity += m_invMass * impulse;
		m_linearVelocity.x += m_invMass * impulse.x;
		m_linearVelocity.y += m_invMass * impulse.y;
		//m_angularVelocity += m_invI * b2Cross(point - m_sweep.c, impulse);
		m_angularVelocity += m_invI * ((point.x - m_sweep.c.x) * impulse.y - (point.y - m_sweep.c.y) * impulse.x);
	}
	/// Get the total mass of the body.
	/// @return the mass, usually in kilograms (kg).
	public function GetMass() : Float{
		return m_mass;
	}
	/// Get the central rotational inertia of the body.
	/// @return the rotational inertia, usually in kg-m^2.
	public function GetInertia() : Float{
		return m_I;
	}
	/// Get the world coordinates of a point given the local coordinates.
	/// @param localPoint a point on the body measured relative the the body's origin.
	/// @return the same point expressed in world coordinates.
	public function GetWorldPoint(localPoint:B2Vec2) :B2Vec2{
		return B2Math.b2MulX(m_xf, localPoint);
	}
	/// Get the world coordinates of a vector given the local coordinates.
	/// @param localVector a vector fixed in the body.
	/// @return the same vector expressed in world coordinates.
	public function GetWorldVector(localVector:B2Vec2) :B2Vec2{
		return B2Math.b2MulMV(m_xf.R, localVector);
	}
	/// Gets a local point relative to the body's origin given a world point.
	/// @param a point in world coordinates.
	/// @return the corresponding local point relative to the body's origin.
	public inline function GetLocalPoint(worldPoint:B2Vec2) :B2Vec2{
		return B2Math.b2MulXT(m_xf, worldPoint);
	}
	/// Gets a local vector given a world vector.
	/// @param a vector in world coordinates.
	/// @return the corresponding local vector.
	public inline function GetLocalVector(worldVector:B2Vec2) :B2Vec2{
		return B2Math.b2MulTMV(m_xf.R, worldVector);
	}
	
	/// Get the world linear velocity of a world point attached to this body.
	/// @param a point in world coordinates.
	/// @return the world velocity of a point.
	public inline function GetLinearVelocityFromWorldPoint(worldPoint:B2Vec2) :B2Vec2
	{
		//return          m_linearVelocity   + b2Cross(m_angularVelocity,   worldPoint   - m_sweep.c);
		return new B2Vec2(m_linearVelocity.x +         m_angularVelocity * (worldPoint.y - m_sweep.c.y), 
		                  m_linearVelocity.x -         m_angularVelocity * (worldPoint.x - m_sweep.c.x));
	}
	
	/// Get the world velocity of a local point.
	/// @param a point in local coordinates.
	/// @return the world velocity of a point.
	public inline function GetLinearVelocityFromLocalPoint(localPoint:B2Vec2) :B2Vec2
	{
		return GetLinearVelocityFromWorldPoint(GetWorldPoint(localPoint));
	}
	
	/// Is this body treated like a bullet for continuous collision detection?
	public function IsBullet() : Bool{
		return (m_flags & e_bulletFlag) == e_bulletFlag;
	}
	/// Should this body be treated like a bullet for continuous collision detection?
	public function SetBullet(flag:Bool) : Void{
		if (flag)
		{
			m_flags |= e_bulletFlag;
		}
		else
		{
			m_flags &= B2Math.complement(e_bulletFlag);
		}
	}
	/// Is this body static (immovable)?
	public function IsStatic() : Bool{
		return m_type == e_staticType;
	}
	/// Is this body dynamic (movable)?
	public function IsDynamic() :Bool{
		return m_type == e_dynamicType;
	}
	/// Is this body frozen?
	public function IsFrozen() : Bool{
		return (m_flags & e_frozenFlag) == e_frozenFlag;
	}
	/// Is this body sleeping (not simulating).
	public function IsSleeping() : Bool{
		return (m_flags & e_sleepFlag) == e_sleepFlag;
	}
	/// You can disable sleeping on this body.
	public function AllowSleeping(flag:Bool) : Void{
		if (flag)
		{
			m_flags |= e_allowSleepFlag;
		}
		else
		{
			m_flags &= B2Math.complement(e_allowSleepFlag);
			WakeUp();
		}
	}
	/// Wake up this body so it will begin simulating.
	public function WakeUp() : Void{
		m_flags &= B2Math.complement(e_sleepFlag);
		m_sleepTime = 0.0;
	}
	/// Put this body to sleep so it will stop simulating.
	/// This also sets the velocity to zero.
	public function PutToSleep() : Void
	{
		m_flags |= e_sleepFlag;
		m_sleepTime = 0.0;
		m_linearVelocity.SetZero();
		m_angularVelocity = 0.0;
		m_force.SetZero();
		m_torque = 0.0;
	}
	/// Get the list of all shapes attached to this body.
	public function GetShapeList() :B2Shape{
		return m_shapeList;
	}
	/// Get the list of all joints attached to this body.
	public function GetJointList() :B2JointEdge{
		return m_jointList;
	}
	/// Get the next body in the world's body list.
	public function GetNext() :B2Body{
		return m_next;
	}
	/// Get the user data pointer that was provided in the body definition.
	public function GetUserData() : Dynamic{
		return m_userData;
	}
	/// Set the user data. Use this to store your application specific data.
	public function SetUserData(data:Dynamic) : Void
	{
		m_userData = data;
	}
	/// Get the parent world of this body.
	public function GetWorld():B2World
	{
		return m_world;
	}
	//--------------- Internals Below -------------------
	
	public var m_flags:Int;
	public var m_type:Int;
	public var m_xf:B2XForm ;		// the body origin transform
	public var m_sweep:B2Sweep ;	// the swept motion for CCD
	public var m_linearVelocity:B2Vec2 ;
	public var m_angularVelocity:Float;
	public var m_force:B2Vec2 ;
	public var m_torque:Float;
	public var m_world:B2World;
	public var m_prev:B2Body;
	public var m_next:B2Body;
	public var m_shapeList:B2Shape;
	public var m_shapeCount:Int;
	public var m_jointList:B2JointEdge;
	public var m_contactList:B2ContactEdge;
	public var m_mass:Float; 
	public var m_invMass:Float;
	public var m_I:Float; 
	public var m_invI:Float;
	public var m_linearDamping:Float;
	public var m_angularDamping:Float;
	public var m_sleepTime:Float;
	public var m_userData:Dynamic;
	
	// Constructor
	public function new (bd:B2BodyDef, world:B2World){
		//B2Settings.b2Assert(world.m_lock == false);
		m_xf = new B2XForm();		// the body origin transform
		m_sweep = new B2Sweep();	// the swept motion for CCD
		m_linearVelocity = new B2Vec2();
		
		m_force = new B2Vec2();
		
		m_flags = 0;
		
		if (bd.isBullet)
		{
			m_flags |= e_bulletFlag;
		}
		if (bd.fixedRotation)
		{
			m_flags |= e_fixedRotationFlag;
		}
		if (bd.allowSleep)
		{
			m_flags |= e_allowSleepFlag;
		}
		if (bd.isSleeping)
		{
			m_flags |= e_sleepFlag;
		}
		
		m_world = world;
		
		m_xf.position.SetV(bd.position);
		m_xf.R.Set(bd.angle);
		
		m_sweep.localCenter.SetV(bd.massData.center);
		m_sweep.t0 = 1.0;
		m_sweep.a0 = m_sweep.a = bd.angle;
		
		//m_sweep.c0 = m_sweep.c = b2Mul(m_xf, m_sweep.localCenter);
		//b2MulMV(m_xf.R, m_sweep.localCenter);
		var tMat:B2Mat22 = m_xf.R;
		var tVec:B2Vec2 = m_sweep.localCenter;
		// (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y)
		m_sweep.c.x = (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		// (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y)
		m_sweep.c.y = (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		//return T.position + b2Mul(T.R, v);
		m_sweep.c.x += m_xf.position.x;
		m_sweep.c.y += m_xf.position.y;
		//m_sweep.c0 = m_sweep.c
		m_sweep.c0.SetV(m_sweep.c);
		
		m_jointList = null;
		m_contactList = null;
		m_prev = null;
		m_next = null;
		
		m_linearDamping = bd.linearDamping;
		m_angularDamping = bd.angularDamping;
		
		m_force.Set(0.0, 0.0);
		m_torque = 0.0;
		
		m_linearVelocity.SetZero();
		m_angularVelocity = 0.0;
		
		m_sleepTime = 0.0;
		
		m_invMass = 0.0;
		m_I = 0.0;
		m_invI = 0.0;
		
		m_mass = bd.massData.mass;
		
		if (m_mass > 0.0)
		{
			m_invMass = 1.0 / m_mass;
		}
		
		if ((m_flags & B2Body.e_fixedRotationFlag) == 0)
		{
			m_I = bd.massData.I;
		}
		
		if (m_I > 0.0)
		{
			m_invI = 1.0 / m_I;
		}
		
		if (m_invMass == 0.0 && m_invI == 0.0)
		{
			m_type = e_staticType;
		}
		else
		{
			m_type = e_dynamicType;
		}
	
		m_userData = bd.userData;
		
		m_shapeList = null;
		m_shapeCount = 0;
	}
	
	
	public function SynchronizeShapes() : Bool{
		
		var xf1:B2XForm = s_xf1;
		xf1.R.Set(m_sweep.a0);
		//xf1.position = m_sweep.c0 - b2Mul(xf1.R, m_sweep.localCenter);
		var tMat:B2Mat22 = xf1.R;
		var tVec:B2Vec2 = m_sweep.localCenter;
		xf1.position.x = m_sweep.c0.x - (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		xf1.position.y = m_sweep.c0.y - (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
		
		var s:B2Shape;
		
		var inRange:Bool = true;
		s = m_shapeList;
		while (s != null)
		{
			inRange = s.Synchronize(m_world.m_broadPhase, xf1, m_xf);
			if (inRange == false)
			{
				break;
			}
			s = s.m_next;
		}
		
		if (inRange == false)
		{
			m_flags |= e_frozenFlag;
			m_linearVelocity.SetZero();
			m_angularVelocity = 0.0;
			s = m_shapeList;
			while (s != null)
			{
				s.DestroyProxy(m_world.m_broadPhase);
				s = s.m_next;
			}
			
			// Failure
			return false;
		}
		
		// Success
		return true;
		
	}
	public function SynchronizeTransform() : Void{
		m_xf.R.Set(m_sweep.a);
		//m_xf.position = m_sweep.c - b2Mul(m_xf.R, m_sweep.localCenter);
		var tMat:B2Mat22 = m_xf.R;
		var tVec:B2Vec2 = m_sweep.localCenter;
		m_xf.position.x = m_sweep.c.x - (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
		m_xf.position.y = m_sweep.c.y - (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
	}
	// This is used to prevent connected bodies from colliding.
	// It may lie, depending on the collideConnected flag.
	public function IsConnected(other:B2Body) : Bool{
		var jn:B2JointEdge = m_jointList;
		while (jn != null)
		{
			if (jn.other == other)
				return jn.joint.m_collideConnected == false;
			jn = jn.next;
		}
		
		return false;
	}
	public function Advance(t:Float) : Void{
		// Advance to the new safe time.
		m_sweep.Advance(t);
		m_sweep.c.SetV(m_sweep.c0);
		m_sweep.a = m_sweep.a0;
		SynchronizeTransform();
	}
	
	
	static var s_xf1:B2XForm = new B2XForm();
	
	public static inline var e_frozenFlag:Int			= 0x0002;
	public static inline var e_islandFlag:Int			= 0x0004;
	public static inline var e_sleepFlag:Int			= 0x0008;
	public static inline var e_allowSleepFlag:Int		= 0x0010;
	public static inline var e_bulletFlag:Int			= 0x0020;
	public static inline var e_fixedRotationFlag:Int	= 0x0040;
	
	public static inline var e_staticType:Int 	= 1;
	public static inline var e_dynamicType:Int 	= 2;
	public static inline var e_maxTypes:Int 	= 3;

	
}