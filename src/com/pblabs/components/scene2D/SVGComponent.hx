/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.engine.resource.ResourceToken;

import de.polygonal.motor2.geom.primitive.AABB2;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.resource.ResourceToken;
using com.pblabs.util.XMLUtil;

/**
  * Cross platform SVG based Scene2D component.
  * Currently supports Flash, js canvas, and js CSS.
  */
class SVGComponent 
#if js
extends com.pblabs.components.scene2D.js.SceneComponent
#elseif (flash || cpp)
extends com.pblabs.components.scene2D.flash.SceneComponent 
#end
{
	/** The IResource name and item id */
	#if (flash || cpp)
	public var resource :ResourceToken<flash.display.Sprite>;
	#elseif js
	/** Load the svg as a raw string.  It's inserted in the dom, or parsed and rendered to the canvas. */
	public var resource :ResourceToken<String>;
	public var svgData (get_svgData, set_svgData) :String;
	var _svgData :String;
	function get_svgData () :String { return _svgData; }
	function set_svgData (val :String) :String
	{
		com.pblabs.util.Assert.isNotNull(val, "SVG data is null");
		_svgData = val;
		var idx = _svgData.indexOf("<svg ");
		if (idx > -1) {
			//SVG documents added to the dom via innerHTML are *not* allowed to have any preamble.
			_svgData = _svgData.substr(idx);
		}
		var svgXml = Xml.parse(_svgData);
		var b = parseBounds(svgXml);
		width = b.intervalX;
		height = b.intervalY;
		registrationPoint.x = b.intervalX / 2;
		registrationPoint.y = b.intervalY / 2;
		return val;
	}
	#end
	
	public function new () :Void
	{
		super();
	}
	
	override function onAdd () :Void
	{
		#if (flash || cpp)
		//An extra layer so the SVG can be offset so that the origin is the image center
		// var s = context.allocate(flash.display.Sprite);
		// s.mouseEnabled = s.mouseChildren = false;
		// _displayObject = s;
		var svg :flash.display.Sprite = context.get(resource);
		com.pblabs.util.Assert.isNotNull(svg);
		_displayObject = svg;
		super.onAdd();
		#elseif js
		super.onAdd();
		loadFromResource();
		#else
		throw "Unsupported platform";
		#end
	}
	
	#if js
	function loadFromResource () :Void
	{
		com.pblabs.util.Assert.isNotNull(resource);
		svgData = Std.string(context.get(resource));
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		if (isOnCanvas) {
			//Render the SVG to the backbuffer to then render to the canvas
			cacheAsBitmap = true;
		} else {
			//Insert the SVGdirectly into the DOM
			com.pblabs.util.Assert.isNotNull(svgData);
			com.pblabs.util.Assert.isNotNull(div);
			
			div.innerHTML = svgData;
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		#if js
		_svgData = null;
		#end
	}
	
	override public function draw (ctx :easel.display.Context2d)
	{
		com.pblabs.util.Assert.isNotNull(ctx);
		if (svgData == null) {
			trace("svgData=" + svgData);
			_isContentsDirty = true;
			ctx.fillRect(0, 0, 30, 30);
			return;
		}
		//Temporary hack: use canvg library for rendering SVGs to canvas
		untyped canvg(ctx.canvas, svgData, { ignoreMouse: true, ignoreAnimation: true, ignoreDimensions: true, ignoreClear: false });
	}
	
	override private function redrawBackBuffer ()
	{
		if (_backBuffer == null) {
			_backBuffer = cast js.Lib.document.createElement("canvas");
			com.pblabs.util.Assert.isNotNull(div);
			div.appendChild(_backBuffer);
		}
		_backBuffer.width = Std.int(bounds.intervalX);
		_backBuffer.height = Std.int(bounds.intervalY);
		super.redrawBackBuffer();
	}
	
	public static function parseBounds (svg :Xml) :AABB2
	{
		var bounds = new AABB2();
		svg = svg.ensureNotDocument();
		var tokens = svg.get("viewBox").split(" ");
		bounds.xmin = Std.parseFloat(tokens[0]);
		bounds.ymin = Std.parseFloat(tokens[1]);
		bounds.xmax = Std.parseFloat(tokens[2]);
		bounds.ymax = Std.parseFloat(tokens[3]);
		return bounds;
	}
	#end
	
	#if debug
	public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "_width", "_height"]);
	}
	#end
}
