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
		if (_isTransformDirty) {
			updateTransform();
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
		_displayObject.name = name;
	}
	
	function get_displayObject () :DisplayObject
	{
		return _displayObject;
	}
	
	function set_displayObject (d :DisplayObject) :DisplayObject
	{
		Preconditions.checkArgument(_displayObject == null && !isRegistered);
		_displayObject = d;
		return d;
	}

	override function set_x (value :Float) :Float
	{
		_displayObject.x = value;
		return super.set_x(value);
	}
	
	override function set_y (value :Float) :Float
	{
		_displayObject.y = value;
		return super.set_y(value);
	}
	
   override function set_angle (value :Float) :Float
   {
	   super.set_angle(value);
	   _displayObject.rotation = _angle.toDeg();
	   return _angle;
   }
   
	override function set_alpha (val :Float) :Float
	{
		super.set_alpha(val);
		_displayObject.alpha = _alpha;
		return val;
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
		_transformMatrix.scale(_scale.x, _scale.y);
		_transformMatrix.translate(-registrationPoint.x * _scale.x, - registrationPoint.y * _scale.y);
		_transformMatrix.rotate(_angle + _angleOffset);
		_transformMatrix.translate(_x + _locationOffset.x, _y + _locationOffset.y);
		
		_displayObject.transform.matrix = _transformMatrix;
		_displayObject.alpha = _alpha;
		// _displayObject.blendMode = _blendMode;
		_displayObject.visible = (alpha > 0);
		
		isTransformDirty = false;
    }
	
	var _displayObject :DisplayObject;

}
