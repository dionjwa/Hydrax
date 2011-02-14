/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.flash;

import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.flash.SceneLayer;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import flash.geom.Matrix;
import flash.geom.Point;

using com.pblabs.util.ArrayUtil;

/**
 * Basic Rendering2D scene; it is given a SceneView and some
 * DisplayObjectRenderers, and makes sure that they are drawn. Extensible
 * for more complex rendering scenarios. Enforces sorting order, too.
 */
class Scene2DManager extends BaseScene2DManager<SceneLayer>, 
	implements IAnimatedObject
{
	
	public var zoomSignal (default, null):hsl.haxe.Signaler<Float>;
	// public var componentReference(lookupComponentReference, null) :PropertyReference<Scene2DManager>;
	// public var currentViewRect(getCurrentViewRect, null) :Rectangle;
	// public var debug(null, setDebug) :Bool;
	// public var layerCount(get_layerCount, null) :Int;
	// public var position(get_position, set_position) :Point;
	// public var positionX(null, set_positionX) :Float;
	// public var positionY(null, set_positionY) :Float;
	public var displayContainer (get_displayContainer, null) :DisplayObjectContainer;
	// public var sceneBounds(get_sceneBounds, set_sceneBounds) :Rectangle;
	// @inject
	// public var sceneView(get_sceneView, set_sceneView) :SceneView;
	// public var zoom(get_zoom, set_zoom) :Float;
	// public static var NAME :String = ReflectUtil.tinyClassName(Scene2DManager);
	public var dirty :Bool;

	/**
	 * Maximum allowed zoom level.
	 *
	 * @see zoom
	 */
	// public var max_zoom :Int;
	/**
	 * Minimum allowed zoom level.
	 *
	 * @see zoom
	 */
	// public var min_zoom :Float;

	/**
	 * How the scene is aligned relative to its position property.
	 *
	 * @see SceneAlignment
	 * @see position
	 */
	// public var sceneAlignment :SceneAlignment;

	/**
	 * If set, every frame, trackObject's position is read and assigned
	 * to the scene's position, so that the scene follows the trackObject.
	 */
	// public var trackObject :Coordinates2D;

	//	public var sceneBoundsRef :RectangleReference;

	public function new ()
	{
		super();
		// Get ticked after all the renderers.
		//		updatePriority = -10;
		
		// max_zoom = 5;
		// min_zoom = 0;
		// sceneAlignment = SceneAlignment.CENTER;
		_rootSprite = new Sprite();
		_rootSprite.mouseEnabled = _rootSprite.mouseChildren = false;
		_rootTransform = new Matrix();
		_tempPoint = new Vector2();
		// _sceneComponents = Maps.newHashMap(Scene2DComponent);
		// _layers = new Array<SceneLayer>();
		// _currentViewRect = new Rectangle();
		// _zoom = 1.0;
		
		// #if debug
		// addLayer(new SceneLayer(), DEBUG_LAYER_NAME);
		// #end
		
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		_rootSprite.name = name;
		context.getManager(SceneView).addDisplayObject(displayContainer);
		zoomSignal = new hsl.haxe.DirectSignaler(this);
		// context.displayContainer.addChild(displayContainer);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		context.getManager(SceneView).removeDisplayObject(displayContainer);
		com.pblabs.util.Assert.isFalse(zoomSignal.isListenedTo, "Still has listeners");
		zoomSignal = null;
		
		com.pblabs.util.Assert.isTrue(_rootSprite.numChildren == 0);
		com.pblabs.util.Assert.isTrue(_rootSprite.parent == null);
	}
	
	override function set_zoom (value :Float) :Float
	{
		// Make sure our zoom level stays within the desired bounds
		value = super.set_zoom(value);
		zoomSignal.dispatch(value);
		return value;
	}
	

	// public function lookupComponentReference () :PropertyReference<Scene2DManager>
	// {
	//	 if (null != _selfReference) {
	//		 return _selfReference;
	//	 }
	//	 _selfReference = new PropertyReference("#" + owner.name + "." + name);
	//	 return _selfReference;
	// }

	// public function setDebug (val :Bool) :Bool{
	//	 var g :Graphics = rootSprite.graphics;
	//	 g.clear();
	//	 if (val && sceneBounds != null) {
	//		 g.lineStyle(1, 0xff0000);
	//		 //			g.drawRect(
	//		 //			DebugUtil.drawRect(this, _width, _height, 0);
	//	 }
	//	 return val;
	//	}

	// public function get_layerCount () :Int
	// {
	//	 return _layers.length;
	// }

	// public function get_position () :Point{
	//	 return _rootPosition.clone();
	// }

   //  public function set_positionX (newX :Float) :Float{
   //	  if (_rootPosition.x == newX) {
   //		  return newX;
   //	  }
   //	  _rootPosition.x = newX;
   //	  _transformDirty = true;
   //	  return newX;
   //	 }

   //  public function set_positionY (newY :Float) :Float{
   //	  if (_rootPosition.y == newY) {
   //		  return newY;
   //	  }
   //	  _rootPosition.y = newY;
   //	  _transformDirty = true;
   //	  return newY;
   //	 }

   //  public function set_position (value :Point) :Point{
   //	  if (value == null) {
   //		  return _rootPosition;
   //	  }

   //	  var newX :Float = value.x;
   //	  var newY :Float = value.y;

   //	  if (_rootPosition.x == newX && _rootPosition.y == newY) {
   //		  return _rootPosition;
   //	  }
   //	  //		trace("Setting _rootPosition.x=" + newX);
   //	  _rootPosition.x = newX;
   //	  _rootPosition.y = newY;
   //	  _transformDirty = true;
   //	  return _rootPosition;
   // }
   
   //  public function get_rootSprite () :Sprite
   //  {
   //	  return _rootSprite;
   //  }

	//	public function get sceneViewBounds () :Rectangle
	//	{
	//		if (!sceneView) {
	//			return null;
	//		}
	//
	//		// Make sure we are up to date with latest track.
	//		if (trackObject) {
	//			position = new Point(-(trackObject.x), -(trackObject.y));
	//		}
	//
	//		if (viewBounds != null) {
	//			var centeredLimitBounds :Rectangle =
	//				new Rectangle(viewBounds.x + sceneView.width * 0.5,
	//				viewBounds.y + sceneView.height * 0.5,
	//				viewBounds.width - sceneView.width,
	//				viewBounds.height - sceneView.height);
	//
	//			position = new Point(MathUtil.fclamp(position.x, -centeredLimitBounds.right,
	//				-centeredLimitBounds.left), MathUtil.fclamp(position.y, -centeredLimitBounds.bottom,
	//				-centeredLimitBounds.top));
	//		}
	//
	//		updateTransform();
	//
	//		// What region of the scene are we currently viewing?
	//		SceneAlignment.calculate(_tempPoint, sceneAlignment, sceneView.width / zoom,
	//			sceneView.height / zoom);
	//
	//		_sceneViewBoundsCache.x = -position.x - _tempPoint.x;
	//		_sceneViewBoundsCache.y = -position.y - _tempPoint.y;
	//		_sceneViewBoundsCache.width = sceneView.width / zoom;
	//		_sceneViewBoundsCache.height = sceneView.height / zoom;
	//
	//		return _sceneViewBoundsCache;
	//	}

	//	public function set sceneViewName (value :String) :void
	//	{
	//		_sceneViewName = value;
	//	}

	/**
	 * @inheritDoc
	 */
	// function get_sceneBounds () :Rectangle{
	//	 //		if (_sceneBounds != null) {
	//	 return _sceneBounds;
	//	 //		}
	//	 //		if (sceneBoundsRef != null && sceneBoundsRef.value != null) {
	//	 //			return sceneBoundsRef.value;
	//	 //		}
	//	 //		return null;
	// }

	// function set_sceneBounds (value :Rectangle) :Rectangle{
	//	 _sceneBounds = value;
	//	 return value;
	//	}

	// function get_sceneView () :SceneView
	// {
	//	 return _sceneView;
	// }

	// public function set_sceneView (value :SceneView) :SceneView
	// {
	//	 if (_sceneView != null) {
	//		 _sceneView.removeDisplayObject(_rootSprite);
	//	 }
	//	 _sceneView = value;

	//	 if (_sceneView != null) {
	//		 _sceneView.addDisplayObject(_rootSprite);
	//		 _currentViewRect.width = _sceneView.width;
	//		 _currentViewRect.height = _sceneView.height;
	//	 }
		
	//	 return value;
	//	}

	// public function get_zoom () :Float{
	//	 return _zoom;
	// }

	// public function set_zoom (value :Float) :Float{
	//	 // Make sure our zoom level stays within the desired bounds
	//	 value = MathUtil.fclamp(value, min_zoom, max_zoom);

	//	 if (_zoom == value) {
	//		 return _zoom;
	//	 }

	//	 _zoom = value;
	//	 _transformDirty = true;
	//	 return value;
	//	 // Make sure our zoom level stays within the desired bounds
	//	}

	// public function addLayer (layer :SceneLayer, ?name :String = null, ?idx :Int = -1) :Void
	// {
	//	 Assert.isNotNull(layer, "null layer");
	//	 Assert.isNull(layer._parentScene, "layer already attached to a scene");

	//	 if (idx == -1) {
	//		 idx = _layers.length;
	//	 }

	//	 _layers.insert(idx, layer);
	//	 _rootSprite.addChildAt(layer, idx);
	//	 if (null != name) {
	//		 layer.name = name;
	//	 }
	//	 layer.attachedInternal();
	// }

	// public function addSceneComponent (obj :Scene2DComponent) :Void
	// {
	//	 com.pblabs.util.Log.debug("adding scene component");
	//	 if (_sceneComponents.exists(obj)) {
	//		 throw "Already contains obj " + obj;
	//	 }

	//	 if (null == obj) {
	//		 throw "obj is null";
	//	 }

	//	 if (null == obj.displayObject) {
	//		 throw "obj.displayObject is null";
	//	 }

	//	 var layerName = obj.sceneLayerName;
	//	 if (null == layerName) {
	//		 com.pblabs.util.Log.warn("obj.sceneLayerName is null, using the default layer");
	//		 layerName = DEFAULT_LAYER_NAME;
	//	 }

	//	 var layer = getLayer(layerName);
		
	//	 if (layer == null && layerName == DEFAULT_LAYER_NAME) {
	//		 layer = getDefaultLayer();
	//	 }

	//	 if (null == layer) {
	//		 // throw "No layer named " + layerName;
	//		 com.pblabs.util.Log.warn("No layer named " + layerName + ", creating");
	//		 layer = new SceneLayer();
	//		 addLayer(layer, layerName);
	//	 }

	//	 _sceneComponents.set(obj, layer);
		
	//	 if (!_sceneComponents.exists(obj)) {
	//		 throw "After adding, still not in the map";
	//	 }
	//	 layer.addObjectInternal(obj);
	//	 obj._scene = this;
	//	 dirty = true;
		
	//	 // DebugUtil.traceDisplayChildren(_rootSprite);
	// }

	// public function getDefaultLayer () :SceneLayer
	// {
	//	 if (null == _layers[0]) {
	//		 var layer = new SceneLayer();
	//		 addLayer(layer, DEFAULT_LAYER_NAME, 0);
	//		 return layer;
	//	 }
	//	 return _layers[0];
	// }

	//	{
	//	public function add (dor :DisplayObjectRenderer) :void
	//		// Add to the appropriate layer.
	//		var layer :SceneLayer = getLayer(dor.layerIndex, true);
	//		layer.add(dor);
	//		if (dor.displayObject)
	//			_renderers[dor.displayObject] = dor;
	//	}
	//
	//	public function getLayer (index :int, allocateIfAbsent :Boolean =
	//		false) :SceneLayer
	//	{
	//		// Maybe it already exists.
	//		if (_layers[index])
	//			return _layers[index];
	//
	//		if (allocateIfAbsent == false)
	//			return null;
	//
	//		// Allocate the layer.
	//		_layers[index] = generateLayer(index);
	//
	//		// Order the layers. This is suboptimal but we are probably not going
	//		// to be adding a lot of layers all the time.
	//		while (_rootSprite.numChildren)
	//			_rootSprite.removeChildAt(_rootSprite.numChildren - 1);
	//		for (var i :int = 0; i < layerCount; i++) {
	//			if (_layers[i])
	//				_rootSprite.addChild(_layers[i]);
	//		}
	//
	//		// Return new layer.
	//		return _layers[index];
	//	}

	//	public function getRenderersUnderPoint (screen_position :Point, mask :ObjectType = null) :Array
	//	{
	//		// Query normal DO hierarchy.
	//		var unfilteredResults :Array = _rootSprite.getObjectsUnderPoint(screen_position);
	//		var world_position :Point = transformScreenToWorld(screen_position);
	//
	//		// TODO :rewrite to splice from unfilteredResults to avoid alloc?
	//		var results :Array = new Array();
	//
	//		for each (var o :*in unfilteredResults) {
	//			var renderer :DisplayObjectRenderer = getRendererForDisplayObject(o);
	//
	//			if (!renderer)
	//				continue;
	//
	//			if (!renderer.owner)
	//				continue;
	//
	//			if (mask && !ObjectTypeManager.instance.doTypesOverlap(mask, renderer.objectMask))
	//				continue;
	//
	//			if (!renderer.pointOccupied(world_position))
	//				continue;
	//
	//			results.push(renderer);
	//		}
	//
	//		// Also give layers opportunity to return renderers.
	//		var scene_position :Point = transformScreenToScene(screen_position);
	//		for each (var l :SceneLayer in _layers) {
	//			// Skip them if they don't use the interface.
	//			if (!(l is ILayerMouseHandler))
	//				continue;
	//
	//			(l as ILayerMouseHandler).getRenderersUnderPoint(scene_position, mask, results);
	//		}
	//
	//		return results;
	//	}

	//	public function invalidate (dirtyRenderer :DisplayObjectRenderer) :void
	//	{
	//		var layerToDirty :SceneLayer = getLayer(dirtyRenderer.layerIndex);
	//		if (!layerToDirty)
	//			return;
	//
	//		if (layerToDirty is ICachingLayer)
	//			ICachingLayer(layerToDirty).invalidate(dirtyRenderer);
	//	}
	//
	//	public function invalidateRectangle (dirty :Rectangle) :void
	//	{
	//		for each (var l :SceneLayer in _layers) {
	//			if (l is ICachingLayer)
	//				(l as ICachingLayer).invalidateRectangle(dirty);
	//		}
	//	}
	//
	//	public function remove (dor :DisplayObjectRenderer) :void
	//	{
	//		var layer :SceneLayer = getLayer(dor.layerIndex, false);
	//		if (!layer)
	//			return;
	//
	//		layer.remove(dor);
	//		if (dor.displayObject)
	//			delete _renderers[dor.displayObject];
	//	}

	// public function panView (deltaX :Float, deltaY :Float) :Void
	// {
	//	 if (deltaX == 0 && deltaY == 0) {
	//		 return;
	//	 }

	//	 // TODO :Take into account rotation so it's correct even when
	//	 //	   rotating.
	//	 var before :Float = _rootPosition.x;
	//	 _rootPosition.x -= deltaX / _zoom;
	//	 //		trace("deltaX=", before, _rootPosition.x);
	//	 //		trace("Before/after=", before, _rootPosition.x);
	//	 _rootPosition.y -= deltaY / _zoom;

	//	 _transformDirty = true;
	// }

	// public function removeSceneComponent (obj :Scene2DComponent) :Void
	// {
	//	 if (!_sceneComponents.exists(obj)) {
	//		 com.pblabs.util.Log.warn("Doesn't contain " + obj + " " + com.pblabs.util.Log.getStackTrace() + "\nmap :" + ReflectUtil.getClass(_sceneComponents) + "\n" + _sceneComponents);
	//		 return;
	//	 }
	//	 var layer :SceneLayer = cast(_sceneComponents.get(obj), SceneLayer);

	//	 if (null == layer) {
	//		 throw "No associated layer for " + obj;
	//	 }

	//	 layer.removeObjectInternal(obj);
	//	 _sceneComponents.remove(obj);
	//	 obj._scene = null;
	// }

	// public function setWorldCenter (pos :Point) :Void
	// {
	//	 if (sceneView == null) {
	//		 throw "sceneView not yet set. can't center the world.";
	//	 }

	//	 position = transformWorldToScreen(pos);
	// }

	// public function transformSceneToScreen (inPos :Point) :Point
	// {
	//	 return _rootSprite.localToGlobal(inPos);
	// }

	// public function transformSceneToWorld (inPos :Point) :Point
	// {
	//	 return inPos;
	// }

	// public function transformScreenToScene (inPos :Point) :Point
	// {
	//	 return _rootSprite.globalToLocal(inPos);
	// }

	// public function transformScreenToWorld (inPos :Point) :Point
	// {
	//	 return _rootSprite.globalToLocal(inPos);
	// }

	// public function transformWorldToScene (inPos :Point) :Point
	// {
	//	 return inPos;
	// }

	// public function transformWorldToScreen (inPos :Point) :Point
	// {
	//	 return _rootSprite.localToGlobal(inPos);
	// }

	public function onFrame (dt :Float) :Void
	{
		//		trace("updating scene");
		if (sceneView == null) {
			com.pblabs.util.Log.warn(this + " sceneView is null, so we aren't rendering.");
			return;
		}
		// if (trackObject != null) {
		//	 position = new Point(-(trackObject.x), -(trackObject.y));
		// }
		//		if (sceneBounds != null) {
		//			var centeredLimitBounds :Rectangle =
		//				new Rectangle(sceneBounds.x + sceneView.width * 0.5,
		//				sceneBounds.y + sceneView.height * 0.5,
		//				sceneBounds.width - sceneView.width,
		//				sceneBounds.height - sceneView.height);
		//		 //			position = new Point(MathUtil.fclamp(position.x, -centeredLimitBounds.right,
		//				-centeredLimitBounds.left), MathUtil.fclamp(position.y, -centeredLimitBounds.bottom,
		//				-centeredLimitBounds.top));
		//		}

		
		updateTransform();

		//Check layers

		// Give layers a chance to sort and update.
		// for (l in _layers) {
		//	 l.renderInternal();
		// }
	}

	//	protected function get sceneBounds () :Rectangle
	//	{
	//
	//	}

	public function updateTransform () :Void
	{
		if (!_transformDirty) {
			return;
		}
	   // trace("scene updateTransform _transformDirty=" +  _transformDirty);
		_transformDirty = false;
	
		for (layer in children) {
		    layer.updateTransform();
		}
		return;
		
		// Update our transform, if required
		_rootTransform.identity();
		// trace(_rootTransform);
		// trace("x=" + x);
		// trace("y=" + y);
		// trace("zoom=" + zoom);
		// trace("rotation=" + rotation);
		_rootTransform.translate(x, y);
		_rootTransform.scale(zoom, zoom);
		
		// Apply rotation.
		_rootTransform.rotate(rotation);
		// trace(_rootTransform);

		// Center it appropriately.
		Preconditions.checkNotNull(_tempPoint);
		Preconditions.checkNotNull(sceneAlignment);
		Preconditions.checkNotNull(sceneView);
		SceneUtil.calculateOutPoint(_tempPoint, sceneAlignment, sceneView.width, sceneView.height);
		// trace("_tempPoint=" + _tempPoint);
		// trace("sceneView=" + sceneView);
		// trace("sceneAlignment=" + sceneAlignment);
		_rootTransform.translate(_tempPoint.x, _tempPoint.y);

		// Apply the transform.
		_rootSprite.transform.matrix = _rootTransform;

		// if (_sceneBounds != null) {
		//	 //			trace("panning");
		//	 //TODO :doesn't take into account zooming yet
		//	 //Check that we're inside the scene bounds
		//	 //Check x, starting with the right.
		//	 var minViewX :Int = cast(-(_sceneBounds.right - _sceneView.width * _zoom), Int);
		//	 //			trace("minViewX=" + minViewX);
		//	 //			trace("_sceneBounds.right=" + _sceneBounds.right);
		//	 var maxViewX :Int = cast(-_sceneBounds.left, Int);
		//	 //			trace("minmaxX=", minViewX, maxViewX);
		//	 var minViewY :Int = cast(-(_sceneBounds.bottom - _sceneView.height * _zoom), Int);
		//	 var maxViewY :Int = cast(-_sceneBounds.top, Int);
		//	 //			trace("clampedX=" + MathUtil.fclamp(_rootPosition.x, minViewX, maxViewX));
		//	 _rootPosition.x = MathUtil.fclamp(_rootPosition.x, minViewX, maxViewX);

		//	 //			trace("After clamping=" + _rootPosition.x);
		//	 _rootPosition.y = MathUtil.fclamp(_rootPosition.y, minViewY, maxViewY);

		//	 //			_rootSprite.x = _rootPosition.x;
		//	 //			_rootSprite.y = _rootPosition.y;
		// }

		// //		return;
		// //		trace("updating scene transform");
		// //		_transformDirty = false;

		// // Update our transform, if required
		// _rootTransform.identity();
		// _rootTransform.translate(_rootPosition.x, _rootPosition.y);
		// _rootTransform.scale(zoom, zoom);
		//		trace("Scene zoom=" + zoom);

		// Center it appropriately.
		//		SceneAlignment.calculate(_tempPoint, SceneAlignment.TOP_LEFT, sceneView.width,
		//			sceneView.height);
		//		_rootTransform.translate(_tempPoint.x, _tempPoint.y);

		// _rootSprite.transform.matrix = _rootTransform;

		// _currentViewRect.x = -_rootPosition.x;
		// _currentViewRect.y = -_rootPosition.y;
		//		trace("updating scene transform, scale=" + _rootSprite.scaleX);
	}

	// public function getCurrentViewRect () :Rectangle
	// {
	//	 if (_sceneView == null) {
	//		 return null;
	//	 }
	//	 return _currentViewRect;
	//	 //		return new Rectangle(-_rootPosition.x, -_rootPosition.y, _sceneView.width, _sceneView.height);
	// }

	// override function onRemove () :Void
	// {
	//	 super.onRemove();
	//	 // Make sure we don't leave any lingering content.
	//	 if (_sceneView != null) {
	//		 //			_sceneView.clearDisplayObjects();
	//	 }
	// }
	
	//	/**
	//	 * Convenience funtion for subclasses to control what class of layer
	//	 * they are using.
	//	 */
	//	protected function generateLayer (layerIndex :int) :SceneLayer
	//	{
	//		var l :SceneLayer = new SceneLayer();
	//
	//		//TODO :set any properties we want for our layer.
	//
	//		return l;
	//	}

	//	/**
	//	 * Convenience function for subclasses to create a custom root sprite.
	//	 */
	//	protected function generate_rootSprite () :Sprite
	//	{
	//		var s :Sprite = new Sprite();
	//
	//		//TODO :set any properties we want for our root host sprite
	//
	//		return s;
	//	}

	//	protected function getRendererForDisplayObject (displayObject :DisplayObject) :DisplayObjectRenderer
	//	{
	//		var current :DisplayObject = displayObject;
	//
	//		// Walk up the display tree looking for a DO we know about.
	//		while (current) {
	//			// See if it's a DOR.
	//			var renderer :DisplayObjectRenderer = _renderers[current] as DisplayObjectRenderer;
	//			if (renderer)
	//				return renderer;
	//
	//			// If we get to a layer, we know we're done.
	//			if (renderer is SceneLayer)
	//				return null;
	//
	//			// Go up the tree..
	//			current = current.parent;
	//		}
	//
	//		// No match!
	//		return null;
	//	}

	// function sceneViewResized (event :Event) :Void
	// {
	//	 _transformDirty = true;
	// }

	// public function removeLayer (layer :SceneLayer) :Void
	// {
	//	 // Lambda.
	//	 // if (!Lambda.has(_layers, layer)) {
	//	 //	 throw "No layer :" + layer;
	//	 // }
	//	 // Lambda.
	//	 _layers[_layers.indexOf(layer)] = null;
	//	 // _layers[ArrayUtil.indexOf(_layers, layer)] = null;
	//	 layer.detachedInternal();
	//	 layer._parentScene = null;
	//	 _rootSprite.removeChild(layer);
	// }
	
	override function childAdded (layer :SceneLayer) :Void
	{
		super.childAdded(layer);
		_rootSprite.addChild(layer.displayContainer);
	}
	
	override function childRemoved (layer :SceneLayer) :Void
	{
		super.childRemoved(layer);
		_rootSprite.removeChild(layer.displayContainer);
	}
	
	function get_displayContainer () :DisplayObjectContainer
	{
		return _rootSprite;
	}

	// var _currentWorldCenter :Vector2;
	// var _layers :Array<SceneLayer>;

	//	protected var _renderers :Dictionary = new Dictionary(true);
	// var _rootPosition :Vector2;
	var _rootSprite :Sprite;
	var _rootTransform :Matrix;
	// var _transformDirty :Bool;
	var _tempPoint :Vector2;
	//	protected var _rootRotation :Number = 0;

	// var _sceneBounds :Rectangle;

	/** Objects mapped to layers*/
	// var _sceneComponents :Map<Scene2DComponent, SceneLayer>;

	//	protected var _sceneViewBoundsCache :Rectangle = new Rectangle();
	//	protected var _sceneViewName :String = null;

	// var _sceneView :SceneView;

	// var _selfReference :PropertyReference<Scene2DManager>;
	// var _currentViewRect :Rectangle;

	// var _zoom :Float;
	// public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
	// public static var DEBUG_LAYER_NAME :String = "debugLayer";

}
