/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

import de.polygonal.motor2.geom.math.XY;

import flash.display.Scene;

using com.pblabs.components.scene.SceneUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;
using com.pblabs.util.StringUtil;

class BaseScene2DComponent<Layer :BaseScene2DLayer<Dynamic, Dynamic>> extends NodeComponent<Layer, Dynamic>,
		implements IInteractiveComponent, implements haxe.rtti.Infos
{
	public var objectMask (get_objectMask, set_objectMask) :ObjectType;
	public var layer (get_layer, null) :BaseScene2DLayer<Dynamic, Dynamic>;
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var width (get_width, set_width) :Float;
	public var height (get_height, set_height) :Float;
	public var angle (get_angle, set_angle) :Float;
	@editor({ui:"HUISlider", min:0})
	public var scale (get_scale, set_scale) :Float;
	public var scaleX (get_scaleX, set_scaleX) :Float;
	public var scaleY (get_scaleY, set_scaleY) :Float;
	
	public var alpha (get_alpha, set_alpha) :Float;
	public var isTransformDirty (get_isTransformDirty, set_isTransformDirty) :Bool;
	
	@editor({ui:"NumericStepper", min:0})
	public var zIndex (get_zIndex, set_zIndex) :Int;
	@editor({ui:"NumericStepper", min:0})
	public var layerIndex (get_layerIndex, set_layerIndex) :Int;
	public var locationOffset (get_locationOffset, set_locationOffset) :XY;
	public var angleOffset (get_angleOffset, set_angleOffset) :Float;
	public var registrationPoint (get_registrationPoint, set_registrationPoint) :XY;
	
	/** We will listen to the signals of this coordinates component. */
	public var spatialProperty :PropertyReference<SpatialComponent>;
	
	var _x :Float;
	var _y :Float;
	var _width :Float;
	var _height :Float;
	var _angle :Float;
	var _scaleX :Float;
	var _scaleY :Float;
	var _alpha :Float;
	var _isTransformDirty :Bool;
	var _layerIndex :Int;
	var _zIndex :Int;
	var _angleOffset :Float;
	var _locationOffset :XY;
	var _layerIndexDirty :Bool;
	var _zIndexDirty :Bool;
	var _registrationPoint :XY;
	var _objectMask :ObjectType;
	
	public function new ()
	{
		super();
		setDefaultVars();
	}
	
	function setDefaultVars () :Void
	{
		_x = 0;
		_y = 0;
		_angle = 0;
		_scaleX = 1;
		_scaleY = 1;
		_alpha = 1;
		_width = 0;
		_height = 0;
		_layerIndex = 0;
		_zIndex = 0;
		isTransformDirty = true;
		_locationOffset = new Vector2();
		_angleOffset = 0;
		_layerIndexDirty = true;
		_zIndexDirty = true;
		_registrationPoint = new Vector2(0, 0);
		//Sensible default
		spatialProperty = SpatialComponent.P_SPATIAL;
		objectMask = ObjectType.ALL;
	}
	
	public function containsScreenPoint (pos :XY, mask :ObjectType) :Bool
	{
		com.pblabs.util.Assert.isNotNull(mask);
		com.pblabs.util.Assert.isNotNull(objectMask);
		if (!objectMask.and(mask)) {
			return false;
		}
		var scene :BaseScene2DManager<Dynamic> = cast parent.scene;
		com.pblabs.util.Assert.isNotNull(scene);
		return containsWorldPoint(scene.translateScreenToWorld(pos), mask);
	}
	
	public function containsWorldPoint (pos :XY, mask :ObjectType) :Bool
	{
		if (!mask.and(objectMask)) {
			return false;
		}
		
		#if (flash || cpp)
		return RectangleTools.contains(x - (_width / 2 * _scaleX) - _locationOffset.x, 
			y -(_height / 2 * _scaleY) - _locationOffset.y, width * _scaleX, height * _scaleY, pos, angle);
		#elseif js
		return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, pos, angle);
		#else
		throw "Not implemented";
		return false;
		#end
	}
	
	public function setLocation (loc :XY) :Void
	{
		// trace(owner.name + " loc=" + loc);
		set_x(loc.x);
		set_y(loc.y);
	}
	
	override function onReset () :Void
	{
		super.onReset();
		Preconditions.checkNotNull(parentProperty, "parentProperty is null");
		com.pblabs.util.Assert.isNotNull(parent, com.pblabs.util.ReflectUtil.tinyClassName(Type.getClass(this)) + ".parent is null, prop=" + parentProperty);
		
		var coords = spatialProperty != null ? owner.getProperty(spatialProperty) : null;
		
		if (coords != null) {
			bindSignal(coords.signalerLocation, setLocation);
			bindSignal(coords.signalerAngle, set_angle);
			//Manually set the location on reseting: there may be discrepencies in timing
			//such that the listeners and values are inconsistant.  So manually reset location.
			setLocation(coords.position);
			angle = coords.angle;
		} else {
			com.pblabs.util.Log.warn("No coords component found, you are on your own regarding updating Scene components " + com.pblabs.util.Log.getStackTrace());
		}
			
		//TODO: Bind scale component, not yet implemented
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		//Reset defaults in case we are pooled
		setDefaultVars();
	}
	
	function get_layer () :BaseScene2DLayer<Dynamic, Dynamic>
	{
		return cast parent;
	}
	
	function get_x () :Float
	{
		return _x;
	}
	
	function set_x (val :Float) :Float
	{
		_x = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_y () :Float
	{
		return _y;
	}
	
	function set_y (val :Float) :Float
	{
		_y = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_angle () :Float
	{
		return _angle;
	}
	
	function set_angle (val :Float) :Float
	{
		if (_angle == val) {
			return val;
		}
		_angle = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_scale () :Float
	{
		return _scaleX;
	}
	
	function set_scale (val :Float) :Float
	{
		if (_scaleX == val && _scaleY == val) {
			return val;
		}
		_scaleX = _scaleY = val;
		_isTransformDirty = true;
		return val;
	}
	
	function get_scaleX () :Float
	{
		return _scaleX;
	}
	
	function set_scaleX (val :Float) :Float
	{
		if (_scaleX == val) {
			return val;
		}
		_scaleX = val;
		_isTransformDirty = true;
		return val;
	}
	
	function get_scaleY () :Float
	{
		return _scaleY;
	}
	
	function set_scaleY (val :Float) :Float
	{
		if (_scaleY == val) {
			return val;
		}
		_scaleY = val;
		_isTransformDirty = true;
		return val;
	}
	
	function get_isTransformDirty () :Bool
	{
		return _isTransformDirty;
	}
	
	function set_isTransformDirty (val :Bool) :Bool
	{
		_isTransformDirty = val;
		return val;
	}
	
	function get_width () :Float
	{
		return _width;
	}
	
	function set_width (val :Float) :Float
	{
		_width = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_height () :Float
	{
		return _height;
	}
	
	function set_height (val :Float) :Float
	{
		_height = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_alpha () :Float
	{
		return _alpha;
	}
	
	function set_alpha (val :Float) :Float
	{
		if (_alpha == val) {
			return val;
		}
		_alpha = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_zIndex () :Int
	{
		return _zIndex;
	}
	
	function set_zIndex (val :Int) :Int
	{
		if (_zIndex == val) {
			return val;
		}
		_zIndex = val;
		_zIndexDirty = true;
		return val;
	}
	
	function get_layerIndex () :Int
	{
		return _layerIndex;
	}
	
	function set_layerIndex (val :Int) :Int
	{
		if (_layerIndex == val) {
			return val;
		}
		_layerIndex = val;
		_layerIndexDirty = true;
		return val;
	}
	
	function get_registrationPoint () :XY
	{
		return _registrationPoint;
	}
	
	function set_registrationPoint (val :XY) :XY
	{
		if (_registrationPoint.equals(val)) {
			return val;
		}
		_registrationPoint = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_locationOffset () :XY
	{
		return _locationOffset;
	}
	
	function set_locationOffset (val :XY) :XY
	{
		_locationOffset = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_angleOffset () :Float
	{
		return _angleOffset;
	}
	
	function set_angleOffset (val :Float) :Float
	{
		_angleOffset = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_objectMask () :ObjectType
	{
		return _objectMask;
	}
	
	function set_objectMask (val :ObjectType) :ObjectType
	{
		_objectMask = val;
		return val;
	}
}
