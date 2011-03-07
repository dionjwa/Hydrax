/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.spatial;

import com.pblabs.components.manager.INodeChild;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.geom.Vector2;

import de.polygonal.motor2.geom.inside.PointInsideAABB;
import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.geom.VectorTools;
using com.pblabs.util.XMLUtil;

/**
 * Very basic spatial component that exists at a position. 
 */ 
class SpatialComponent extends EntityComponent,
	implements ISpatialObject2D, implements INodeChild<ISpatialManager2D>
{
	inline public static var NAME :String = "ISpatialObject2D";
	public static var P_X :PropertyReference<Float> = new PropertyReference("@" + NAME + ".x");
	public static var P_Y :PropertyReference<Float> = new PropertyReference("@" + NAME + ".y");
	public static var P_POINT :PropertyReference<XY> = new PropertyReference("@" + NAME + ".position");
	public static var P_ANGLE :PropertyReference<Float> = new PropertyReference("@" + NAME + ".angle");
	public static var P_SPATIAL :PropertyReference<SpatialComponent> = new PropertyReference("@" + NAME);
	
	public static function getLocation (c :IEntity) :XY	
	{
	    return c.getComponent(SpatialComponent).position;
	}
	
	public static function addToEntity (e :IEntity) :SpatialComponent
	{
		com.pblabs.util.Assert.isNotNull(e);
		com.pblabs.util.Assert.isNotNull(e.context);
		var s = e.context.allocate(SpatialComponent);
		e.addComponent(s, NAME);
		return s;
	}
	
	
	public var position (get_point, set_point) :XY;
	public var point (get_point, set_point) :XY;
	public var parent :ISpatialManager2D;
	public var x (get_x, set_x) : Float;
	public var y (get_y, set_y) : Float;
	public var angle (get_angle, set_angle) : Float;
	public var objectMask(get_objectMask, set_objectMask) :ObjectType;
	public var worldExtents(get_worldExtents, set_worldExtents) :AABB2;
	
	public var signalerLocation (default, null) :Signaler<XY>;
	public var signalerAngle (default, null) :Signaler<Float>;
	
	/**
	 * If set, a SpriteRenderComponent we can use to fulfill point occupied
	 * tests.
	 */
	#if (flash || js)
	public var spriteForPointChecks :com.pblabs.components.scene.BaseSceneComponent<com.pblabs.components.scene.BaseSceneLayer<Dynamic, Dynamic>>;
	#end
	var _objectMask :ObjectType;
	var _vec :XY;
	var _vecForSignalling :XY;
	var _angle :Float;
	var _worldAABB :AABB2;
	
	public function new() 
	{ 
		super();
		signalerAngle = new DirectSignaler(this);
		signalerLocation = new DirectSignaler(this);
		_vec = new Vector2();
		_vecForSignalling = new Vector2();
		_angle = 0;
	}

	function get_point ():XY
	{
		return _vec.clone();
	}

	function set_point (p :XY):XY
	{
		setLocation(p.x, p.y);
		return p;
   }

   	function get_angle () :Float
	{
		return _angle;
	}
	
	function set_angle (val :Float) :Float
	{
		if (_angle != val) {
			_angle = val;
			dispatchAngle();
		}
		return val;
	}
	
	function get_x ():Float
	{
		return _vec.x;
	}

	function set_x (val :Float):Float
	{
		// com.pblabs.util.Assert.isFalse(Math.isNaN(val), com.pblabs.util.Log.getStackTrace());
		if (_vec.x != val) {
			_vec.x = val;
			updateWorldAABB();			
			dispatchLocation();
		}
		return val;
   }

	function get_y ():Float
	{
		return _vec.y;
	}

	function set_y (val :Float):Float
	{
		// com.pblabs.util.Assert.isFalse(Math.isNaN(val), com.pblabs.util.Log.getStackTrace());
		if (_vec.y != val) {
			_vec.y = val;
			updateWorldAABB();
			dispatchLocation();
		}
		return val;
   }

	public function setLocation (xLoc :Float, yLoc :Float) :Void
	{
		// com.pblabs.util.Assert.isFalse(Math.isNaN(xLoc), com.pblabs.util.Log.getStackTrace());
		// com.pblabs.util.Assert.isFalse(Math.isNaN(yLoc), com.pblabs.util.Log.getStackTrace());
		if (_vec.x != xLoc || _vec.y != yLoc) {
			_vec.x = xLoc;
			_vec.y = yLoc;
			updateWorldAABB();
			dispatchLocation();
		}
	}
	
	public function serialize (xml :Xml) :Void
	{
		xml.createChild("x", _vec.x);
		xml.createChild("y", _vec.y);
		xml.createChild("angle", _angle);
	}
	
	public function deserialize (xml :Xml) :Dynamic
	{
		_vec.x = xml.parseFloat("x");
		_vec.y = xml.parseFloat("y");
		_angle = xml.parseFloat("angle");
	}
	
	override function onReset () :Void
	{
		super.onReset();
		com.pblabs.util.Assert.isTrue(name == NAME, com.pblabs.util.Log.getStackTrace());
		// spriteForPointChecks = null;
		#if (flash || js)
		if (spriteForPointChecks == null || !spriteForPointChecks.isRegistered) {
			spriteForPointChecks = cast owner.getComponent(com.pblabs.components.scene.BaseSceneComponent);
		}
		#end
		dispatchAll();
	}
	
	override function onRemove () :Void
	{
		#if debug
		debugOwnerName = owner.name;
		#end
		_vec.x = 0;
		_vec.y = 0;
		_angle = 0;
		_worldAABB = null;
		_objectMask = ObjectType.ALL;
		#if (flash || js)
		spriteForPointChecks = null;
		#end
		super.onRemove();
	}
	
	public function dispatchAngle () :Void
	{
		if (signalerAngle.isListenedTo) {
			signalerAngle.dispatch(_angle);
		}
	}
	
	public function dispatchLocation () :Void
	{
		if ( signalerLocation.isListenedTo) {
			_vecForSignalling.x = _vec.x;
			_vecForSignalling.y = _vec.y;
			signalerLocation.dispatch(_vecForSignalling);
		}
	}
	
	public function dispatchAll () :Void
	{
		dispatchAngle();
		dispatchLocation();
	}
	
	#if debug
	#if !neko
	public function toString () :String
	{
		return "[x=" + x + ", y=" + y + ", angle=" + angle + "]";
	}
	#end
	
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		com.pblabs.util.Assert.isFalse(signalerLocation.isListenedTo, debugOwnerName);
		com.pblabs.util.Assert.isFalse(signalerAngle.isListenedTo, debugOwnerName);
	}
	var debugOwnerName :String;
	#end
	
	function get_objectMask() :ObjectType
	{
		return _objectMask;
	}
	
	function set_objectMask (val :ObjectType) :ObjectType
	{
		_objectMask = val;
		return val;
	}
	
	function get_worldExtents() :AABB2
	{
		if (_worldAABB != null) {
			return _worldAABB;
		}
		#if (flash || js)
		else if (spriteForPointChecks != null) {
			return spriteForPointChecks.bounds;
		}
		#end
		else {
			return new AABB2(x, y, x + 1, y + 1);
		}
	}
	
	function set_worldExtents(val :AABB2) :AABB2
	{
		_worldAABB = val;
		return val;
	}
	
	/**
	 * Not currently implemented.
	 */
	// public function castRay (start :XY, end :XY, result :RayHitInfo, ?flags :ObjectType = null):Bool
	// {
	// 	return false;
	// }
	
	/**
	 * All points in our bounding box are occupied.
	 */
	public function containsWorldPoint (pos :XY, mask :ObjectType):Bool
	{
		//False if masks say so
		if (_objectMask != null && mask != null && !_objectMask.and(mask)) {
			return false;
		}
		
		if (_worldAABB != null) {
			return PointInsideAABB.test2(pos, _worldAABB);
			// return pos.x <= _worldAABB.xmax && pos.x >= _worldAABB.xmin && pos.y <= _worldAABB.ymax && pos.y >= _worldAABB.ymin;
		}
		// OK, so pass it over to the sprite.
		#if (flash || js)
		if(spriteForPointChecks != null) {
			return spriteForPointChecks.containsWorldPoint(pos, mask);
		}
		#end
		
		throw "No AABB2";
		
		// com.pblabs.util.Assert.isNotNull(worldExtents, "No worldExtends for point checking");
		// // If no sprite then we just test our bounds.
		// var b = worldExtents;
		// return pos.x <= b.xmax && pos.x >= b.xmin && pos.y <= b.ymax && pos.y >= b.ymin;
	}
	
	inline function updateWorldAABB () :Void
	{
		if (_worldAABB != null) {
			_worldAABB.centerX = _vec.x;
			_worldAABB.centerY = _vec.y;
		}
	}
}
