/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.flash;

import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.util.Preconditions;

import flash.display.DisplayObject;

import flash.geom.Matrix;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.MathUtil;

class Scene2DComponent extends BaseScene2DComponent<SceneLayer>,
	implements com.pblabs.engine.time.IAnimatedObject
{
	public var displayObject(get_displayObject, set_displayObject) :DisplayObject;
	var _transformMatrix :Matrix;
	
	public function new ()
	{
		_transformMatrix = new Matrix();
		super();
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (parent == null) {
			return;
		}
		if (_layerIndexDirty) {
			com.pblabs.util.Assert.isNotNull(parent, "Cannot change layer index if not attached to a scene, since which layer?");
			var scene = parent.parent;
			var newlayer = scene.getLayerAt(layerIndex);
			if (newlayer != null) {
				this.removeFromParent();
				parentProperty = newlayer.entityProp();
				addToParent(newlayer);
				_zIndex = parent.children.length - 1;
				_zIndexDirty = true;
			}
			_layerIndexDirty = false;
			_layerIndex = scene.getLayerIndex(parent);
		}
		if (_zIndexDirty) {
			com.pblabs.util.Assert.isNotNull(parent);
			_zIndex = _zIndex.clamp(0, parent.displayContainer.numChildren - 1);
			parent.displayContainer.setChildIndex(displayObject, _zIndex);
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
		zIndex = parent.getChildIndex(this);
		com.pblabs.util.Assert.isNotNull(parent.parent);
		layerIndex = parent.parent.getLayerIndex(parent); 
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
		_width = _displayObject.width;
		_height = _displayObject.height;
		_scaleX = 1;
		_scaleY = 1;
	}
	
	override function set_width (val :Float) :Float
	{
		super.set_width(val);
		var localDimensions = displayObject.getBounds(displayObject);
		scaleX = val / localDimensions.width;
		return val;
	}
	
	override function set_height (val :Float) :Float
	{
		super.set_height(val);
		var localDimensions = displayObject.getBounds(displayObject);
		scaleY = val / localDimensions.height;
		return val;
	}
	
	function get_displayObject () :DisplayObject
	{
		return _displayObject;
	}
	
	function set_displayObject (d :DisplayObject) :DisplayObject
	{
		Preconditions.checkArgument(_displayObject == null && !isRegistered);
		_displayObject = d;
		_width = _displayObject.width;
		_height = _displayObject.height;
		return d;
	}

	/**
	 * Update the object's transform based on its current state. Normally
	 * called automatically, but in some cases you might have to force it
	 * to update immediately.
	 * @param updateProps Read fresh values from any mapped properties.
	 */
	public function updateTransform (?updateProps:Bool = false) :Void
	{
		if (_displayObject == null) {
			return;
		}
		// if(updateProps)
		//     updateProperties();
		
		// If size is active, it always takes precedence over scale.
		// var tmpScaleX:Float = _scale.x;
		// var tmpScaleY:Float = _scale.y;
		// if(_size)
		// {
		// 	var localDimensions:Rectangle = displayObject.getBounds(displayObject);
		// 	tmpScaleX = _scale.x * (_size.x / localDimensions.width);
		// 	tmpScaleY = _scale.y * (_size.y / localDimensions.height);
		// }
		
		
		_transformMatrix.identity();
		_transformMatrix.scale(_scaleX, _scaleY);
		_transformMatrix.translate(-registrationPoint.x * _scaleX, - registrationPoint.y * _scaleY);
		_transformMatrix.rotate(_angle + _angleOffset);
		_transformMatrix.translate(_x - _locationOffset.x, _y - _locationOffset.y);
		
		_displayObject.transform.matrix = _transformMatrix;
		_displayObject.alpha = _alpha;
		// _displayObject.blendMode = _blendMode;
		_displayObject.visible = (alpha > 0);
		
		isTransformDirty = false;
    }
	
	var _displayObject :DisplayObject;
}
