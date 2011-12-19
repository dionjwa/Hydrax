package com.pblabs.components.physics.motor;

import com.pblabs.components.manager.NodeComponent;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;
import de.polygonal.motor.collision.nbody.SAP;
import de.polygonal.motor.data.RigidBodyData;
import de.polygonal.motor.geom.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import com.pblabs.components.physics.CollisionPair;

using org.transition9.util.MathUtil;

/**
  * This is not designed to be pooled.
  */
class PhysicsManager extends NodeComponent<Dynamic, com.pblabs.components.physics.motor.PhysicsComponent>
{
	public var precision :Int;
	public var world (default, null) :World;
	public var settings (default, null) :Settings;
	public var updateCollisionData :PhysicsComponent->Void;
	public var collisionSignaler :Signaler<CollisionPair<PhysicsComponent>>;
	var _collision :CollisionPair<PhysicsComponent>;
	
	public function new ()
	{
		super();
		precision = 8;
		settings = new Settings();
		settings.lazyPooling = true;
		collisionSignaler = new DirectSignaler(this, true);
		_collision = new CollisionPair();
	}
	
	override public function addChild (c :PhysicsComponent) :Void
	{
		org.transition9.util.Assert.isTrue(children.length - 1 <= settings.maxProxies, "Max children exceeded, assuming  max 1 shape/child");
		super.addChild(c);
	}
	
	public function onTick (dt :Float) :Void
	{
		for (body in world.bodyList) {
			body.x = Mathematics.maxPrecision(body.x, precision);
			body.y = Mathematics.maxPrecision(body.y, precision);
			body.angle = Mathematics.maxPrecision(body.angle, precision);
			body.vx = Mathematics.maxPrecision(body.vx, precision);
			body.vy = Mathematics.maxPrecision(body.vy, precision);
			body.w = Mathematics.maxPrecision(body.w, precision);
			body.fx = Mathematics.maxPrecision(body.fx, precision);
			body.fy = Mathematics.maxPrecision(body.fy, precision);
			body.t = Mathematics.maxPrecision(body.t, precision);
		}
		//The dt is specified in Settings
		while (dt >= settings.dt) {
			world.solve();
			checkCollisions();
			dt -= settings.dt;
		}
		for (body in world.bodyList) {
			body.x = Mathematics.maxPrecision(body.x, precision);
			body.y = Mathematics.maxPrecision(body.y, precision);
			body.angle = Mathematics.maxPrecision(body.angle, precision);
			body.vx = Mathematics.maxPrecision(body.vx, precision);
			body.vy = Mathematics.maxPrecision(body.vy, precision);
			body.w = Mathematics.maxPrecision(body.w, precision);
			body.fx = Mathematics.maxPrecision(body.fx, precision);
			body.fy = Mathematics.maxPrecision(body.fy, precision);
			body.t = Mathematics.maxPrecision(body.t, precision);
		}
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		//From TestManifold
		var _tmpAABB :AABB2 = new AABB2();
		_tmpAABB.set4(-1500, -1500, 1500, 1500);
		settings.worldBounds = _tmpAABB;
		// settings.contactPoolSize = 4;
		// settings.maxProxies = 1 << 3;
		// settings.maxPairs = settings.maxProxies << 4;
		
		// settings.maxProxies = 100.upperPowerOf2();
		// settings.maxPairs = (settings.maxProxies * (settings.maxProxies - 1)).upperPowerOf2();
		// settings.setStepSize(1 / 60);
		// settings.velocityIterations = 20;//10;
		// settings.positionIterations = 30;//15;
		// settings.gravity.x = 0;
		// settings.gravity.y = 0;
		world = new World(settings);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		world.clear();
		world.free();
		world = null;
		settings = null;
		updateCollisionData = null;
		_collision.c1 = null;
		_collision.c2 = null;
		org.transition9.util.Assert.isFalse(collisionSignaler.isListenedTo);
		collisionSignaler = null;
	}
	
	function checkCollisions () :Void
	{
		for (c in children) {
			if (c.contacts.length > 0) {
				c.contacts = [];
			}
		}
		for (contact in world.contactList) {
			if (contact.manifoldCount > 0) {
				_collision.c1 = contact.body1.userData;
				_collision.c2 = contact.body2.userData;
				
				_collision.c1.contacts.push(_collision.c2);
				_collision.c2.contacts.push(_collision.c1);
				
				collisionSignaler.dispatch(_collision);
			}
		}
	}
	
	#if debug
	override public function toString () :String
	{
		return "PhysicsManager";//Std.string(world);
	}
	#end
}
