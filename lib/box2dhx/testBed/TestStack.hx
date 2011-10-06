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
	
	
class TestStack extends Test{
	
	public function new(){
		
		super();
		// Set Text field
		Main.m_aboutText.text = "Stacked Boxes";
		
		// Add bodies
		var sd:B2PolygonDef = new B2PolygonDef();
		var bd:B2BodyDef = new B2BodyDef();
		//bd.isBullet = true;
		var b:B2Body;
		sd.density = 1.0;
		sd.friction = 0.5;
		sd.restitution = 0.1;
		
		var i:Int;
		// Create 3 stacks
		for (i in 0...10) {
			sd.SetAsBox((10) / m_physScale, (10) / m_physScale);
			bd.position.Set((640/2+100+Math.random()*0.02 - 0.01) / m_physScale, (360-5-i*25) / m_physScale);
			b = m_world.CreateBody(bd);
			b.CreateShape(sd);
			b.SetMassFromShapes();
		}
		for (i in 0...10) {
			sd.SetAsBox((10) / m_physScale, (10) / m_physScale);
			bd.position.Set((640/2-0+Math.random()*0.02 - 0.01) / m_physScale, (360-5-i*25) / m_physScale);
			b = m_world.CreateBody(bd);
			b.CreateShape(sd);
			b.SetMassFromShapes();
		}
		for (i in 0...10) {
			sd.SetAsBox((10) / m_physScale, (10) / m_physScale);
			bd.position.Set((640/2+200+Math.random()*0.02 - 0.01) / m_physScale, (360-5-i*25) / m_physScale);
			b = m_world.CreateBody(bd);
			b.CreateShape(sd);
			b.SetMassFromShapes();
		}
		
		
		// Create ramp
		sd.vertexCount = 3;
		sd.density = 0;
		sd.vertices[0] = new B2Vec2(0,0);
		sd.vertices[1] = new B2Vec2(0,-100/m_physScale);
		sd.vertices[2] = new B2Vec2(200/m_physScale,0);
		bd.position.Set(0, 360 / m_physScale);
		b = m_world.CreateBody(bd);
		b.CreateShape(sd);
		b.SetMassFromShapes();
		
		// Create ball
		var cd:B2CircleDef = new B2CircleDef();
		cd.radius = 40/m_physScale;
		cd.density = 2;
		cd.restitution = 0.2;
		cd.friction = 0.5;
		bd.position.Set(50/m_physScale, 100 / m_physScale);
		b = m_world.CreateBody(bd);
		b.CreateShape(cd);
		b.SetMassFromShapes();
		
		
	}
	
	
	//======================
	// Member Data 
	//======================
}
	
