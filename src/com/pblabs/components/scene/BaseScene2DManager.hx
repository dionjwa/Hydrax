/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.MathUtil;
import com.pblabs.util.Preconditions;
using com.pblabs.util.IterUtil;

/**
  * Layers are arranged: smaller index is behind.
  */
@sets("Scene2DManager")
class BaseScene2DManager<Layer :BaseScene2DLayer<Dynamic, Dynamic>> extends NodeComponent<Dynamic, Layer>,
	implements haxe.rtti.Infos, implements IScene2D
{
	@inject
	public var sceneView(get_sceneView, set_sceneView) :SceneView;
	
	@editor({ui:"UpdatingLabel"})
	public var zoom(get_zoom, set_zoom) :Float;
	public var sceneBounds(get_sceneBounds, set_sceneBounds) :Rectangle;
	public var layerCount(get_layerCount, never) :Int;
	@editor({ui:"UpdatingLabel"})
	public var x (get_x, set_x) :Float;
	@editor({ui:"UpdatingLabel"})
	public var y (get_y, set_y) :Float;
	@editor({ui:"UpdatingLabel"})
	public var rotation (get_rotation, set_rotation) :Float;
	
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
	 * How the scene is aligned relative to its position property.
	 *
	 * @see SceneAlignment
	 * @see position
	 */
	public var sceneAlignment :SceneAlignment;

	public function new ()
	{
		super();
		zoomMax = 100;
		zoomMin = 0;
		sceneAlignment = SceneAlignment.CENTER;
		_currentViewRect = new Rectangle();
		_zoom = 1.0;
		_rotation = 0;
		_position = new Vector2();
		_transformDirty = false;
	}
	
	public function addLayer <T>(cls :Class<T>, layerName :String, ?registerAsManager :Bool = true) :T
	{
		com.pblabs.util.Assert.isNotNull(context);
		var layer = context.allocate(cls);
		com.pblabs.util.Assert.isTrue(Std.is(layer, BaseScene2DLayer), "Layer class " + cls + " is not a BaseScene2DLayer");
		
		cast(layer, BaseScene2DLayer<Dynamic, Dynamic>).parentProperty = PBUtil.componentProp(this);
		owner.addComponent(cast(layer, IEntityComponent), layerName);
		if (registerAsManager) {
			context.registerManager(cast(BaseScene2DLayer), layer, layerName, true);
		}
		return layer;
	}
	
	/** Calls onFrame on this and all children to make sure they're in the right place on the first frame */
	public function update () :Void
	{
		if (Std.is(this, IAnimatedObject)) {
			cast(this, IAnimatedObject).onFrame(0);
		}
		if (children != null) {
			for (layer in children) {
				if (Std.is(layer, IAnimatedObject)) {
					cast(layer, IAnimatedObject).onFrame(0);
				}
				if (layer.children != null) {
					for (c in layer.children) {
						if (Std.is(c, IAnimatedObject)) {
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
		return children.indexOf(layer);
	}
	
	public function setLayerIndex (layer :Layer, index :Int) :Void
	{
		Preconditions.checkNotNull(layer, "Null layer");
		Preconditions.checkPositionIndex(index, children.length, "Layer index out of bounds");
		children.remove(layer);
		children.insert(index, layer);
	}

	override function childAdded (c :Layer) :Void
	{
		com.pblabs.util.Log.debug("adding scene layer " + c);
		super.childAdded(c);
		_transformDirty = true;
	}
	
	override function childRemoved (c :Layer) :Void
	{
		super.childRemoved(c);
		com.pblabs.util.Log.debug("removing scene layer " + c);
		_transformDirty = true;
	}

	public function getTopLayer () :Layer
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
		super.onAdd();	  
		sceneView = context.getManager(SceneView);
		com.pblabs.util.Assert.isNotNull(sceneView, "No SceneView"); 
	}

	override function onRemove () :Void
	{
		super.onRemove();
		_sceneView == null;
	}
	
	function get_layerCount () :Int
	{
		return children != null ? children.length : 0;
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
	
	var _position :Vector2;
	var _zoom :Float;
	var _rotation :Float;
	var _transformDirty :Bool;
	
	/** The view of the scene is always enclosed in the bounds */
	var _sceneBounds :Rectangle;
	var _sceneView :SceneView;
	var _currentViewRect :Rectangle;

	
	public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
	static var EMPTY_ARRAY :Array<Dynamic> = [];
	
	#if (debug || editor)
	public function toString () :String
	{
	    return owner != null ? owner.name : name;
	}
	#end
}
