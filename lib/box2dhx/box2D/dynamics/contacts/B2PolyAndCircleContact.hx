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
package box2D.dynamics.contacts;

import box2D.collision.shapes.B2Shape;
import box2D.collision.B2ContactPoint;
import box2D.dynamics.B2ContactListener;
import box2D.collision.B2Manifold;
import box2D.common.math.B2Vec2;
import box2D.common.B2Settings;
import box2D.collision.B2ManifoldPoint;
import box2D.dynamics.B2Body;
import box2D.collision.B2Collision;

class B2PolyAndCircleContact extends B2Contact {
	
	
	
	public static function Create(shape1:B2Shape, shape2:B2Shape, allocator:Dynamic):B2Contact{
		return new B2PolyAndCircleContact(shape1, shape2);
	}
	public static function Destroy(contact:B2Contact, allocator:Dynamic): Void{
	}
	public function new(shape1:B2Shape, shape2:B2Shape){
		super(shape1, shape2);
		m_manifolds = [new B2Manifold()];
		
		m0 = new B2Manifold();
		
		m_manifold = m_manifolds[0];
		
		B2Settings.b2Assert(m_shape1.m_type == B2Shape.e_polygonShape);
		B2Settings.b2Assert(m_shape2.m_type == B2Shape.e_circleShape);
		m_manifold.pointCount = 0;
		var point:B2ManifoldPoint = m_manifold.points[0];
		point.normalImpulse = 0.0;
		point.tangentImpulse = 0.0;
	}
	//~b2PolyAndCircleContact() {}
	//
	static var s_evalCP:B2ContactPoint = new B2ContactPoint();
	//
	public override function Evaluate(listener:B2ContactListener): Void{
		var i:Int;
		var v1:B2Vec2;
		var v2:B2Vec2;
		var mp0:B2ManifoldPoint;
		
		var b1:B2Body = m_shape1.m_body;
		var b2:B2Body = m_shape2.m_body;
		
		//b2Manifold m0;
		//memcpy(&m0, &m_manifold, sizeof(b2Manifold));
		// TODO: make sure this is completely necessary
		m0.Set(m_manifold);
		
		B2Collision.b2CollidePolygonAndCircle(m_manifold, cast m_shape1, b1.m_xf, cast m_shape2, b2.m_xf);
		
		var persisted:Array<Bool> = [false, false];
		
		var cp:B2ContactPoint = s_evalCP;
		cp.shape1 = m_shape1;
		cp.shape2 = m_shape2;
		cp.friction = m_friction;
		cp.restitution = m_restitution;
		
		// Match contact ids to facilitate warm starting.
		if (m_manifold.pointCount > 0)
		{
			// Match old contact ids to new contact ids and copy the
			// stored impulses to warm start the solver.
			for (i in 0...m_manifold.pointCount)
			{
				var mp:B2ManifoldPoint = m_manifold.points[ i ];
				mp.normalImpulse = 0.0;
				mp.tangentImpulse = 0.0;
				var found:Bool = false;
				var idKey:Int = mp.id._key;
	
				for (j in 0...m0.pointCount)
				{
					if (persisted[j] == true)
					{
						continue;
					}
	
					mp0 = m0.points[ j ];
	
					if (mp0.id._key == idKey)
					{
						persisted[j] = true;
						mp.normalImpulse = mp0.normalImpulse;
						mp.tangentImpulse = mp0.tangentImpulse;
	
						// A persistent point.
						found = true;
	
						// Report persistent point.
						if (listener != null)
						{
							cp.position = b1.GetWorldPoint(mp.localPoint1);
							v1 = b1.GetLinearVelocityFromLocalPoint(mp.localPoint1);
							v2 = b2.GetLinearVelocityFromLocalPoint(mp.localPoint2);
							cp.velocity.Set(v2.x - v1.x, v2.y - v1.y);
							cp.normal.SetV(m_manifold.normal);
							cp.separation = mp.separation;
							cp.id.key = idKey;
							listener.Persist(cp);
						}
						break;
					}
				}
	
				// Report added point.
				if (found == false && listener != null)
				{
					cp.position = b1.GetWorldPoint(mp.localPoint1);
					v1 = b1.GetLinearVelocityFromLocalPoint(mp.localPoint1);
					v2 = b2.GetLinearVelocityFromLocalPoint(mp.localPoint2);
					cp.velocity.Set(v2.x - v1.x, v2.y - v1.y);
					cp.normal.SetV(m_manifold.normal);
					cp.separation = mp.separation;
					cp.id.key = idKey;
					listener.Add(cp);
				}
			}
			m_manifoldCount = 1;
		}
		else
		{
			m_manifoldCount = 0;
		}
		if (listener == null)
		{
			return;
		}
		// Report removed points.
		for (i in 0...m0.pointCount)
		{
			if (persisted[i])
			{
				continue;
			}
			mp0 = m0.points[ i ];
			cp.position = b1.GetWorldPoint(mp0.localPoint1);
			v1 = b1.GetLinearVelocityFromLocalPoint(mp0.localPoint1);
			v2 = b2.GetLinearVelocityFromLocalPoint(mp0.localPoint2);
			cp.velocity.Set(v2.x - v1.x, v2.y - v1.y);
			cp.normal.SetV(m0.normal);
			cp.separation = mp0.separation;
			cp.id.key = mp0.id._key;
			listener.Remove(cp);
		}
	}
	public override function GetManifolds():Array<B2Manifold>
	{
		return m_manifolds;
	}
	var m_manifolds:Array<B2Manifold> ;
	public var m_manifold:B2Manifold;
	var m0:B2Manifold ;
}