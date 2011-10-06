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

import box2D.dynamics.B2Body;
import box2D.common.math.B2XForm;
import box2D.common.math.B2Vec2;
import box2D.collision.B2Segment;
import box2D.collision.B2AABB;
import box2D.collision.B2BroadPhase;
import box2D.collision.B2Pair;
/// A shape is used for collision detection. Shapes are created in b2World.
/// You can use shape for collision detection before they are attached to the world.
/// @warning you cannot reuse shapes.
class B2Shape
 {
	/// Get the type of this shape. You can use this to down cast to the concrete shape.
	/// @return the shape type.
	
	/// Get the type of this shape. You can use this to down cast to the concrete shape.
	/// @return the shape type.
	public function GetType() : Int{
		return m_type;
	}
	/// Is this shape a sensor (non-solid)?
	/// @return the true if the shape is a sensor.
	public function IsSensor() : Bool{
		return m_isSensor;
	}
	/// Set the contact filtering data. You must call b2World::Refilter to correct
	/// existing contacts/non-contacts.
	public function SetFilterData(filter:B2FilterData) : Void
	{
		m_filter = filter.Copy();
	}
	/// Get the contact filtering data.
	public function GetFilterData() :B2FilterData
	{
		return m_filter.Copy();
	}
	/// Get the parent body of this shape. This is NULL if the shape is not attached.
	/// @return the parent body.
	public inline function GetBody() :B2Body{
		return m_body;
	}
	/// Get the next shape in the parent body's shape list.
	/// @return the next shape.
	public inline function GetNext() :B2Shape{
		return m_next;
	}
	/// Get the user data that was assigned in the shape definition. Use this to
	/// store your application specific data.
	public function GetUserData() : Dynamic{
		return m_userData;
	}
	/// Set the user data. Use this to store your application specific data.
	public function SetUserData(data:Dynamic) : Void
	{
		m_userData = data;
	}
	/// Test a point for containment in this shape. This only works for convex shapes.
	/// @param xf the shape world transform.
	/// @param p a point in world coordinates.
	public  function TestPoint(xf:B2XForm, p:B2Vec2) : Bool {return false;}
	/// Perform a ray cast against this shape.
	/// @param xf the shape world transform.
	/// @param lambda returns the hit fraction. You can use this to compute the contact point
	/// p = (1 - lambda) * segment.p1 + lambda * segment.p2.
	/// @param normal returns the normal at the contact point. If there is no intersection, the normal
	/// is not set.
	/// @param segment defines the begin and end point of the ray cast.
	/// @param maxLambda a number typically in the range [0,1].
	/// @return true if there was an intersection.
	public  function  TestSegment(xf:B2XForm,
								lambda:Array<Float>, // float pointer
								normal:B2Vec2, // pointer
								segment:B2Segment,
								maxLambda:Float) : Bool {return false;}
	/// Given a transform, compute the associated axis aligned bounding box for this shape.
	/// @param aabb returns the axis aligned box.
	/// @param xf the world transform of the shape.
	public  function  ComputeAABB(aabb:B2AABB, xf:B2XForm) : Void {}
	/// Given two transforms, compute the associated swept axis aligned bounding box for this shape.
	/// @param aabb returns the axis aligned box.
	/// @param xf1 the starting shape world transform.
	/// @param xf2 the ending shape world transform.
	public  function  ComputeSweptAABB(	aabb:B2AABB,
									xf1:B2XForm,
									xf2:B2XForm) : Void {}
	/// Compute the mass properties of this shape using its dimensions and density.
	/// The inertia tensor is computed about the local origin, not the centroid.
	/// @param massData returns the mass data for this shape.
	public  function  ComputeMass(massData:B2MassData) : Void {}
	/// Get the maximum radius about the parent body's center of mass.
	public function GetSweepRadius() : Float
	{
		return m_sweepRadius;
	}
	/// Get the coefficient of friction.
	public function GetFriction() : Float
	{
		return m_friction;
	}
	/// Get the coefficient of restitution.
	public function GetRestitution() : Float
	{
		return m_restitution;
	}
	
	//--------------- Internals Below -------------------
	public static function Create(def:B2ShapeDef, allocator:Dynamic) :B2Shape
	{
		switch (def.type)
		{
		case e_circleShape:
			{
				//void* mem = allocator->Allocate(sizeof(b2CircleShape));
				return new B2CircleShape(def);
			}
		
		case e_polygonShape:
			{
				//void* mem = allocator->Allocate(sizeof(b2PolygonShape));
				return new B2PolygonShape(def);
			}
		
		default:
			//B2Settings.b2Assert(false);
			return null;
		}
	}
	
	public static function Destroy(shape:B2Shape, allocator:Dynamic) : Void
	{
		/*switch (s.m_type)
		{
		case e_circleShape:
			//s->~B2Shape();
			//allocator->Free(s, sizeof(b2CircleShape));
			break;
		
		case e_polygonShape:
			//s->~B2Shape();
			//allocator->Free(s, sizeof(b2PolygonShape));
			break;
		
		default:
			//B2Settings.b2Assert(false);
		}*/
	}
	public function new(def:B2ShapeDef){
		
		m_userData = def.userData;
		m_friction = def.friction;
		m_restitution = def.restitution;
		m_density = def.density;
		m_body = null;
		m_sweepRadius = 0.0;
		
		m_next = null;
		
		m_proxyId = B2Pair.b2_nullProxy;
		
		m_filter = def.filter.Copy();
		
		m_isSensor = def.isSensor;
		
	}
	
	// ~B2Shape();
	//
	static var s_proxyAABB:B2AABB = new B2AABB();
	public function CreateProxy(broadPhase:B2BroadPhase, transform:B2XForm) : Void{
		
		//B2Settings.b2Assert(m_proxyId == b2_nullProxy);
		
		var aabb:B2AABB = s_proxyAABB;
		ComputeAABB(aabb, transform);
		
		var inRange:Bool = broadPhase.InRange(aabb);
		
		// You are creating a shape outside the world box.
		//B2Settings.b2Assert(inRange);
		
		if (inRange)
		{
			m_proxyId = broadPhase.CreateProxy(aabb, this);
		}
		else
		{
			m_proxyId = B2Pair.b2_nullProxy;
		}
		
	}
	
	public function DestroyProxy(broadPhase:B2BroadPhase) : Void{
		
		if (m_proxyId != B2Pair.b2_nullProxy)
		{
			broadPhase.DestroyProxy(m_proxyId);
			m_proxyId = B2Pair.b2_nullProxy;
		}
		
	}
	
	//
	static var s_syncAABB:B2AABB = new B2AABB();
	//
	public function Synchronize(broadPhase:B2BroadPhase, transform1:B2XForm, transform2:B2XForm) : Bool{
		
		if (m_proxyId == B2Pair.b2_nullProxy)
		{	
			return false;
		}
		
		// Compute an AABB that covers the swept shape (may miss some rotation effect).
		var aabb:B2AABB = s_syncAABB;
		ComputeSweptAABB(aabb, transform1, transform2);
		
		if (broadPhase.InRange(aabb))
		{
			broadPhase.MoveProxy(m_proxyId, aabb);
			return true;
		}
		else
		{
			return false;
		}
		
	}
	
	static var s_resetAABB:B2AABB = new B2AABB();
	public function RefilterProxy(broadPhase:B2BroadPhase, transform:B2XForm) : Void{
		
		if (m_proxyId == B2Pair.b2_nullProxy)
		{
			return;
		}
		
		broadPhase.DestroyProxy(m_proxyId);
		
		var aabb:B2AABB = s_resetAABB;
		ComputeAABB(aabb, transform);
		
		var inRange:Bool = broadPhase.InRange(aabb);
		
		if (inRange)
		{
			m_proxyId = broadPhase.CreateProxy(aabb, this);
		}
		else
		{
			m_proxyId = B2Pair.b2_nullProxy;
		}
		
	}
	public  function UpdateSweepRadius(center:B2Vec2) : Void{}
	public var m_type:Int;
	public var m_next:B2Shape;
	public var m_body:B2Body;
	// Sweep radius relative to the parent body's center of mass.
	public var m_sweepRadius:Float;
	public var m_density:Float;
	public var m_friction:Float;
	public var m_restitution:Float;
	public var m_proxyId:Int;
	public var m_filter:B2FilterData;
	public var m_isSensor:Bool;
	public var m_userData:Dynamic;
	
	
	
	/// The various collision shape types supported by Box2D.
	//enum B2ShapeType
	//{
		public static inline var e_unknownShape:Int = 	-1;
		public static inline var e_circleShape:Int = 	0;
		public static inline var e_polygonShape:Int = 	1;
		public static inline var e_shapeTypeCount:Int = 	2;
	//}
	
	
	
}