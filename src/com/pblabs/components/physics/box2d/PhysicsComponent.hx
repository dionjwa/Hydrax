package com.pblabs.components.physics.box2d;

import box2D.collision.shapes.B2MassData;

import box2D.common.math.B2Vec2;

import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2World;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.time.ITickedObject;
import org.transition9.geom.Circle;
import org.transition9.geom.Vec2Tools;
import org.transition9.util.Preconditions;
import org.transition9.util.SignalVarAdvanced;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import com.pblabs.components.physics.CollisionData;
import com.pblabs.components.physics.ShapeType;

using com.pblabs.engine.util.PBUtil;

using com.pblabs.components.physics.box2d.B2Tools;

class PhysicsComponent extends SpatialComponent<PhysicsManager>,
	implements ITickedObject
{
	public var priority :Int;
	public var shapeType (get_shapeType, set_shapeType) :ShapeType;
	var _shapeType :ShapeType;
	public var body (default, null):B2Body;
	var world (get_world, null) :B2World;
	
	// public var isCollidable (default, set_isCollidable) :Bool;
	// public var enabled (default, set_enabled) :Bool;
	// public var collisionSignaler (default, null) :Signaler<CollisionData>;
	
	public var xVelocity (get_xVelocity, set_xVelocity) :Float;
	public var yVelocity (get_yVelocity, set_yVelocity) :Float;
	public var linearFriction (get_linearFriction, set_linearFriction) :Float;
	public var restitution (get_restitution, set_restitution) :Float;
	public var angularFriction (get_angularFriction, set_angularFriction) :Float;
	public var mass (get_mass, set_mass) :Float;
	public var xForce (get_xForce, set_xForce) :Float;
	public var yForce (get_yForce, set_yForce) :Float;
	public var angularVelocity (get_angularVelocity, set_angularVelocity) :Float;
	@editor({ui:"UpdatingLabel"})
	public var speed (get_speed, null) :Float;
	
	var _temp :B2Vec2;
	
	public function new ()
    {
        super();
        _temp = new B2Vec2();
        setDefaults();
    }

    override function setDefaults () :Void
    {
    	super.setDefaults();
    	priority = 0;
        _shapeType = ShapeType.CIRCLE(0.5, new ShapeDefinition(2, 0.2, 0.5));
        //Set the default.  Hard to imagine needing more than one physics engine at once
        parentProperty = PhysicsManager.singletonProp();
    }
    
	// public function updateCollisionData () :Void
	// {
	// 	if (parent == null || body == null) {
	// 		return;
	// 	}
	// 	//Collision data
	// 	if (parent.updateCollisionData != null) {
	// 			parent.updateCollisionData(this);
	// 			body.wakeUp();
	// 	} else {
	// 		org.transition9.util.Log.error("No parent.updateCollisionData");
	// 	}
	// }
	
	inline function createBody () :Void
	{
		org.transition9.util.Assert.isNotNull(world, ' world is null');
		org.transition9.util.Assert.isNull(body);
		
		var bd = new B2BodyDef();
		bd.userData = this;
		body = world.CreateBody(bd);
		org.transition9.util.Assert.isNotNull(body, ' body is null');
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		destroyBody();
		setDefaults();
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		if (body == null) {
			createBody();
		}
		org.transition9.util.Assert.isNotNull(_shapeType, ' _shapeType is null');
		set_shapeType(_shapeType);
	}
	
	override function removingFromParent () :Void
	{
		destroyBody();
		super.removingFromParent();
	}
	
	function get_speed () :Float
	{
		return Math.sqrt(xVelocity * xVelocity + yVelocity * yVelocity);
	}
	
	public function onTick (dt :Float) :Void
	{
		com.pblabs.engine.debug.Profiler.enter("settingprops");
		
		if (body == null) {
			return;
		}
		super.set_x(body.GetXForm().position.x * parent.m_physScale);
		super.set_y(body.GetXForm().position.y * parent.m_physScale);
		super.set_angle(body.GetAngle());
		com.pblabs.engine.debug.Profiler.exit("settingprops");
	}
	
	public function applyForce (forceX :Float, forceY :Float) :Void
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		body.ApplyForce(new B2Vec2(forceX, forceY), body.GetXForm().position);
	}
	
	override function set_x (val :Float) :Float
	{
		super.set_x(val);
		updatePos();
		return val;
	}
	
	override function set_y (val :Float) :Float
	{
		super.set_y(val);
		updatePos();
		return val;
	}
	
	override function set_angle (val :Float) :Float
	{
		super.set_angle(Vec2Tools.simplifyRadian(val));
		updatePos();
		return _angle;
	}
	
	inline function updatePos () :Void
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		_temp.x = x / parent.m_physScale;
		_temp.y = y / parent.m_physScale;
		body.SetXForm(_temp, _angle);
	}
	
	function get_xVelocity () :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		return body.GetLinearVelocity().x * parent.m_physScale;
	}
	
	function set_xVelocity (val :Float) :Float
	{
		_temp.x = val;
		_temp.y = body.GetLinearVelocity().y;
		
		_temp.x /= parent.m_physScale;
		_temp.y /= parent.m_physScale;
		
		body.SetLinearVelocity(_temp);
		return val;
	}
	
	function get_yVelocity () :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		return body.GetLinearVelocity().y;
	}
	
	function set_yVelocity (val :Float) :Float
	{
		_temp.x = body.GetLinearVelocity().x;
		_temp.y = val;
		
		_temp.x /= parent.m_physScale;
		_temp.y /= parent.m_physScale;
		
		body.SetLinearVelocity(_temp);
		return val;
	}
	
	function get_linearFriction () :Float
	{
		org.transition9.util.Log.error("Not implemented");
		return 0;
	}
	
	function set_linearFriction (val :Float) :Float
	{
		org.transition9.util.Log.error("Not implemented");
		return val;
	}
	
	function get_restitution () :Float
	{
		org.transition9.util.Log.error("Not implemented");
		return 0;
	}
	
	function set_restitution (val :Float) :Float
	{
		org.transition9.util.Log.error("Not implemented");
		return val;
	}
	
	function get_angularVelocity () :Float
	{
		return body.GetAngularVelocity();
	}
	
	function set_angularVelocity (val :Float) :Float
	{
		body.SetAngularVelocity(val);
		return val;
	}
	
	function get_angularFriction () :Float
	{
		return body.m_angularDamping;
	}
	
	function set_angularFriction (val :Float) :Float
	{
		body.m_angularDamping = val;
		return val;
	}
	
	function get_mass () :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		return body.GetMass();
	}
	
	function set_mass (val :Float) :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		
		var md = new B2MassData();
		//Copied from Circle/BoxShape
		md.mass = val / parent.m_physScale;
		switch (shapeType) {
			case CIRCLE(radius, def):
				var rSq = (radius / parent.m_physScale) * (radius / parent.m_physScale);
				md.I = md.mass * .5 * rSq;
			case BOX(w, h, def):
				md.I = (md.mass / 12 * de.polygonal.core.math.Vec2.dot4(w / parent.m_physScale, h / parent.m_physScale, w / parent.m_physScale, h / parent.m_physScale));
			case FIXED_BOX(x, y, w, h, def):
				md.mass = 0;		
		}
		body.SetMass(md);
		return val;
	}
	
	function get_xForce () :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		return body.m_force.x * parent.m_physScale;
	}
	
	function set_xForce (val :Float) :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		body.m_force.x = val / parent.m_physScale;
		if (body.IsSleeping())
		{
			body.WakeUp();
		}
		return val;
	}
	
	function get_yForce () :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		return body.m_force.y * parent.m_physScale;
	}
	
	function set_yForce (val :Float) :Float
	{
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		body.m_force.y = val / parent.m_physScale;
		if (body.IsSleeping())
		{
			body.WakeUp();
		}
		return val;
	}
	
	function get_world () :B2World
	{
		if (parent == null) {
			org.transition9.util.Log.error("Asking for World, but no parent");
			return null;
		}
		return parent.world;
	}
	
	function get_shapeType () :ShapeType
	{
		return _shapeType;
	}
	
	function set_shapeType (shape) :ShapeType
	{
		if (Type.enumEq(_shapeType, shape) && body != null) {
			return shape;
		}
		_shapeType = shape;
		//Destroy the old body, create a new one
		if (body != null) {
			for (shape in body.getShapes()) {
				shape.SetUserData(null);
				body.DestroyShape(shape);
			}
		}
		if (_shapeType == null) {
			return null;
		}
		org.transition9.util.Assert.isNotNull(parent, "No parent");
		org.transition9.util.Assert.isNotNull(parent.world, "No world on parent");
		org.transition9.util.Assert.isNotNull(body, ' body is null');
		
		switch (_shapeType) {
			case CIRCLE(radius, def):
				// Create ball
				var cd:B2CircleDef = new B2CircleDef();
				cd.radius = radius / parent.m_physScale;
				cd.density = def.density;
				cd.restitution = def.restitution;
				cd.friction = def.friction;
				var shape = body.CreateShape(cd);
				shape.SetUserData(this);
				body.SetMassFromShapes();
			case BOX(w, h, def): 
				throw "Not implemented";
			case FIXED_BOX(x, y, w, h, def):
				destroyBody();
				var box = new B2PolygonDef();
				box.density = 0;
				box.restitution = 0.3;
				box.friction = 0.3;
				box.SetAsBox(w, h);
				
				var boxDef = new B2BodyDef();
				boxDef.position.Set(x / parent.m_physScale, y / parent.m_physScale);
				// wallSd.SetAsBox((w / 2) / parent.m_physScale, (h / 2) / parent.m_physScale);
				
				body = world.CreateBody(boxDef);
				
				var shape = body.CreateShape(box);
				shape.SetUserData(this);
				body.SetMassFromShapes();
				set_x(x);
				set_y(y);
		}
		return _shapeType;
	}
	
	// function set_isCollidable (val :Bool) :Bool
	// {
	// 	this.isCollidable = val;
	// 	if (body != null) {
	// 		if (val) {
	// 			body.clrf(de.polygonal.motor.collision.shape.AbstractShape.GHOST);
	// 		} else {
	// 			body.setf(de.polygonal.motor.collision.shape.AbstractShape.GHOST);
	// 		}
	// 		body.wakeUp();
	// 	}
	// 	return val;
	// }
	
	function destroyBody () :Void
	{
		org.transition9.util.Log.debug("");
		if (body != null) {
			for (shape in body.getShapes()) {
				shape.SetUserData(null);
			}
			if (body.GetWorld() != null) {
				body.GetWorld().DestroyBody(body);
			}
			body.SetUserData(null);
			body = null;
		}
		_vec.x = _vec.y = _angle = 0;
		org.transition9.util.Log.debug("end");
	}
	
	#if debug
	override public function toString () :String
	{
		if (body == null) {
			return "null body";
		} else {
			return "[x=" + x + ", y=" + y + ", angle=" + angle + "]";
		}
	}
	#end
}
