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
	public var lineColor (get_lineColor, set_lineColor) :Int;
	public var lineStroke (get_lineStroke, set_lineStroke) :Float;
	public var lineAlpha (get_lineAlpha, set_lineAlpha) :Float;
	
	var _fillColor :Int;
	var _lineColor :Int;
	var _lineStroke :Float;
	var _lineAlpha :Float;
	
	public function new ()
	{
		#if (flash || cpp)
		_displayObject = new flash.display.Shape();
		#end
		super();
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		_fillColor = 0xff0000;
		_lineColor = 0x000000;
		_lineStroke = 1;
		_lineAlpha = 1;
	}
	
	override function onReset () :Void
	{
		org.transition9.util.Log.debug("");
		super.onReset();
		redraw();
		org.transition9.util.Log.debug("finished");
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
	
	function get_lineColor () :Int
	{
		return _lineColor;
	}
	
	function set_lineColor (val :Int) :Int
	{
		_lineColor = val;
		redraw();
		return val;
	}
	
	function get_lineStroke () :Float
	{
		return _lineStroke;
	}
	
	function set_lineStroke (val :Float) :Float
	{
		_lineStroke = val;
		redraw();
		return val;
	}
	
	override function set_alpha (val :Float) :Float
	{
		super.set_alpha(val);
		redraw();
		return val;
	}
	
	function get_lineAlpha () :Float
	{
		return _lineAlpha;
	}
	
	function set_lineAlpha (val :Float) :Float
	{
		_lineAlpha = val;
		redraw();
		return val;
	}
}
