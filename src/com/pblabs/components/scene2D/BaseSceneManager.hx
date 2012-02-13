/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene2D.SceneTransformUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.util.PBUtil;
import org.transition9.geom.Rectangle;
import org.transition9.util.Preconditions;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

import hsl.haxe.Bond;
import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using org.transition9.util.IterUtil;
using org.transition9.util.StringUtil;

/**
  * Layers are arranged :smaller index is behind.
  */
@sets("SceneManager")
class BaseSceneManager extends NodeComponent,
	implements haxe.rtti.Infos, implements IScene2D
{
	@inject
	public var sceneView(get_sceneView, set_sceneView) :SceneView;
	
	public var zoom(get_zoom, set_zoom) :Float;
	public var zoomSignaler (default, null):Signaler<Float>;
	public var sceneBounds(get_sceneBounds, set_sceneBounds) :AABB2;
	public var layerCount(get_layerCount, never) :Int;
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var rotation (get_rotation, set_rotation) :Float;
	public var visibleArea (get_visibleArea, null) :AABB2;
	/** Default true.  Automatically  */
	public var autoSceneViewAttach (default, set_autoSceneViewAttach) :Bool;
	function set_autoSceneViewAttach (val :Bool) :Bool
	{
		this.autoSceneViewAttach = val;
		if (_autoSceneViewAttachBonds == null) {
			_autoSceneViewAttachBonds = [];
		}
		while (_autoSceneViewAttachBonds.length > 0) {
			_autoSceneViewAttachBonds.pop().destroy();
		}
		if (autoSceneViewAttach && isRegistered) {
			var pb :com.pblabs.engine.core.PBContext = cast context;
				_autoSceneViewAttachBonds.push(bindVoidSignal(pb.signalEnter, attach));
				_autoSceneViewAttachBonds.push(bindVoidSignal(pb.signalExit, detach));
		}
		return val;
	}
	var _autoSceneViewAttachBonds :Array<Bond>;
	
	public var visible (get_visible, set_visible) :Bool;
	var _visible :Bool;
	function get_visible () :Bool
	{
		return _visible;
	}
	
	function set_visible (val :Bool) :Bool
	{
		_transformDirty = true;
		_visible = val;
		return val;
	}
	
	public var defaultLayerClass (get_defaultLayerClass, null) :Class<Dynamic>;
	function get_defaultLayerClass () :Class<Dynamic>
	{
		org.transition9.util.Log.error("Subclasses override");
		return null;
	}
	
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
	 * How the scene is aligned relative to its position property.
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
	
	var _position :Vec2;
	var _zoom :Float;
	var _rotation :Float;
	var _transformDirty :Bool;
	
	/** The view of the scene is always enclosed in the bounds */
	var _sceneBounds :AABB2;
	var _sceneAlignment :SceneAlignment;
	var _sceneView :SceneView;
	var _currentViewRect :Rectangle;

	public function new ()
	{
		super();
		zoomSignaler = new DirectSignaler(this);
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
		_position = new Vec2();
		parentProperty = SceneManagerList.PROP;
		_sceneView = null;
		_sceneBounds = null;
		this.autoSceneViewAttach = true;
		_autoSceneViewAttachBonds = [];
		
		//Device specific
		#if js
		if (org.transition9.util.Device.isRetinaDisplay) {
			// _zoom = 2.0;
		}
		#end
	}
	
	public function addLayer (?layerName :String = null, ?cls :Class<Dynamic> = null, ?registerAsManager :Bool = false, 
		?startDetached :Bool = false) :BaseSceneLayer
	{
		org.transition9.util.Assert.isNotNull(context);
		
		//Get the order of the children first
		var childrenCopy = children.copy();
		
		var layer = createLayer(layerName, cls);//context.allocate(cls);
		var layerCast :com.pblabs.components.manager.NodeComponent = cast layer;
		
		if (!startDetached) {
			layerCast.parentProperty = PBUtil.componentProp(this);
			layerCast.addToParent();
		}
		
		if (registerAsManager) {
			// context.registerManager(SceneUtil.LAYER_CLASS, layer, layerName, true);
		}
		
		//Put the children in the previous order
		if (!startDetached) {
			childrenCopy.push(cast layer);
			for (i in 0...childrenCopy.length) {
				setLayerIndex(childrenCopy[i], i);
			}
		}
		return cast layer;
	}
	
	/**
	  * The layer starts detached.  Manual attachment necessary.
	  */
	public function createLayer (?layerName :String = null, ?cls :Class<Dynamic> = null) :BaseSceneLayer
	{
		//Use default class is none is given
		cls = cls == null ? defaultLayerClass : cls;
		org.transition9.util.Assert.isNotNull(cls, "Null Layer Class");
		
		var layer = context.allocate(cls);
		
		var layerCount = owner.getComponents(BaseSceneLayer).length;
		
		if (layerName.isBlank()) {
			if (layerCount == 0) {
				layerName = SceneConstants.DEFAULT_LAYER_NAME;
			} else {
				layerName = SceneConstants.DEFAULT_LAYER_NAME + (layerCount + 1);
			}
		}
		
		//Check for existing layers with the same name, maybe we could do something other than throw an error?
		for (l in owner) {
			if (l.name == layerName) {
				throw "Existing layer with default name=" + layerName;
			}
		}
		
		owner.addComponent(layer, layerName);
		return cast layer;
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
					for (c in cast(layer, NodeComponent).children) {
						if (Std.is(c, IAnimatedObject)) {
							cast(c, IAnimatedObject).onFrame(0);
						}
					}
				}
			}
		}
		#if flash
		flash.Lib.current.stage.invalidate();
		#end
	}

	function isLayer (name :String) :Bool
	{
		return getLayer(name) != null;
	}

	public function getLayerAt (idx :Int) :BaseSceneLayer
	{
		return children[idx];
	}
	
	public function getLayerIndex (layer :BaseSceneLayer) :Int
	{
		org.transition9.util.Assert.isTrue(children.indexOf(layer) >= 0 && children.indexOf(layer) < children.length);
		return children.indexOf(layer);
	}
	
	public function setLayerIndex (layer :BaseSceneLayer, index :Int) :Void
	{
		Preconditions.checkNotNull(layer, "Null layer");
		Preconditions.checkPositionIndex(index, children.length, "Layer index out of bounds");
		children.remove(layer);
		children.insert(index, layer);
	}
	
	public function setLocation (loc :Vec2) :Void
	{
		set_x(loc.x);
		set_y(loc.y);
	}

	override function childAdded (c :NodeComponent) :Void
	{
		org.transition9.util.Log.debug("adding scene layer " + c);
		super.childAdded(c);
		_transformDirty = true;
	}
	
	override function childRemoved (c :NodeComponent) :Void
	{
		super.childRemoved(c);
		org.transition9.util.Log.debug("removing scene layer " + c);
		_transformDirty = true;
	}

	public function getTopLayer () :BaseSceneLayer
	{
		if (children.length > 0) {
			return children[children.length - 1];
		}
		return null;
	}

	public function getLayer (layerName :String) :BaseSceneLayer
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
			org.transition9.util.Assert.isNotNull(context.getManager(SceneManagerList), "No SceneManagerList after adding one???");
		}
		
		parentProperty = context.getManager(com.pblabs.components.scene2D.SceneManagerList).entityProp(); 
		super.onAdd();	  
		sceneView = context.getManager(SceneView);
		org.transition9.util.Assert.isNotNull(sceneView, "No SceneView");
		//Custom attachment
		attach();
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
		set_autoSceneViewAttach(autoSceneViewAttach);
	}

	override function onRemove () :Void
	{
		super.onRemove();
		detach();
		initVars();
		while (_autoSceneViewAttachBonds.length > 0) {
			_autoSceneViewAttachBonds.pop().destroy();
		}
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
		constrainViewToBounds();
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
		constrainViewToBounds();
		return newY;
	}
	
	function constrainViewToBounds () :Void
	{
		if (_sceneBounds != null) {
			var visible = visibleArea;

			if (visible.minX < _sceneBounds.minX) {
				_position.x += visible.minX - _sceneBounds.minX;
			} else if (visible.maxX > _sceneBounds.maxX) {
				_position.x += visible.maxX - _sceneBounds.maxX;
			}
			
			if (visible.minY < _sceneBounds.minY) {
				_position.y += visible.minY - _sceneBounds.minY;
			} else if (visible.maxY > _sceneBounds.maxY) {
				_position.y += visible.maxY - _sceneBounds.maxY;
			}
		}
		_transformDirty = true;
	}

	function get_sceneBounds () :AABB2
	{
		return _sceneBounds;
	}
	
	function get_visibleArea () :AABB2
	{
		var area = new AABB2(0, 0, sceneView.width / _zoom, sceneView.height / _zoom);
		area.centerX = -x;
		area.centerY = -y;
		return area;
	}

	function set_sceneBounds (value :AABB2) :AABB2
	{
		org.transition9.util.Assert.isNotNull(sceneView, ' sceneView is null');
		org.transition9.util.Assert.isTrue(value.intervalX >= sceneView.width, "value.intervalX >= sceneView.width");
		org.transition9.util.Assert.isTrue(value.intervalY >= sceneView.height, "value.intervalY >= sceneView.height");
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
		value = Mathematics.fclamp(value, zoomMin, zoomMax);
		if (_zoom == value) {
			return _zoom;
		}
		_zoom = value;
		constrainViewToBounds();
		zoomSignaler.dispatch(_zoom);
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
	public function attach () :Void
	{
		
	}
	
	public function detach () :Void
	{
		
	}
	
	public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
	static var EMPTY_ARRAY :Array<Dynamic> = [];
	
	#if (debug || editor)
	#if debug override #end
	public function toString () :String
	{
		return owner != null ? owner.name :name;
	}
	
	var _debugcontext :com.pblabs.engine.core.IPBContext;
	#end
}
