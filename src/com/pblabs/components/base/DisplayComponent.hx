/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.Log;
import com.pblabs.util.Preconditions;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.engine.core.PropertyReference;


class DisplayComponent extends EntityComponent 
{
	public static var NAME :String = ReflectUtil.tinyClassName(DisplayComponent);
	public static var P_DISPLAY :PropertyReference<DisplayObject> = PBUtil.componentProp(NAME, "displayObject");
	public static var P_X :PropertyReference<Float> = PBUtil.componentProp(NAME, "x");
	public static var P_Y :PropertyReference<Float> = PBUtil.componentProp(NAME, "y");
	
	public var displayObject (get_displayObject, null) : DisplayObject;
	public var x(get_x, set_x) : Float;
	public var y(get_y, set_y) : Float;

	public static function getSpriteFrom (e :IEntity) :Sprite
	{
		return cast( (cast( e.lookupComponentByName(NAME), DisplayComponent))._displayObject, Sprite);
	}

	public function new (disp :DisplayObject)
	{
		super();
		Preconditions.checkNotNull(disp, "disp cannot be null");
		_displayObject = disp;
	}

	function get_displayObject ():DisplayObject
	{
		return _displayObject;
	}

	function get_x ():Float{
		return _displayObject.x;
	}

	function set_x (val :Float):Float{
		_displayObject.x = val;
		return val;
	   }

	function get_y ():Float{
		return _displayObject.y;
	}

	function set_y (val :Float):Float{
		_displayObject.y = val;
		return val;
   }

	override function onRemove():Void
	{
		super.onRemove();
		_displayObject = null;
	}

	var _displayObject :DisplayObject;
}
