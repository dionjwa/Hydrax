/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.util.Preconditions;

import de.polygonal.core.math.Mathematics;

import flash.display.DisplayObject;

import flash.geom.Matrix;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.ArrayUtil;
using com.pblabs.util.DisplayUtils;
using com.pblabs.util.MathUtil;

class SceneComponent extends BaseSceneComponent<SceneLayer>,
	implements com.pblabs.engine.time.IAnimatedObject
{
	public var priority :Int;
	public var displayObject(get_displayObject, set_displayObject) :DisplayObject;
	
	public function new ()
	{
		super();
		priority = 0;
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (parent == null) {
			return;
		}
		if (_layerIndexDirty) {
			com.pblabs.util.Assert.isNotNull(parent, "Cannot change layer index if not attached to a scene since which layer?");
			var scene = parent.parent;
			var newlayer = scene.getLayerAt(layerIndex);
			if (newlayer != null) {
				this.removeFromParent();
				parentProperty = newlayer.entityProp();
				addToParent(newlayer);
				// _zIndexDirty = true;
			}
			_layerIndexDirty = false;
			_layerIndex = scene.getLayerIndex(parent);
		}
		if (_isTransformDirty) {
			updateTransform();
			_isTransformDirty =false;
		}
	}
	
	override public function addedToParent () :Void
	{
		com.pblabs.engine.debug.Profiler.enter("sc.addedToParent");
		super.addedToParent();
		if (parent.parent != null) {
			com.pblabs.util.Assert.isNotNull(parent.parent);
			_layerIndex = parent.parent.getLayerIndex(parent);
		} else {
			com.pblabs.util.Log.warn("Layer " + parent.name + " has no scene parent");
		}
		com.pblabs.engine.debug.Profiler.exit("sc.addedToParent");
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		priority = 0;
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		com.pblabs.util.Assert.isNotNull(_displayObject);
		_displayObject.name = name;
		_transformMatrix.identity();
		_displayObject.transform.matrix = _transformMatrix;
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		if (_displayObject != null) {
			_displayObject.detach();
			com.pblabs.util.Assert.isNull(_displayObject.parent);
			_displayObject = null;
		}
	}
	
	function recomputeBounds () :Void
	{
		#if flash
		var localDimensions = _displayObject.getBounds(displayObject);
		#elseif cpp
		var localDimensions = _displayObject.nmeGetPixelBounds();
		#end
		_unscaledBounds.x = localDimensions.width <= 0 ? 1 : localDimensions.width;
		_unscaledBounds.y = localDimensions.height <= 0 ? 1 : localDimensions.height;
		width = _unscaledBounds.x * scaleX;
		height = _unscaledBounds.y * scaleY;
		
		_isTransformDirty = true;
	}
	
	function get_displayObject () :DisplayObject
	{
		return _displayObject;
	}
	
	function set_displayObject (d :DisplayObject) :DisplayObject
	{
		Preconditions.checkArgument(parent == null);
		_displayObject = d;
		recomputeBounds();
		return d;
	}

	/**
	 * Update the object's transform based on its current state. Normally
	 * called automatically, but in some cases you might have to force it
	 * to update immediately.
	 * @param updateProps Read fresh values from any mapped properties.
	 */
	override public function updateTransform () :Void
	{
		if (_displayObject == null) {
			com.pblabs.util.Log.error("No _displayObject");
			return;
		}
		
		super.updateTransform();
		
		_displayObject.transform.matrix = _transformMatrix;
		_displayObject.alpha = _alpha;
		// _displayObject.blendMode = _blendMode;
		// _displayObject.visible = (alpha > 0);
		
		isTransformDirty = false;
	}
	
	override function get_zIndex () :Int
	{
		return layer == null ? _zIndex : layer.children.indexOf(this);
	}
	
	override function set_zIndex (val :Int) :Int
	{
		if (layer == null) {
			_zIndex = val;
		} else {
			val = Mathematics.clamp(val, 0, layer.children.length - 1);
			var curIndex = layer.children.indexOf(this);
			if (curIndex != val) {
				layer.children.remove(this);
				layer.children.insert(val, this);
				layer.zOrderDirty = true;
			}
		}
		return val;
	}
	
	override function set_visible (val :Bool) :Bool
	{
		_visible = val;
		_displayObject.visible = _visible;
		return val;
	}
	
	var _displayObject :DisplayObject;
}
