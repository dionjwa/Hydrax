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
import box2D.collision.B2Manifold;
import box2D.dynamics.B2ContactListener;
import box2D.common.math.B2Math;
import box2D.dynamics.B2Body;
import haxe.Int32;
//typedef b2Contact* b2ContactCreateFcn(B2Shape* shape1, B2Shape* shape2, b2BlockAllocator* allocator);
//typedef void b2ContactDestroyFcn(b2Contact* contact, b2BlockAllocator* allocator);
class B2Contact
 {
	
	public  function GetManifolds():Array<B2Manifold>{return null;}
	
	/// Get the number of manifolds. This is 0 or 1 between convex shapes.
	/// This may be greater than 1 for convex-vs-concave shapes. Each
	/// manifold holds up to two contact points with a shared contact normal.
	public function GetManifoldCount():Int
	{
		return m_manifoldCount;
	}
	
	/// Is this contact solid?
	/// @return true if this contact should generate a response.
	public function IsSolid():Bool{
		return (m_flags & e_nonSolidFlag) == 0;
	}
	
	/// Get the next contact in the world's contact list.
	public function GetNext():B2Contact{
		return m_next;
	}
	
	/// Get the first shape in this contact.
	public function GetShape1():B2Shape{
		return m_shape1;
	}
	
	/// Get the second shape in this contact.
	public function GetShape2():B2Shape{
		return m_shape2;
	}
	//--------------- Internals Below -------------------
	
	// m_flags
	// enum
	public static var e_nonSolidFlag:Int	= 0x0001;
	public static var e_slowFlag:Int		= 0x0002;
	public static var e_islandFlag:Int		= 0x0004;
	public static var e_toiFlag:Int			= 0x0008;
	
	
	public static function AddType(createFcn:Dynamic, destroyFcn:Dynamic, type1:Int, type2:Int) : Void
	{
		//B2Settings.b2Assert(B2Shape.e_unknownShape < type1 && type1 < B2Shape.e_shapeTypeCount);
		//B2Settings.b2Assert(B2Shape.e_unknownShape < type2 && type2 < B2Shape.e_shapeTypeCount);
		
		s_registers[type1][type2].createFcn = createFcn;
		s_registers[type1][type2].destroyFcn = destroyFcn;
		s_registers[type1][type2].primary = true;
		
		if (type1 != type2)
		{
			s_registers[type2][type1].createFcn = createFcn;
			s_registers[type2][type1].destroyFcn = destroyFcn;
			s_registers[type2][type1].primary = false;
		}
	}
	public static function InitializeRegisters() : Void{
		s_registers = new Array();
		for (i in 0...B2Shape.e_shapeTypeCount){
			s_registers[i] = new Array();
			for (j in 0...B2Shape.e_shapeTypeCount){
				s_registers[i][j] = new B2ContactRegister();
			}
		}
		
		AddType(B2CircleContact.Create, B2CircleContact.Destroy, B2Shape.e_circleShape, B2Shape.e_circleShape);
		AddType(B2PolyAndCircleContact.Create, B2PolyAndCircleContact.Destroy, B2Shape.e_polygonShape, B2Shape.e_circleShape);
		AddType(B2PolygonContact.Create, B2PolygonContact.Destroy, B2Shape.e_polygonShape, B2Shape.e_polygonShape);
		
	}
	public static function Create(shape1:B2Shape, shape2:B2Shape, allocator:Dynamic):B2Contact{
		if (s_initialized == false)
		{
			InitializeRegisters();
			s_initialized = true;
		}
		
		var type1:Int = shape1.m_type;
		var type2:Int = shape2.m_type;
		
		//B2Settings.b2Assert(B2Shape.e_unknownShape < type1 && type1 < B2Shape.e_shapeTypeCount);
		//B2Settings.b2Assert(B2Shape.e_unknownShape < type2 && type2 < B2Shape.e_shapeTypeCount);
		
		var reg:B2ContactRegister = s_registers[type1][type2];
		var createFcn:Dynamic = reg.createFcn;
		if (createFcn != null)
		{
			if (reg.primary)
			{
				return createFcn(shape1, shape2, allocator);
			}
			else
			{
				var c:B2Contact = createFcn(shape2, shape1, allocator);
				for (i in 0...c.m_manifoldCount)
				{
					var m:B2Manifold = c.GetManifolds()[ i ];
					m.normal = m.normal.Negative();
				}
				return c;
			}
		}
		else
		{
			return null;
		}
	}
	public static function Destroy(contact:B2Contact, allocator:Dynamic) : Void{
		//B2Settings.b2Assert(s_initialized == true);
		
		if (contact.m_manifoldCount > 0)
		{
			contact.m_shape1.m_body.WakeUp();
			contact.m_shape2.m_body.WakeUp();
		}
		
		var type1:Int = contact.m_shape1.m_type;
		var type2:Int = contact.m_shape2.m_type;
		
		//B2Settings.b2Assert(B2Shape.e_unknownShape < type1 && type1 < B2Shape.e_shapeTypeCount);
		//B2Settings.b2Assert(B2Shape.e_unknownShape < type2 && type2 < B2Shape.e_shapeTypeCount);
		
		var reg:B2ContactRegister = s_registers[type1][type2];
		var destroyFcn:Dynamic = reg.destroyFcn;
		destroyFcn(contact, allocator);
	}
	
	public var m_flags:Int;
	// World pool and list pointers.
	public var m_prev:B2Contact;
	public var m_next:B2Contact;
	// Nodes for connecting bodies.
	public var m_node1:B2ContactEdge ;
	public var m_node2:B2ContactEdge ;
	public var m_shape1:B2Shape;
	public var m_shape2:B2Shape;
	public var m_manifoldCount:Int;
	// Combined friction
	public var m_friction:Float;
	public var m_restitution:Float;
	
	public var m_toi:Float;
	
	public function new(?s1:B2Shape=null, ?s2:B2Shape=null)
	{
		
		m_node1 = new B2ContactEdge();
		m_node2 = new B2ContactEdge();
		m_flags = 0;
		
		if ((s1 == null) || s2 == null){
			m_shape1 = null;
			m_shape2 = null;
			return;
		}
		
		if (s1.IsSensor() || s2.IsSensor())
		{
			m_flags |= e_nonSolidFlag;
		}
		
		m_shape1 = s1;
		m_shape2 = s2;
		
		m_manifoldCount = 0;
		
		m_friction = Math.sqrt(m_shape1.m_friction * m_shape2.m_friction);
		m_restitution = B2Math.b2Max(m_shape1.m_restitution, m_shape2.m_restitution);
		
		m_prev = null;
		m_next = null;
		
		m_node1.contact = null;
		m_node1.prev = null;
		m_node1.next = null;
		m_node1.other = null;
		
		m_node2.contact = null;
		m_node2.prev = null;
		m_node2.next = null;
		m_node2.other = null;
	}
	
	public function Update(listener:B2ContactListener) : Void
	{
		var oldCount:Int = m_manifoldCount;
		
		Evaluate(listener);
		
		var newCount:Int = m_manifoldCount;
		
		var body1:B2Body = m_shape1.m_body;
		var body2:B2Body = m_shape2.m_body;
		
		if (newCount == 0 && oldCount > 0)
		{
			body1.WakeUp();
			body2.WakeUp();
		}
		
		// Slow contacts don't generate TOI events.
		if (body1.IsStatic() || body1.IsBullet() || body2.IsStatic() || body2.IsBullet())
		{
			m_flags &= B2Math.complement(e_slowFlag);
		}
		else
		{
			m_flags |= e_slowFlag;
		}
	}
	// ~b2Contact() {}
	public  function Evaluate(listener:B2ContactListener) : Void{}
	public static var s_registers:Array<Array<B2ContactRegister>>; //[][];
	public static var s_initialized:Bool = false;
	
}