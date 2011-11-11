/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.spatial.IBounded;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

import flash.geom.Matrix;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;
using com.pblabs.util.ArrayUtil;
using com.pblabs.util.StringUtil;

class BaseSceneComponent<Layer :BaseSceneLayer<Dynamic, Dynamic>> extends NodeComponent<Layer, Dynamic>,
		implements IInteractiveComponent, implements haxe.rtti.Infos, implements IBounded
{
	public var objectMask (get_objectMask, set_objectMask) :ObjectType;
	// public var layer (get_layer, null) :BaseSceneLayer<Dynamic, Dynamic>;
	public var layer (get_layer, null) :BaseSceneLayer<Dynamic, Dynamic>;
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var width (get_width, set_width) :Float;
	public var height (get_height, set_height) :Float;
	public var angle (get_angle, set_angle) :Float;
	public var scale (get_scale, set_scale) :Float;
	public var scaleX (get_scaleX, set_scaleX) :Float;
	public var scaleY (get_scaleY, set_scaleY) :Float;
	
	public var alpha (get_alpha, set_alpha) :Float;
	public var isTransformDirty (get_isTransformDirty, set_isTransformDirty) :Bool;
	
	public var zIndex (get_zIndex, set_zIndex) :Int;
	public var layerIndex (get_layerIndex, set_layerIndex) :Int;
	public var locationOffset (get_locationOffset, set_locationOffset) :XY;
	public var angleOffset (get_angleOffset, set_angleOffset) :Float;
	public var registrationPoint (get_registrationPoint, set_registrationPoint) :XY;
	public var bounds (get_bounds, set_bounds) :AABB2;
	public var visible (get_visible, set_visible) :Bool;
	
	/** Sometimes you need to control when the display object is added to the scene*/
	public var autoAddToScene :Bool;
	
	/** We will listen to the signals of this coordinates component. */
	public var spatialProperty :PropertyReference<SpatialComponent<Dynamic>>;
	
	var _x :Float;
	var _y :Float;
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
	// var _zIndexDirty :Bool;
	var _registrationPoint :XY;
	var _objectMask :ObjectType;
	var _bounds :AABB2;
	var _unscaledBounds :XY;
	var _visible :Bool;
	/** For physics engines and the like, where the x and y need to be translated  */
	public var localZoom :Float;
	
	var _transformMatrix :Matrix;
	
	public function new ()
	{
		super();
		setDefaults();
	}
	
	function setDefaults () :Void
	{
		localZoom = 1;
		_alpha = 1;
		_angle = 0;
		_angleOffset = 0;
		_bounds = new AABB2(0, 0, 1, 1);
		isTransformDirty = true;
		_layerIndex = 0;
		_layerIndexDirty = false;
		_locationOffset = new Vector2();
		objectMask = ObjectType.ALL;
		_registrationPoint = new Vector2(0, 0);
		_scaleX = 1;
		_scaleY = 1;
		_transformMatrix = new Matrix();
		_unscaledBounds = new Vector2(1, 1);
		_visible = true;
		_x = 0;
		_y = 0;
		_zIndex = -1;
		spatialProperty = SpatialComponent.P_SPATIAL;
		autoAddToScene = true;
	}
	
	/**
	 * Update the object's transform based on its current state. Normally
	 * called automatically, but in some cases you might have to force it
	 * to update immediately.
	 */
	public function updateTransform () :Void
	{
		if (!isTransformDirty) {
			return;
		}
		_transformMatrix.identity();
		_transformMatrix.scale(_scaleX, _scaleY);
		_transformMatrix.translate(-registrationPoint.x * _scaleX, - registrationPoint.y * _scaleY);
		_transformMatrix.rotate(_angle + _angleOffset);
		_transformMatrix.translate(_x * localZoom + _locationOffset.x * localZoom, _y * localZoom + _locationOffset.y * localZoom);
		isTransformDirty = false;
	}
	
	public function containsScreenPoint (pos :XY, mask :ObjectType) :Bool
	{
		com.pblabs.util.Assert.isNotNull(mask);
		com.pblabs.util.Assert.isNotNull(objectMask);
		if (!objectMask.and(mask)) {
			return false;
		}
		var scene :BaseSceneManager<Dynamic> = cast parent.scene;
		com.pblabs.util.Assert.isNotNull(scene);
		return containsWorldPoint(scene.translateScreenToWorld(pos), mask);
	}
	
	public function containsWorldPoint (pos :XY, mask :ObjectType) :Bool
	{
		if (!mask.and(objectMask)) {
			return false;
		}
		return de.polygonal.motor2.geom.inside.PointInsideAABB.test2(pos, bounds);
	}
	
	public function setLocation (loc :XY) :Void
	{
		set_x(loc.x);
		set_y(loc.y);
	}
	
	override function onReset () :Void
	{
		com.pblabs.engine.debug.Profiler.enter("basescene onReset");
		com.pblabs.engine.debug.Profiler.enter("super");
		super.onReset();
		com.pblabs.engine.debug.Profiler.exit("super");
		if (autoAddToScene) {
			Preconditions.checkNotNull(parentProperty, "parentProperty is null in " + com.pblabs.util.ReflectUtil.getClassName(this));
			com.pblabs.util.Assert.isNotNull(parent, com.pblabs.util.ReflectUtil.tinyClassName(this) + ".parent is null, prop=" + parentProperty);
		}
		
		var coords = spatialProperty != null ? owner.getProperty(spatialProperty) : null;
		com.pblabs.engine.debug.Profiler.enter("bindsignals");
		if (coords != null) {
			#if debug
			var bond = bindSignal(coords.signalerLocation, setLocation);
			bond.debugInfo = com.pblabs.util.ReflectUtil.tinyClassName(this);
			#else
			bindSignal(coords.signalerLocation, setLocation);
			#end
			bindSignal(coords.signalerAngle, set_angle);
			//Manually set the location on reseting: there may be discrepencies in timing
			//such that the listeners and values are inconsistant.  So manually reset location.
			setLocation(coords.position);
			angle = coords.angle;
		} else {
			com.pblabs.util.Log.info("No coords component found, you are on your own regarding updating Scene components " + com.pblabs.util.Log.getStackTrace());
		}
		com.pblabs.engine.debug.Profiler.exit("bindsignals");
		
		if (owner.getComponent(com.pblabs.components.base.AlphaComponent) != null) {
			bindSignal(owner.getComponent(com.pblabs.components.base.AlphaComponent).signaler, set_alpha);
		}
		
		com.pblabs.engine.debug.Profiler.enter("removing");
		if (!autoAddToScene) {
			removeFromParent();
		}
		com.pblabs.engine.debug.Profiler.exit("removing");
		//TODO: Bind scale component, not yet implemented
		_isTransformDirty = true;
		com.pblabs.engine.debug.Profiler.exit("basescene onReset");
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		//Reset defaults in case we are pooled
		setDefaults();
	}
	
	function get_layer () :BaseSceneLayer<Dynamic, Dynamic>
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
		_bounds.centerX = _x;
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
		_bounds.centerY = _y;
		return val;
	}
	
	function get_angle () :Float
	{
		return _angle;
	}
	
	function set_angle (val :Float) :Float
	{
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
		scaleX = val; 
		scaleY = val;
		return val;
	}
	
	function get_scaleX () :Float
	{
		return _scaleX;
	}
	
	function set_scaleX (val :Float) :Float
	{
		_scaleX = val;
		_isTransformDirty = true;
		_bounds.xmin = _x - (_scaleX * _unscaledBounds.x) / 2;
		_bounds.xmax = _x + (_scaleX * _unscaledBounds.x) / 2;
		return val;
	}
	
	function get_scaleY () :Float
	{
		return _scaleY;
	}
	
	function set_scaleY (val :Float) :Float
	{
		_scaleY = val;
		_isTransformDirty = true;
		_bounds.ymin = _y - (_scaleY * _unscaledBounds.y) / 2;
		_bounds.ymax = _y + (_scaleY * _unscaledBounds.y) / 2;
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
		return _bounds.intervalX;
	}
	
	function set_width (val :Float) :Float
	{
		com.pblabs.util.Assert.isTrue(val >= 0, "val=" + val + " " + com.pblabs.util.Log.getStackTrace());
		isTransformDirty = true;
		_bounds.xmin = _x - val / 2;
		_bounds.xmax = _x + val / 2;
		com.pblabs.util.Assert.isTrue(_unscaledBounds.x > 0, com.pblabs.util.Log.getStackTrace());
		_scaleX =_bounds.intervalX / _unscaledBounds.x;
		return val;
	}
	
	function get_height () :Float
	{
		return _bounds.intervalY;
	}
	
	function set_height (val :Float) :Float
	{
		com.pblabs.util.Assert.isTrue(val >= 0, "val=" + val);
		isTransformDirty = true;
		_bounds.ymin = _y - val / 2;
		_bounds.ymax = _y + val / 2;
		com.pblabs.util.Assert.isTrue(_unscaledBounds.y > 0);
		_scaleY =_bounds.intervalY / _unscaledBounds.y;
		return val;
	}
	
	function get_alpha () :Float
	{
		return _alpha;
	}
	
	function set_alpha (val :Float) :Float
	{
		_alpha = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_zIndex () :Int
	{
		return layer == null ? _zIndex : layer.children.indexOf(this);
	}
	
	function set_zIndex (val :Int) :Int
	{
		if (layer == null) {
			_zIndex = val;
		} else {
			_zIndex = Mathematics.clamp(val, 0, layer.children.length - 1);
			var curIndex = layer.children.indexOf(this);
			com.pblabs.util.Assert.isTrue(curIndex > -1);
			if (curIndex != _zIndex) {
				layer.children.splice(curIndex, 1);
				layer.children.insert(_zIndex, this);
				layer.zOrderDirty = true;
			}
		}
		return val;
	}
	
	function get_layerIndex () :Int
	{
		return _layerIndex;
	}
	
	function set_layerIndex (val :Int) :Int
	{
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
	
	function get_bounds () :AABB2
	{
		return _bounds;
	}
	
	function set_bounds (val :AABB2) :AABB2
	{
		throw "Cannot set bounds";
		return null;
	}
	
	function get_visible () :Bool
	{
		return _visible;
	}
	
	function set_visible (val :Bool) :Bool
	{
		_visible = val;
		return val;
	}
}
