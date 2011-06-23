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
import flash.display.Sprite;

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
		_transformMatrix = new Matrix();
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
				_zIndexDirty = true;
			}
			_layerIndexDirty = false;
			_layerIndex = scene.getLayerIndex(parent);
		}
		if (_zIndexDirty) {
			com.pblabs.util.Assert.isNotNull(parent);
			parent.updateZOrder();
			_zIndexDirty = false;
			_isTransformDirty = true;
		}
		if (_isTransformDirty) {
			updateTransform();
		}
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		if (parent.parent != null) {
			com.pblabs.util.Assert.isNotNull(parent.parent);
			_layerIndex = parent.parent.getLayerIndex(parent);
		} else {
			com.pblabs.util.Log.warn("Layer " + parent.name + " has no scene parent");
		}
	}
	
	override function setDefaultVars () :Void
	{
		super.setDefaultVars();
		_transformMatrix.identity();
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		com.pblabs.util.Assert.isNotNull(_displayObject);
		_displayObject.name = name;
		_transformMatrix.identity();
		_displayObject.transform.matrix = _transformMatrix;
		// recomputeBounds();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		if (_displayObject != null) {
			_displayObject.detach();
			com.pblabs.util.Assert.isNull(_displayObject.parent);
		}
	}
	
	// override function get_width () :Float
	// {
	// 	return _width * _scaleX;
	// }
	
	// override function set_width (val :Float) :Float
	// {
	// 	com.pblabs.util.Assert.isTrue(val >= 0);
	// 	scaleX = val / _width;
	// 	// _width = val;
	// 	return val;
	// }
	
	// override function get_height () :Float
	// {
	// 	return _height * _scaleY;
	// }
	
	// override function set_height (val :Float) :Float
	// {
	// 	com.pblabs.util.Assert.isTrue(val >= 0);
	// 	scaleY = val / _height;
	// 	// _height = val;
	// 	return val;
	// }
	
	function recomputeBounds () :Void
	{
		#if flash
		var localDimensions = _displayObject.getBounds(displayObject);
		#elseif cpp
		var localDimensions = _displayObject.nmeGetPixelBounds();
		#end
		_unscaledBounds.xmin = localDimensions.left;
		_unscaledBounds.xmax = localDimensions.right;
		_unscaledBounds.ymin = localDimensions.top;
		_unscaledBounds.ymax = localDimensions.bottom;
		// _width = localDimensions.width;
		// _height = localDimensions.height;
		
		// _bounds.xmin = _x - width / 2;
		// _bounds.xmax = _x + width / 2;
		// _bounds.ymin = _y - height / 2;
		// _bounds.ymax = _y + height / 2;
		_isTransformDirty = true;
	}
	
	function get_displayObject () :DisplayObject
	{
		return _displayObject;
	}
	
	function set_displayObject (d :DisplayObject) :DisplayObject
	{
		// Preconditions.checkArgument(_displayObject == null && !isRegistered);
		Preconditions.checkArgument(parent == null);
		_displayObject = d;
		recomputeBounds();
		// _width = _displayObject.width;
		// _height = _displayObject.height;
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
		
		// if(updateProps)
		//	 updateProperties();
		
		// If size is active, it always takes precedence over scale.
		// var tmpScaleX:Float = _scale.x;
		// var tmpScaleY:Float = _scale.y;
		// if(_size)
		// {
		// 	var localDimensions:Rectangle = displayObject.getBounds(displayObject);
		// 	tmpScaleX = _scale.x * (_size.x / localDimensions.width);
		// 	tmpScaleY = _scale.y * (_size.y / localDimensions.height);
		// }
		
		// _transformMatrix.identity();
		// _transformMatrix.scale(_scaleX, _scaleY);
		// _transformMatrix.translate(-registrationPoint.x * _scaleX, - registrationPoint.y * _scaleY);
		// _transformMatrix.rotate(_angle + _angleOffset);
		// _transformMatrix.translate(_x + _locationOffset.x, _y + _locationOffset.y);
		
		_displayObject.transform.matrix = _transformMatrix;
		_displayObject.alpha = _alpha;
		// _displayObject.blendMode = _blendMode;
		_displayObject.visible = (alpha > 0);
		
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
			_zIndexDirty = true;
		} else {
			val = Mathematics.clamp(val, 0, layer.children.length - 1);
			var curIndex = layer.children.indexOf(this);
			if (curIndex != val) {
				layer.children.remove(this);
				layer.children.insert(val, this);
				_zIndexDirty = true;
			}
		}
		return val;
	}
	
	var _displayObject :DisplayObject;
}
