/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.motor.dynamics;

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DLL;
import de.polygonal.ds.DLLNode;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.data.BoxData;
import de.polygonal.motor.data.MassData;
import de.polygonal.motor.data.RigidBodyData;
import de.polygonal.motor.data.ShapeData;
import de.polygonal.motor.dynamics.contact.ContactEdge;
import de.polygonal.motor.dynamics.joint.JointEdge;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.World;
import de.polygonal.motor.WorldEvent;

using de.polygonal.ds.BitFlags;

class RigidBody
{
	inline public static var FROZEN         = Bits.BIT_02;
	inline public static var ISLAND         = Bits.BIT_03;
	inline public static var SLEEPING       = Bits.BIT_04;
	inline public static var ALLOW_SLEEP    = Bits.BIT_05;
	inline public static var BULLET         = Bits.BIT_06;
	inline public static var NO_ROTATION    = Bits.BIT_07;
	inline public static var STATIC         = Bits.BIT_09;
	inline public static var DYNAMIC        = Bits.BIT_10;
	inline public static var STACK_ANALYSIS = Bits.BIT_11;
	inline public static var SCRIPTED       = Bits.BIT_12;
	inline static var FREED = Bits.BIT_13;
	
	/** Application specific data. */
	public var userData:Dynamic;
	
	/** The world in which the body lives. */
	public var world(default, null):World;
	
	/** The next body in the island. */
	public var next:RigidBody;
	
	/** A doubly linked list of all attached shapes. */
	public var shapeList:DLL<AbstractShape>;
	/** A doubly linked list of all contact constraints. */
	public var contactList:ContactEdge;
	/** A doubly linked list of all attached joints. */
	public var jointList:JointEdge;
	
	/** The linear velocity of the center of mass, x-coordinate. */
	public var vx:Float;
	/** The linear velocity of the center of mass, y-coordinate. */
	public var vy:Float; 
	/** The angular velocity in radians per second. */
	public var w:Float;
	/** The world force vector, usually in Newtons (N), x-coordinate */
	public var fx:Float;
	/** The world force vector, usually in Newtons (N), y-coordinate */
	public var fy:Float;
	/** The torque in N·m. */
	public var t:Float;
	
	/** The total mass of the body, usually in kilograms (kg). */
	public var mass(default, null):Float;
	/** The inverse mass (1 / getMass()). */
	public var invMass(default, null):Float;
	/** The central rotational inertia of the body, usually in kg-m^2 */
	public var I(default, null):Float;
	/** The inverse central rotational inertia (1 / inertia). */
	public var invI(default, null):Float;
	
	/** Linear damping coefficient in the range between 0 (no damping) and 1 (full damping). */
	public var linDamping:Float;
	/** Angular damping coefficient in the range between 0 (no damping) and 1 (full damping). */
	public var angDamping:Float;
	
	/** Swept motion for CCD. */
	public var sweep(default, null):Sweep;
	
	/** The world position of the center of mass. */
	public var worldCenter(_worldCenterGetter, never):Vec2;
	inline function _worldCenterGetter():Vec2 { return sweep.c; }
	
	/** The local position of the center of mass. */
	public var localCenter(_localCenterGetter, never):Vec2;
	inline function _localCenterGetter():Vec2 { return sweep.localCenter; }
	
	/** The world transform of the body origin. */
	public var TWorld(default, null):Mat32;
	//TODO cache and settter
	/** The world position of the origin (not necessarily the center of mass.) */
	public var origin(_originGetter, never):Vec2;
	inline function _originGetter():Vec2 { return TWorld.getPositionFromLocalToParentMatrix(_vTmp); }
	
	/**
	 * The world <b>x</b> position of the <b>origin</b> (not necessarily the center of mass).
	 * @throws de.polygonal.motor.WorldError The body has left the world bound.
	 */
	public var x(_xGetter, _xSetter):Float;
	inline function _xGetter():Float { return TWorld.tx; }
	inline function _xSetter(x:Float):Float
	{
		if (hasf(FROZEN)) throw WorldError.WorldBoundViolation;
		TWorld.tx = x;
		_syncSweepAfterT();
		if (!_syncShapesAfterT()) throw WorldError.WorldBoundViolation;
		return x;
	}
	
	/**
	 * The world <b>y</b> position of the <b>origin</b> (not necessarily the center of mass).
	 * @throws de.polygonal.motor.WorldError The body has left the world bound.
	 */
	public var y(_yGetter, _ySetter):Float;
	inline function _yGetter():Float { return TWorld.ty; }
	inline function _ySetter(x:Float):Float
	{
		if (hasf(FROZEN)) throw WorldError.WorldBoundViolation;
		TWorld.ty = x;
		_syncSweepAfterT();
		if (!_syncShapesAfterT()) throw WorldError.WorldBoundViolation;
		return x;
	}
	
	/**
	 * The current world rotation angle in radians.
	 * @throws de.polygonal.motor.WorldError The body has left the world bound.
	 */
	public var angle(_gangle, _sangle):Float;
	inline function _gangle():Float { return sweep.a; }
	function _sangle(x:Float):Float
	{
		if (hasf(FROZEN)) throw WorldError.WorldBoundViolation;
		TWorld.setAngle(x);
		_syncSweepAfterT();
		sweep.a0 = sweep.a = x;
		if (!_syncShapesAfterT()) throw WorldError.WorldBoundViolation;
		return x;
	}
	
	/** The first attached shape in the body's linked list of shapes. */
	public var shape(__shape, never):AbstractShape;
	inline function __shape():AbstractShape
	{
		var head = shapeList.head;
		return (head != null) ? head.val : null;
	}
	
	/** Is this a static body? A static body is a fixed object with an infinitive mass (the inverse mass is zero). */
	public var isStatic(_isStaticGetter, never):Bool;
	inline function _isStaticGetter():Bool { return hasf(RigidBody.STATIC); }
	
	/** Is this a dynamic body? A dynamic body is a non-fixed object with a mass greater than zero. */
	public var isDynamic(_isDynamicGetter, never):Bool;
	inline function _isDynamicGetter():Bool { return hasf(RigidBody.DYNAMIC); }
	
	/** Is This body sleeping? */
	public var isSleeping(_isSleepingGetter, never):Bool;
	inline function _isSleepingGetter():Bool { return hasf(RigidBody.SLEEPING); }
	
	/** The stack height which is the shortest distance to a fixed object. */
	public var stackHeight:Int;
	
	public var sleepTime:Float;
	
	var _bits:Int;
	var _node:DLLNode<RigidBody>;
	var _vTmp:Vec2;
	var _TTmp:Mat32;
	
	/** Creates a rigid body object from the <i>data</i> blueprint. */
	public function new(data:RigidBodyData, world:World)
	{
		shapeList = new DLL<AbstractShape>();
		
		userData   = data.userData;
		linDamping = data.linDamping;
		angDamping = data.angDamping;
		
		if (data.allowSleep)    setf(RigidBody.ALLOW_SLEEP);
		if (data.putToSleep)    setf(RigidBody.SLEEPING);
		if (data.fixedRotation) setf(RigidBody.NO_ROTATION);
		
		vx = vy = fx = fy = w = t = 0;
		sleepTime = 0;
		
		//don't allow rotation of axis aligned boxes
		for (shapeData in data.getShapeDataList())
		{
			if (Std.is(shapeData, BoxData))
			{
				if (cast(shapeData, BoxData).isAxisAligned)
					setf(RigidBody.NO_ROTATION);
			}
		}
		
		//initialize local->world transformation, sweep motion and mass properties
		TWorld = new Mat32();
		TWorld.setupLocalToParent(data.x, data.y, data.r);
		
		//setup sweep motion for CCD
		sweep = new Sweep();
		sweep.localCenter = data.massData.center.clone();
		sweep.t0 = 1.;
		sweep.a0 = sweep.a = data.r;
		_syncSweepAfterT();
		
		//mass and inertia
		invMass = I = invI = 0;
		mass = data.massData.mass;
		if (mass > 0) invMass = 1 / mass;
		if (!hasf(RigidBody.NO_ROTATION)) I = data.massData.I;
		if (I > 0) invI = 1 / invI;
		
		//update static/dynamic state
		var isStatic = mass == 0 && I == 0;
		setf(isStatic ? RigidBody.STATIC : RigidBody.DYNAMIC);
		
		//add the body to the world;
		//once added, the world takes control over the body's physical behaviour
		#if debug
		de.polygonal.core.util.Assert.assert(!world.bodyList.contains(this), "!world.getBodyList().contains(this)");
		#end
		
		this.world = world;
		_node = world.bodyList.prepend(this);
		
		//construct passed shapes
		if (data.getShapeDataList().length > 0)
		{
			for (shapeData in data.getShapeDataList())
				createShape(shapeData);
			setMassFromShapes();
			
			clrf(RigidBody.DYNAMIC | RigidBody.STATIC);
			setf((mass == 0 && I == 0) ? RigidBody.STATIC : RigidBody.DYNAMIC);
		}
		
		_vTmp = new Vec2();
		_TTmp = new Mat32();
	}
	
	public function free():Void
	{
		if (hasf(FREED)) return;
		setf(FREED);
		
		#if debug
		de.polygonal.core.util.Assert.assert(world != null, "_world != null");
		de.polygonal.core.util.Assert.assert(world.bodyList.contains(this), "_world.getBodyList().contains(this)");
		#end
		
		world.notify(WorldEvent.BODY_DESTROYED, this);
		
		//destroy attached joints
		var n = jointList;
		while (n != null)
		{
			var t = n;
			n = n.next;
			t.joint.free();
		}
		
		//destroy attached shapes; destroys broad-phase proxies and pairs,
		//leading to the destruction of contacts.
		for (shape in shapeList) shape.free();
		
		shapeList.free();
		shapeList = null;
		
		//unlink from world
		_node.unlink();
		_node = null;
		
		world       = null;
		next        = null;
		contactList = null;
		jointList   = null;
		sweep       = null;
		TWorld      = null;
		_vTmp       = null;
		_TTmp       = null;
		userData    = null;
	}
	
	/** Creates and attaches a new shape to this body. */
	public function createShape(shapeData:ShapeData):Void
	{
		var shape = Type.createInstance(shapeData.getShapeClass(), [shapeData, world, World.settings]);
		shapeList.prepend(shape);
		shape.body = this;
		shape.createProxy(world, TWorld);
		shape.updateSweepRadius(sweep.localCenter);
		_invalidateShapeT();
	}
	
	/** Sets the force vector and torque to zero. */
	inline public function clearForce()
	{
		fx = fy = t = 0;
	}
	
	/**
	 * Applies the specified force vector (<i>x</i>,<i>y</i>) to the center of mass,
	 * usually in Newtons (N). This wakes up the body.
	 */
	inline public function applyForce(x:Float, y:Float):Void
	{
		if (isSleeping) wakeUp();
		fx += x;
		fy += y;
	}
	
	/**
	 * Applies the specified force vector <i>fx</i>,<i>fy</i> at a world point <i>px</i>,<i>py</i>,
	 * usually in Newtons (N). If the world point is different from the center of mass, it will
	 * generate a torque as well and affect the angular velocity. This wakes up the body.
	 */
	inline public function applyForceAt(fx:Float, fy:Float, px:Float, py:Float):Void
	{
		applyForce(fx, fy);
		var c = sweep.c;
		t += Vec2Util.perpDot4(px - c.x, py - c.y, fx, fy);
	}
	/**
	 * Applies a <i>torque</i> about the z-axis (out of the screen), usually in N-m. This affects
	 * the angular velocity without affecting the linear velocity of the center of mass.
	 * This wakes up the body.
	 */
	inline public function applyTorque(torque:Float):Void
	{
		if (isSleeping) wakeUp();
		t += torque;
	}
	
	/** Sets the linear and angular velocity to zero. */
	inline public function clearImpulse()
	{
		vx = vy = w = 0;
	}
	
	/**
	 * Applies the specified impulse <i>x</i>,<i>y</i> at the center of mass, usually in
	 * N-seconds or kg-m/s. This immediately modifies the velocity and wakes up the body.
	 */
	inline public function applyImpulse(x:Float, y:Float):Void
	{
		if (isSleeping) wakeUp();
		vx += invMass * x;
		vy += invMass * y;
	}
	/**
	 * Applies the specified impulse <i>x</i>,<i>y</i> at the world point <i>px</i>,<i>py</i>,
	 * usually in N-seconds or kg-m/s. This immediately modifies the velocity and wakes up the body.
	 * It also modifies the angular velocity if the point of application is not at the center of mass.
	 */
	inline public function applyImpulseAt(ix:Float, iy:Float, px:Float, py:Float):Void
	{
		applyImpulse(ix, iy);
		var x = sweep.c.x;
		var y = sweep.c.y;
		w += invI * Vec2Util.perpDot4(px - sweep.c.x, py - sweep.c.y, ix, iy);
	}
	
	/**
	 * Transforms the object point (<i>x</i>,<i>y</i>) measured relative the the body's origin to world space.
	 * The method returns <i>out</i>, which stores the result.
	 */
	inline public function getWorldPoint(x:Float, y:Float, out:Vec2):Vec2
	{
		out.x = TWorld.mulx(x, y);
		out.y = TWorld.muly(x, y);
		return out;
	}
	/**
	 * Transforms the object direction (<i>x</i>,<i>y</i>) to world space.
	 * The method returns <i>out</i>, which stores the result.
	 */
	inline public function getWorldDirection(x:Float, y:Float, out:Vec2):Vec2
	{
		out.x = TWorld.mul22x(x, y);
		out.y = TWorld.mul22y(x, y);
		return out;
	}
	
	/**
	 * Transforms the world point (<i>x</i>,<i>y</i>) to the body's object space.
	 * The method returns <i>out</i>, which stores the result.
	 */
	inline public function getLocalPoint(x:Float, y:Float, out:Vec2):Vec2
	{
		out.x = TWorld.mulTx(x, y);
		out.y = TWorld.mulTy(x, y);
		return out;
	}
	/**
	 * Transforms the world direction (<i>x</i>,<i>y</i>) to the body's object space.
	 * The method returns <i>out</i>, which stores the result.
	 */
	inline public function getLocalDirection(x:Float, y:Float, out:Vec2):Vec2
	{
		out.x = TWorld.mul22Tx(x, y);
		out.y = TWorld.mul22Ty(x, y);
		return out;
	}
	
	/**
	 * Returns the world linear velocity of a world point (<i>x</i>,<i>y</i>) attached to the body.
	 * The method returns <i>out</i>, which stores the result.
	 */
	inline public function getLinearVelocityFromWorldPoint(x:Float, y:Float, out:Vec2):Vec2
	{
		var c = sweep.c;
		var dx = x - c.x;
		var dy = y - c.y;
		var t = Vec2Util.perpDot4(vx, vy, dx, dy);
		out.x = vx + t;
		out.y = vy + t;
		return out;
	}
	/**
	 * Returns the world linear velocity of an object point (<i>x</i>,<i>y</i>).
	 * The method returns <i>out</i>, which stores the result.
	 */
	inline public function getLinearVelocityFromLocalPoint(x:Float, y:Float, out:Vec2):Vec2
	{
		var p = getWorldPoint(x, y, out);
		return getLinearVelocityFromWorldPoint(p.x, p.y, out);
	}
	
	/**
	 * Make this body static (immovable).
	 * Use setMass() and setMassFromShapes() to make bodies dynamic.
	 */
	public function setStatic():Void
	{
		if (hasf(RigidBody.STATIC)) return;
		clrf(RigidBody.DYNAMIC);
		setf(RigidBody.STATIC);
		mass = invMass = I = invI = 0;
		_refreshProxies();
	}
	
	/** If <i>flag</i>=true, this body can fall to sleep, otherwise it stays awake. */
	public function setAllowSleep(flag:Bool):Void
	{
		if (flag)
			setf(RigidBody.ALLOW_SLEEP);
		else
		{
			clrf(RigidBody.ALLOW_SLEEP);
			wakeUp();
		}
	}
	
	/** If <i>flag</i>=true, this body is treated like a bullet for continuous collision detection. */
	public function setBullet(flag:Bool):Void
	{
		if (flag)
			setf(RigidBody.BULLET);
		else
			clrf(RigidBody.BULLET);
	}
	
	/** Wakes up this body so it will begin simulating. */
	public function wakeUp():Void
	{
		clrf(RigidBody.SLEEPING);
		sleepTime = 0;
	}
	
	/** Puts this body to sleep so it will stop simulating. This also sets the velocity to zero. */
	public function putToSleep():Void
	{
		setf(RigidBody.SLEEPING);
		sleepTime = 0;
		vx = vy = w = fx = fy = t = 0;
	}
	
	/**
	 * Sets the mass. Note that this changes the position of the center of mass. The inertia tensor
	 * is assumed to be relative to the center of mass. If <i>massData</i> is omitted, the mass of
	 * all attaches shapes is used to compute the body's mass.
	 */
	public function setMass(?massData:MassData):Void
	{
		if (massData == null)
			setMassFromShapes();
		else
		{
			invMass = 0;
			mass = massData.mass;
			if (mass > 0) invMass = 1 / mass;
			
			I = invI = 0;
			if (!hasf(RigidBody.NO_ROTATION))
			{
				I = massData.I;
				invI = 1 / I;
			}
			
			//adjust the center of mass in object and world coordinates
			sweep.localCenter.x = massData.center.x;
			sweep.localCenter.y = massData.center.y;
			_syncSweepAfterT();
			
			//center of mass changed; update sweep radii
			for (shape in shapeList) shape.updateSweepRadius(sweep.localCenter);
		}
		
		#if debug
		de.polygonal.core.util.Assert.assert(hasf(RigidBody.DYNAMIC | RigidBody.STATIC), "_bits.hasBits(RigidBody.DYNAMIC | RigidBody.STATIC)");
		#end
		
		//if the body type changed, refilter the broad-phase proxies.
		if (mass == 0 && I == 0)
		{
			if (isDynamic)
			{
				//changed from static->dynamic
				_refreshProxies();
				clrf(RigidBody.DYNAMIC);
				setf(RigidBody.STATIC);
			}
		}
		else
		{
			if (isStatic)
			{
				//changed from dynamic->static
				_refreshProxies();
				clrf(RigidBody.STATIC);
				setf(RigidBody.DYNAMIC);
			}
		}
	}
	
	/**
	 * Computes the mass properties from the attached shapes.
	 * Call this method after all shapes have been attached.
	 * If you attach or detach shapes later on, you may want to call this again.
	 * Note that this changes the C.O.M. position.
	 */
	public function setMassFromShapes():Void
	{
		mass = invMass = I = invI = 0;
		
		var center = new Vec2();
		
		//compute mass properties from shapes, each shape has its own density
		for (shape in shapeList)
		{
			var massData = shape.computeMass();
			mass += massData.mass;
			center.x += massData.mass * massData.center.x;
			center.y += massData.mass * massData.center.y;
			I += massData.I;
		}
		
		//compute the center of mass and shift the origin to the center of mass
		if (mass > 0)
		{
			invMass = 1 / mass;
			center.x *= invMass;
			center.y *= invMass;
		}
		
		if (I > 0 && !hasf(RigidBody.NO_ROTATION))
		{
			//center the inertia about the center of mass
			I -= mass * Vec2Util.dot2(center, center);
			#if debug
			de.polygonal.core.util.Assert.assert(I > 0, "I > 0");
			#end
			invI = 1 / I;
		}
		else
		{
			I = invI = 0;
		}
		
		//move center of mass and update sweep radii of all shapes
		sweep.localCenter.x = center.x;
		sweep.localCenter.y = center.y;
		_syncSweepAfterT();
		
		for (shape in shapeList) shape.updateSweepRadius(sweep.localCenter);
		
		//if the body type changed, refilter the broad-phase proxies
		if (mass == 0 && I == 0)
		{
			if (isDynamic)
			{
				clrf(RigidBody.DYNAMIC);
				setf(RigidBody.STATIC);
				
				//dynamic->static
				_refreshProxies();
			}
		}
		else
		{
			if (isStatic)
			{
				clrf(RigidBody.STATIC);
				setf(RigidBody.DYNAMIC);
				
				//static->dynamic
				_refreshProxies();
			}
		}
	}
	
	/**
	 * Sets the position of the body's origin and rotation (radians).
	 * This breaks any contacts and wakes the other bodies.
	 * @param x x position of the body's origin in world space (not necessarily the center of mass).
	 * @param y y position of the body's origin in world space (not necessarily the center of mass).
	 * @param r rotation angle of the body in radians.
	 * @return False if the movement put a shape outside the world. In this case the body is
	 * automatically frozen.
	 */
	public function transform(x:Float, y:Float, angle:Float):Bool
	{
		if (hasf(FROZEN)) return false;
		TWorld.setupLocalToParent(x, y, angle);
		_syncSweepAfterT();
		sweep.a0 = sweep.a = angle;
		return _syncShapesAfterT();
	}
	
	/** Syncronizes the body's transform with the sweep motion. */
	public function syncT():Void
	{
		var cx = sweep.localCenter.x;
		var cy = sweep.localCenter.y;
		TWorld.setAngle(sweep.a);
		TWorld.tx = sweep.c.x - TWorld.mul22x(cx, cy);
		TWorld.ty = sweep.c.y - TWorld.mul22y(cx, cy);
		_invalidateShapeT();
	}
	
	/**
	 * Synchronizes the attached shapes with the body's transform.
	 * @return True if all shapes were successfully syncronized (didn't escape the world bound).
	 */
	public function synchronizeShapes():Bool
	{
		var cx = sweep.localCenter.x;
		var cy = sweep.localCenter.y;
		_TTmp.setAngle(sweep.a0);
		_TTmp.tx = sweep.c0.x - _TTmp.mul22x(cx, cy);
		_TTmp.ty = sweep.c0.y - _TTmp.mul22y(cx, cy);
		_invalidateShapeT();
		
		var broadPhase = world.getBroadPhase();
		var inRange = true;
		for (shape in shapeList)
		{
			inRange = shape.synchronize(broadPhase, _TTmp, TWorld);
			if (!inRange) break;
		}
		
		if (!inRange)
		{
			setf(FROZEN);
			vx = vy = w = 0;
			for (shape in shapeList) shape.destroyProxy();
			return false;
		}
		
		return true;
	}
	
	/** Advance sweep motion to new safe time <i>t</i>. */
	inline public function advance(t:Float):Void
	{
		sweep.advance(t);
		sweep.c.x = sweep.c0.x;
		sweep.c.y = sweep.c0.y;
		sweep.a = sweep.a0;
		syncT();
	}
	
	/**
	 * This is used to prevent connected bodies from colliding.
	 * It may lie, depending on the collideConnected flag.
	 */
	inline public function isConnected(other:RigidBody):Bool
	{
		var b = false;
		var j = jointList;
		while (j != null)
		{
			if (j.other == other)
			{
				b = j.joint.collideConnected == false;
				break;
			}
			j = j.next;
		}
		return b;
	}
	
	inline function _refreshProxies():Void
	{
		//refreshes all shape proxies (removes/adds proxy)
		var node = shapeList.head;
		while (node != null)
		{
			node.val.refreshProxy(world);
			node = node.next;
		}
	}
	
	inline function _syncShapesAfterT():Bool
	{
		//syncronize all attached shapes after the world transform has been modified
		_invalidateShapeT();
		
		//syncronize all shape proxies
		var inRange = true;
		for (shape in shapeList)
		{
			inRange = shape.synchronize(world.getBroadPhase(), TWorld, TWorld);
			if (!inRange) break;
		}
		
		if (!inRange)
		{
			//freeze escaped shapes
			setf(RigidBody.FROZEN);
			vx = vy = w = 0;
			for (shape in shapeList) shape.destroyProxy();
		}
		
		return inRange;
	}
	
	inline function _syncSweepAfterT()
	{
		TWorld.mul(sweep.localCenter, sweep.c);
		sweep.c0.x = sweep.c.x;
		sweep.c0.y = sweep.c.y;
	}
	
	inline function _invalidateShapeT():Void
	{
		//forces recomputation of shape transformation
		var node = shapeList.head;
		while (node != null)
		{
			node.val.clrf(AbstractShape.T_SYNCED | AbstractShape.FEATURES_SYNCED);
			node = node.next;
		}
	}
}