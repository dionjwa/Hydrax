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
import box2D.dynamics.B2Body;
import box2D.dynamics.B2TimeStep;
/// The base joint class. Joints are used to constraint two bodies together in
/// various fashions. Some joints also feature limits and motors.
class B2Joint
 {
	/// Get the type of the concrete joint.
	
	/// Get the type of the concrete joint.
	public function GetType():Int{
		return m_type;
	}
	
	/// Get the anchor point on body1 in world coordinates.
	public  function GetAnchor1():B2Vec2{return null;}
	/// Get the anchor point on body2 in world coordinates.
	public  function GetAnchor2():B2Vec2{return null;}
	
	/// Get the reaction force on body2 at the joint anchor.
	public  function GetReactionForce():B2Vec2 {return null;}
	/// Get the reaction torque on body2.
	public  function GetReactionTorque():Float {return 0.0;}
	
	/// Get the first body attached to this joint.
	public function GetBody1():B2Body
	{
		return m_body1;
	}
	
	/// Get the second body attached to this joint.
	public function GetBody2():B2Body
	{
		return m_body2;
	}
	/// Get the next joint the world joint list.
	public function GetNext():B2Joint{
		return m_next;
	}
	/// Get the user data pointer.
	public function GetUserData():Dynamic{
		return m_userData;
	}
	/// Set the user data pointer.
	public function SetUserData(data:Dynamic):Void{
		m_userData = data;
	}
	//--------------- Internals Below -------------------
	public static function Create(def:B2JointDef, ?allocator:Dynamic):B2Joint{
		var joint:B2Joint = null;
		switch (def.type)
		{
			case e_distanceJoint:
				joint = new B2DistanceJoint(cast def);
			case e_mouseJoint:
				joint = new B2MouseJoint(cast def);
			case e_prismaticJoint:
				joint = new B2PrismaticJoint(cast def);
			case e_revoluteJoint:
				joint = new B2RevoluteJoint(cast def);
			case e_pulleyJoint:
				joint = new B2PulleyJoint(cast def);
			case e_gearJoint:
				joint = new B2GearJoint(cast def);
			default:
				//B2Settings.b2Assert(false);
				joint = null;
			
		}
		return joint;
		
		
	}
	
	public static function Destroy(joint:B2Joint, ?allocator:Dynamic) : Void{
		/*joint->~B2Joint();
		switch (joint.m_type)
		{
		case e_distanceJoint:
			allocator->Free(joint, sizeof(b2DistanceJoint));
			break;
		
		case e_mouseJoint:
			allocator->Free(joint, sizeof(b2MouseJoint));
			break;
		
		case e_prismaticJoint:
			allocator->Free(joint, sizeof(b2PrismaticJoint));
			break;
		
		case e_revoluteJoint:
			allocator->Free(joint, sizeof(b2RevoluteJoint));
			break;
		
		case e_pulleyJoint:
			allocator->Free(joint, sizeof(b2PulleyJoint));
			break;
		
		case e_gearJoint:
			allocator->Free(joint, sizeof(b2GearJoint));
			break;
		
		default:
			b2Assert(false);
			break;
		}*/
	}
	public function new(def:B2JointDef){
		m_node1 = new B2JointEdge();
		m_node2 = new B2JointEdge();
		
		m_type = def.type;
		m_prev = null;
		m_next = null;
		m_body1 = def.body1;
		m_body2 = def.body2;
		m_collideConnected = def.collideConnected;
		m_islandFlag = false;
		m_userData = def.userData;
	}
	// ~B2Joint() {}
	public  function InitVelocityConstraints(step:B2TimeStep) : Void{}
	public  function SolveVelocityConstraints(step:B2TimeStep) : Void{}
	// This returns true if the position errors are within tolerance.
	public  function InitPositionConstraints() : Void{}
	public  function SolvePositionConstraints():Bool{return false;}
	public var m_type:Int;
	public var m_prev:B2Joint;
	public var m_next:B2Joint;
	public var m_node1:B2JointEdge ;
	public var m_node2:B2JointEdge ;
	public var m_body1:B2Body;
	public var m_body2:B2Body;
	public var m_inv_dt:Float;
	public var m_islandFlag:Bool;
	public var m_collideConnected:Bool;
	public var m_userData:Dynamic;
	
	
	// ENUMS
	
	// enum B2JointType
	public static inline var e_unknownJoint:Int = 0;
	public static inline var e_revoluteJoint:Int = 1;
	public static inline var e_prismaticJoint:Int = 2;
	public static inline var e_distanceJoint:Int = 3;
	public static inline var e_pulleyJoint:Int = 4;
	public static inline var e_mouseJoint:Int = 5;
	public static inline var e_gearJoint:Int = 6;
	// enum b2LimitState
	public static inline var e_inactiveLimit:Int = 0;
	public static inline var e_atLowerLimit:Int = 1;
	public static inline var e_atUpperLimit:Int = 2;
	public static inline var e_equalLimits:Int = 3;
	
}