/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.spatial;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.Constants;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.serialization.Serializer;

import de.polygonal.motor.geom.inside.PointInsideAABB;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using org.transition9.geom.Vec2Tools;
using org.transition9.util.XmlTools;

/**
 * Very basic spatial component that exists at a position. 
 */ 
class SpatialComponent<Manager:ISpatialManager2D<Dynamic>> extends NodeComponent
{
	public static function getLocation (c :IEntity) :Vec2
	{
	    return c.getComponent(SpatialComponent).position;
	}
	
	public static function addToEntity (e :IEntity) :SpatialComponent<Dynamic>
	{
		org.transition9.util.Assert.isNotNull(e);
		org.transition9.util.Assert.isNotNull(e.context);
		var s = e.context.allocate(SpatialComponent);
		e.addComponent(s, Constants.SPATIAL_NAME);
		return s;
	}
	
	public var position (get_point, set_point) :Vec2;
	public var point (get_point, set_point) :Vec2;
	public var x (get_x, set_x) : Float;
	public var y (get_y, set_y) : Float;
	public var angle (get_angle, set_angle) : Float;
	public var objectMask(get_objectMask, set_objectMask) :ObjectType;
	public var worldExtents(get_worldExtents, set_worldExtents) :AABB2;
	
	public var signalerLocation (default, null) :Signaler<Vec2>;
	public var signalerAngle (default, null) :Signaler<Float>;
	
	/**
	 * If set, a SpriteRenderComponent we can use to fulfill point occupied
	 * tests.
	 */
	#if (flash || js)
	public var spriteForPointChecks :IBounded;
	#end
	var _objectMask :ObjectType;
	var _vec :Vec2;
	var _vecForSignalling :Vec2;
	var _angle :Float;
	var _worldAABB :AABB2;
	
	public function new() 
	{ 
		super();
		signalerAngle = new DirectSignaler(this);
		signalerLocation = new DirectSignaler(this);
		setDefaults();
	}
	
	function setDefaults() :Void
	{
		_vec = new Vec2();
		_vecForSignalling = new Vec2();
		_angle = 0;
		_worldAABB = null;
		_objectMask = ObjectType.ALL;
		#if (flash || js)
		spriteForPointChecks = null;
		#end
	}

	function get_point ():Vec2
	{
		_vecForSignalling.x = _vec.x;
		_vecForSignalling.y = _vec.y;
		return _vecForSignalling;
	}

	function set_point (p :Vec2):Vec2
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
		if (_vec.y != val) {
			_vec.y = val;
			updateWorldAABB();
			dispatchLocation();
		}
		return val;
   }

	inline public function setLocation (xLoc :Float, yLoc :Float) :Void
	{
		x = xLoc;
		y = yLoc;
	}
	
	override public function serialize (xml :Xml) :Void
	{
		super.serialize(xml);
		xml.createChild("x", _vec.x, Serializer.serializeFloat);
		xml.createChild("y", _vec.y, Serializer.serializeFloat);
		xml.createChild("angle", _angle, Serializer.serializeFloat);
	}
	
	override public function deserialize (xml :Xml) :Dynamic
	{
		_vec.x = xml.parseFloat("x");
		_vec.y = xml.parseFloat("y");
		_angle = xml.parseFloat("angle");
		return super.deserialize(xml);
	}
	
	override function onReset () :Void
	{
		super.onReset();
		#if (flash || js)
		if (spriteForPointChecks == null || !spriteForPointChecks.isRegistered) {
			spriteForPointChecks = cast owner.getComponent(IBounded);
		}
		#end
		dispatchAll();
	}
	
	override function onRemove () :Void
	{
		setDefaults();
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
	
	inline public function dispatchAll () :Void
	{
		dispatchAngle();
		dispatchLocation();
	}
	
	#if (debug && !neko)
	override public function toString () :String
	{
		return "[x=" + x + ", y=" + y + ", angle=" + angle + "]";
	}
	#end
	
	#if debug
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		#if debug_hxhsl
			var sigs :Array<Signaler<Dynamic>> = cast [signalerLocation, signalerAngle]; 
			for (sig in sigs) {
				if (sig.isListenedTo) {
					for (b in sig.getBonds()) {
						trace("Stuck bond on " + debugOwnerName + "=" + b);
					}
					org.transition9.util.Assert.isFalse(sig.isListenedTo, debugOwnerName);
				}
			}
		#end
	}
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
	 * All points in our bounding box are occupied.
	 */
	public function containsWorldPoint (pos :Vec2, mask :ObjectType):Bool
	{
		//False if masks say so
		if (_objectMask != null && mask != null && !_objectMask.and(mask)) {
			return false;
		}
		
		if (_worldAABB != null) {
			return PointInsideAABB.test2(pos, _worldAABB);
		}
		// OK, so pass it over to the sprite.
		#if (flash || js)
		if(spriteForPointChecks != null) {
			return spriteForPointChecks.containsWorldPoint(pos, mask);
		}
		#end
		
		throw "No AABB2";
	}
	
	inline function updateWorldAABB () :Void
	{
		if (_worldAABB != null) {
			_worldAABB.centerX = _vec.x;
			_worldAABB.centerY = _vec.y;
		}
	}
}
