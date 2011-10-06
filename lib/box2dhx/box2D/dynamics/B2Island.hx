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
	
import box2D.common.B2Color;
import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Sweep;
import box2D.common.math.B2Vec2;
import box2D.common.math.B2XForm;
import box2D.dynamics.contacts.B2CircleContact;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactConstraint;
import box2D.dynamics.contacts.B2ContactConstraintPoint;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.dynamics.contacts.B2ContactRegister;
import box2D.dynamics.contacts.B2ContactResult;
import box2D.dynamics.contacts.B2ContactSolver;
import box2D.dynamics.contacts.B2NullContact;
import box2D.dynamics.contacts.B2PolyAndCircleContact;
import box2D.dynamics.contacts.B2PolygonContact;
import box2D.dynamics.joints.B2DistanceJoint;
import box2D.dynamics.joints.B2DistanceJointDef;
import box2D.dynamics.joints.B2GearJoint;
import box2D.dynamics.joints.B2GearJointDef;
import box2D.dynamics.joints.B2Jacobian;
import box2D.dynamics.joints.B2Joint;
import box2D.dynamics.joints.B2JointDef;
import box2D.dynamics.joints.B2JointEdge;
import box2D.dynamics.joints.B2MouseJoint;
import box2D.dynamics.joints.B2MouseJointDef;
import box2D.dynamics.joints.B2PrismaticJoint;
import box2D.dynamics.joints.B2PrismaticJointDef;
import box2D.dynamics.joints.B2PulleyJoint;
import box2D.dynamics.joints.B2PulleyJointDef;
import box2D.dynamics.joints.B2RevoluteJoint;
import box2D.dynamics.joints.B2RevoluteJointDef;
import box2D.collision.B2AABB;
import box2D.collision.B2Bound;
import box2D.collision.B2BoundValues;
import box2D.collision.B2BroadPhase;
import box2D.collision.B2BufferedPair;
import box2D.collision.B2Collision;
import box2D.collision.B2ContactID;
import box2D.collision.B2ContactPoint;
import box2D.collision.B2Distance;
import box2D.collision.B2Manifold;
import box2D.collision.B2ManifoldPoint;
import box2D.collision.B2OBB;
import box2D.collision.B2Pair;
import box2D.collision.B2PairCallback;
import box2D.collision.B2PairManager;
import box2D.collision.B2Point;
import box2D.collision.B2Proxy;
import box2D.collision.B2Segment;
import box2D.collision.B2TimeOfImpact;
import box2D.collision.ClipVertex;
import box2D.collision.Features;

/*
Position Correction Notes
=========================
I tried the several algorithms for position correction of the 2D revolute joint.
I looked at these systems:
- simple pendulum (1m diameter sphere on massless 5m stick) with initial angular velocity of 100 rad/s.
- suspension bridge with 30 1m long planks of length 1m.
- multi-link chain with 30 1m long links.
Here are the algorithms:
Baumgarte - A fraction of the position error is added to the velocity error. There is no
separate position solver.
Pseudo Velocities - After the velocity solver and position integration,
the position error, Jacobian, and effective mass are recomputed. Then
the velocity constraints are solved with pseudo velocities and a fraction
of the position error is added to the pseudo velocity error. The pseudo
velocities are initialized to zero and there is no warm-starting. After
the position solver, the pseudo velocities are added to the positions.
This is also called the First Order World method or the Position LCP method.
Modified Nonlinear Gauss-Seidel (NGS) - Like Pseudo Velocities except the
position error is re-computed for each constraint and the positions are updated
after the constraint is solved. The radius vectors (aka Jacobians) are
re-computed too (otherwise the algorithm has horrible instability). The pseudo
velocity states are not needed because they are effectively zero at the beginning
of each iteration. Since we have the current position error, we allow the
iterations to terminate early if the error becomes smaller than b2_linearSlop.
Full NGS or just NGS - Like Modified NGS except the effective mass are re-computed
each time a constraint is solved.
Here are the results:
Baumgarte - this is the cheapest algorithm but it has some stability problems,
especially with the bridge. The chain links separate easily close to the root
and they jitter as they struggle to pull together. This is one of the most common
methods in the field. The big drawback is that the position correction artificially
affects the momentum, thus leading to instabilities and false bounce. I used a
bias factor of 0.2. A larger bias factor makes the bridge less stable, a smaller
factor makes joints and contacts more spongy.
Pseudo Velocities - the is more stable than the Baumgarte method. The bridge is
stable. However, joints still separate with large angular velocities. Drag the
simple pendulum in a circle quickly and the joint will separate. The chain separates
easily and does not recover. I used a bias factor of 0.2. A larger value lead to
the bridge collapsing when a heavy cube drops on it.
Modified NGS - this algorithm is better in some ways than Baumgarte and Pseudo
Velocities, but in other ways it is worse. The bridge and chain are much more
stable, but the simple pendulum goes unstable at high angular velocities.
Full NGS - stable in all tests. The joints display good stiffness. The bridge
still sags, but this is better than infinite forces.
Recommendations
Pseudo Velocities are not really worthwhile because the bridge and chain cannot
recover from joint separation. In other cases the benefit over Baumgarte is small.
Modified NGS is not a robust method for the revolute joint due to the violent
instability seen in the simple pendulum. Perhaps it is viable with other constraint
types, especially scalar constraints where the effective mass is a scalar.
This leaves Baumgarte and Full NGS. Baumgarte has small, but manageable instabilities
and is very fast. I don't think we can escape Baumgarte, especially in highly
demanding cases where high constraint fidelity is not needed.
Full NGS is robust and easy on the eyes. I recommend this as an option for
higher fidelity simulation and certainly for suspension bridges and long chains.
Full NGS might be a good choice for ragdolls, especially motorized ragdolls where
joint separation can be problematic. The number of NGS iterations can be reduced
for better performance without harming robustness much.
Each joint in a can be handled differently in the position solver. So I recommend
a system where the user can select the algorithm on a per joint basis. I would
probably default to the slower Full NGS and let the user select the faster
Baumgarte method in performance critical scenarios.
*/
class B2Island
 {
	
	public function new(
		bodyCapacity:Int,
		contactCapacity:Int,
		jointCapacity:Int,
		allocator:Dynamic,
		listener:B2ContactListener)
	{
		var i:Int;
		
		m_bodyCapacity = bodyCapacity;
		m_contactCapacity = contactCapacity;
		m_jointCapacity	 = jointCapacity;
		m_bodyCount = 0;
		m_contactCount = 0;
		m_jointCount = 0;
		
		m_allocator = allocator;
		m_listener = listener;
		
		//m_bodies = (b2Body**)allocator->Allocate(bodyCapacity * sizeof(b2Body*));
		m_bodies = new Array();
		
		//m_contacts = (b2Contact**)allocator->Allocate(contactCapacity	 * sizeof(b2Contact*));
		m_contacts = new Array();
		
		//m_joints = (b2Joint**)allocator->Allocate(jointCapacity * sizeof(b2Joint*));
		m_joints = new Array();
		
		m_positionIterationCount = 0;
		
	}
	//~b2Island();
	
	public function Clear() : Void
	{
		m_bodyCount = 0;
		m_contactCount = 0;
		m_jointCount = 0;
	}
	public function Solve(step:B2TimeStep, gravity:B2Vec2, correctPositions:Bool, allowSleep:Bool) : Void
	{
		
		var b:B2Body;
		var joint:B2Joint;
		
		// Integrate velocities and apply damping.
		for (i in 0...m_bodyCount)
		{
			b = m_bodies[i];
			
			if (b.IsStatic())
				continue;
			
			// Integrate velocities.
			//b.m_linearVelocity += step.dt * (gravity + b.m_invMass * b.m_force);
			b.m_linearVelocity.x += step.dt * (gravity.x + b.m_invMass * b.m_force.x);
			b.m_linearVelocity.y += step.dt * (gravity.y + b.m_invMass * b.m_force.y);
			b.m_angularVelocity += step.dt * b.m_invI * b.m_torque;
			
			// Reset forces.
			b.m_force.SetZero();
			b.m_torque = 0.0;
			
			// Apply damping.
			// ODE: dv/dt + c * v = 0
			// Solution: v(t) = v0 * exp(-c * t)
			// Time step: v(t + dt) = v0 * exp(-c * (t + dt)) = v0 * exp(-c * t) * exp(-c * dt) = v * exp(-c * dt)
			// v2 = exp(-c * dt) * v1
			// Taylor expansion:
			// v2 = (1.0f - c * dt) * v1
			b.m_linearVelocity.Multiply( B2Math.b2Clamp(1.0 - step.dt * b.m_linearDamping, 0.0, 1.0) );
			b.m_angularVelocity *= B2Math.b2Clamp(1.0 - step.dt * b.m_angularDamping, 0.0, 1.0);
			
			// Check for large velocities.
			//if (b2Dot(b->m_linearVelocity, b->m_linearVelocity) > b2_maxLinearVelocitySquared)
			if ((b.m_linearVelocity.LengthSquared()) > B2Settings.b2_maxLinearVelocitySquared)
			{
				b.m_linearVelocity.Normalize();
				b.m_linearVelocity.x *= B2Settings.b2_maxLinearVelocity;
				b.m_linearVelocity.y *= B2Settings.b2_maxLinearVelocity;
			}
			
			if (b.m_angularVelocity * b.m_angularVelocity > B2Settings.b2_maxAngularVelocitySquared)
			{
				if (b.m_angularVelocity < 0.0)
				{
					b.m_angularVelocity = -B2Settings.b2_maxAngularVelocity;
				}
				else
				{
					b.m_angularVelocity = B2Settings.b2_maxAngularVelocity;
				}
			}
		}
		
		var contactSolver:B2ContactSolver = new B2ContactSolver(step, m_contacts, m_contactCount, m_allocator);
		
		// Initialize velocity constraints.
		
		contactSolver.InitVelocityConstraints(step);
		
		
		
		for (i in 0...m_jointCount)
		{
			joint = m_joints[i];
			joint.InitVelocityConstraints(step);
		}
		
		// Solve velocity constraints.
		
		for (i in 0...step.maxIterations)
		{
			contactSolver.SolveVelocityConstraints();
			
			for (j in 0...m_jointCount)
			{
				joint = m_joints[j];
				joint.SolveVelocityConstraints(step);
			}
		}
		
		// Post-solve (store impulses for warm starting).
		
		contactSolver.FinalizeVelocityConstraints();
		
		// Integrate positions.
		
		for (i in 0...m_bodyCount)
		{
			b = m_bodies[i];
			
			if (b.IsStatic())
				continue;
			
			// Store positions for continuous collision.
			b.m_sweep.c0.SetV(b.m_sweep.c);
			b.m_sweep.a0 = b.m_sweep.a;
			
			// Integrate
			//b.m_sweep.c += step.dt * b.m_linearVelocity;
			b.m_sweep.c.x += step.dt * b.m_linearVelocity.x;
			b.m_sweep.c.y += step.dt * b.m_linearVelocity.y;
			b.m_sweep.a += step.dt * b.m_angularVelocity;
			
			// Compute new transform
			b.SynchronizeTransform();
			
			// Note: shapes are synchronized later.
		}
		
		
		if (correctPositions)
		{
			// Initialize position constraints.
			// Contacts don't need initialization.
			for (i in 0...m_jointCount)
			{
				joint = m_joints[i];
				joint.InitPositionConstraints();
			}
			
			// Iterate over constraints.
			for (m_positionIterationCount in 0...step.maxIterations)
			{
				var contactsOkay:Bool = contactSolver.SolvePositionConstraints(B2Settings.b2_contactBaumgarte);
				
				var jointsOkay:Bool = true;
				for (i in 0...m_jointCount)
				{
					joint = m_joints[i];
					var jointOkay:Bool = joint.SolvePositionConstraints();
					jointsOkay = jointsOkay && jointOkay;
				}
				
				if (contactsOkay && jointsOkay)
				{
					break;
				}
			}
		}
		
		
		
		Report(contactSolver.m_constraints);
		
		if (allowSleep){
			
			var minSleepTime:Float = box2D.common.math.B2Math.MAX_VALUE;
			
			var linTolSqr:Float = B2Settings.b2_linearSleepTolerance * B2Settings.b2_linearSleepTolerance;
			var angTolSqr:Float = B2Settings.b2_angularSleepTolerance * B2Settings.b2_angularSleepTolerance;
			
			for (i in 0...m_bodyCount)
			{
				b = m_bodies[i];
				if (b.m_invMass == 0.0)
				{
					continue;
				}
				
				if ((b.m_flags & B2Body.e_allowSleepFlag) == 0)
				{
					b.m_sleepTime = 0.0;
					minSleepTime = 0.0;
				}
				
				if ((b.m_flags & B2Body.e_allowSleepFlag) == 0 ||
					b.m_angularVelocity * b.m_angularVelocity > angTolSqr ||
					B2Math.b2Dot(b.m_linearVelocity, b.m_linearVelocity) > linTolSqr)
				{
					b.m_sleepTime = 0.0;
					minSleepTime = 0.0;
				}
				else
				{
					b.m_sleepTime += step.dt;
					minSleepTime = B2Math.b2Min(minSleepTime, b.m_sleepTime);
				}
			}
			
			if (minSleepTime >= B2Settings.b2_timeToSleep)
			{
				for (i in 0...m_bodyCount)
				{
					b = m_bodies[i];
					b.m_flags |= B2Body.e_sleepFlag;
					b.m_linearVelocity.SetZero();
					b.m_angularVelocity = 0.0;
				}
			}
		}
		
	}
	
	
	public function SolveTOI(subStep:B2TimeStep) : Void
	{
		
		
		var contactSolver:B2ContactSolver = new B2ContactSolver(subStep, m_contacts, m_contactCount, m_allocator);
		
		// No warm starting needed for TOI events.
		
		// Solve velocity constraints.
		for (i in 0...subStep.maxIterations)
		{
			contactSolver.SolveVelocityConstraints();
		}
		
		// Don't store the TOI contact forces for warm starting
		// because they can be quite large.
		
		// Integrate positions.
		for (i in 0...m_bodyCount)
		{
			var b:B2Body = m_bodies[i];
			
			if (b.IsStatic())
				continue;
			
			// Store positions for continuous collision.
			b.m_sweep.c0.SetV(b.m_sweep.c);
			b.m_sweep.a0 = b.m_sweep.a;
			
			// Integrate
			b.m_sweep.c.x += subStep.dt * b.m_linearVelocity.x;
			b.m_sweep.c.y += subStep.dt * b.m_linearVelocity.y;
			b.m_sweep.a += subStep.dt * b.m_angularVelocity;
			
			// Compute new transform
			b.SynchronizeTransform();
			
			// Note: shapes are synchronized later.
		}
		
		// Solve position constraints.
		var k_toiBaumgarte:Float = 0.75;
		for (i in 0...subStep.maxIterations)
		{
			var contactsOkay:Bool = contactSolver.SolvePositionConstraints(k_toiBaumgarte);
			if (contactsOkay)
			{
				break;
			}
		}
		
		Report(contactSolver.m_constraints);
	}
	static var s_reportCR:B2ContactResult = new B2ContactResult();
	public function Report(constraints:Array<B2ContactConstraint>) : Void
	{
		var tMat:B2Mat22;
		var tVec:B2Vec2;
		if (m_listener == null)
		{
			return;
		}
		
		for (i in 0...m_contactCount)
		{
			var c:B2Contact = m_contacts[i];
			var cc:B2ContactConstraint = constraints[ i ];
			var cr:B2ContactResult = s_reportCR;
			cr.shape1 = c.m_shape1;
			cr.shape2 = c.m_shape2;
			var b1:B2Body = cr.shape1.m_body;
			var manifoldCount:Int = c.m_manifoldCount;
			var manifolds:Array<B2Manifold> = c.GetManifolds();
			for (j in 0...manifoldCount)
			{
				var manifold:B2Manifold = manifolds[ j ];
				cr.normal.SetV( manifold.normal );
				for (k in 0...manifold.pointCount)
				{
					var point:B2ManifoldPoint = manifold.points[ k ];
					var ccp:B2ContactConstraintPoint = cc.points[ k ];
					cr.position = b1.GetWorldPoint(point.localPoint1);
					
					// TOI constraint results are not stored, so get
					// the result from the constraint.
					cr.normalImpulse = ccp.normalImpulse;
					cr.tangentImpulse = ccp.tangentImpulse;
					cr.id.key = point.id.key;
					
					m_listener.Result(cr);
				}
			}
		}
	}
	
	public function AddBody(body:B2Body) : Void
	{
		//B2Settings.b2Assert(m_bodyCount < m_bodyCapacity);
		m_bodies[m_bodyCount++] = body;
	}
	public function AddContact(contact:B2Contact) : Void
	{
		//B2Settings.b2Assert(m_contactCount < m_contactCapacity);
		m_contacts[m_contactCount++] = contact;
	}
	public function AddJoint(joint:B2Joint) : Void
	{
		//B2Settings.b2Assert(m_jointCount < m_jointCapacity);
		m_joints[m_jointCount++] = joint;
	}
	public var m_allocator:Dynamic;
	public var m_listener:B2ContactListener;
	public var m_bodies:Array<B2Body>;
	public var m_contacts:Array<B2Contact>;
	public var m_joints:Array<B2Joint>;
	public var m_bodyCount:Int;
	public var m_jointCount:Int;
	public var m_contactCount:Int;
	public var m_bodyCapacity:Int;
	public var m_contactCapacity:Int;
	public var m_jointCapacity:Int;
	public var m_positionIterationCount:Int;
	
}