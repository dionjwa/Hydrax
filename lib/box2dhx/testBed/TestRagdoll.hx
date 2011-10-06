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
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.joints.B2RevoluteJointDef;
	
	
	
class TestRagdoll extends Test
{
	
	public function new(){
		
		super();
		// Set Text field
		Main.m_aboutText.text = "Ragdolls";
		
		var bd:B2BodyDef;
		var circ:B2CircleDef = new B2CircleDef();
		var box:B2PolygonDef = new B2PolygonDef();
		var jd:B2RevoluteJointDef = new B2RevoluteJointDef();
		var head:B2Body;
		// Add 5 ragdolls along the top
		for (i in 0...2) {
			var startX:Float = 70 + Math.random() * 20 + 480 * i;
			var startY:Float = 20 + Math.random() * 50;
			
			// BODIES
			
			// Head
			circ.radius = 12.5 / m_physScale;
			circ.density = 1.0;
			circ.friction = 0.4;
			circ.restitution = 0.3;
			bd = new B2BodyDef();
			bd.position.Set(startX / m_physScale, startY / m_physScale);
			head = m_world.CreateBody(bd);
			head.CreateShape(circ);
			head.SetMassFromShapes();
			//if (i == 0){
				head.ApplyImpulse(new B2Vec2(Math.random() * 100 - 50, Math.random() * 100 - 50), head.GetWorldCenter());
			//}
			
			// Torso1
			box.SetAsBox(15 / m_physScale, 10 / m_physScale);
			box.density = 1.0;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new B2BodyDef();
			bd.position.Set(startX / m_physScale, (startY + 28) / m_physScale);
			var torso1:B2Body = m_world.CreateBody(bd);
			torso1.CreateShape(box);
			torso1.SetMassFromShapes();
			// Torso2
			bd = new B2BodyDef();
			bd.position.Set(startX / m_physScale, (startY + 43) / m_physScale);
			var torso2:B2Body = m_world.CreateBody(bd);
			torso2.CreateShape(box);
			torso2.SetMassFromShapes();
			// Torso3
			bd = new B2BodyDef();
			bd.position.Set(startX / m_physScale, (startY + 58) / m_physScale);
			var torso3:B2Body = m_world.CreateBody(bd);
			torso3.CreateShape(box);
			torso3.SetMassFromShapes();
			
			// UpperArm
			box.SetAsBox(18 / m_physScale, 6.5 / m_physScale);
			box.density = 1.0;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new B2BodyDef();
			// L
			bd.position.Set((startX - 30) / m_physScale, (startY + 20) / m_physScale);
			var upperArmL:B2Body = m_world.CreateBody(bd);
			upperArmL.CreateShape(box);
			upperArmL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 30) / m_physScale, (startY + 20) / m_physScale);
			var upperArmR:B2Body = m_world.CreateBody(bd);
			upperArmR.CreateShape(box);
			upperArmR.SetMassFromShapes();
			
			// LowerArm
			box.SetAsBox(17 / m_physScale, 6 / m_physScale);
			box.density = 1.0;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new B2BodyDef();
			// L
			bd.position.Set((startX - 57) / m_physScale, (startY + 20) / m_physScale);
			var lowerArmL:B2Body = m_world.CreateBody(bd);
			lowerArmL.CreateShape(box);
			lowerArmL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 57) / m_physScale, (startY + 20) / m_physScale);
			var lowerArmR:B2Body = m_world.CreateBody(bd);
			lowerArmR.CreateShape(box);
			lowerArmR.SetMassFromShapes();
			
			// UpperLeg
			box.SetAsBox(7.5 / m_physScale, 22 / m_physScale);
			box.density = 1.0;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new B2BodyDef();
			// L
			bd.position.Set((startX - 8) / m_physScale, (startY + 85) / m_physScale);
			var upperLegL:B2Body = m_world.CreateBody(bd);
			upperLegL.CreateShape(box);
			upperLegL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 8) / m_physScale, (startY + 85) / m_physScale);
			var upperLegR:B2Body = m_world.CreateBody(bd);
			upperLegR.CreateShape(box);
			upperLegR.SetMassFromShapes();
			
			// LowerLeg
			box.SetAsBox(6 / m_physScale, 20 / m_physScale);
			box.density = 1.0;
			box.friction = 0.4;
			box.restitution = 0.1;
			bd = new B2BodyDef();
			// L
			bd.position.Set((startX - 8) / m_physScale, (startY + 120) / m_physScale);
			var lowerLegL:B2Body = m_world.CreateBody(bd);
			lowerLegL.CreateShape(box);
			lowerLegL.SetMassFromShapes();
			// R
			bd.position.Set((startX + 8) / m_physScale, (startY + 120) / m_physScale);
			var lowerLegR:B2Body = m_world.CreateBody(bd);
			lowerLegR.CreateShape(box);
			lowerLegR.SetMassFromShapes();
			
			
			// JOINTS
			jd.enableLimit = true;
			
			// Head to shoulders
			jd.lowerAngle = -40 / (180/Math.PI);
			jd.upperAngle = 40 / (180/Math.PI);
			jd.Initialize(torso1, head, new B2Vec2(startX / m_physScale, (startY + 15) / m_physScale));
			m_world.CreateJoint(jd);
			
			// Upper arm to shoulders
			// L
			jd.lowerAngle = -85 / (180/Math.PI);
			jd.upperAngle = 130 / (180/Math.PI);
			jd.Initialize(torso1, upperArmL, new B2Vec2((startX - 18) / m_physScale, (startY + 20) / m_physScale));
			m_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -130 / (180/Math.PI);
			jd.upperAngle = 85 / (180/Math.PI);
			jd.Initialize(torso1, upperArmR, new B2Vec2((startX + 18) / m_physScale, (startY + 20) / m_physScale));
			m_world.CreateJoint(jd);
			
			// Lower arm to upper arm
			// L
			jd.lowerAngle = -130 / (180/Math.PI);
			jd.upperAngle = 10 / (180/Math.PI);
			jd.Initialize(upperArmL, lowerArmL, new B2Vec2((startX - 45) / m_physScale, (startY + 20) / m_physScale));
			m_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -10 / (180/Math.PI);
			jd.upperAngle = 130 / (180/Math.PI);
			jd.Initialize(upperArmR, lowerArmR, new B2Vec2((startX + 45) / m_physScale, (startY + 20) / m_physScale));
			m_world.CreateJoint(jd);
			
			// Shoulders/stomach
			jd.lowerAngle = -15 / (180/Math.PI);
			jd.upperAngle = 15 / (180/Math.PI);
			jd.Initialize(torso1, torso2, new B2Vec2(startX / m_physScale, (startY + 35) / m_physScale));
			m_world.CreateJoint(jd);
			// Stomach/hips
			jd.Initialize(torso2, torso3, new B2Vec2(startX / m_physScale, (startY + 50) / m_physScale));
			m_world.CreateJoint(jd);
			
			// Torso to upper leg
			// L
			jd.lowerAngle = -25 / (180/Math.PI);
			jd.upperAngle = 45 / (180/Math.PI);
			jd.Initialize(torso3, upperLegL, new B2Vec2((startX - 8) / m_physScale, (startY + 72) / m_physScale));
			m_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -45 / (180/Math.PI);
			jd.upperAngle = 25 / (180/Math.PI);
			jd.Initialize(torso3, upperLegR, new B2Vec2((startX + 8) / m_physScale, (startY + 72) / m_physScale));
			m_world.CreateJoint(jd);
			
			// Upper leg to lower leg
			// L
			jd.lowerAngle = -25 / (180/Math.PI);
			jd.upperAngle = 115 / (180/Math.PI);
			jd.Initialize(upperLegL, lowerLegL, new B2Vec2((startX - 8) / m_physScale, (startY + 105) / m_physScale));
			m_world.CreateJoint(jd);
			// R
			jd.lowerAngle = -115 / (180/Math.PI);
			jd.upperAngle = 25 / (180/Math.PI);
			jd.Initialize(upperLegR, lowerLegR, new B2Vec2((startX + 8) / m_physScale, (startY + 105) / m_physScale));
			m_world.CreateJoint(jd);
			
		}
		
		
		// Add stairs on the left
		for (j in 1...11) {
			box.SetAsBox((10*j) / m_physScale, 10 / m_physScale);
			box.density = 0.0;
			box.friction = 0.4;
			box.restitution = 0.3;
			bd = new B2BodyDef();
			bd.position.Set((10*j) / m_physScale, (150 + 20*j) / m_physScale);
			head = m_world.CreateBody(bd);
			head.CreateShape(box);
			head.SetMassFromShapes();
		}
		
		// Add stairs on the right
		for (k in 1...11) {
			box.SetAsBox((10*k) / m_physScale, 10 / m_physScale);
			box.density = 0.0;
			box.friction = 0.4;
			box.restitution = 0.3;
			bd = new B2BodyDef();
			bd.position.Set((640-10*k) / m_physScale, (150 + 20*k) / m_physScale);
			head = m_world.CreateBody(bd);
			head.CreateShape(box);
			head.SetMassFromShapes();
		}
		
		box.SetAsBox(30 / m_physScale, 40 / m_physScale);
		box.density = 0.0;
		box.friction = 0.4;
		box.restitution = 0.3;
		bd = new B2BodyDef();
		bd.position.Set(320 / m_physScale, 320 / m_physScale);
		head = m_world.CreateBody(bd);
		head.CreateShape(box);
		head.SetMassFromShapes();
		
		
	}
	
	
	//======================
	// Member Data 
	//======================
}
	
