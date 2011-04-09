/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
 #if !nodejs
package com.pblabs.components.scene2D;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.MathUtil;
import com.pblabs.util.Preconditions;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.IterUtil;
using com.pblabs.util.StringUtil;

/**
  * Layers are arranged :smaller index is behind.
  */
@sets("SceneManager")
class BaseSceneManager<Layer :BaseSceneLayer<Dynamic, Dynamic>> extends NodeComponent<SceneManagerList, Layer>,
	implements haxe.rtti.Infos, implements IScene2D
{
	@inject
	public var sceneView(get_sceneView, set_sceneView) :SceneView;
	
	@editor({ui :"UpdatingLabel"})
	public var zoom(get_zoom, set_zoom) :Float;
	public var sceneBounds(get_sceneBounds, set_sceneBounds) :Rectangle;
	public var layerCount(get_layerCount, never) :Int;
	@editor({ui :"UpdatingLabel"})
	public var x (get_x, set_x) :Float;
	@editor({ui :"UpdatingLabel"})
	public var y (get_y, set_y) :Float;
	@editor({ui :"UpdatingLabel"})
	public var rotation (get_rotation, set_rotation) :Float;
	
	public var index :Int;
	
	/**
	 * Maximum allowed zoom level.
	 *
	 * @see zoom
	 */
	public var zoomMax :Float;
	/**
	 * Minimum allowed zoom level.
	 *
	 * @see zoom
	 */
	public var zoomMin :Float;

	/**
	 * How the.scene2D.is aligned relative to its position property.
	 *
	 * @see SceneAlignment
	 * @see position
	 */
	public var sceneAlignment (get_sceneAlignment, set_sceneAlignment) :SceneAlignment;
	function get_sceneAlignment () :SceneAlignment
	{
		return _sceneAlignment;
	}
	function set_sceneAlignment (val :SceneAlignment) :SceneAlignment
	{
		_sceneAlignment = val;
		_transformDirty = true;
		return val;
	}
	
	var _position :XY;
	var _zoom :Float;
	var _rotation :Float;
	var _transformDirty :Bool;
	
	/** The view of the.scene2D.is always enclosed in the bounds */
	var _sceneBounds :Rectangle;
	var _sceneAlignment :SceneAlignment;
	var _sceneView :SceneView;
	var _currentViewRect :Rectangle;

	

	public function new ()
	{
		super();
		initVars();
	}
	
	function initVars () :Void
	{
		zoomMax = 300;
		zoomMin = 0.001;
		_sceneAlignment = SceneAlignment.CENTER;
		_currentViewRect = new Rectangle();
		_zoom = 1.0;
		_rotation = 0;
		_position = new Vector2();
		// _transformDirty = false;
		parentProperty = SceneManagerList.PROP;
		_sceneView = null;
		_sceneBounds = null;
	}
	
	public function addLayer (?layerName :String = null, ?cls :Class<Dynamic> = null, ?registerAsManager :Bool = false) :BaseSceneLayer<Dynamic, Dynamic>
	{
		com.pblabs.util.Assert.isNotNull(context);
		
		//Get the order of the children first
		var childrenCopy = children.copy();
		
		if (layerName.isBlank()) {
			if (children.length == 0) {
				layerName = SceneUtil.DEFAULT_LAYER_NAME;
			} else {
				layerName = SceneUtil.DEFAULT_LAYER_NAME + (children.length + 1);
			}
		}
		
		//Check for existing layers with the same name, maybe we could do something other than throw an error?
		for (l in children	) {
			if (l.name == layerName) {
				throw "Existing layer with default name=" + layerName;
			}
		}
		
		//Use default class is none is given
		if (cls == null) {
			cls = SceneUtil.LAYER_CLASS;
		}
		
		var layer = context.allocate(cls);
		//Check compatability
		com.pblabs.util.Assert.isTrue(Std.is(layer, SceneUtil.LAYER_CLASS), "Layer class " + cls + " is not a " + SceneUtil.LAYER_CLASS);
		var layerCast :com.pblabs.components.manager.NodeComponent<Dynamic, Dynamic> = cast layer;
		layerCast.parentProperty = PBUtil.componentProp(this);
		owner.addComponent(cast(layer, IEntityComponent), layerName);
		if (registerAsManager) {
			context.registerManager(SceneUtil.LAYER_CLASS, layer, layerName, true);
		}
		
		//Put the children in the previous order
		childrenCopy.push(cast layer);
		for (i in 0...childrenCopy.length) {
			setLayerIndex(childrenCopy[i], i);
		}
		return cast layer;
	}
	
	/** Calls onFrame on this and all children to make sure they're in the right place on the first frame */
	public function update () :Void
	{
		#if cpp
		if (com.pblabs.util.ReflectUtil.is(this, "com.pblabs.engine.time.IAnimatedObject")) {
		#else
		if (Std.is(this, IAnimatedObject)) {
		#end
			cast(this, IAnimatedObject).onFrame(0);
		}
		if (children != null) {
			for (layer in children) {
				#if cpp
				if (com.pblabs.util.ReflectUtil.is(layer, "com.pblabs.engine.time.IAnimatedObject")) {
				#else
				if (Std.is(layer, IAnimatedObject)) {
				#end
					cast(layer, IAnimatedObject).onFrame(0);
				}
				if (layer.children != null) {
					for (c in layer.children) {
						#if cpp
						if (com.pblabs.util.ReflectUtil.is(c, "com.pblabs.engine.time.IAnimatedObject")) {
						#else
						if (Std.is(c, IAnimatedObject)) {
						#end
							cast(c, IAnimatedObject).onFrame(0);
						}
					}
				}
			}
		}
	}

	function isLayer (name :String) :Bool
	{
		return getLayer(name) != null;
	}

	public function getLayerAt (idx :Int) :Layer
	{
		return children[idx];
	}
	
	public function getLayerIndex (layer :Layer) :Int
	{
		com.pblabs.util.Assert.isTrue(children.indexOf(layer) >= 0 && children.indexOf(layer) < children.length);
		return children.indexOf(layer);
	}
	
	public function setLayerIndex (layer :Layer, index :Int) :Void
	{
		Preconditions.checkNotNull(layer, "Null layer");
		Preconditions.checkPositionIndex(index, children.length, "Layer index out of bounds");
		children.remove(layer);
		children.insert(index, layer);
	}
	
	public function setLocation (loc :XY) :Void
	{
		set_x(loc.x);
		set_y(loc.y);
	}

	override function childAdded (c :Layer) :Void
	{
		com.pblabs.util.Log.debug("adding.scene2D.layer " + c);
		super.childAdded(c);
		_transformDirty = true;
	}
	
	override function childRemoved (c :Layer) :Void
	{
		super.childRemoved(c);
		com.pblabs.util.Log.debug("removing.scene2D.layer " + c);
		_transformDirty = true;
	}

	public function getTopLayer () :BaseSceneLayer<Dynamic, Dynamic>
	{
		if (children.length > 0) {
			return children[children.length - 1];
		}
		return null;
	}

	public function getLayer (layerName :String) :Layer
	{
		for (layer in children) {
			if (null != layer && layer.name == layerName) {
				return layer;
			}
		}
		return null;
	}

	override function onAdd () :Void
	{
		// Check for SceneManagerList, add and register if there is none.
		if (context.getManager(SceneManagerList) == null) {
			var sceneList = com.pblabs.engine.util.PBUtil.addSingletonComponent(context, SceneManagerList, 
				SceneManagerList.NAME + ":" + context.name);
			context.registerManager(SceneManagerList, sceneList, null, true);
			com.pblabs.util.Assert.isNotNull(context.getManager(SceneManagerList), "No SceneManagerList after adding one???");
		}
		
		parentProperty = context.getManager(com.pblabs.components.scene2D.SceneManagerList).entityProp(); 
		super.onAdd();	  
		sceneView = context.getManager(SceneView);
		com.pblabs.util.Assert.isNotNull(sceneView, "No SceneView");
	}
	
	override function onReset () :Void
	{
		super.onReset();
		var spatial = owner.getComponent(SpatialComponent);
		if (spatial != null) {
			bindSignal(spatial.signalerLocation, setLocation);
		} //No spatial component means no panning 
		
		var pb :com.pblabs.engine.core.PBContext = cast context;
		#if debug
		_debugcontext = pb;
		#end
		this.bindVoidSignal(pb.signalEnter, attach);
		this.bindVoidSignal(pb.signalExit, detach);
	}

	override function onRemove () :Void
	{
		super.onRemove();
		detach();
		initVars();
	}
	
	function get_layerCount () :Int
	{
		return children != null ? children.length :0;
	}
	
	function get_x () :Float
	{
		return _position.x;
	}
	
	function set_x (newX :Float) :Float
	{
		if (_position.x == newX) {
			return newX;
		}
		_position.x = newX;
		_transformDirty = true;
		return newX;
	}
	
	function get_y () :Float
	{
		return _position.y;
	}

	function set_y (newY :Float) :Float
	{
		if (_position.y == newY) {
			return newY;
		}
		_position.y = newY;
		_transformDirty = true;
		return newY;
	}

	function get_sceneBounds () :Rectangle
	{
		return _sceneBounds;
	}

	function set_sceneBounds (value :Rectangle) :Rectangle
	{
		_sceneBounds = value;
		return value;
	}

	function get_sceneView () :SceneView
	{
		return _sceneView;
	}

	function set_sceneView (value :SceneView) :SceneView
	{
		_sceneView = value;
		_transformDirty = true;
		return value;
	}

	function get_zoom () :Float
	{
		return _zoom;
	}

	function set_zoom (value :Float) :Float
	{
		// Make sure our zoom level stays within the desired bounds
		value = MathUtil.fclamp(value, zoomMin, zoomMax);
		if (_zoom == value) {
			return _zoom;
		}
		_zoom = value;
		_transformDirty = true;
		return value;
	}
	
	function get_rotation () :Float
	{
		return _rotation;
	}
	
	function set_rotation (val :Float) :Float
	{
		_rotation = val;
		_transformDirty = true;
		return val;
	}
	
	//Override
	function attach () :Void
	{
		
	}
	
	function detach () :Void
	{
		
	}
	
	public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
	static var EMPTY_ARRAY :Array<Dynamic> = [];
	
	#if (debug || editor)
	public function toString () :String
	{
		return owner != null ? owner.name :name;
	}
	
	var _debugcontext :com.pblabs.engine.core.IPBContext;
	#end
}
#end
