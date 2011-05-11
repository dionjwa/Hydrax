/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;
class ShapeComponent
#if (flash || cpp)
 extends com.pblabs.components.scene2D.flash.SceneComponent
#elseif js
	#if css
 extends com.pblabs.components.scene2D.js.css.SceneComponent
	#else
 extends com.pblabs.components.scene2D.js.canvas.SceneComponent   
	#end
#end
{
	public var fillColor (get_fillColor, set_fillColor) :Int;
	public var borderColor (get_borderColor, set_borderColor) :Int;
	public var borderStroke (get_borderStroke, set_borderStroke) :Float;
	
	public function new ()
	{
		super();
		_fillColor = 0xff0000;
		_borderColor = 0x000000;
		_borderStroke = 1;
		#if (flash || cpp)
		_displayObject = new flash.display.Sprite();
		// _width = 10;
		// _height = 10;
		cast(_displayObject, flash.display.Sprite).mouseChildren = cast(_displayObject, flash.display.Sprite).mouseEnabled = false;
		#end
	}
	
	#if css
	override public function onFrame (dt :Float) :Void
	{
		com.pblabs.util.Assert.isNotNull(parent);
		
		if (isTransformDirty) {
			isTransformDirty = false;
			var xOffset = parent.xOffset - (width / 2);
			var yOffset = parent.yOffset- (height / 2);
			untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
		}
	}
	#end
	
	override function onReset () :Void
	{
		com.pblabs.util.Log.debug("");
		super.onReset();
		redraw();
		com.pblabs.util.Log.debug("finished");
	}
	
	// override function get_width () :Float
	// {
	// 	return _width;
	// }
	
	// override function set_width (val :Float) :Float
	// {
	// 	_width = val;
	// 	isTransformDirty = true;
	// 	_bounds.xmin = _x - _width / 2;
	// 	_bounds.xmax = _x + _width / 2;
	// 	redraw();
	// 	return val;
	// }
	
	// override function get_height () :Float
	// {
	// 	return _height;
	// }
	
	// override function set_height (val :Float) :Float
	// {
	// 	_height = val;
	// 	isTransformDirty = true;
	// 	_bounds.ymin = _y - _height / 2;
	// 	_bounds.ymax = _y + _height / 2;
	// 	redraw();
	// 	return val;
	// }
	
	public function redraw () :Void
	{
		throw "Subclasses must override";
	}
	
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
	
	function get_borderStroke () :Float
	{
		return _borderStroke;
	}
	
	function set_borderStroke (val :Float) :Float
	{
		_borderStroke = val;
		redraw();
		return val;
	}
	
	override function set_alpha (val :Float) :Float
	{
		super.set_alpha(val);
		redraw();
		return val;
	}
	
	var _fillColor :Int;
	var _borderColor :Int;
	var _borderStroke :Float;

}
