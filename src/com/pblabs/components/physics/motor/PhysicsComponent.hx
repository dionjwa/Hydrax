package com.pblabs.components.physics.motor;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.physics.CollisionData;
import com.pblabs.components.physics.ShapeType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.util.PBUtil;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.World;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.data.BoxData;
import de.polygonal.motor.data.CircleData;
import de.polygonal.motor.data.MassData;
import de.polygonal.motor.data.RigidBodyData;
import de.polygonal.motor.data.ShapeData;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import org.transition9.geom.Circle;
import org.transition9.geom.Vec2Tools;
import org.transition9.util.Preconditions;
import org.transition9.util.SignalVarAdvanced;

using de.polygonal.ds.BitFlags;

using de.polygonal.core.math.Vec2Util;

@sets("motorPhysicsComponent")
class PhysicsComponent extends NodeComponent<PhysicsManager, Dynamic>,
	implements com.pblabs.components.physics.IPhysicalObject
{
	static var DEFAULT_PARENT_PROP :PropertyReference<PhysicsManager> = PBUtil.componentClassToSingletonProp(PhysicsManager);
	
	public var contacts :Array<PhysicsComponent>;
	public var shapeType (get_shapeType, set_shapeType) :ShapeType;
	var _shapeType :ShapeType;
	public var body (default, null) :RigidBody;
	var world (get_world, null) :World;
	
	// public var isCollidable (default, set_isCollidable) :Bool;
	public var enabled (default, set_enabled) :Bool;
	// public var collisionSignaler (default, null) :Signaler<CollisionData>;
	
	//From IPhysicalObject
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var angle (get_angle, set_angle) :Float;
	public var xVelocity (get_xVelocity, set_xVelocity) :Float;
	public var yVelocity (get_yVelocity, set_yVelocity) :Float;
	public var linearFriction (get_linearFriction, set_linearFriction) :Float;
	public var restitution (get_restitution, set_restitution) :Float;
	public var angularFriction (get_angularFriction, set_angularFriction) :Float;
	// @editor({ui :"UpdatingLabel"})
	public var mass (get_mass, set_mass) :Float;
	public var xForce (get_xForce, set_xForce) :Float;
	public var yForce (get_yForce, set_yForce) :Float;
	public var angularVelocity (get_angularVelocity, set_angularVelocity) :Float;
	@editor({ui :"UpdatingLabel"})
	public var speed (get_speed, null) :Float;
	
	//Other components can set the values
	public var xProperty :PropertyReference<Float>;
	public var yProperty :PropertyReference<Float>;
	public var angleProperty :PropertyReference<Float>;
	
	var _x :Float;
	var _y :Float;
	var _angle :Float;
	var _mass :Float;
	
	public var precision (get_precision, never) :Int;
	inline function get_precision () :Int
	{
		return parent == null ? 6 :manager.precision;
	}
	
	public var manager (get_manager, never) :PhysicsManager;
	function get_manager () :PhysicsManager
	{
		return cast parent;
	}
	
	public function new ()
	{
		super();
		setDefaults();
	}
	
	inline function setDefaults () :Void
	{
		contacts = [];
		enabled = true;
		_shapeType = ShapeType.CIRCLE(0.5, null);
		_x = 0;
		_y = 0;
		_angle = 0;
		_mass = 0.1;
		xProperty = com.pblabs.components.Constants.DEFAULT_X_PROP;
		yProperty = com.pblabs.components.Constants.DEFAULT_Y_PROP;
		angleProperty = com.pblabs.components.Constants.DEFAULT_ANGLE_PROP;
		//Set the default.  Hard to imagine needing more than one physics engine.
		parentProperty = DEFAULT_PARENT_PROP;
		body = null;
	}

	public function updateCollisionData () :Void
	{
		if (parent == null || body == null) {
			return;
		}
		//Collision data
		if (parent.updateCollisionData != null) {
				parent.updateCollisionData(this);
				body.wakeUp();
		} else {
			org.transition9.util.Log.error("No parent.updateCollisionData");
		}
	}
	
	#if !no_Logging 
	override function onReset () :Void
	{
		super.onReset();
		org.transition9.util.Log.debug("_shapeType=" + _shapeType);
	}
	#end
	
	override function onRemove () :Void
	{
		super.onRemove();
		destroyBody();
		setDefaults();
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		set_shapeType(_shapeType);
	}
	
	override function removingFromParent () :Void
	{
		super.removingFromParent();
		destroyBody();
	}
	
	function get_speed () :Float
	{
		return Mathematics.maxPrecision(Math.sqrt(xVelocity * xVelocity + yVelocity * yVelocity), precision);
	}
	
	public function onTick (dt :Float) :Void
	{
		if (!enabled) {
			return;
		}
		com.pblabs.engine.debug.Profiler.enter("settingprops");
		
		if (body == null) {
			return;
		}
		
		org.transition9.util.Assert.isFalse(Math.isNaN(body.x));
		org.transition9.util.Assert.isFalse(Math.isNaN(body.y));
		org.transition9.util.Assert.isFalse(Math.isNaN(body.angle));
		
		_x = body.x;
		_y = body.y;
		_angle = body.angle;

		if (xProperty != null) {
			owner.setProperty(xProperty, _x);
		}
		if (yProperty != null) {
			owner.setProperty(yProperty, _y);
		}
		if (angleProperty != null) {
			owner.setProperty(angleProperty, _angle);
		}
		com.pblabs.engine.debug.Profiler.exit("settingprops");
	}
	
	public function applyForce (forceX :Float, forceY :Float) :Void
	{
		if (body == null) {
			org.transition9.util.Log.debug("No body defined");
			return;
		}
		body.applyForce(Mathematics.maxPrecision(forceX, precision), Mathematics.maxPrecision(forceY, precision));
	}
	
	function get_x () :Float
	{
		return _x;
	}
	
	function set_x (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (_x == val) {
			return val;
		}
		_x = val;
		if (body != null ) {
			body.x = _x;
			body.wakeUp();
		}
		if (owner != null && xProperty != null) {
			owner.setProperty(xProperty, _x);
		}
		return val;
	}
	
	function get_y () :Float
	{
		return _y;
	}
	
	function set_y (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (_y == val) {
			return val;
		}
		_y = val;
		if (body != null) {
			org.transition9.util.Assert.isNotNull(body);
			org.transition9.util.Assert.isNotNull(_y);
			body.y = _y;
			body.wakeUp();
		}
		if (owner != null && yProperty != null) {
			owner.setProperty(yProperty, _y);
		}
		return val;
	}
	
	function get_angle () :Float
	{
		return _angle;
	}
	
	function set_angle (val :Float) :Float
	{
		_angle = Mathematics.maxPrecision(Vec2Tools.simplifyRadian(val), precision);
		if (body != null) {
			body.angle = _angle;
			//If we're setting the angle directly, remove angular momentum
			body.t = 0;
			body.wakeUp();
		}
		if (owner != null && angleProperty != null) {
			owner.setProperty(angleProperty, _angle);
		}
		return _angle;
	}
	
	function get_xVelocity () :Float
	{
		if (body == null) {
			org.transition9.util.Log.debug("No body defined");
			return 0;
		}
		return body.vx;
	}
	
	function set_xVelocity (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null || body.vx == val) {
			return val;
		}
		body.vx = val;
		body.wakeUp();
		return val;
	}
	
	function get_yVelocity () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.vy;
	}
	
	function set_yVelocity (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null || body.vy == val) {
			return val;
		}
		body.vy = val;
		body.wakeUp();
		return val;
	}
	
	function get_linearFriction () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.linDamping;
		for (shape in body.shapeList) {
			return shape.friction;
		}
		return 0;
	}
	
	function set_linearFriction (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null) {
			return val;
		}
		body.linDamping = val;
		//What is the difference between linDamping and friction?
		for (shape in body.shapeList) {
			shape.friction = val;
		}
		return val;
	}
	
	function get_restitution () :Float
	{
		if (body == null) {
			return 0;
		}
		for (shape in body.shapeList) {
			return shape.restitution;
		}
		return 0;
	}
	
	function set_restitution (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null) {
			return val;
		}
		for (shape in body.shapeList) {
			shape.restitution = val;
		}
		return val;
	}
	
	function get_angularVelocity () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.w;
	}
	
	function set_angularVelocity (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null) {
			return 0;
		}
		body.w = val;
		body.wakeUp();
		return val;
	}
	
	function get_angularFriction () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.angDamping;
	}
	
	function set_angularFriction (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null) {
			return 0;
		}
		body.angDamping = val;
		body.wakeUp();
		return val;
	}
	
	function get_mass () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.mass;
	}
	
	function set_mass (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		// trace("\nsetting mass=" + val);
		_mass = val;
		if (body == null) {
			org.transition9.util.Log.debug("No body defined");
			return 0;
		}
		
		var md = new MassData();
		//Copied from Circle/BoxShape
		// trace("precision=" + precision);
		// trace(val + '=>' + Mathematics.maxPrecision(val, precision));
		md.mass = Mathematics.maxPrecision(val, precision);
		// trace("md=" + md);
		switch (shapeType) {
			case CIRCLE(radius, def) :
			var rSq = radius * radius;
			md.I = Mathematics.maxPrecision(md.mass * .5 * rSq, precision);
			case BOX(w, h, def) :
			md.I = Mathematics.maxPrecision(md.mass / 12 * Vec2Util.dot4(w, h, w, h), precision);
			case FIXED_BOX(x, y, w, h, def) :
				//Nothing, it's fixed
				return val;
		}
		// trace("setting mass=" + md);
		body.setMass(md);
		body.wakeUp();
		// trace("body.mass=" + body.mass);
		return val;
	}
	
	function get_xForce () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.fx;
	}
	
	function set_xForce (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null || body.fx == val) {
			return val;
		}
		body.fx = val;
		body.wakeUp();
		return val;
	}
	
	function get_yForce () :Float
	{
		if (body == null) {
			return 0;
		}
		return body.fy;
	}
	
	function set_yForce (val :Float) :Float
	{
		val = Mathematics.maxPrecision(val, precision);
		if (body == null || body.fy == val) {
			return val;
		}
		body.fy = val;
		body.wakeUp();
		return val;
	}
	
	function get_world () :World
	{
		if (parent == null) {
			org.transition9.util.Log.error("Asking for World, but no parent");
			return null;
		}
		return parent.world;
	}
	
	function set_enabled (val :Bool) :Bool
	{
		//When going from not enabled to enabled, set the physics coords to the property coords.
		if (!this.enabled && val && body != null) {
			if (xProperty != null) {
				body.x = owner.getProperty(xProperty, 0);
				_x = body.x; 
			}
			if (yProperty != null) {
				body.y = owner.getProperty(yProperty, 0);
				_y = body.y;
			}
			if (angleProperty != null) {
				body.angle = owner.getProperty(angleProperty, body.angle);
				_angle = body.angle;
			}
			body.wakeUp();
		}
		this.enabled = val;
		if (!enabled) {
			angularVelocity = 0;
			xForce = 0;
			yForce = 0;
			xVelocity = 0;
			yVelocity = 0;
		}
		return val;
	}
	
	function get_shapeType () :ShapeType
	{
		return _shapeType;
	}
	
	function set_shapeType (shape) :ShapeType
	{
		com.pblabs.engine.debug.Profiler.enter("set_shapeType");
		if (Type.enumEq(_shapeType, shape) && body != null) {
			com.pblabs.engine.debug.Profiler.exit("set_shapeType");
			return shape;
		}
		_shapeType = shape;
		//Destroy the old body, create a new one
		destroyBody();
		if (_shapeType == null) {
			com.pblabs.engine.debug.Profiler.exit("set_shapeType");
			return null;
		}
		if (parent == null || parent.world == null) {
			org.transition9.util.Log.info("No parent when setting shapeType");
			com.pblabs.engine.debug.Profiler.exit("set_shapeType");
			return _shapeType;
		}
		org.transition9.util.Assert.isNotNull(parent, "No parent");
		org.transition9.util.Assert.isNotNull(parent.world, "No world on parent");
		
		var initialX = 0.0;//owner.getProperty(xProperty, 0);// / parent.scale;
		var initialY = 0.0;//owner.getProperty(yProperty, 0);// / parent.scale;
		
		var shapeData :ShapeData;
		switch (_shapeType) {
			case CIRCLE(radius, def) :
				var sd = new CircleData(0.1, radius);
				// trace("radius=" + radius);
				sd.x = 0;
				sd.y = 0;
				sd.r = 0;
				shapeData = sd; 
			case BOX(w, h, def) :
				var sd = new BoxData(0.1, w, h);
				sd.x = 0;
				sd.y = 0;
				sd.r = 0;
				shapeData = sd; 
			case FIXED_BOX(x, y, w, h, def):
				var boxData = new BoxData(0, w, h, false, null);
				initialX = x;
				initialY = y;
				shapeData = boxData; 
		}
		
		var initialAngle = owner.getProperty(angleProperty, 0);
		var bd = new RigidBodyData(initialX, initialY, initialAngle);
		org.transition9.util.Assert.isNotNull(bd, "No rigid body data");
		org.transition9.util.Assert.isNotNull(shapeData, "No shapeData");
		
		body = parent.world.createBody(bd);
		body.userData = this;
		body.createShape(shapeData);
		org.transition9.util.Assert.isNotNull(body);
		set_mass(_mass);
		updateCollisionData();
		com.pblabs.engine.debug.Profiler.exit("set_shapeType");
		return _shapeType;
	}
	
	function destroyBody () :Void
	{
		org.transition9.util.Log.debug("");
		if (body != null) {
			body.free();
			body.userData = null;
			body = null;
		}
		_x = _y = _angle = 0;
		org.transition9.util.Log.debug("end");
	}
	
	#if debug
	override public function toString () :String
	{
		if (body == null) {
			return "null body";
		} else {
			return "[x=" + _x + ", y=" + _y + ", angle=" + _angle + ", isSleeping=" + de.polygonal.ds.BitFlags.hasf(body, de.polygonal.motor.dynamics.RigidBody.SLEEPING) + ", speed=" + speed + "]";// "\n			body=" + body + "]";
		}
	}
	#end
}
