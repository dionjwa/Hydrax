package com.pblabs.components.physics; 

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.time.ITickedObject;
import com.pblabs.engine.util.PBUtil;
import org.transition9.geom.Vec2Tools;
import org.transition9.util.Log;
import org.transition9.util.Preconditions;

import hsl.haxe.Signaler;

import com.pblabs.components.physics.CollisionData;
import com.pblabs.components.physics.IPhysicalObject;
import com.pblabs.components.physics.PhysicsManagerPhysaxe;
import com.pblabs.components.physics.ShapeType;

import phx.Body;

import phx.Circle;

import phx.Const;

import phx.Material;

import phx.Properties;

import phx.Shape;

import phx.World;

using com.pblabs.engine.core.SignalBondManager;

@sets("physaxePhysicsComponent")
class PhysicsComponentPhysaxe extends NodeComponent<PhysicsManagerPhysaxe, Dynamic>,
	implements ITickedObject, implements IPhysicalObject
{
	//Currently unused.
	public static var SCALE_FACTOR :Float = 0.01;
	
	public var priority :Float;
	
	public var enabled (default, set_enabled) :Bool;
	public var collisionSignaler (default, null) :Signaler<CollisionData>;
	public var isCollidable (default, set_isCollidable) :Bool;
	public var body (default, null) :Body;
	public var shapeType (get_shapeType, set_shapeType) :ShapeType;
	
	//From IPhysicalObject
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var angle (get_angle, set_angle) :Float;
	public var xVelocity (get_xVelocity, set_xVelocity) :Float;
	public var yVelocity (get_yVelocity, set_yVelocity) :Float;
	public var linearFriction (get_linearFriction, set_linearFriction) :Float;
	public var restitution (get_restitution, set_restitution) :Float;
	public var angularFriction (get_angularFriction, set_angularFriction) :Float;
	// @editor({ui:"UpdatingLabel"})
	public var mass (get_mass, set_mass) :Float;
	public var xForce (get_xForce, set_xForce) :Float;
	public var yForce (get_yForce, set_yForce) :Float;
	public var angularVelocity (get_angularVelocity, set_angularVelocity) :Float;
	@editor({ui:"UpdatingLabel"})
	public var speed (get_speed, null) :Float;
	
	//Other components can set the values
	public var xProperty :PropertyReference<Float>;
	public var yProperty :PropertyReference<Float>;
	public var angleProperty :PropertyReference<Float>;
	
	var world (get_world, null) :World;
	var _shape :ShapeType;
	var _physaxeShape :phx.Shape;
	var _mass :Float;
	var _scale :Float;
	
	public function new ()
	{
		super();
		_mass = 0.1;
		_scale = 1;
		enabled = true;
		initBody();
		
		xProperty = SpatialComponent.P_X;
		yProperty = SpatialComponent.P_Y;
		angleProperty = SpatialComponent.P_ANGLE;
		// this.shape = shape;
		//Set the default.  Hard to imagine needing more than one physics engine.
		parentProperty = PBUtil.componentClassToSingletonProp(PhysicsManagerPhysaxe);
		
		
		//Copy the default properties, but don't use the default in case we want to change it
		// var p = new Properties(Const.DEFAULT_PROPERTIES.linearFriction,
		//									 Const.DEFAULT_PROPERTIES.angularFriction,
		//									 Const.DEFAULT_PROPERTIES.biasCoef,
		//									 Const.DEFAULT_PROPERTIES.maxMotion,
		//									 Const.DEFAULT_PROPERTIES.maxDist);
		// body = new Body(0, 0, p);
		
		// var material = new Material(Const.DEFAULT_MATERIAL.restitution,
		//									 Const.DEFAULT_MATERIAL.friction,
		//									 Const.DEFAULT_MATERIAL.density);
											
		// if (shape != null) {
		//	 switch(shape) {
		//		 case CIRCLE(r) : body.addShape(new Circle(r ,new phx.Vector(0,0), material));
		//		 case BOX(w, h): body.addShape(Shape.makeBox(w, h, material));
		//		 default: Log.error("Unrecognized shape: " + shape);
		//	 }
		// }
	}

	public function updateCollisionData () :Void
	{
		// trace("not implemented");		
	}
	
	override function addedToParent () :Void
	{
		org.transition9.util.Assert.isNotNull(parent);
		org.transition9.util.Assert.isNotNull(parent.world);
		org.transition9.util.Assert.isNotNull(body);
		_scale = parent.internalScale;
	}
	
	override function removingFromParent () :Void
	{
		org.transition9.util.Assert.isNotNull(parent);
		org.transition9.util.Assert.isNotNull(parent.world);
		org.transition9.util.Assert.isNotNull(body);
		parent.world.removeBody(body);
	}
	
	function get_shapeType () :ShapeType
	{
		return _shape;
	}
	
	function set_shapeType (val :ShapeType) :ShapeType
	{
		org.transition9.util.Assert.isNotNull(body);
		_shape = val;
		if (_physaxeShape != null) {
			body.removeShape(_physaxeShape);
			_physaxeShape = null;
		}
		
		if (shapeType != null) {
			var material = new Material(Const.DEFAULT_MATERIAL.restitution,
											Const.DEFAULT_MATERIAL.friction,
											Const.DEFAULT_MATERIAL.density);
											
			switch(shapeType) {
				case CIRCLE(r):
					material.density = _mass / (Math.PI * r * r * _scale);
					_physaxeShape = new Circle(r * _scale, new phx.Vector(0,0), material);
				case BOX(w, h):
					material.density = _mass / (w * h * _scale);
					_physaxeShape = Shape.makeBox(w * _scale, h * _scale, material);
				default: Log.error("Unrecognized shape: " + shapeType);
			}
			body.addShape(_physaxeShape);
		}
		body.mass = _mass;
		body.updatePhysics();		
		return val;
	}
	
	override function onReset () :Void
	{
		super.onReset();
		// org.transition9.util.Assert.isNotNull(parent);
		// org.transition9.util.Assert.isNotNull(parent.world);
		// initBody();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_shape = null;
		_physaxeShape = null;
		body = null;
	}
	
	function initBody () :Void
	{
		// if (parent != null && body != null) {
		// 	parent.world.removeBody(body);
		// 	body = null;
		// }
		
		// Preconditions.checkNotNull(shapeType, "Shape is null");
		Preconditions.checkArgument(parent ==null,  "initBody, but we already have a parent");
		//Copy the default properties, but don't use the default in case we want to change it
		var p = new Properties(Const.DEFAULT_PROPERTIES.linearFriction,
											0,//Const.DEFAULT_PROPERTIES.angularFriction,
											Const.DEFAULT_PROPERTIES.biasCoef,
											Const.DEFAULT_PROPERTIES.maxMotion,
											Const.DEFAULT_PROPERTIES.maxDist);
		body = new Body(0, 0, p);
	}
	
	function get_speed () :Float
	{
		return Math.sqrt(body.v.x * body.v.x + body.v.y * body.v.y) / _scale;//xVelocity * xVelocity + yVelocity * yVelocity);
	}
	
	public function onTick (dt :Float) :Void
	{
		if (!enabled) {
			return;
		}
		com.pblabs.engine.debug.Profiler.enter("settingprops");
		if (xProperty != null) {
			owner.setProperty(xProperty, x);
		}
		if (yProperty != null) {
			owner.setProperty(yProperty, y);
		}
		if (angleProperty != null) {
			owner.setProperty(angleProperty, angle);
		}
		com.pblabs.engine.debug.Profiler.exit("settingprops");
	}
	
	public function applyForce (forceX :Float, forceY :Float) :Void
	{
		body.f.x += forceX;
		body.f.y += forceY;
		activate();
	}
	
	public function setCollisionMask (mask :Int) :Void//Applies to the whole body
	{
		for (shape in body.shapes) {
			shape.groups = mask;
		}
	}
	
	function get_x () :Float
	{
		return body.x / _scale;
	}
	
	function set_x (val :Float) :Float
	{
		body.x = val * _scale;
		// if (isRegistered && xProperty != null) {
		// 	owner.setProperty(xProperty, body.x);
		// }
		sync();
		return val;
	}
	
	function get_y () :Float
	{
		return body.y / _scale;
	}
	
	function set_y (val :Float) :Float
	{
		body.y = val * _scale;
		// if (isRegistered && yProperty != null) {
		// 	owner.setProperty(yProperty, body.y);
		// }
		sync();
		return val;
	}
	
	function get_angle () :Float
	{
		// trace("body.a=" + body.a + ", ->" + Vec2Tools.simplifyRadian(body.a));
		return Vec2Tools.simplifyRadian(body.a);//Vec2Tools.simplifyRadian(body.a);
	}
	
	function set_angle (val :Float) :Float
	{
		//[-pi, pi]
		// trace("val=" + val);
		// val = Vec2Tools.simplifyRadian(val);
		// if (val < 0) {
		// 	val = 2 * Math.PI  - val; 
		// }
		// trace("final=" + val);
		// body.setAngle(org.transition9.util.MathUtil.toDeg(Vec2Tools.simplifyRadian(val)));
		body.setAngle(val);
		sync();
		return val;
	}
	
	function get_xVelocity () :Float
	{
		return body.v.x / _scale;
	}
	
	function set_xVelocity (val :Float) :Float
	{
		body.v.x = val * _scale;
		sync();
		return val;
	}
	
	function get_yVelocity () :Float
	{
		return body.v.y / _scale;
	}
	
	function set_yVelocity (val :Float) :Float
	{
		body.v.y = val * _scale;
		sync();
		return val;
	}
	
	function get_linearFriction () :Float
	{
		//http://code.google.com/p/physaxe/issues/detail?id=9
		return 1 - body.properties.linearFriction;
		// return body.properties.linearFriction;
	}
	
	function set_linearFriction (val :Float) :Float
	{
		org.transition9.util.Assert.isWithinRange(val, 0, 1);
		//http://code.google.com/p/physaxe/issues/detail?id=9
		body.properties.linearFriction = 1 - val;
		// body.properties.linearFriction = val;
		activate();
		return val;
	}
	
	function get_restitution () :Float
	{
		for (shape in body.shapes) {
			return shape.material.restitution;
		}
		org.transition9.util.Log.warn("no shape");
		return 0;
	}
	
	function set_restitution (val :Float) :Float
	{
		for (shape in body.shapes) {
			shape.material.restitution = val;
		}
		activate();
		return val;
	}
	
	function get_angularVelocity () :Float
	{
		return body.w;
	}
	
	function set_angularVelocity (val :Float) :Float
	{
		body.w = val;
		activate();
		return val;
	}
	
	function get_angularFriction () :Float
	{
		return body.properties.angularFriction;
	}
	
	function set_angularFriction (val :Float) :Float
	{
		body.properties.angularFriction = val;
		activate();
		return val;
	}
	
	function get_mass () :Float
	{
		return body.mass;
	}
	
	function set_mass (val :Float) :Float
	{
		_mass = val;
		set_shapeType(_shape);
		// body.mass = _mass;
		// body.updatePhysics();
		return val;
	}
	
	function get_xForce () :Float
	{
		return body.f.x;
	}
	
	function set_xForce (val :Float) :Float
	{
		body.f.x = val;
		activate();
		return val;
	}
	
	function get_yForce () :Float
	{
		return body.f.y;
	}
	
	function set_yForce (val :Float) :Float
	{
		body.f.y = val;
		activate();
		return val;
	}
	
	function get_world () :World
	{
		return parent.world;
	}
	
	function activate () :Void
	{
		if (!hasParent() || body == null) {
			return;//Not yet connected
		}
		world.activate(body);
	}
	
	function sync () :Void
	{
		if (!hasParent() || body == null) {
			return;//Not yet connected
		}
		world.sync(body);
	}
	
	function set_enabled (val :Bool) :Bool
	{
		if (!this.enabled && val && body != null) {
			if (xProperty != null) {
				body.x = owner.getProperty(xProperty, x) * _scale;
			}
			if (yProperty != null) {
				body.y = owner.getProperty(yProperty, y) * _scale;
			}
			if (angleProperty != null) {
				body.a = owner.getProperty(angleProperty, angle);
			}
		}
		this.enabled = val;
		return val;
	}
	
	function set_isCollidable (val :Bool) :Bool
	{
		this.isCollidable = val;
		if (body != null) {
			if (val) {
				setCollisionMask(1);
			} else {
				setCollisionMask(0);
			}
		}
		return val;
	}
	
	#if debug
	public function toString () :String
	{
		if (body == null) {
			return "null body";
		} else {
			return "[x=" + x + ", y=" + y + ", angle=" + angle + "]\n internal body[x=" + body.x + ", y=" + body.y + ", angle=" + body.a + "]";
		}
	}
	#end
}
