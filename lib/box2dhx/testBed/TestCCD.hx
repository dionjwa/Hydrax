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
	
	
class TestCCD extends Test{
	
	public function new(){
		
		super();
		// Set Text field
		Main.m_aboutText.text = "Continuous Collision Detection";
		
		var bd;
		var body:B2Body;
		
		var sd_bottom:B2PolygonDef = new B2PolygonDef();
		sd_bottom.SetAsBox( 45.0/m_physScale, 4.5/m_physScale );
		sd_bottom.density = 4.0;
		sd_bottom.restitution = 1.4;
		
		var sd_left:B2PolygonDef = new B2PolygonDef();
		sd_left.SetAsOrientedBox(4.5/m_physScale, 81.0/m_physScale, new B2Vec2(-43.5/m_physScale, -70.5/m_physScale), -0.2);
		sd_left.density = 4.0;
		sd_left.restitution = 1.4;
		
		var sd_right:B2PolygonDef = new B2PolygonDef();
		sd_right.SetAsOrientedBox(4.5/m_physScale, 81.0/m_physScale, new B2Vec2(43.5/m_physScale, -70.5/m_physScale), 0.2);
		sd_right.density = 4.0;
		sd_right.restitution = 1.4;
		
		bd = new B2BodyDef();
		bd.isBullet = true;
		bd.position.Set( 150.0/m_physScale, 100.0/m_physScale );
		body = m_world.CreateBody(bd);
		body.CreateShape(sd_bottom);
		body.CreateShape(sd_left);
		body.CreateShape(sd_right);
		body.SetMassFromShapes();
		
		
		// add some small circles for effect
		for (i in 0...5) {
			var cd:B2CircleDef = new B2CircleDef();
			cd.radius = (Math.random() * 10 + 5) / m_physScale;
			cd.friction = 0.3;
			cd.density = 1.0;
			cd.restitution = 1.1;
			bd = new B2BodyDef();
			bd.isBullet = true;
			bd.position.Set( (Math.random()*300 + 250)/m_physScale, (Math.random()*320 + 20)/m_physScale );
			body = m_world.CreateBody(bd);
			body.CreateShape(cd);
			body.SetMassFromShapes();
		}
		
	}
	
	
	//======================
	// Member Data 
	//======================
	
}
	
