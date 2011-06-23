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
 extends com.pblabs.components.scene2D.js.SceneComponent
#end
{
	public var fillColor (get_fillColor, set_fillColor) :Int;
	public var borderColor (get_borderColor, set_borderColor) :Int;
	public var borderStroke (get_borderStroke, set_borderStroke) :Float;
	public var borderAlpha (get_borderAlpha, set_borderAlpha) :Float;
	
	var _fillColor :Int;
	var _borderColor :Int;
	var _borderStroke :Float;
	var _borderAlpha :Float;
	
	#if js
	var _svgContainer :js.Dom.HtmlDom;
	var _svg :js.Dom.HtmlDom;
	#end
	
	public function new ()
	{
		super();
		_fillColor = 0xff0000;
		_borderColor = 0x000000;
		_borderStroke = 1;
		_borderAlpha = 1;
		#if (flash || cpp)
		_displayObject = new flash.display.Shape();
		#end
	}
	
	override function onReset () :Void
	{
		com.pblabs.util.Log.debug("");
		super.onReset();
		redraw();
		com.pblabs.util.Log.debug("finished");
	}
	
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
	
	function get_borderAlpha () :Float
	{
		return _borderAlpha;
	}
	
	function set_borderAlpha (val :Float) :Float
	{
		_borderAlpha = val;
		redraw();
		return val;
	}
}
