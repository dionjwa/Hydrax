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

using com.pblabs.util.MathUtil;

class Scene2DComponent extends BaseScene2DComponent<SceneLayer>
{
	public var displayObject(get_displayObject, set_displayObject) :DisplayObject;

	public function new ()
	{
		super();
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

	var _displayObject :DisplayObject;

}
