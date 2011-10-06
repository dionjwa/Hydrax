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

import box2D.collision.B2PairCallback;
import box2D.collision.B2ContactPoint;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2NullContact;
import box2D.collision.shapes.B2Shape;
import box2D.collision.B2Manifold;
import box2D.common.math.B2Vec2;
import box2D.collision.B2ManifoldPoint;

// Delegate of b2World.
class B2ContactManager extends B2PairCallback {
	
	public function new() {
		super();
		
		
		m_nullContact = new B2NullContact();
		
		m_world = null;
		m_destroyImmediate = false;
	}
	// This is a myCallback from the broadphase when two AABB proxies begin
	// to overlap. We create a b2Contact to manage the narrow phase.
	public override function PairAdded(proxyUserData1:Dynamic, proxyUserData2:Dynamic):Dynamic{
		var shape1:B2Shape = cast proxyUserData1;
		var shape2:B2Shape = cast proxyUserData2;
		
		var body1:B2Body = shape1.m_body;
		var body2:B2Body = shape2.m_body;
		
		if (body1.IsStatic() && body2.IsStatic())
		{
			return m_nullContact;
		}
		
		if (shape1.m_body == shape2.m_body)
		{
			return m_nullContact;
		}
		
		if (body2.IsConnected(body1))
		{
			return m_nullContact;
		}
		
		if (m_world.m_contactFilter != null && m_world.m_contactFilter.ShouldCollide(shape1, shape2) == false)
		{
			return m_nullContact;
		}
		
		// Call the factory.
		var c:B2Contact = B2Contact.Create(shape1, shape2, m_world.m_blockAllocator);
		
		if (c == null)
		{
			return m_nullContact;
		}
		
		// Contact creation may swap shapes.
		shape1 = c.m_shape1;
		shape2 = c.m_shape2;
		body1 = shape1.m_body;
		body2 = shape2.m_body;
		
		// Insert into the world.
		c.m_prev = null;
		c.m_next = m_world.m_contactList;
		if (m_world.m_contactList != null)
		{
			m_world.m_contactList.m_prev = c;
		}
		m_world.m_contactList = c;
		
		
		// Connect to island graph.
		
		// Connect to body 1
		c.m_node1.contact = c;
		c.m_node1.other = body2;
		
		c.m_node1.prev = null;
		c.m_node1.next = body1.m_contactList;
		if (body1.m_contactList != null)
		{
			body1.m_contactList.prev = c.m_node1;
		}
		body1.m_contactList = c.m_node1;
		
		// Connect to body 2
		c.m_node2.contact = c;
		c.m_node2.other = body1;
		
		c.m_node2.prev = null;
		c.m_node2.next = body2.m_contactList;
		if (body2.m_contactList != null)
		{
			body2.m_contactList.prev = c.m_node2;
		}
		body2.m_contactList = c.m_node2;
		
		++m_world.m_contactCount;
		return c;
		
	}
	// This is a myCallback from the broadphase when two AABB proxies cease
	// to overlap. We retire the b2Contact.
	public override function PairRemoved(proxyUserData1:Dynamic, proxyUserData2:Dynamic, pairUserData:Dynamic): Void{
		
		if (pairUserData == null)
		{
			return;
		}
		
		var c:B2Contact = cast pairUserData;
		if (c == m_nullContact)
		{
			return;
		}
		
		// An attached body is being destroyed, we must destroy this contact
		// immediately to avoid orphaned shape pointers.
		Destroy(c);
	}
	
	static var s_evalCP:B2ContactPoint = new B2ContactPoint();
	public function Destroy(c:B2Contact) : Void
	{
		
		var shape1:B2Shape = c.m_shape1;
		var shape2:B2Shape = c.m_shape2;
		
		// Inform the user that this contact is ending.
		var manifoldCount:Int = c.m_manifoldCount;
		if (manifoldCount > 0 && m_world.m_contactListener != null)
		{
			var b1:B2Body = shape1.m_body;
			var b2:B2Body = shape2.m_body;
			var manifolds:Array<B2Manifold>  = c.GetManifolds();
			var cp:B2ContactPoint = s_evalCP;
			cp.shape1 = c.m_shape1;
			cp.shape2 = c.m_shape1;
			cp.friction = c.m_friction;
			cp.restitution = c.m_restitution;
			
			for (i in 0...manifoldCount)
			{
				var manifold:B2Manifold = manifolds[ i ];
				cp.normal.SetV(manifold.normal);
				
				for (j in 0...manifold.pointCount)
				{
					var mp:B2ManifoldPoint = manifold.points[j];
					cp.position = b1.GetWorldPoint(mp.localPoint1);
					var v1:B2Vec2 = b1.GetLinearVelocityFromLocalPoint(mp.localPoint1);
					var v2:B2Vec2 = b2.GetLinearVelocityFromLocalPoint(mp.localPoint2);
					cp.velocity.Set(v2.x - v1.x, v2.y - v1.y);
					cp.separation = mp.separation;
					cp.id.key = mp.id._key;
					m_world.m_contactListener.Remove(cp);
				}
			}
		}
		
		// Remove from the world.
		if (c.m_prev != null)
		{
			c.m_prev.m_next = c.m_next;
		}
		
		if (c.m_next != null)
		{
			c.m_next.m_prev = c.m_prev;
		}
		
		if (c == m_world.m_contactList)
		{
			m_world.m_contactList = c.m_next;
		}
		
		var body1:B2Body = shape1.m_body;
		var body2:B2Body = shape2.m_body;
		
		// Remove from body 1
		if (c.m_node1.prev != null)
		{
			c.m_node1.prev.next = c.m_node1.next;
		}
		
		if (c.m_node1.next != null)
		{
			c.m_node1.next.prev = c.m_node1.prev;
		}
		
		if (c.m_node1 == body1.m_contactList)
		{
			body1.m_contactList = c.m_node1.next;
		}
		
		// Remove from body 2
		if (c.m_node2.prev != null)
		{
			c.m_node2.prev.next = c.m_node2.next;
		}
		
		if (c.m_node2.next != null)
		{
			c.m_node2.next.prev = c.m_node2.prev;
		}
		
		if (c.m_node2 == body2.m_contactList)
		{
			body2.m_contactList = c.m_node2.next;
		}
		
		// Call the factory.
		B2Contact.Destroy(c, m_world.m_blockAllocator);
		--m_world.m_contactCount;
	}
	
	// This is the top level collision call for the time step. Here
	// all the narrow phase collision is processed for the world
	// contact list.
	public function Collide() : Void
	{
		// Update awake contacts.
		var c:B2Contact = m_world.m_contactList;
		while (c != null)
		{
			var body1:B2Body = c.m_shape1.m_body;
			var body2:B2Body = c.m_shape2.m_body;
			if (body1.IsSleeping() && body2.IsSleeping())
			{
				c = c.m_next; continue;
			}
			
			c.Update(m_world.m_contactListener);
			c = c.m_next;
		}
	}
	public var m_world:B2World;
	// This lets us provide broadphase proxy pair user data for
	// contacts that shouldn't exist.
	public var m_nullContact:B2NullContact ;
	public var m_destroyImmediate:Bool;
	
}