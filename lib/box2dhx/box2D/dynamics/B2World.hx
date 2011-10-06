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

import box2D.collision.B2AABB;
import box2D.common.math.B2Vec2;
import box2D.dynamics.joints.B2Joint;
import box2D.dynamics.joints.B2JointDef;
import box2D.collision.shapes.B2Shape;
import box2D.common.B2Color;
import box2D.common.math.B2XForm;
import box2D.collision.B2BroadPhase;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.dynamics.joints.B2JointEdge;
import box2D.common.B2Settings;
import box2D.common.math.B2Math;
import box2D.collision.B2TimeOfImpact;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.dynamics.joints.B2PulleyJoint;
import box2D.collision.B2Pair;
import box2D.collision.B2Proxy;
import box2D.collision.B2OBB;
import box2D.common.math.B2Mat22;



class B2World
 {
	
	// Construct a world object.
	/// @param worldAABB a bounding box that completely encompasses all your shapes.
	/// @param gravity the world gravity vector.
	/// @param doSleep improve performance by not simulating inactive bodies.
	
	
	// Construct a world object.
	/// @param worldAABB a bounding box that completely encompasses all your shapes.
	/// @param gravity the world gravity vector.
	/// @param doSleep improve performance by not simulating inactive bodies.
	public function new(worldAABB:B2AABB, gravity:B2Vec2, doSleep:Bool){
		
		m_destructionListener = null;
		m_boundaryListener = null;
		m_contactFilter = B2ContactFilter.b2_defaultFilter;
		m_contactListener = null;
		#if (flash || cpp)
		m_debugDraw = null;
		#end
		
		m_bodyList = null;
		m_contactList = null;
		m_jointList = null;
		
		m_bodyCount = 0;
		m_contactCount = 0;
		m_jointCount = 0;
		
		m_positionCorrection = true;
		m_warmStarting = true;
		m_continuousPhysics = true;
		
		m_allowSleep = doSleep;
		m_gravity = gravity;
		
		m_lock = false;
		
		m_inv_dt0 = 0.0;
		
		m_contactManager = new B2ContactManager();
		m_contactManager.m_world = this;
		//void* mem = b2Alloc(sizeof(B2BroadPhase));
		m_broadPhase = new B2BroadPhase(worldAABB, m_contactManager);
		
		var bd:B2BodyDef = new B2BodyDef();
		m_groundBody = CreateBody(bd);
	}
	/// Destruct the world. All physics entities are destroyed and all heap memory is released.
	//~b2World();
	/// Register a destruction listener.
	public function SetDestructionListener(listener:B2DestructionListener) : Void{
		m_destructionListener = listener;
	}
	/// Register a broad-phase boundary listener.
	public function SetBoundaryListener(listener:B2BoundaryListener) : Void{
		m_boundaryListener = listener;
	}
	/// Register a contact filter to provide specific control over collision.
	/// Otherwise the default filter is used (b2_defaultFilter).
	public function SetContactFilter(filter:B2ContactFilter) : Void{
		m_contactFilter = filter;
	}
	/// Register a contact event listener
	public function SetContactListener(listener:B2ContactListener) : Void{
		m_contactListener = listener;
	}
	/// Register a routine for debug drawing. The debug draw functions are called
	/// inside the b2World::Step method, so make sure your renderer is ready to
	/// consume draw commands when you call Step().
	#if (flash ||cpp)
	public function SetDebugDraw(debugDraw:B2DebugDraw) : Void{
		m_debugDraw = debugDraw;
	}
	#end
	
	/// Perform validation of internal data structures.
	public function Validate() : Void
	{
		m_broadPhase.Validate();
	}
	
	/// Get the number of broad-phase proxies.
	public function GetProxyCount() : Int
	{
		return m_broadPhase.m_proxyCount;
	}
	
	/// Get the number of broad-phase pairs.
	public function GetPairCount() : Int
	{
		return m_broadPhase.m_pairManager.m_pairCount;
	}
	
	/// Create a rigid body given a definition. No reference to the definition
	/// is retained.
	/// @warning This function is locked during myCallbacks.
	public function CreateBody(def:B2BodyDef) :B2Body{
		
		//B2Settings.b2Assert(m_lock == false);
		if (m_lock == true)
		{
			return null;
		}
		
		//void* mem = m_blockAllocator.Allocate(sizeof(B2Body));
		var b:B2Body = new B2Body(def, this);
		
		// Add to world doubly linked list.
		b.m_prev = null;
		b.m_next = m_bodyList;
		if (m_bodyList != null)
		{
			m_bodyList.m_prev = b;
		}
		m_bodyList = b;
		++m_bodyCount;
		
		return b;
		
	}
	/// Destroy a rigid body given a definition. No reference to the definition
	/// is retained. This function is locked during myCallbacks.
	/// @warning This automatically deletes all associated shapes and joints.
	/// @warning This function is locked during myCallbacks.
	public function DestroyBody(b:B2Body) : Void{
		
		//B2Settings.b2Assert(m_bodyCount > 0);
		//B2Settings.b2Assert(m_lock == false);
		if (m_lock == true)
		{
			return;
		}
		
		// Delete the attached joints.
		var jn:B2JointEdge = b.m_jointList;
		while (jn != null)
		{
			var jn0:B2JointEdge = jn;
			jn = jn.next;
			
			if (m_destructionListener != null)
			{
				m_destructionListener.SayGoodbyeJoint(jn0.joint);
			}
			
			DestroyJoint(jn0.joint);
		}
		
		// Delete the attached shapes. This destroys broad-phase
		// proxies and pairs, leading to the destruction of contacts.
		var s:B2Shape = b.m_shapeList;
		while (s != null)
		{
			var s0:B2Shape = s;
			s = s.m_next;
			
			if (m_destructionListener != null)
			{
				m_destructionListener.SayGoodbyeShape(s0);
			}
			
			s0.DestroyProxy(m_broadPhase);
			B2Shape.Destroy(s0, m_blockAllocator);
		}
		
		// Remove world body list.
		if (b.m_prev != null)
		{
			b.m_prev.m_next = b.m_next;
		}
		
		if (b.m_next != null)
		{
			b.m_next.m_prev = b.m_prev;
		}
		
		if (b == m_bodyList)
		{
			m_bodyList = b.m_next;
		}
		
		--m_bodyCount;
		//b->~B2Body();
		//m_blockAllocator.Free(b, sizeof(B2Body));
		
	}
	/// Create a joint to constrain bodies together. No reference to the definition
	/// is retained. This may cause the connected bodies to cease colliding.
	/// @warning This function is locked during myCallbacks.
	public function CreateJoint(def:B2JointDef) :B2Joint{
		
		
		//B2Settings.b2Assert(m_lock == false);
		
		var j:B2Joint = B2Joint.Create(def, m_blockAllocator);
		
	
		// Connect to the world list.
		j.m_prev = null;
		j.m_next = m_jointList;
		if (m_jointList != null)
		{
			m_jointList.m_prev = j;
		}
		m_jointList = j;
		++m_jointCount;
		
		// Connect to the bodies' doubly linked lists.
		j.m_node1.joint = j;
		j.m_node1.other = j.m_body2;
		j.m_node1.prev = null;
		j.m_node1.next = j.m_body1.m_jointList;
		if (j.m_body1.m_jointList != null) j.m_body1.m_jointList.prev = j.m_node1;
		j.m_body1.m_jointList = j.m_node1;
		
		j.m_node2.joint = j;
		j.m_node2.other = j.m_body1;
		j.m_node2.prev = null;
		j.m_node2.next = j.m_body2.m_jointList;
		if (j.m_body2.m_jointList != null) j.m_body2.m_jointList.prev = j.m_node2;
		j.m_body2.m_jointList = j.m_node2;
		
		// If the joint prevents collisions, then reset collision filtering.
		if (def.collideConnected == false)
		{
			// Reset the proxies on the body with the minimum number of shapes.
			var b:B2Body = (def.body1.m_shapeCount < def.body2.m_shapeCount) ? def.body1 : def.body2;
			var s:B2Shape = b.m_shapeList;
			while (s != null)
			{
				s.RefilterProxy(m_broadPhase, b.m_xf);
				s = s.m_next;
			}
		}
		
		return j;
		
	}
	/// Destroy a joint. This may cause the connected bodies to begin colliding.
	/// @warning This function is locked during myCallbacks.
	public function DestroyJoint(j:B2Joint) : Void{
		
		//B2Settings.b2Assert(m_lock == false);
		
		var collideConnected:Bool = j.m_collideConnected;
		
		// Remove from the doubly linked list.
		if (j.m_prev != null)
		{
			j.m_prev.m_next = j.m_next;
		}
		
		if (j.m_next != null)
		{
			j.m_next.m_prev = j.m_prev;
		}
		
		if (j == m_jointList)
		{
			m_jointList = j.m_next;
		}
		
		// Disconnect from island graph.
		var body1:B2Body = j.m_body1;
		var body2:B2Body = j.m_body2;
		
		// Wake up connected bodies.
		body1.WakeUp();
		body2.WakeUp();
		
		// Remove from body 1.
		if (j.m_node1.prev != null)
		{
			j.m_node1.prev.next = j.m_node1.next;
		}
		
		if (j.m_node1.next != null)
		{
			j.m_node1.next.prev = j.m_node1.prev;
		}
		
		if (j.m_node1 == body1.m_jointList)
		{
			body1.m_jointList = j.m_node1.next;
		}
		
		j.m_node1.prev = null;
		j.m_node1.next = null;
		
		// Remove from body 2
		if (j.m_node2.prev != null)
		{
			j.m_node2.prev.next = j.m_node2.next;
		}
		
		if (j.m_node2.next != null)
		{
			j.m_node2.next.prev = j.m_node2.prev;
		}
		
		if (j.m_node2 == body2.m_jointList)
		{
			body2.m_jointList = j.m_node2.next;
		}
		
		j.m_node2.prev = null;
		j.m_node2.next = null;
		
		B2Joint.Destroy(j, m_blockAllocator);
		
		//B2Settings.b2Assert(m_jointCount > 0);
		--m_jointCount;
		
		// If the joint prevents collisions, then reset collision filtering.
		if (collideConnected == false)
		{
			// Reset the proxies on the body with the minimum number of shapes.
			var b:B2Body = (body1.m_shapeCount < body2.m_shapeCount) ? body1 : body2;
			var s:B2Shape = b.m_shapeList;
			while (s != null)
			{
				s.RefilterProxy(m_broadPhase, b.m_xf);
				s = s.m_next;
			}
		}
		
	}
	/// Re-filter a shape. This re-runs contact filtering on a shape.
	public function Refilter(shape:B2Shape) : Void
	{
		shape.RefilterProxy(m_broadPhase, shape.m_body.m_xf);
	}
	
	/// Enable/disable warm starting. For testing.
	public function SetWarmStarting(flag: Bool) : Void { m_warmStarting = flag; }
	/// Enable/disable position correction. For testing.
	public function SetPositionCorrection(flag: Bool) : Void { m_positionCorrection = flag; }
	/// Enable/disable continuous physics. For testing.
	public function SetContinuousPhysics(flag: Bool) : Void { m_continuousPhysics = flag; }
	
	/// Get the number of bodies.
	public function GetBodyCount() : Int
	{
		return m_bodyCount;
	}
	
	/// Get the number joints.
	public function GetJointCount() : Int
	{
		return m_jointCount;
	}
	
	/// Get the number of contacts (each may have 0 or more contact points).
	public function GetContactCount() : Int
	{
		return m_contactCount;
	}
	
	/// Change the global gravity vector.
	public function SetGravity(gravity:B2Vec2): Void
	{
		m_gravity = gravity;
	}
	
	/// The world provides a single static ground body with no collision shapes.
	/// You can use this to simplify the creation of joints and static shapes.
	public function GetGroundBody() :B2Body{
		return m_groundBody;
	}
	/// Take a time step. This performs collision detection, integration,
	/// and constraint solution.
	/// @param timeStep the amount of time to simulate, this should not vary.
	/// @param iterations the number of iterations to be used by the constraint solver.
	public function Step(dt:Float, iterations:Int) : Void{
		
		m_lock = true;
		
		var step:B2TimeStep = new B2TimeStep();
		step.dt = dt;
		step.maxIterations	= iterations;
		if (dt > 0.0)
		{
			step.inv_dt = 1.0 / dt;
		}
		else
		{
			step.inv_dt = 0.0;
		}
		
		step.dtRatio = m_inv_dt0 * dt;
		
		step.positionCorrection = m_positionCorrection;
		step.warmStarting = m_warmStarting;
		
		
		
		// Update contacts.
		m_contactManager.Collide();
		
	
		
		// Integrate velocities, solve velocity constraints, and integrate positions.
		
		if (step.dt > 0.0)
		{
			Solve(step);
		}
		
		
		
		// Handle TOI events.
		if (m_continuousPhysics && step.dt > 0.0)
		{
			SolveTOI(step);
		}
		
		// Draw debug information.
		#if (flash || cpp)
		DrawDebugData();
		#end
		
		m_inv_dt0 = step.inv_dt;
		m_lock = false;
	}
	/// Query the world for all shapes that potentially overlap the
	/// provided AABB. You provide a shape pointer buffer of specified
	/// size. The number of shapes found is returned.
	/// @param aabb the query box.
	/// @param shapes a user allocated shape pointer array of size maxCount (or greater).
	/// @param maxCount the capacity of the shapes array.
	/// @return the number of shapes found in aabb.
	public function Query(aabb:B2AABB, shapes:Array<Dynamic>, maxCount:Int) : Int{
		
		//void** results = (void**)m_stackAllocator.Allocate(maxCount * sizeof(void*));
		var results:Array<Dynamic> = new Array();
	
		var count:Int = m_broadPhase.QueryAABB(aabb, results, maxCount);
		
		for (i in 0...count)
		{
			shapes[i] = results[i];
		}
		
		//m_stackAllocator.Free(results);
		return count;
		
	}
	/// Get the world body list. With the returned body, use B2Body::GetNext to get
	/// the next body in the world list. A NULL body indicates the end of the list.
	/// @return the head of the world body list.
	public function GetBodyList() :B2Body{
		return m_bodyList;
	}
	/// Get the world joint list. With the returned joint, use B2Joint::GetNext to get
	/// the next joint in the world list. A NULL joint indicates the end of the list.
	/// @return the head of the world joint list.
	public function GetJointList() :B2Joint{
		return m_jointList;
	}
	//--------------- Internals Below -------------------
	// Internal yet public to make life easier.
	// Find islands, integrate and solve constraints, solve position constraints
	public function Solve(step:B2TimeStep) : Void{
		
		var b:B2Body;
		
		m_positionIterationCount = 0;
		
		// Size the island for the worst case.
		var island:B2Island = new B2Island(m_bodyCount, m_contactCount, m_jointCount, m_stackAllocator, m_contactListener);
		
		// Clear all the island flags.
		b = m_bodyList;
		
		
		
		while (b != null)
		{
			b.m_flags &= B2Math.complement(B2Body.e_islandFlag);
			b = b.m_next;
		}
		
		var c : B2Contact = m_contactList;
		
		
		while (c != null)
		{
			c.m_flags &= B2Math.complement(B2Contact.e_islandFlag);
			c = c.m_next;
		}
		
		var j : B2Joint = m_jointList;

		while (j != null)
		{
			j.m_islandFlag = false;
			j = j.m_next;
		}
		
		// Build and simulate all awake islands.
		var stackSize:Int = m_bodyCount;
		//B2Body** stack = (B2Body**)m_stackAllocator.Allocate(stackSize * sizeof(B2Body*));
		var stack:Array<B2Body> = new Array();
		var seed : B2Body = m_bodyList;
		
		while (seed != null)
		{
			if ((seed.m_flags & (B2Body.e_islandFlag | B2Body.e_sleepFlag | B2Body.e_frozenFlag)) != 0)
			{
				seed = seed.m_next; continue;
			}
			if (seed.IsStatic())
			{
				seed = seed.m_next; continue;
			}
			// Reset island and stack.
			island.Clear();
			var stackCount:Int = 0;
			stack[stackCount++] = seed;
			seed.m_flags |= B2Body.e_islandFlag;
			// Perform a depth first search (DFS) on the constraint graph.
			
			while (stackCount > 0)
			{
				// Grab the next body off the stack and add it to the island.
				b = stack[--stackCount];
				island.AddBody(b);
				// Make sure the body is awake.
				b.m_flags &= B2Math.complement(B2Body.e_sleepFlag);
				// To keep islands as small as possible, we don't
				// propagate islands across static bodies.
				if (b.IsStatic())
				{
					continue;
				}
				var other:B2Body;
				// Search all contacts connected to this body.
				var cn:B2ContactEdge = b.m_contactList;
					// Has this contact already been added to an island?
				while (cn != null)
				{
					// Has this contact already been added to an island?
					if ((cn.contact.m_flags & (B2Contact.e_islandFlag | B2Contact.e_nonSolidFlag)) != 0)
					{
						cn = cn.next; continue;
					}
					// Is this contact touching?
					if (cn.contact.m_manifoldCount == 0)
					{
						cn = cn.next; continue;
					}
					island.AddContact(cn.contact);
					cn.contact.m_flags |= B2Contact.e_islandFlag;
					//var other:B2Body = cn.other;
					other = cn.other;
					// Was the other body already added to this island?
					if ((other.m_flags & B2Body.e_islandFlag) != 0)
					{
						cn = cn.next; continue;
					}
					//B2Settings.b2Assert(stackCount < stackSize);
					stack[stackCount++] = other;
					other.m_flags |= B2Body.e_islandFlag;
					cn = cn.next;
					// Has this contact already been added to an island?
				}
				// Search all joints connect to this body.
				var jn:B2JointEdge = b.m_jointList;
				while (jn != null)
				{
					if (jn.joint.m_islandFlag == true)
					{
						jn = jn.next; continue;
					}
					
					island.AddJoint(jn.joint);
					jn.joint.m_islandFlag = true;
					//var other:B2Body = jn.other;
					other = jn.other;
					if ((other.m_flags & B2Body.e_islandFlag) != 0)
					{
						jn = jn.next; continue;
					}
					
					//B2Settings.b2Assert(stackCount < stackSize);
					stack[stackCount++] = other;
					other.m_flags |= B2Body.e_islandFlag;
					jn = jn.next;
				}
			}
			
			
			island.Solve(step, m_gravity, m_positionCorrection, m_allowSleep);
			
			//m_positionIterationCount = Math.max(m_positionIterationCount, island.m_positionIterationCount);
			if (island.m_positionIterationCount > m_positionIterationCount) {
				m_positionIterationCount = island.m_positionIterationCount;
			}
			
			// Post solve cleanup.

			for (i in 0...island.m_bodyCount)
			{
				// Allow static bodies to participate in other islands.
				b = island.m_bodies[i];
				if (b.IsStatic())
				{
					b.m_flags &= B2Math.complement(B2Body.e_islandFlag);
				}
			}
			
			seed = seed.m_next;
		}
		
		//m_stackAllocator.Free(stack);
		
		// Synchronize shapes, check for out of range bodies.
		b = m_bodyList;
		
		while (b != null)
		{
			if ((b.m_flags & (B2Body.e_sleepFlag | B2Body.e_frozenFlag)) !=0 )
			{
				b = b.m_next;continue;
			}
			
			if (b.IsStatic())
			{
				b = b.m_next;continue;
			}
			
			// Update shapes (for broad-phase). If the shapes go out of
			// the world AABB then shapes and contacts may be destroyed,
			// including contacts that are
			var inRange:Bool = b.SynchronizeShapes();
			
			// Did the body's shapes leave the world?
			if (inRange == false && m_boundaryListener != null)
			{
				m_boundaryListener.Violation(b);
			}
			b = b.m_next;
		}
		
		// Commit shape proxy movements to the broad-phase so that new contacts are created.
		// Also, some contacts can be destroyed.
		
		
		m_broadPhase.Commit();
		
		
	}
	
	// Find TOI contacts and solve them.
	public function SolveTOI(step:B2TimeStep) : Void{
		
		var b:B2Body;
		var s1:B2Shape;
		var s2:B2Shape;
		var b1:B2Body;
		var b2:B2Body;
		var cn:B2ContactEdge;
		
		// Reserve an island and a stack for TOI island solution.
		var island:B2Island = new B2Island(m_bodyCount, B2Settings.b2_maxTOIContactsPerIsland, 0, m_stackAllocator, m_contactListener);
		var stackSize:Int = m_bodyCount;
		
		//B2Body** stack = (B2Body**)m_stackAllocator.Allocate(stackSize * sizeof(B2Body*));
		var stack:Array<B2Body> = new Array();
		
		b = m_bodyList;
		while (b != null)
		{
			b.m_flags &= B2Math.complement(B2Body.e_islandFlag);
			b.m_sweep.t0 = 0.0;
			b = b.m_next;
		}
		
		var c:B2Contact;
		c = m_contactList;
			// Invalidate TOI
		while (c != null)
		{
			// Invalidate TOI
			c.m_flags &= B2Math.complement(B2Contact.e_toiFlag | B2Contact.e_islandFlag);
			c = c.m_next;
			// Invalidate TOI
		}
		
		// Find TOI events and solve them.
		while (true)
		{
			// Find the first TOI.
			var minContact:B2Contact = null;
			var minTOI:Float = 1.0;
			
			c = m_contactList;
			while (c != null)
			{
				if ((c.m_flags & (B2Contact.e_slowFlag | B2Contact.e_nonSolidFlag)) != 0)
				{
					c = c.m_next; continue;
				}
				
				// TODO_ERIN keep a counter on the contact, only respond to M TOIs per contact.
				
				var toi:Float = 1.0;
				if ((c.m_flags & B2Contact.e_toiFlag) != 0)
				{
					// This contact has a valid cached TOI.
					toi = c.m_toi;
				}
				else
				{
					// Compute the TOI for this contact.
					s1 = c.m_shape1;
					s2 = c.m_shape2;
					b1 = s1.m_body;
					b2 = s2.m_body;
					
					if ((b1.IsStatic() || b1.IsSleeping()) && (b2.IsStatic() || b2.IsSleeping()))
					{
						c = c.m_next; continue;
					}
					
					// Put the sweeps onto the same time interval.
					var t0:Float = b1.m_sweep.t0;
					
					if (b1.m_sweep.t0 < b2.m_sweep.t0)
					{
						t0 = b2.m_sweep.t0;
						b1.m_sweep.Advance(t0);
					}
					else if (b2.m_sweep.t0 < b1.m_sweep.t0)
					{
						t0 = b1.m_sweep.t0;
						b2.m_sweep.Advance(t0);
					}
					
					//B2Settings.b2Assert(t0 < 1.0f);
					
					// Compute the time of impact.
					toi = B2TimeOfImpact.TimeOfImpact(c.m_shape1, b1.m_sweep, c.m_shape2, b2.m_sweep);
					//B2Settings.b2Assert(0.0 <= toi && toi <= 1.0);
					
					if (toi > 0.0 && toi < 1.0)
					{
						//toi = Math.min((1.0 - toi) * t0 + toi, 1.0);
						toi = (1.0 - toi) * t0 + toi;
						if (toi > 1) toi = 1;
					}
					
					
					c.m_toi = toi;
					c.m_flags |= B2Contact.e_toiFlag;
				}
				
				if (box2D.common.math.B2Math.MIN_VALUE < toi && toi < minTOI)
				{
					// This is the minimum TOI found so far.
					minContact = c;
					minTOI = toi;
				}
				c = c.m_next;
			}
			
			if (minContact == null || 1.0 - 100.0 * box2D.common.math.B2Math.MIN_VALUE < minTOI)
			{
				// No more TOI events. Done!
				break;
			}
			
			// Advance the bodies to the TOI.
			s1 = minContact.m_shape1;
			s2 = minContact.m_shape2;
			b1 = s1.m_body;
			b2 = s2.m_body;
			b1.Advance(minTOI);
			b2.Advance(minTOI);
			
			// The TOI contact likely has some new contact points.
			minContact.Update(m_contactListener);
			minContact.m_flags &= B2Math.complement(B2Contact.e_toiFlag);
			
			if (minContact.m_manifoldCount == 0)
			{
				// This shouldn't happen. Numerical error?
				//b2Assert(false);
				continue;
			}
			
			// Build the TOI island. We need a dynamic seed.
			var seed:B2Body = b1;
			if (seed.IsStatic())
			{
				seed = b2;
			}
			
			// Reset island and stack.
			island.Clear();
			var stackCount:Int = 0;
			stack[stackCount++] = seed;
			seed.m_flags |= B2Body.e_islandFlag;
			
			// Perform a depth first search (DFS) on the contact graph.
			while (stackCount > 0)
			{
				// Grab the next body off the stack and add it to the island.
				b = stack[--stackCount];
				island.AddBody(b);
				
				// Make sure the body is awake.
				b.m_flags &= B2Math.complement(B2Body.e_sleepFlag);
				
				// To keep islands as small as possible, we don't
				// propagate islands across static bodies.
				if (b.IsStatic())
				{
					continue;
				}
				
				// Search all contacts connected to this body.
				cn = b.m_contactList;
					// Does the TOI island still have space for contacts?
				while (cn != null)
				{
					// Does the TOI island still have space for contacts?
					if (island.m_contactCount == island.m_contactCapacity)
					{
						cn = cn.next;continue;
					}
					
					// Has this contact already been added to an island? Skip slow or non-solid contacts.
					if (cn.contact.m_flags & (B2Contact.e_islandFlag | B2Contact.e_slowFlag | B2Contact.e_nonSolidFlag) != 0)
					{
						cn = cn.next;continue;
					}
					
					// Is this contact touching? For performance we are not updating this contact.
					if (cn.contact.m_manifoldCount == 0)
					{
						cn = cn.next;continue;
					}
					
					island.AddContact(cn.contact);
					cn.contact.m_flags |= B2Contact.e_islandFlag;
					
					// Update other body.
					var other:B2Body = cn.other;
					
					// Was the other body already added to this island?
					if ((other.m_flags & B2Body.e_islandFlag) != 0)
					{
						cn = cn.next;continue;
					}
					
					// March forward, this can do no harm since this is the min TOI.
					if (other.IsStatic() == false)
					{
						other.Advance(minTOI);
						other.WakeUp();
					}
					
					//B2Settings.b2Assert(stackCount < stackSize);
					stack[stackCount++] = other;
					other.m_flags |= B2Body.e_islandFlag;
					cn = cn.next;
					// Does the TOI island still have space for contacts?
				}
			}
			
			var subStep:B2TimeStep = new B2TimeStep();
			subStep.dt = (1.0 - minTOI) * step.dt;
			//B2Settings.b2Assert(subStep.dt > box2D.common.math.B2Math.MIN_VALUE);
			subStep.inv_dt = 1.0 / subStep.dt;
			subStep.maxIterations = step.maxIterations;
			
			island.SolveTOI(subStep);
			
			var i:Int;
			// Post solve cleanup.
			for (i in 0...island.m_bodyCount)
			{
				// Allow bodies to participate in future TOI islands.
				b = island.m_bodies[i];
				b.m_flags &= B2Math.complement(B2Body.e_islandFlag);
				
				if (b.m_flags & (B2Body.e_sleepFlag | B2Body.e_frozenFlag) != 0)
				{
					continue;
				}
				
				if (b.IsStatic())
				{
					continue;
				}
				
				// Update shapes (for broad-phase). If the shapes go out of
				// the world AABB then shapes and contacts may be destroyed,
				// including contacts that are
				var inRange:Bool = b.SynchronizeShapes();
				
				// Did the body's shapes leave the world?
				if (inRange == false && m_boundaryListener != null)
				{
					m_boundaryListener.Violation(b);
				}
				
				// Invalidate all contact TOIs associated with this body. Some of these
				// may not be in the island because they were not touching.
				cn = b.m_contactList;
				while (cn != null)
				{
					cn.contact.m_flags &= B2Math.complement(B2Contact.e_toiFlag);
					cn = cn.next;
				}
			}
			
			for (i in 0...island.m_contactCount)
			{
				// Allow contacts to participate in future TOI islands.
				c = island.m_contacts[i];
				c.m_flags &= B2Math.complement(B2Contact.e_toiFlag | B2Contact.e_islandFlag);
			}
			
			// Commit shape proxy movements to the broad-phase so that new contacts are created.
			// Also, some contacts can be destroyed.
			m_broadPhase.Commit();
		}
		
		//m_stackAllocator.Free(stack);
		
	}
	
	static var s_jointColor:B2Color = new B2Color(0.5, 0.8, 0.8);
	//
	#if (flash || cpp)
	public function DrawJoint(joint:B2Joint) : Void{
		
		var b1:B2Body = joint.m_body1;
		var b2:B2Body = joint.m_body2;
		var xf1:B2XForm = b1.m_xf;
		var xf2:B2XForm = b2.m_xf;
		var x1:B2Vec2 = xf1.position;
		var x2:B2Vec2 = xf2.position;
		var p1:B2Vec2 = joint.GetAnchor1();
		var p2:B2Vec2 = joint.GetAnchor2();
		
		//b2Color color(0.5f, 0.8f, 0.8f);
		var color:B2Color = s_jointColor;
		
		switch (joint.m_type)
		{
		case B2Joint.e_distanceJoint:
			m_debugDraw.DrawSegment(p1, p2, color);
			
		
		case B2Joint.e_pulleyJoint:
			{
				var pulley:B2PulleyJoint = (cast( joint,B2PulleyJoint));
				var s1:B2Vec2 = pulley.GetGroundAnchor1();
				var s2:B2Vec2 = pulley.GetGroundAnchor2();
				m_debugDraw.DrawSegment(s1, p1, color);
				m_debugDraw.DrawSegment(s2, p2, color);
				m_debugDraw.DrawSegment(s1, s2, color);
			}
			
		
		case B2Joint.e_mouseJoint:
			m_debugDraw.DrawSegment(p1, p2, color);
			
		
		default:
			if (b1 != m_groundBody)
				m_debugDraw.DrawSegment(x1, p1, color);
			m_debugDraw.DrawSegment(p1, p2, color);
			if (b2 != m_groundBody)
				m_debugDraw.DrawSegment(x2, p2, color);
		}
	}
	
	
	static var s_coreColor:B2Color = new B2Color(0.9, 0.6, 0.6);
	public function DrawShape(shape:B2Shape, xf:B2XForm, color:B2Color, core:Bool) : Void{
		
		var coreColor:B2Color = s_coreColor;
		
		switch (shape.m_type)
		{
		case B2Shape.e_circleShape:
			{
				var circle:B2CircleShape = cast shape;
				
				var center:B2Vec2 = B2Math.b2MulX(xf, circle.m_localPosition);
				var radius:Float = circle.m_radius;
				var axis:B2Vec2 = xf.R.col1;
				
				m_debugDraw.DrawSolidCircle(center, radius, axis, color);
				
				if (core)
				{
					m_debugDraw.DrawCircle(center, radius - B2Settings.b2_toiSlop, coreColor);
				}
			}
			
		
		case B2Shape.e_polygonShape:
			{
				var i:Int;
				var poly:B2PolygonShape = cast shape;
				var vertexCount:Int = poly.GetVertexCount();
				var localVertices:Array<B2Vec2> = poly.GetVertices();
				
				//b2Assert(vertexCount <= b2_maxPolygonVertices);
				var vertices:Array<B2Vec2> = new Array();
				
				for (i in 0...vertexCount)
				{
					vertices[i] = B2Math.b2MulX(xf, localVertices[i]);
				}
				
				m_debugDraw.DrawSolidPolygon(vertices, vertexCount, color);
				
				if (core)
				{
					var localCoreVertices:Array<B2Vec2> = poly.GetCoreVertices();
					for (i in 0...vertexCount)
					{
						vertices[i] = B2Math.b2MulX(xf, localCoreVertices[i]);
					}
					m_debugDraw.DrawPolygon(vertices, vertexCount, coreColor);
				}
			}
			
		}
	}
	
	
	static var s_xf:B2XForm = new B2XForm();
	public function DrawDebugData() : Void{
		
		if (m_debugDraw == null)
		{
			return;
		}
		
		m_debugDraw.m_sprite.graphics.clear();
		
		var flags:Int = m_debugDraw.GetFlags();
		
		var i:Int;
		var b:B2Body;
		var s:B2Shape;
		var j:B2Joint;
		var bp:B2BroadPhase;
		var invQ:B2Vec2 = new B2Vec2();
		var x1:B2Vec2 = new B2Vec2();
		var x2:B2Vec2 = new B2Vec2();
		var color:B2Color = new B2Color(0,0,0);
		var xf:B2XForm;
		var b1:B2AABB = new B2AABB();
		var b2:B2AABB = new B2AABB();
		var vs:Array<B2Vec2> = [new B2Vec2(), new B2Vec2(), new B2Vec2(), new B2Vec2()];
		
		if ((flags & B2DebugDraw.e_shapeBit) != 0)
		{
			var core:Bool = (flags & B2DebugDraw.e_coreShapeBit) == B2DebugDraw.e_coreShapeBit;
			
			b = m_bodyList;
			while (b != null)
			{
				xf = b.m_xf;
				s = b.GetShapeList();
				while (s != null)
				{
					if (b.IsStatic())
					{
						DrawShape(s, xf, new B2Color(0.5, 0.9, 0.5), core);
					}
					else if (b.IsSleeping())
					{
						DrawShape(s, xf, new B2Color(0.5, 0.5, 0.9), core);
					}
					else
					{
						DrawShape(s, xf, new B2Color(0.9, 0.9, 0.9), core);
					}
					s = s.m_next;
				}
				b = b.m_next;
			}
		}
		
		if ((flags & B2DebugDraw.e_jointBit) != 0)
		{
			j = m_jointList;
				//if (j.m_type != B2Joint.e_mouseJoint)
				//{
			while (j != null)
			{
				//if (j.m_type != B2Joint.e_mouseJoint)
				//{
					DrawJoint(j);
				//}
				j = j.m_next;
				//if (j.m_type != B2Joint.e_mouseJoint)
				//{
				}
		}
		
		if ((flags & B2DebugDraw.e_pairBit) != 0)
		{
			bp = m_broadPhase;
			//b2Vec2 invQ;
			invQ.Set(1.0 / bp.m_quantizationFactor.x, 1.0 / bp.m_quantizationFactor.y);
			//b2Color color(0.9f, 0.9f, 0.3f);
			color.Set(0.9, 0.9, 0.3);
			
			for (i in 0...B2Pair.b2_tableCapacity)
			{
				var index:Int = bp.m_pairManager.m_hashTable[i];
				while (index != B2Pair.b2_nullPair)
				{
					var pair:B2Pair = bp.m_pairManager.m_pairs[ index ];
					var p1:B2Proxy = bp.m_proxyPool[ pair.proxyId1 ];
					var p2:B2Proxy = bp.m_proxyPool[ pair.proxyId2 ];
					
					//b2AABB b1, b2;
					b1.lowerBound.x = bp.m_worldAABB.lowerBound.x + invQ.x * bp.m_bounds[0][p1.lowerBounds[0]].value;
					b1.lowerBound.y = bp.m_worldAABB.lowerBound.y + invQ.y * bp.m_bounds[1][p1.lowerBounds[1]].value;
					b1.upperBound.x = bp.m_worldAABB.lowerBound.x + invQ.x * bp.m_bounds[0][p1.upperBounds[0]].value;
					b1.upperBound.y = bp.m_worldAABB.lowerBound.y + invQ.y * bp.m_bounds[1][p1.upperBounds[1]].value;
					b2.lowerBound.x = bp.m_worldAABB.lowerBound.x + invQ.x * bp.m_bounds[0][p2.lowerBounds[0]].value;
					b2.lowerBound.y = bp.m_worldAABB.lowerBound.y + invQ.y * bp.m_bounds[1][p2.lowerBounds[1]].value;
					b2.upperBound.x = bp.m_worldAABB.lowerBound.x + invQ.x * bp.m_bounds[0][p2.upperBounds[0]].value;
					b2.upperBound.y = bp.m_worldAABB.lowerBound.y + invQ.y * bp.m_bounds[1][p2.upperBounds[1]].value;
					
					//b2Vec2 x1 = 0.5f * (b1.lowerBound + b1.upperBound);
					x1.x = 0.5 * (b1.lowerBound.x + b1.upperBound.x);
					x1.y = 0.5 * (b1.lowerBound.y + b1.upperBound.y);
					//b2Vec2 x2 = 0.5f * (b2.lowerBound + b2.upperBound);
					x2.x = 0.5 * (b2.lowerBound.x + b2.upperBound.x);
					x2.y = 0.5 * (b2.lowerBound.y + b2.upperBound.y);
					
					m_debugDraw.DrawSegment(x1, x2, color);
					
					index = pair.next;
				}
			}
		}
		
		if ((flags & B2DebugDraw.e_aabbBit) != 0)
		{
			bp = m_broadPhase;
			var worldLower:B2Vec2 = bp.m_worldAABB.lowerBound;
			var worldUpper:B2Vec2 = bp.m_worldAABB.upperBound;
			
			//b2Vec2 invQ;
			invQ.Set(1.0 / bp.m_quantizationFactor.x, 1.0 / bp.m_quantizationFactor.y);
			//b2Color color(0.9f, 0.3f, 0.9f);
			color.Set(0.9, 0.3, 0.9);
			for (i in 0...B2Settings.b2_maxProxies)
			{
				var p:B2Proxy = bp.m_proxyPool[ i];
				if (p.IsValid() == false)
				{
					continue;
				}
				
				//b2AABB b1;
				b1.lowerBound.x = worldLower.x + invQ.x * bp.m_bounds[0][p.lowerBounds[0]].value;
				b1.lowerBound.y = worldLower.y + invQ.y * bp.m_bounds[1][p.lowerBounds[1]].value;
				b1.upperBound.x = worldLower.x + invQ.x * bp.m_bounds[0][p.upperBounds[0]].value;
				b1.upperBound.y = worldLower.y + invQ.y * bp.m_bounds[1][p.upperBounds[1]].value;
				
				//b2Vec2 vs[4];
				vs[0].Set(b1.lowerBound.x, b1.lowerBound.y);
				vs[1].Set(b1.upperBound.x, b1.lowerBound.y);
				vs[2].Set(b1.upperBound.x, b1.upperBound.y);
				vs[3].Set(b1.lowerBound.x, b1.upperBound.y);
				
				m_debugDraw.DrawPolygon(vs, 4, color);
			}
			
			//b2Vec2 vs[4];
			vs[0].Set(worldLower.x, worldLower.y);
			vs[1].Set(worldUpper.x, worldLower.y);
			vs[2].Set(worldUpper.x, worldUpper.y);
			vs[3].Set(worldLower.x, worldUpper.y);
			m_debugDraw.DrawPolygon(vs, 4, new B2Color(0.3, 0.9, 0.9));
		}
		
		if ((flags & B2DebugDraw.e_obbBit) != 0)
		{
			//b2Color color(0.5f, 0.3f, 0.5f);
			color.Set(0.5, 0.3, 0.5);
			
			b = m_bodyList;
			while (b != null)
			{
				xf = b.m_xf;
				s = b.GetShapeList();
				while (s != null)
				{
					if (s.m_type != B2Shape.e_polygonShape)
					{
						s = s.m_next; 
						continue;
					}
					
					var poly:B2PolygonShape = (cast( s,B2PolygonShape));
					var obb:B2OBB = poly.GetOBB();
					var h:B2Vec2 = obb.extents;
					//b2Vec2 vs[4];
					vs[0].Set(-h.x, -h.y);
					vs[1].Set( h.x, -h.y);
					vs[2].Set( h.x,  h.y);
					vs[3].Set(-h.x,  h.y);
					
					for (i in 0...4)
					{
						//vs[i] = obb.center + b2Mul(obb.R, vs[i]);
						var tMat:B2Mat22 = obb.R;
						var tVec:B2Vec2 = vs[i];
						var tX:Float;
						tX      = obb.center.x + (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
						vs[i].y = obb.center.y + (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
						vs[i].x = tX;
						//vs[i] = b2Mul(xf, vs[i]);
						tMat = xf.R;
						tX      = xf.position.x + (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y);
						vs[i].y = xf.position.y + (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y);
						vs[i].x = tX;
					}
					
					m_debugDraw.DrawPolygon(vs, 4, color);
					s = s.m_next;
				}
				b = b.m_next;
			}
		}
		
		if ((flags & B2DebugDraw.e_centerOfMassBit) != 0)
		{
			b = m_bodyList;
			while (b != null)
			{
				xf = s_xf;
				xf.R = b.m_xf.R;
				xf.position = b.GetWorldCenter();
				m_debugDraw.DrawXForm(xf);
				b = b.m_next;
			}
		}
	}
	#end
	public var m_blockAllocator:Dynamic;
	public var m_stackAllocator:Dynamic;
	public var m_lock:Bool;
	public var m_broadPhase:B2BroadPhase;
	public var m_contactManager:B2ContactManager ;
	public var m_bodyList:B2Body;
	public var m_jointList:B2Joint;
	// Do not access
	public var m_contactList:B2Contact;
	public var m_bodyCount:Int;
	public var m_contactCount:Int;
	public var m_jointCount:Int;
	public var m_gravity:B2Vec2;
	public var m_allowSleep:Bool;
	public var m_groundBody:B2Body;
	public var m_destructionListener:B2DestructionListener;
	public var m_boundaryListener:B2BoundaryListener;
	public var m_contactFilter:B2ContactFilter;
	public var m_contactListener:B2ContactListener;
	#if (flash || cpp)
	public var m_debugDraw:B2DebugDraw;
	#end
	public var m_inv_dt0:Float;
	public var m_positionIterationCount:Int;
	// This is for debugging the solver.
	public static var m_positionCorrection:Bool;
	// This is for debugging the solver.
	public static var m_warmStarting:Bool;
	// This is for debugging the solver.
	public static var m_continuousPhysics:Bool;
	
}