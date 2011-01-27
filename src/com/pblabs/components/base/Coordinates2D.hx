package com.pblabs.components.base;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.geom.Vector2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.util.XMLUtil;

/**
  * 2D Coordinates2D (x, y, angle) that can be set to be a scaled version of another
  * Coordinates2D component.
  */
class Coordinates2D extends EntityComponent,
	implements ISerializable
{
	public var point(get_point, set_point) : Vector2;
	
	public var x (get_x, set_x) : Float;
	public var y (get_y, set_y) : Float;
	public var angle (get_angle, set_angle) : Float;
	
	public var signalerLocation (default, null) :Signaler<Vector2>;
	public var signalerAngle (default, null) :Signaler<Float>;
	
	public static var P_X :PropertyReference<Float> = new PropertyReference("@Coordinates2D.x");
	public static var P_Y :PropertyReference<Float> = new PropertyReference("@Coordinates2D.y");
	public static var P_POINT :PropertyReference<Vector2> = new PropertyReference("@Coordinates2D.point");
	public static var P_ANGLE :PropertyReference<Float> = new PropertyReference("@Coordinates2D.angle");
	public static var P_COORDINATES :PropertyReference<Coordinates2D> = new PropertyReference("@Coordinates2D");
	
	public function new() 
	{ 
		super();
		signalerAngle = new DirectSignaler(this);
		signalerLocation = new DirectSignaler(this);
		_vec = new Vector2();
		_vecForSignalling = new Vector2();
		_angle = 0;
	}

	function get_point ():Vector2
	{
		return _vec.clone();
	}

	function set_point (p :Vector2):Vector2
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
			dispatchLocation();
		}
		return val;
   }

	public function setLocation (xLoc :Float, yLoc :Float) :Void
	{
		com.pblabs.util.Assert.isFalse(Math.isNaN(xLoc), com.pblabs.util.Log.getStackTrace());
		com.pblabs.util.Assert.isFalse(Math.isNaN(yLoc), com.pblabs.util.Log.getStackTrace());
		if (_vec.x != xLoc || _vec.y != yLoc) {
			_vec.x = xLoc;
			_vec.y = yLoc;
			dispatchLocation();
		}
	}
	
	public function serialize (xml :XML) :Void
	{
		xml.createChild("x", _vec.x);
		xml.createChild("y", _vec.y);
		xml.createChild("angle", _angle);
	}
	
	public function deserialize (xml :XML, context :IPBContext) :Dynamic
	{
		_vec.x = xml.parseFloat("x");
		_vec.y = xml.parseFloat("y");
		_angle = xml.parseFloat("angle");
	}
	
	override function onRemove () :Void
	{
		_vec.x = 0;
		_vec.y = 0;
		_angle = 0;
		super.onRemove();
	}
	
	override function onReset () :Void
	{
		super.onReset();
		dispatchAll();
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
	
	var _vec :Vector2;
	var _vecForSignalling :Vector2;
	var _angle :Float;
	
	#if debug
	public function toString () :String
	{
		return "[x=" + x + ", y=" + y + ", angle=" + angle + "]";
	}
	
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		com.pblabs.util.Assert.isFalse(signalerLocation.isListenedTo);
		com.pblabs.util.Assert.isFalse(signalerAngle.isListenedTo);
	}
	#end
}
