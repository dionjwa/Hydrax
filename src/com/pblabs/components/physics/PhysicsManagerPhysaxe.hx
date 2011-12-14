package com.pblabs.components.physics; 

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.time.ITickedObject;
import org.transition9.geom.Vector2;
import org.transition9.util.Preconditions;
import org.transition9.util.SignalVar;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import com.pblabs.components.physics.CollisionData;
import com.pblabs.components.physics.PhysicsComponentPhysaxe;

import phx.Contact;

import phx.Shape;

import phx.World;

class PhysicsManagerPhysaxe extends NodeComponent<Dynamic, PhysicsComponentPhysaxe>,
	implements ITickedObject
{
	
	public var internalScale (get_internalScale, set_internalScale) :Float;
	var _internalScale :Float;
	function get_internalScale () :Float
	{
		return _internalScale;
	}
	function set_internalScale (val :Float) :Float
	{
		Preconditions.checkArgument(children == null || children.length == 0, "You cannot change the scale if physical objects exist");
	    Preconditions.checkArgument(val > 0, "Value must be > 0");
	    _internalScale = val;
		return val;
	}
	
	public var world (default, null) :World;
	public var collisionSignaler (default, null) :Signaler<CollisionData>;
	
	public function new (?gravity :Vector2)
	{
		super();
		internalScale = 1.0;//new SignalVar(1.0);
		_enabled = true;
		_gravity = gravity;
		_bodies = new IntHash();
		collisionSignaler = new DirectSignaler(this);
		_collisionData = new CollisionData();
	}
	
	public function enable () :Void
	{
		_enabled = true;
		for (c in children) {
			cast(c, PhysicsComponentPhysaxe).enabled = true;
		}
	}
	
	public function disable () :Void
	{
		_enabled = false;
		for (c in children) {
			cast(c, PhysicsComponentPhysaxe).enabled = false;
		}
	}
	
	public function onTick (dt :Float) :Void
	{
		// update the world
		if (_enabled) {
			// world.step(dt / (1/30.0), 20);
			world.step(dt, 20);
			
			//Check for collisions
			for (b in world.bodies) {
				for (a in b.arbiters) {
					var c :Contact = a.contacts;
					while (c != null) {
						contact(_bodies.get(a.s1.body.id), _bodies.get(a.s2.body.id), c.px, c.py);
						c = c.next;
					}
				}
			}
		}
	}
	
	function contact (body1 :PhysicsComponentPhysaxe, body2 :PhysicsComponentPhysaxe, x :Float, y :Float) :Void
	{
		_collisionData.body1 = body1;
		_collisionData.body2 = body2;
		_collisionData.x = x;
		_collisionData.y = y;
		//Global dispatcher
		collisionSignaler.dispatch(_collisionData);
		//And dispatch to the bodies themselves
		body1.collisionSignaler.dispatch(_collisionData);
		//Make the dispatcher the first body
		_collisionData.body1 = body2;
		_collisionData.body2 = body1;
		body2.collisionSignaler.dispatch(_collisionData);
	}
	
	override function childAdded (c :PhysicsComponentPhysaxe) :Void
	{
		if (!Std.is(c, PhysicsComponentPhysaxe)) {
			throw "Not a PhysicsComponentPhysaxe\n" + c.owner;
		}
		var b :PhysicsComponentPhysaxe = cast(c);
		Preconditions.checkNotNull(b.shapeType, "Shape is null");
		
		switch(b.shapeType) {
			case FIXED_BOX(x, y, w, h): world.addStaticShape(Shape.makeBox(w, h, x, y));
			default: world.addBody(b.body);
		}
		
		_bodies.set(c.body.id, c);
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		// define the size of the world
		var size = new phx.col.AABB(-1000,-1000,1000,1000);
		// create the broadphase : this is the algorithm used to optimize collision detection
		var bf = new phx.col.SortedList();
		// initialize the world
		world = new World(size,bf);
		// // create one 50x50 box body at x=210,y=-50
		// var b1 = new Body(210,-50);
		// b1.addShape( Shape.makeBox(50,50) );
		// // create one 30 radius circle at x=200,y=250
		// var b2 = new phx.Body(200,250);
		// b2.addShape( new phx.Circle(30,new phx.Vector(0,0)) );
		// // create one 20x20 box body at x=100,y=270
		// var b3 = new phx.Body(100,270);
		// b3.addShape( phx.Shape.makeBox(20,20) );
		// // add the created bodies to the world
		// world.addBody(b1);
		// world.addBody(b2);
		// world.addBody(b3);
		// // creates a 270x50 box at x=0,y=280
		// var floor = phx.Shape.makeBox(270,50,0,280);
		// the floor is static, it can't move
		// world.addStaticShape(floor);
		// setup gravity
		if (_gravity != null) {
			world.gravity = new phx.Vector(_gravity.x, _gravity.y);
		}
	}
	
	override function childRemoved (c :PhysicsComponentPhysaxe) :Void
	{
		world.removeBody(c.body);
		_bodies.remove(c.body.id);
	}
	
	var _enabled :Bool;
	var _gravity :Vector2;
	var _bodies :IntHash<PhysicsComponentPhysaxe>;
	var _collisionData :CollisionData;
}
