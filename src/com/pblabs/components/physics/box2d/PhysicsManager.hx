package com.pblabs.components.physics.box2d;

import box2D.collision.B2AABB;
import box2D.collision.B2ContactPoint;

import box2D.common.math.B2Vec2;

import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.B2World;
import box2D.dynamics.contacts.B2ContactResult;

import com.pblabs.components.manager.NodeParent;
import com.pblabs.components.spatial.ISpatialManager2D;
import com.pblabs.components.spatial.ISpatialObject2D;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.time.ITickedObject;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

class PhysicsManager extends NodeParent<PhysicsComponent>,	
	implements ISpatialManager2D<PhysicsComponent>,
	implements ITickedObject
{
	public var priority :Int;
	public var world (default, null) :B2World;
	public var contactSignaler (get_contactSignaler, null):Signaler<Contact>;
	function get_contactSignaler () :Signaler<Contact> {return _contactListener.signaler;}
	public var bounds:B2AABB;
	public var m_iterations :Int;
	public var m_timeStep :Float;
	public var m_physScale :Float;
	public var gravity:B2Vec2;
	public var doSleep :Bool;
	
	var _contactListener :ContactListener;
	
	public function new ()
	{
	    super();
	    
	    _contactListener = new ContactListener();
	    setDefaults();
	}
	
	public function onTick (dt :Float) :Void
	{
		//The dt is specified in Settings
	    world.Step(m_timeStep, m_iterations);
	}
	
	#if (debug && flash)
	public function setDebugLayer (debugLayer :flash.display.Sprite) :Void
	{
		
		if (debugLayer != null) {
			var drawLayer = org.transition9.util.SpriteUtil.create();
			var gridLayer = org.transition9.util.SpriteUtil.create();
			debugLayer.addChild(gridLayer);
			debugLayer.addChild(drawLayer);
			var dbgDraw = new box2D.dynamics.B2DebugDraw();
			dbgDraw.m_sprite = drawLayer;
			dbgDraw.setDrawScale(m_physScale);
			dbgDraw.
			dbgDraw.m_fillAlpha = 0.8;
			dbgDraw.m_lineThickness = 1.0;
			dbgDraw.m_drawFlags = box2D.dynamics.B2DebugDraw.e_shapeBit | box2D.dynamics.B2DebugDraw.e_jointBit | box2D.dynamics.B2DebugDraw.e_coreShapeBit;
			world.SetDebugDraw(dbgDraw);
			
			//Draw grid 10 wide
			org.transition9.util.GraphicsUtil.drawGrid(gridLayer.graphics, m_physScale * 10, 0x000000, 10);
			// org.transition9.util.GraphicsUtil.drawGrid(gridLayer.graphics, 10, 0x000000, 10);
		} else {
			org.transition9.util.Log.warn("No PhysicsManager debug layer");
		}
	}
	#end
	
	override function onAdd () :Void
	{
		super.onAdd();
		// Construct a world object
		world = new B2World(bounds, gravity, doSleep);
		world.SetContactListener(_contactListener);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		setDefaults();
		_contactListener.shutdown();
		world = null;
	}
	
	function setDefaults () :Void
	{
		priority = 0;
		// Allow bodies to sleep
		doSleep = true;
		gravity = new B2Vec2(0.0, 0.0);
		bounds = new B2AABB();
		bounds.lowerBound.Set(-1000.0, -1000.0);
		bounds.upperBound.Set(1000.0, 1000.0);
		m_iterations = 10;
	    m_timeStep = 1.0/30.0;
	    m_physScale = 1.0;
	}
	
	public function setBounds (width :Float, height :Float, ?offset :B2Vec2) :Void
	{
		offset = offset == null ? new B2Vec2() :offset;
		var boxWidth = 20;
		
		var left = offset.x - width / 2 - boxWidth;
		var right = offset.x + width / 2 + boxWidth;
		var top = offset.y - height / 2 - boxWidth;
		var bottom = offset.y + height / 2 + boxWidth;
		
		// Create border of boxes
		var wallSd = new B2PolygonDef();
		var wallBd = new B2BodyDef();
		var wallB:B2Body;
		
		// Left
		wallBd.position.Set(left / m_physScale, offset.y / m_physScale);
		wallSd.SetAsBox(boxWidth/m_physScale, height/m_physScale);
		wallB = world.CreateBody(wallBd);
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		// Right
		wallBd.position.Set(right / m_physScale, offset.y / m_physScale);
		wallB = world.CreateBody(wallBd);
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		// Top
		wallBd.position.Set(offset.x / m_physScale , top / m_physScale);
		wallSd.SetAsBox(width/m_physScale, boxWidth/m_physScale);
		wallB = world.CreateBody(wallBd);
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
		// Bottom
		wallBd.position.Set(offset.x / m_physScale , bottom / m_physScale);
		wallB = world.CreateBody(wallBd);	
		wallB.CreateShape(wallSd);
		wallB.SetMassFromShapes();
	}
	
	#if debug
	public function createStairs () :Void
	{
		trace('m_physScale=' + m_physScale);
		var bd:B2BodyDef;
		var circ = new box2D.collision.shapes.B2CircleDef();
		var box = new box2D.collision.shapes.B2PolygonDef();
		var jd = new box2D.dynamics.joints.B2RevoluteJointDef();
		var head:B2Body;
		
		// Add stairs on the left
		for (j in 1...11) {
			box.SetAsBox((10*j) / m_physScale, 10 / m_physScale);
			box.density = 0.0;
			box.friction = 0.4;
			box.restitution = 0.3;
			bd = new B2BodyDef();
			bd.position.Set((10*j) / m_physScale, (150 + 20*j) / m_physScale);
			head = world.CreateBody(bd);
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
			head = world.CreateBody(bd);
			head.CreateShape(box);
			head.SetMassFromShapes();
		}
		
		box.SetAsBox(30 / m_physScale, 40 / m_physScale);
		box.density = 0.0;
		box.friction = 0.0;
		box.restitution = 1;
		bd = new B2BodyDef();
		bd.position.Set(320 / m_physScale, 320 / m_physScale);
		head = world.CreateBody(bd);
		head.CreateShape(box);
		head.SetMassFromShapes();
	}
	#end
	
	public function queryAABB2 (box:de.polygonal.motor.geom.primitive.AABB2, mask :ObjectType, results :Array<PhysicsComponent>) :Bool
	{
		throw "Not implemented";
		return false;
	}
	
	public function queryCircle(center :de.polygonal.motor.geom.math.Vec2, radius :Float, mask :ObjectType, results :Array<PhysicsComponent>) :Bool
	{
		throw "Not implemented";
		return false;
	}
	
	public function getObjectsUndergetObjectsUnderPoint(worldPosition :de.polygonal.motor.geom.math.Vec2, mask :ObjectType, results :Array<PhysicsComponent>) :Bool
	{
		throw "Not implemented";
		return false;
	}
}

class ContactListener extends B2ContactListener
{
	public var signaler :Signaler<Contact>;
	var _contact :Contact;
	
	public function new ()
	{
		super();
		signaler = new DirectSignaler(this);
		_contact = new Contact();
	}
	
	/// Called when a contact point is added. This includes the geometry
	/// and the forces.
	override public  function Add(point:B2ContactPoint) : Void
	{
		_contact.contact1 = point.shape1.GetUserData();
		_contact.contact2 = point.shape2.GetUserData();
		_contact.point = point;
		signaler.dispatch(_contact);
	}
	/// Called when a contact point persists. This includes the geometry
	/// and the forces.
	override public  function Persist(point:B2ContactPoint) : Void
	{
	}
	
	/// Called when a contact point is removed. This includes the last
	/// computed geometry and forces.
	override public  function Remove(point:B2ContactPoint) : Void
	{
	}
	
	/// Called after a contact point is solved.
	override public  function Result(point:B2ContactResult) : Void
	{
	}
	
	public function shutdown () :Void
	{
		_contact.contact1 = null;
		_contact.contact2 = null;
		_contact.point = null;
	}

}

class Contact
{
	public var contact1 :PhysicsComponent;
	public var contact2 :PhysicsComponent;
	public var point :B2ContactPoint;
	public function new () {}
}
