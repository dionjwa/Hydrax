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
import box2D.common.math.B2XForm;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
	
	
	
	
class TestCompound extends Test{
	
	public function new(){
		
		super();
		// Set Text field
		Main.m_aboutText.text = "Compound Shapes";
		
		var bd:B2BodyDef;
		var body:B2Body;
		var i:Int;
		var x:Float;
		
		{
			var cd1:B2CircleDef = new B2CircleDef();
			cd1.radius = 15.0/m_physScale;
			cd1.localPosition.Set(-15.0/m_physScale, 15.0/m_physScale);
			cd1.density = 2.0;
			
			var cd2:B2CircleDef = new B2CircleDef();
			cd2.radius = 15.0/m_physScale;
			cd2.localPosition.Set(15.0/m_physScale, 15.0/m_physScale);
			cd2.density = 0.0; // massless
			
			bd = new B2BodyDef();
			for (i in 0...5) 
			{
				x = 320.0 + B2Math.b2RandomRange(-3.0, 3.0);
				bd.position.Set((x + 150.0)/m_physScale, (31.5 + 75.0 * -i + 300.0)/m_physScale);
				bd.angle = B2Math.b2RandomRange(-Math.PI, Math.PI);
				body = m_world.CreateBody(bd);
				body.CreateShape(cd1);
				body.CreateShape(cd2);
				body.SetMassFromShapes();
			}
		}
		
		{
			var pd1:B2PolygonDef = new B2PolygonDef();
			pd1.SetAsBox(7.5/m_physScale, 15.0/m_physScale);
			pd1.density = 2.0;
			
			var pd2:B2PolygonDef = new B2PolygonDef();
			pd2.SetAsOrientedBox(7.5/m_physScale, 15.0/m_physScale, new B2Vec2(0.0, -15.0/m_physScale), 0.5 * Math.PI);
			pd2.density = 2.0;
			
			bd = new B2BodyDef();
			
			for (i in 0...5)
			{
				x = 320.0 + B2Math.b2RandomRange(-3.0, 3.0);
				bd.position.Set((x - 150.0)/m_physScale, (31.5 + 75.0 * -i + 300)/m_physScale);
				bd.angle = B2Math.b2RandomRange(-Math.PI, Math.PI);
				body = m_world.CreateBody(bd);
				body.CreateShape(pd1);
				body.CreateShape(pd2);
				body.SetMassFromShapes();
			}
		}
		
		{
			var xf1:B2XForm = new B2XForm();
			xf1.R.Set(0.3524 * Math.PI);
			xf1.position = B2Math.b2MulMV(xf1.R, new B2Vec2(1.0, 0.0));
			
			var sd1:B2PolygonDef = new B2PolygonDef();
			sd1.vertexCount = 3;
			sd1.vertices[0] = B2Math.b2MulX(xf1, new B2Vec2(-30.0/m_physScale, 0.0));
			sd1.vertices[1] = B2Math.b2MulX(xf1, new B2Vec2(30.0/m_physScale, 0.0));
			sd1.vertices[2] = B2Math.b2MulX(xf1, new B2Vec2(0.0, 15.0/m_physScale));
			sd1.density = 2.0;
			
			var xf2:B2XForm = new B2XForm();
			xf2.R.Set(-0.3524 * Math.PI);
			xf2.position = B2Math.b2MulMV(xf2.R, new B2Vec2(-30.0/m_physScale, 0.0));
			
			var sd2:B2PolygonDef = new B2PolygonDef();
			sd2.vertexCount = 3;
			sd2.vertices[0] = B2Math.b2MulX(xf2, new B2Vec2(-30.0/m_physScale, 0.0));
			sd2.vertices[1] = B2Math.b2MulX(xf2, new B2Vec2(30.0/m_physScale, 0.0));
			sd2.vertices[2] = B2Math.b2MulX(xf2, new B2Vec2(0.0, 15.0/m_physScale));
			sd2.density = 2.0;
			
			bd = new B2BodyDef();
			
			for (i in 0...5)
			{
				x = 320.0 + B2Math.b2RandomRange(-3.0, 3.0);
				bd.position.Set(x/m_physScale, (-61.5 + 55.0 * -i + 300)/m_physScale);
				bd.angle = 0.0;
				body = m_world.CreateBody(bd);
				body.CreateShape(sd1);
				body.CreateShape(sd2);
				body.SetMassFromShapes();
			}
		}
		
		{
			var sd_bottom:B2PolygonDef = new B2PolygonDef();
			sd_bottom.SetAsBox( 45.0/m_physScale, 4.5/m_physScale );
			sd_bottom.density = 4.0;
			
			var sd_left:B2PolygonDef = new B2PolygonDef();
			sd_left.SetAsOrientedBox(4.5/m_physScale, 81.0/m_physScale, new B2Vec2(-43.5/m_physScale, -70.5/m_physScale), -0.2);
			sd_left.density = 4.0;
			
			var sd_right:B2PolygonDef = new B2PolygonDef();
			sd_right.SetAsOrientedBox(4.5/m_physScale, 81.0/m_physScale, new B2Vec2(43.5/m_physScale, -70.5/m_physScale), 0.2);
			sd_right.density = 4.0;
			
			bd = new B2BodyDef();
			bd.position.Set( 320.0/m_physScale, 300.0/m_physScale );
			body = m_world.CreateBody(bd);
			body.CreateShape(sd_bottom);
			body.CreateShape(sd_left);
			body.CreateShape(sd_right);
			body.SetMassFromShapes();
		}
		
	}
	
	
	//======================
	// Member Data 
	//======================
}
	
