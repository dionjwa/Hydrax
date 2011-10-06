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
package testBed;
import box2D.collision.shapes.B2CircleDef;
import box2D.collision.shapes.B2PolygonDef;
import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.joints.B2DistanceJointDef;
import box2D.dynamics.joints.B2RevoluteJoint;
import box2D.dynamics.joints.B2RevoluteJointDef;
import general.Input;
	
	
	
class TestTheoJansen extends Test{
	
	public function new(){
		
		super();
		m_motorOn = true;
		m_offset = new B2Vec2();
		
		// Set Text field
		Main.m_aboutText.text = "Theo Jansen Walker";
		
		// scale walker by variable to easily change size
		tScale = m_physScale * 2;
		
		// Set position in world space
		m_offset.Set(120.0/m_physScale, 250/m_physScale);
		m_motorSpeed = -2.0;
		m_motorOn = true;
		var pivot:B2Vec2 = new B2Vec2(0.0, -24.0/tScale);
		
		var pd:B2PolygonDef;
		var cd:B2CircleDef;
		var bd:B2BodyDef;
		var body:B2Body;
		for (i in 0...40)
		{
			cd = new B2CircleDef();
			cd.density = 1.0;
			cd.radius = 7.5/tScale;
			
			bd = new B2BodyDef();
			// Position in world space
			bd.position.Set((Math.random() * 620 + 10)/m_physScale, 350/m_physScale);
			
			body = m_world.CreateBody(bd);
			body.CreateShape(cd);
			body.SetMassFromShapes();
		}
		
		{
			pd = new B2PolygonDef();
			pd.density = 1.0;
			pd.SetAsBox(75/tScale, 30/tScale);
			pd.filter.groupIndex = -1;
			bd = new B2BodyDef();
			//bd.position = pivot + m_offset;
			bd.position = B2Math.AddVV(pivot, m_offset);
			m_chassis = m_world.CreateBody(bd);
			m_chassis.CreateShape(pd);
			m_chassis.SetMassFromShapes();
		}
		
		{
			cd = new B2CircleDef();
			cd.density = 1.0;
			cd.radius = 48/tScale;
			cd.filter.groupIndex = -1;
			bd = new B2BodyDef();
			//bd.position = pivot + m_offset;
			bd.position = B2Math.AddVV(pivot, m_offset);
			m_wheel = m_world.CreateBody(bd);
			m_wheel.CreateShape(cd);
			m_wheel.SetMassFromShapes();
		}
		
		{
			var jd:B2RevoluteJointDef = new B2RevoluteJointDef();
			var po:B2Vec2 = pivot.Copy();
			po.Add(m_offset);
			jd.Initialize(m_wheel, m_chassis, po);
			jd.collideConnected = false;
			jd.motorSpeed = m_motorSpeed;
			jd.maxMotorTorque = 400.0;
			jd.enableMotor = m_motorOn;
			m_motorJoint = cast m_world.CreateJoint(jd);
		}
		
		var wheelAnchor:B2Vec2;
		
		//wheelAnchor = pivot + B2Vec2(0.0f, -0.8);
		wheelAnchor = new B2Vec2(0.0, 24.0/tScale);
		wheelAnchor.Add(pivot);
		
		CreateLeg(-1.0, wheelAnchor);
		CreateLeg(1.0, wheelAnchor);
		
		m_wheel.SetXForm(m_wheel.GetPosition(), 120.0 * Math.PI / 180.0);
		CreateLeg(-1.0, wheelAnchor);
		CreateLeg(1.0, wheelAnchor);
		
		m_wheel.SetXForm(m_wheel.GetPosition(), -120.0 * Math.PI / 180.0);
		CreateLeg(-1.0, wheelAnchor);
		CreateLeg(1.0, wheelAnchor);
		
		
	}
	
	
	
	private function CreateLeg(s:Float, wheelAnchor:B2Vec2){
		
		var p1:B2Vec2 = new B2Vec2(162 * s/tScale, 183/tScale);
		var p2:B2Vec2 = new B2Vec2(216 * s/tScale, 36 /tScale);
		var p3:B2Vec2 = new B2Vec2(129 * s/tScale, 57 /tScale);
		var p4:B2Vec2 = new B2Vec2( 93 * s/tScale, -24  /tScale);
		var p5:B2Vec2 = new B2Vec2(180 * s/tScale, -45  /tScale);
		var p6:B2Vec2 = new B2Vec2( 75 * s/tScale, -111 /tScale);
		
		//B2PolygonDef sd1, sd2;
		var sd1:B2PolygonDef = new B2PolygonDef();
		var sd2:B2PolygonDef = new B2PolygonDef();
		sd1.vertexCount = 3;
		sd2.vertexCount = 3;
		sd1.filter.groupIndex = -1;
		sd2.filter.groupIndex = -1;
		sd1.density = 1.0;
		sd2.density = 1.0;
		
		if (s > 0.0)
		{
			sd1.vertices[2] = p1;
			sd1.vertices[1] = p2;
			sd1.vertices[0] = p3;
			
			sd2.vertices[2] = new B2Vec2();
			sd2.vertices[1] = B2Math.SubtractVV(p5, p4);
			sd2.vertices[0] = B2Math.SubtractVV(p6, p4);
		}
		else
		{
			sd1.vertices[2] = p1;
			sd1.vertices[1] = p3;
			sd1.vertices[0] = p2;
			
			sd2.vertices[2] = new B2Vec2();
			sd2.vertices[1] = B2Math.SubtractVV(p6, p4);
			sd2.vertices[0] = B2Math.SubtractVV(p5, p4);
		}
		
		//B2BodyDef bd1, bd2;
		var bd1:B2BodyDef = new B2BodyDef();
		var bd2:B2BodyDef = new B2BodyDef();
		bd1.position.SetV(m_offset);
		bd2.position = B2Math.AddVV(p4, m_offset);
		
		bd1.angularDamping = 10.0;
		bd2.angularDamping = 10.0;
		
		var body1:B2Body = m_world.CreateBody(bd1);
		var body2:B2Body = m_world.CreateBody(bd2);
		
		body1.CreateShape(sd1);
		body2.CreateShape(sd2);
		
		body1.SetMassFromShapes();
		body2.SetMassFromShapes();
		
		var djd:B2DistanceJointDef = new B2DistanceJointDef();
		
		djd.Initialize(body1, body2, B2Math.AddVV(p2, m_offset), B2Math.AddVV(p5, m_offset));
		m_world.CreateJoint(djd);
		
		djd.Initialize(body1, body2, B2Math.AddVV(p3, m_offset), B2Math.AddVV(p4, m_offset));
		m_world.CreateJoint(djd);
		
		djd.Initialize(body1, m_wheel, B2Math.AddVV(p3, m_offset), B2Math.AddVV(wheelAnchor, m_offset));
		m_world.CreateJoint(djd);
		
		djd.Initialize(body2, m_wheel, B2Math.AddVV(p6, m_offset), B2Math.AddVV(wheelAnchor, m_offset));
		m_world.CreateJoint(djd);
		
		var rjd:B2RevoluteJointDef = new B2RevoluteJointDef();
		
		rjd.Initialize(body2, m_chassis, B2Math.AddVV(p4, m_offset));
		m_world.CreateJoint(rjd);
		
	}
	
	
	
	public override function Update():Void{
		
		//case 'a':
		if (Input.isKeyPressed(65)){ // A
			m_chassis.WakeUp();
			m_motorJoint.SetMotorSpeed(-m_motorSpeed);
		}
		//case 's':
		if (Input.isKeyPressed(83)){ // S
			m_chassis.WakeUp();
			m_motorJoint.SetMotorSpeed(0.0);
		}
		//case 'd':
		if (Input.isKeyPressed(68)){ // D
			m_chassis.WakeUp();
			m_motorJoint.SetMotorSpeed(m_motorSpeed);
		}
		//case 'm':
		if (Input.isKeyPressed(77)){ // M
			m_chassis.WakeUp();
			m_motorJoint.EnableMotor(!m_motorJoint.IsMotorEnabled());
		}
		
		// Finally update super class
		super.Update();
	}
	
	
	//======================
	// Member Data 
	//======================
	private var tScale:Float;
	
	private var m_offset:B2Vec2;
	private var m_chassis:B2Body;
	private var m_wheel:B2Body;
	private var m_motorJoint:B2RevoluteJoint;
	private var m_motorOn:Bool;
	private var m_motorSpeed:Float;
	
}
