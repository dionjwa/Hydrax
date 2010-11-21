/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.debug;

import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.scene.flash.Scene2DComponent;
import com.pblabs.components.scene.flash.Scene2DManager;
import com.pblabs.engine.core.PropertyReference;

import flash.display.Graphics;
import flash.display.Sprite;

/**
 * Hold a value in a component, just so we can use a property reference to get it.
 */
class RectDisplayComponent extends Scene2DComponent
{
	// public var centered (get_centered, set_centered) :Bool;
	// public var width (get_width, set_width) :Float;
	// public var height (get_height, set_height) :Float;
	public var fillColor (get_fillColor, set_fillColor) :Int;
	public var borderColor (get_borderColor, set_borderColor) :Int;
	public var borderWidth (get_borderWidth, set_borderWidth) :Float;
	
	public function new (?w :Float = 0, ?h :Float = 0, ?color :Int = 0xff0000)
	{
		super();
		// sceneLayerName = Scene2DManager.DEBUG_LAYER_NAME;
		_displayObject = new Sprite();
		_fillColor = color;
		_borderColor = 0x000000;
		setRect(w, h);
	}
	
	public function setRect (w :Float, h :Float) :Void
	{
		// this.x = x;
		// this.y = y;
		_width = w;
		_height= h;
		redraw();
	}

	function redraw () :Void
	{
		var g :Graphics = cast(_displayObject, Sprite).graphics;
		g.clear();
		g.beginFill(_fillColor);
		g.drawRect(-_width / 2, -_height / 2, _width, _height);
		g.endFill();
		
		g.lineStyle(_borderWidth, _borderColor);
		g.drawRect(-_width / 2, -_height / 2, _width, _height);
	}
	
	// function get_width () :Float
	// {
	//	 return _width;
	// }
	
	// function set_width (val :Float) :Float
	// {
	//	 _width = val;
	//	 redraw();
	//	 return val;
	// }
	
	// function get_height () :Float
	// {
	//	 return _height;
	// }
	
	// function set_height (val :Float) :Float
	// {
	//	 _height = val;
	//	 redraw();
	//	 return val;
	// }
	
	function get_fillColor () :Int
	{
		return _fillColor;
	}
	
	function set_fillColor (val :Int) :Int
	{
		_fillColor = val;
		redraw();
		return val;
	}
	
	function get_borderColor () :Int
	{
		return _borderColor;
	}
	
	function set_borderColor (val :Int) :Int
	{
		_borderColor = val;
		redraw();
		return val;
	}
	
	function get_borderWidth () :Float
	{
		return _borderWidth;
	}
	
	function set_borderWidth (val :Float) :Float
	{
		_borderWidth = val;
		redraw();
		return val;
	}
	
	var _fillColor :Int;
	var _borderColor :Int;
	var _borderWidth :Float;
	// var _width :Float;
	// var _height :Float;
}


