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
	
import box2D.collision.B2AABB;
import box2D.collision.shapes.B2PolygonDef;
import box2D.collision.shapes.B2Shape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2World;
import box2D.dynamics.joints.B2Joint;
import box2D.dynamics.joints.B2MouseJoint;
import box2D.dynamics.joints.B2MouseJointDef;
import box2D.dynamics.joints.B2PulleyJoint;
import flash.display.Sprite;
import general.Input;
import box2D.dynamics.B2DebugDraw;
class Test{
	
	public function new(){
		
		mousePVec = new B2Vec2();
		m_iterations = 10;
		m_timeStep = 1.0/30.0;
		m_physScale = 30.0;
		
		m_sprite = Main.m_sprite;
		
		var worldAABB:B2AABB = new B2AABB();
		worldAABB.lowerBound.Set(-1000.0, -1000.0);
		worldAABB.upperBound.Set(1000.0, 1000.0);
		
		// Define the gravity vector
		var gravity:B2Vec2 = new B2Vec2(0.0, 10.0);
		
		// Allow bodies to sleep
		var doSleep:Bool = true;
		
		// Construct a world object
		m_world = new B2World(worldAABB, gravity, doSleep);
		// set debug draw
		var dbgDraw:B2DebugDraw = new B2DebugDraw();
		//var dbgSprite:Sprite = new Sprite();
		//m_sprite.addChild(dbgSprite);
		dbgDraw.m_sprite = m_sprite;
		dbgDraw.m_drawScale = 30.0;
		dbgDraw.m_fillAlpha = 0.3;
		dbgDraw.m_lineThickness = 1.0;
		dbgDraw.m_drawFlags = B2DebugDraw.e_shapeBit | B2DebugDraw.e_jointBit;
		m_world.SetDebugDraw(dbgDraw);
		
		
		// Create border of boxes
		var wallSd:B2PolygonDef = new B2PolygonDef();
		var wallBd = new B2BodyDef();
		var wallB:B2Body;
		
		// Left
		wallBd.position.Set(-95.0 / m_physScale, 360.0/m_physScale/2.0);
		wallSd.SetAsBox(100.0/m_physScale, 400.0/m_physScale/2.0);
		wallB = m_world.CreateBody(wallBd);
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		// Right
		wallBd.position.Set((640.0+95.0) / m_physScale, 360.0/m_physScale/2.0);
		wallB = m_world.CreateBody(wallBd);
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		// Top
		wallBd.position.Set(640.0/m_physScale/2.0, -95.0/m_physScale);
		wallSd.SetAsBox(680.0/m_physScale/2.0, 100.0/m_physScale);
		wallB = m_world.CreateBody(wallBd);
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		// Bottom
		wallBd.position.Set(640.0/m_physScale/2.0, (360.0+95.0)/m_physScale);
		wallB = m_world.CreateBody(wallBd);	
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		
	}
	
	
	public function Update():Void{
		
		// Update mouse joint
		UpdateMouseWorld();
		MouseDestroy();
		MouseDrag();
		
		// Update physics
		var physStart:Int = flash.Lib.getTimer();
		m_world.Step(m_timeStep, m_iterations);
		Main.m_fpsCounter.updatePhys(physStart);
		
		// Render
		// joints
		/*
		var jj:B2Joint = m_world.m_jointList;
		while (jj != null) 
		{
			DrawJoint(jj);
			jj = jj.m_next;
		}*/
		
		// bodies
		/*
		for (var bb:B2Body = m_world.m_bodyList; bb; bb = bb.m_next){
			for (var s:B2Shape = bb.GetShapeList(); s != null; s = s.GetNext()){
				DrawShape(s);
			}
		}
		*/
		//DrawPairs();
		//DrawBounds();
		
	}
	
	
	//======================
	// Member Data 
	//======================
	public var m_world:B2World;
	public var m_bomb:B2Body;
	public var m_mouseJoint:B2MouseJoint;
	public var m_iterations:Int;
	public var m_timeStep:Float;
	public var m_physScale:Float;
	// world mouse position
	static public var mouseXWorldPhys:Float;
	static public var mouseYWorldPhys:Float;
	static public var mouseXWorld:Float;
	static public var mouseYWorld:Float;
	// Sprite to draw in to
	public var m_sprite:Sprite;
	
	
	
	//======================
	// Update mouseWorld
	//======================
	public function UpdateMouseWorld():Void{
		mouseXWorldPhys = (Input.mouseX)/m_physScale; 
		mouseYWorldPhys = (Input.mouseY)/m_physScale; 
		
		mouseXWorld = (Input.mouseX); 
		mouseYWorld = (Input.mouseY); 
	}
	
	
	
	//======================
	// Mouse Drag 
	//======================
	public function MouseDrag():Void{
		// mouse press
		
		if (Input.mouseDown && m_mouseJoint == null){
			
			
			var body:B2Body = GetBodyAtMouse();
			
			if (body != null)
			{
				
				
				var md:B2MouseJointDef = new B2MouseJointDef();
				md.body1 = m_world.GetGroundBody();
				md.body2 = body;
				md.target.Set(mouseXWorldPhys, mouseYWorldPhys);
				md.maxForce = 300.0 * body.GetMass();
				md.timeStep = m_timeStep;
				m_mouseJoint = cast(m_world.CreateJoint(md),B2MouseJoint);
				
				body.WakeUp();
				
			}
			
		}
		
		
		// mouse release
		if (!Input.mouseDown){
			if (m_mouseJoint != null)
			{
				m_world.DestroyJoint(m_mouseJoint);
				m_mouseJoint = null;
			}
		}
		
		
		
		// mouse move
		if (m_mouseJoint != null)
		{
			var p2:B2Vec2 = new B2Vec2(mouseXWorldPhys, mouseYWorldPhys);
			m_mouseJoint.SetTarget(p2);
		}
		
	}
	
	
	
	//======================
	// Mouse Destroy
	//======================
	public function MouseDestroy():Void{
		// mouse press
		if (!Input.mouseDown && Input.isKeyPressed(68/*D*/)){
			
			var body:B2Body = GetBodyAtMouse(true);
			
			if (body != null)
			{
				m_world.DestroyBody(body);
				return;
			}
		}
	}
	
	
	
	//======================
	// GetBodyAtMouse
	//======================
	private var mousePVec:B2Vec2;
	public function GetBodyAtMouse(?includeStatic:Bool = false):B2Body{
		// Make a small box.
		
		mousePVec.Set(mouseXWorldPhys, mouseYWorldPhys);
		var aabb:B2AABB = new B2AABB();
		
		aabb.lowerBound.Set(mouseXWorldPhys - 0.001, mouseYWorldPhys - 0.001);
		aabb.upperBound.Set(mouseXWorldPhys + 0.001, mouseYWorldPhys + 0.001);
		
		// Query the world for overlapping shapes.
		var k_maxCount:Int = 10;
		var shapes = new Array<Dynamic>();
		var qCount:Int = m_world.Query(aabb, shapes, k_maxCount);
		
		var body:B2Body = null;
		
		for (i in 0...qCount)
		{
			var s:B2Shape = cast shapes[i];
			
			if (s.GetBody().IsStatic() == false || includeStatic)
			{
		
				var tShape:B2Shape = s;
				var inside:Bool = tShape.TestPoint(tShape.GetBody().GetXForm(), mousePVec);
				if (inside)
				{
		
					body = tShape.GetBody();
					break;
				}
			}
		}
		return body;
	}
	
	
	
	//======================
	// Draw Bounds
	//======================
	/*public function DrawBounds(){
		var b:b2AABB = new b2AABB();
		
		var bp:b2BroadPhase = m_world.m_broadPhase;
		var invQ:b2Vec2 = new b2Vec2();
		invQ.Set(1.0 / bp.m_quantizationFactor.x, 1.0 / bp.m_quantizationFactor.y);
		
		for (var i:int = 0; i < b2Settings.b2_maxProxies; ++i)
		{
			var p:b2Proxy = bp.m_proxyPool[ i ];
			if (p.IsValid() == false)
			{
				continue;
			}
			
			b.minVertex.x = bp.m_worldAABB.minVertex.x + invQ.x * bp.m_bounds[0][p.lowerBounds[0]].value;
			b.minVertex.y = bp.m_worldAABB.minVertex.y + invQ.y * bp.m_bounds[1][p.lowerBounds[1]].value;
			b.maxVertex.x = bp.m_worldAABB.minVertex.x + invQ.x * bp.m_bounds[0][p.upperBounds[0]].value;
			b.maxVertex.y = bp.m_worldAABB.minVertex.y + invQ.y * bp.m_bounds[1][p.upperBounds[1]].value;
			
			m_sprite.graphics.lineStyle(1,0xff22ff,1);
			m_sprite.graphics.moveTo(b.minVertex.x * m_physScale, b.minVertex.y * m_physScale);
			m_sprite.graphics.lineTo(b.maxVertex.x * m_physScale, b.minVertex.y * m_physScale);
			m_sprite.graphics.lineTo(b.maxVertex.x * m_physScale, b.maxVertex.y * m_physScale);
			m_sprite.graphics.lineTo(b.minVertex.x * m_physScale, b.maxVertex.y * m_physScale);
			m_sprite.graphics.lineTo(b.minVertex.x * m_physScale, b.minVertex.y * m_physScale);
		}
	}
	
	
	//======================
	// Draw Pairs
	//======================
	public function DrawPairs():void{
		
		var bp:b2BroadPhase = m_world.m_broadPhase;
		var invQ:b2Vec2 = new b2Vec2();
		invQ.Set(1.0 / bp.m_quantizationFactor.x, 1.0 / bp.m_quantizationFactor.y);
		
		for (var i:int = 0; i < b2Pair.b2_tableCapacity; ++i)
		{
			var index:uint = bp.m_pairManager.m_hashTable[i];
			while (index != b2Pair.b2_nullPair)
			{
				var pair:b2Pair = bp.m_pairManager.m_pairs[ index ];
				var p1:b2Proxy = bp.m_proxyPool[ pair.proxyId1 ];
				var p2:b2Proxy = bp.m_proxyPool[ pair.proxyId2 ];
				
				var b1:b2AABB = new b2AABB();
				var b2:b2AABB = new b2AABB();
				b1.minVertex.x = bp.m_worldAABB.minVertex.x + invQ.x * bp.m_bounds[0][p1.lowerBounds[0]].value;
				b1.minVertex.y = bp.m_worldAABB.minVertex.y + invQ.y * bp.m_bounds[1][p1.lowerBounds[1]].value;
				b1.maxVertex.x = bp.m_worldAABB.minVertex.x + invQ.x * bp.m_bounds[0][p1.upperBounds[0]].value;
				b1.maxVertex.y = bp.m_worldAABB.minVertex.y + invQ.y * bp.m_bounds[1][p1.upperBounds[1]].value;
				b2.minVertex.x = bp.m_worldAABB.minVertex.x + invQ.x * bp.m_bounds[0][p2.lowerBounds[0]].value;
				b2.minVertex.y = bp.m_worldAABB.minVertex.y + invQ.y * bp.m_bounds[1][p2.lowerBounds[1]].value;
				b2.maxVertex.x = bp.m_worldAABB.minVertex.x + invQ.x * bp.m_bounds[0][p2.upperBounds[0]].value;
				b2.maxVertex.y = bp.m_worldAABB.minVertex.y + invQ.y * bp.m_bounds[1][p2.upperBounds[1]].value;
				
				var x1:b2Vec2 = b2Math.MulFV(0.5, b2Math.AddVV(b1.minVertex, b1.maxVertex) );
				var x2:b2Vec2 = b2Math.MulFV(0.5, b2Math.AddVV(b2.minVertex, b2.maxVertex) );
				
				m_sprite.graphics.lineStyle(1,0xff2222,1);
				m_sprite.graphics.moveTo(x1.x * m_physScale, x1.y * m_physScale);
				m_sprite.graphics.lineTo(x2.x * m_physScale, x2.y * m_physScale);
				
				index = pair.next;
			}
		}
	}
	
	//======================
	// Draw Contacts
	//======================
	public function DrawContacts():void{
		for (var c:b2Contact = m_world.m_contactList; c; c = c.m_next)
		{
			var ms:Array = c.GetManifolds();
			for (var i:int = 0; i < c.GetManifoldCount(); ++i)
			{
				var m:b2Manifold = ms[ i ];
				//this.graphics.lineStyle(3,0x11CCff,0.7);
				
				for (var j:int = 0; j < m.pointCount; ++j)
				{	
					m_sprite.graphics.lineStyle(m.points[j].normalImpulse,0x11CCff,0.7);
					var v:b2Vec2 = m.points[j].position;
					m_sprite.graphics.moveTo(v.x * m_physScale, v.y * m_physScale);
					m_sprite.graphics.lineTo(v.x * m_physScale, v.y * m_physScale);
					
				}
			}
		}
	}
	
	
	//======================
	// Draw Shape 
	//======================
	public function DrawShape(shape:b2Shape):void{
		switch (shape.m_type)
		{
		case b2Shape.e_circleShape:
			{
				var circle:b2CircleShape = shape as b2CircleShape;
				var pos:b2Vec2 = circle.m_position;
				var r:Float = circle.m_radius;
				var k_segments:Float = 16.0;
				var k_increment:Float = 2.0 * Math.PI / k_segments;
				m_sprite.graphics.lineStyle(1,0xffffff,1);
				m_sprite.graphics.moveTo((pos.x + r) * m_physScale, (pos.y) * m_physScale);
				var theta:Float = 0.0;
				
				for (var i:int = 0; i < k_segments; ++i)
				{
					var d:b2Vec2 = new b2Vec2(r * Math.cos(theta), r * Math.sin(theta));
					var v:b2Vec2 = b2Math.AddVV(pos , d);
					m_sprite.graphics.lineTo((v.x) * m_physScale, (v.y) * m_physScale);
					theta += k_increment;
				}
				m_sprite.graphics.lineTo((pos.x + r) * m_physScale, (pos.y) * m_physScale);
				
				m_sprite.graphics.moveTo((pos.x) * m_physScale, (pos.y) * m_physScale);
				var ax:b2Vec2 = circle.m_R.col1;
				var pos2:b2Vec2 = new b2Vec2(pos.x + r * ax.x, pos.y + r * ax.y);
				m_sprite.graphics.lineTo((pos2.x) * m_physScale, (pos2.y) * m_physScale);
			}
			break;
		case b2Shape.e_polyShape:
			{
				var poly:b2PolyShape = shape as b2PolyShape;
				var tV:b2Vec2 = b2Math.AddVV(poly.m_position, b2Math.b2MulMV(poly.m_R, poly.m_vertices[i]));
				m_sprite.graphics.lineStyle(1,0xffffff,1);
				m_sprite.graphics.moveTo(tV.x * m_physScale, tV.y * m_physScale);
				
				for (i = 0; i < poly.m_vertexCount; ++i)
				{
					v = b2Math.AddVV(poly.m_position, b2Math.b2MulMV(poly.m_R, poly.m_vertices[i]));
					m_sprite.graphics.lineTo(v.x * m_physScale, v.y * m_physScale);
				}
				m_sprite.graphics.lineTo(tV.x * m_physScale, tV.y * m_physScale);
			}
			break;
		}
	}
	
	
	//======================
	// Draw Joint 
	//======================*/
	public function DrawJoint(joint:B2Joint):Void
	{
		var b1:B2Body = joint.m_body1;
		var b2:B2Body = joint.m_body2;
		
		var x1:B2Vec2 = b1.GetPosition();
		var x2:B2Vec2 = b2.GetPosition();
		var p1:B2Vec2 = joint.GetAnchor1();
		var p2:B2Vec2 = joint.GetAnchor2();
		
		m_sprite.graphics.lineStyle(1,0x44aaff,1/1);
		
		switch (joint.m_type)
		{
		case B2Joint.e_mouseJoint, B2Joint.e_distanceJoint:
			m_sprite.graphics.moveTo(p1.x * m_physScale, p1.y * m_physScale);
			m_sprite.graphics.lineTo(p2.x * m_physScale, p2.y * m_physScale);
			
			
		case B2Joint.e_pulleyJoint:
			var pulley:B2PulleyJoint = cast joint;
			var s1:B2Vec2 = pulley.GetGroundAnchor1();
			var s2:B2Vec2 = pulley.GetGroundAnchor2();
			m_sprite.graphics.moveTo(s1.x * m_physScale, s1.y * m_physScale);
			m_sprite.graphics.lineTo(p1.x * m_physScale, p1.y * m_physScale);
			m_sprite.graphics.moveTo(s2.x * m_physScale, s2.y * m_physScale);
			m_sprite.graphics.lineTo(p2.x * m_physScale, p2.y * m_physScale);
			
			
		default:
			if (b1 == m_world.m_groundBody){
				m_sprite.graphics.moveTo(p1.x * m_physScale, p1.y * m_physScale);
				m_sprite.graphics.lineTo(x2.x * m_physScale, x2.y * m_physScale);
			}
			else if (b2 == m_world.m_groundBody){
				m_sprite.graphics.moveTo(p1.x * m_physScale, p1.y * m_physScale);
				m_sprite.graphics.lineTo(x1.x * m_physScale, x1.y * m_physScale);
			}
			else{
				m_sprite.graphics.moveTo(x1.x * m_physScale, x1.y * m_physScale);
				m_sprite.graphics.lineTo(p1.x * m_physScale, p1.y * m_physScale);
				m_sprite.graphics.lineTo(x2.x * m_physScale, x2.y * m_physScale);
				m_sprite.graphics.lineTo(p2.x * m_physScale, p2.y * m_physScale);
			}
		}
	}
}
	
