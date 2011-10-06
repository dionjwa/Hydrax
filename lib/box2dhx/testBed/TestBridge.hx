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
	
	
	
	
	
class TestBridge extends Test{
	
	public function new(){
		super();
		
		// Set Text field
		Main.m_aboutText.text = "Bridge";
		
		var ground:B2Body = m_world.GetGroundBody();
		
		var anchor:B2Vec2 = new B2Vec2();
		var body:B2Body;
		
		// Bridge
		
		var sd:B2PolygonDef = new B2PolygonDef();
		sd.SetAsBox(24.0 / m_physScale, 5.0 / m_physScale);
		sd.density = 20.0;
		sd.friction = 0.2;
		
		var bd = new B2BodyDef();
		
		var jd:B2RevoluteJointDef = new B2RevoluteJointDef();
		var numPlanks:Int = 10;
		jd.lowerAngle = -15.0 / (180.0/Math.PI);
		jd.upperAngle = 15.0 / (180.0/Math.PI);
		jd.enableLimit = true;
		
		var prevBody:B2Body = ground;
		for (i in 0...numPlanks) {
			bd.position.Set((100.0 + 22.0 + 44.0 * i) / m_physScale, 250.0 / m_physScale);
			body = m_world.CreateBody(bd);
			body.CreateShape(sd);
			body.SetMassFromShapes();
			
			anchor.Set((100.0 + 44.0 * i) / m_physScale, 250.0 / m_physScale);
			jd.Initialize(prevBody, body, anchor);
			m_world.CreateJoint(jd);
			
			prevBody = body;
		}
		
		anchor.Set((100.0 + 44.0 * numPlanks) / m_physScale, 250.0 / m_physScale);
		jd.Initialize(prevBody, ground, anchor);
		m_world.CreateJoint(jd);
		
		
		
		
		
		
		
		
		
		// Spawn in a bunch of crap
		for (i in 0...5) {
		
			var bodyDef = new B2BodyDef();
			//bodyDef.isBullet = true;
			var boxDef:B2PolygonDef = new B2PolygonDef();
			boxDef.density = 1.0;
			// Override the default friction.
			boxDef.friction = 0.3;
			boxDef.restitution = 0.1;
			boxDef.SetAsBox((Math.random() * 5 + 10) / m_physScale, (Math.random() * 5 + 10) / m_physScale);
			bodyDef.position.Set((Math.random() * 400 + 120) / m_physScale, (Math.random() * 150 + 50) / m_physScale);
			bodyDef.angle = Math.random() * Math.PI;
			body = m_world.CreateBody(bodyDef);
			body.CreateShape(boxDef);
			body.SetMassFromShapes();
			
		}
		for (i in 0...5) {
		
			var bodyDefC = new B2BodyDef();
			//bodyDefC.isBullet = true;
			var circDef:B2CircleDef = new B2CircleDef();
			circDef.density = 1.0;
			circDef.radius = (Math.random() * 5 + 10) / m_physScale;
			// Override the default friction.
			circDef.friction = 0.3;
			circDef.restitution = 0.1;
			bodyDefC.position.Set((Math.random() * 400 + 120) / m_physScale, (Math.random() * 150 + 50) / m_physScale);
			bodyDefC.angle = Math.random() * Math.PI;
			body = m_world.CreateBody(bodyDefC);
			body.CreateShape(circDef);
			body.SetMassFromShapes();
			
		}
		for (i in 0...15) {
			var bodyDefP = new B2BodyDef();
			//bodyDefP.isBullet = true;
			var polyDef:B2PolygonDef = new B2PolygonDef();
			if (Math.random() > 0.66){
				polyDef.vertexCount = 4;
				polyDef.vertices[0].Set((-10 -Math.random()*10) / m_physScale, ( 10 +Math.random()*10) / m_physScale);
				polyDef.vertices[1].Set(( -5 -Math.random()*10) / m_physScale, (-10 -Math.random()*10) / m_physScale);
				polyDef.vertices[2].Set((  5 +Math.random()*10) / m_physScale, (-10 -Math.random()*10) / m_physScale);
				polyDef.vertices[3].Set(( 10 +Math.random()*10) / m_physScale, ( 10 +Math.random()*10) / m_physScale);
			}
			else if (Math.random() > 0.5){
				polyDef.vertexCount = 5;
				polyDef.vertices[0].Set(0, (10 +Math.random()*10) / m_physScale);
				polyDef.vertices[2].Set((-5 -Math.random()*10) / m_physScale, (-10 -Math.random()*10) / m_physScale);
				polyDef.vertices[3].Set(( 5 +Math.random()*10) / m_physScale, (-10 -Math.random()*10) / m_physScale);
				polyDef.vertices[1].Set((polyDef.vertices[0].x + polyDef.vertices[2].x), (polyDef.vertices[0].y + polyDef.vertices[2].y));
				polyDef.vertices[1].Multiply(Math.random()/2+0.8);
				polyDef.vertices[4].Set((polyDef.vertices[3].x + polyDef.vertices[0].x), (polyDef.vertices[3].y + polyDef.vertices[0].y));
				polyDef.vertices[4].Multiply(Math.random()/2+0.8);
			}
			else{
				polyDef.vertexCount = 3;
				polyDef.vertices[0].Set(0, (10 +Math.random()*10) / m_physScale);
				polyDef.vertices[1].Set((-5 -Math.random()*10) / m_physScale, (-10 -Math.random()*10) / m_physScale);
				polyDef.vertices[2].Set(( 5 +Math.random()*10) / m_physScale, (-10 -Math.random()*10) / m_physScale);
			}
			polyDef.density = 1.0;
			polyDef.friction = 0.3;
			polyDef.restitution = 0.1;
			bodyDefP.position.Set((Math.random() * 400 + 120) / m_physScale, (Math.random() * 150 + 50) / m_physScale);
			bodyDefP.angle = Math.random() * Math.PI;
			body = m_world.CreateBody(bodyDefP);
			body.CreateShape(polyDef);
			body.SetMassFromShapes();
		}
		
	}
	
	
	//======================
	// Member Data 
	//======================
	
}