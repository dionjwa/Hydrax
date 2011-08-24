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
import com.pblabs.geom.Vector2;
import com.pblabs.util.ds.Tuple;

import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

import flash.geom.Matrix;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.scene2D.SvgRenderTools;
using com.pblabs.engine.resource.ResourceToken;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XmlUtil;
#if flash
using com.pblabs.util.DisplayUtils;
import de.polygonal.core.math.Mathematics;
#end


/**
  * Cross platform SVG based Scene2D component.
  * Renders a single svg image.
  * Currently supports Flash, JS canvas, and JS CSS.
  */
class Svg
#if js
extends com.pblabs.components.scene2D.js.SceneComponent
#elseif (flash || cpp)
extends com.pblabs.components.scene2D.flash.SceneComponent 
#end
{
	#if (flash || cpp)
	/** Fired when the svgweb renderer completes */
	public var renderCompleteSignal (default, null):Signaler<Void>;
	/** New svg data may be set before the render call from a previous update is finished.  Track the render calls. */
	public static var RENDER_CALLBACK_ID :Int = 1;
	var _renderId :Int;
	#end
	public var svgData (get_svgData, set_svgData) :String;
	var _svgData :String;
	function get_svgData () :String { return _svgData; }
	function set_svgData (val :String) :String
	{
		_svgData = val;
		 
		#if flash
		_renderId = ++RENDER_CALLBACK_ID;
		var localRenderId =_renderId;
		_displayObject.removeAllChildren();
		#elseif js
		if (!isOnCanvas) {
			com.pblabs.util.Assert.isNotNull(div);
			//Remove previous children
			while (div.hasChildNodes()) {
				div.removeChild(div.lastChild);
			}
		} else {
			canvas.getContext("2d").clearRect(0, 0, width, height);
			// com.pblabs.util.Log.error("Setting svg null should clear the display component, but this is not yet implemented in canvas js");
		}
		#end
		
		if (val == null) {
			_unscaledBounds.x = _unscaledBounds.y = 0.0001;
			// _unscaledBounds.xmax = _unscaledBounds.ymax = 0.001;
			registrationPoint.x = registrationPoint.y = 0;
			_bounds.xmin = _bounds.ymin = 0;
			_bounds.xmax = _bounds.ymax = _unscaledBounds.x;
			isTransformDirty = true;
			return val;
		}
		#if js
		//SVG documents added to the dom via innerHTML are *not* allowed to have any preamble.
		_svgData = _svgData.cleanSvgForInnerHtml();
		#end
		
		var svgXml = Xml.parse(_svgData).ensureNotDocument();
		
		var b = svgXml.parseElementBounds();
		_unscaledBounds.x = b.intervalX;
		_unscaledBounds.y = b.intervalY;
		_bounds = b.clone();
		registrationPoint.x = _bounds.intervalX / 2;
		registrationPoint.y = _bounds.intervalY / 2;
		#if js
		if (hasParent() && !isOnCanvas) {
			insertSvgsIntoDiv();
		}
		#end
		
		#if (flash || cpp)
		_displayObject.removeAllChildren();
		var self = this;
		trace("Rendering svg from Svg");
		SvgRenderTools.renderSvg(_svgData, function (renderedSvg :flash.display.DisplayObject) :Void {
			if (!self.isRegistered) return;
			if (localRenderId != self._renderId) return;//Another render call supercedes this render
			var sprite = cast(self._displayObject, flash.display.Sprite);
			sprite.addChild(renderedSvg);
			self.recomputeBounds();
			self.renderCompleteSignal.dispatch();
		});
		#else
		//TODO: Is the js renderer asynchronous???
		#end
		isTransformDirty = true;
		return val;
	}
	
	public function new () :Void
	{
		super();
		#if (flash || cpp)
		renderCompleteSignal = new DirectSignaler(this);
		var s = new flash.display.Sprite();
		s.mouseEnabled = s.mouseChildren = false;
		_displayObject = s;
		#end
	}
	
	#if js
	override public function updateTransform () :Void
	{
		if (!isTransformDirty) {
			return;
		}
		_transformMatrix.identity();
		if (cacheAsBitmap) {
		} else {
			_transformMatrix.scale(_scaleX, _scaleY);
		}
		_transformMatrix.translate(-registrationPoint.x * _scaleX, - registrationPoint.y * _scaleY);
		_transformMatrix.rotate(_angle + _angleOffset);
		_transformMatrix.translate(_x + _locationOffset.x, _y + _locationOffset.y);
		isTransformDirty = false;
	}
	#end
	
	override function onRemove () :Void
	{
		super.onRemove();
		#if (flash && debug)
		if (displayObject != null && displayObject.parent != null) {
			trace("WTF, still attached");
		}
		#end
		svgData = null;
	}
	
	#if js
	override function addedToParent () :Void
	{
		super.addedToParent();
		if (isOnCanvas) {
			//Render the SVG to the backbuffer to then render to the canvas
			cacheAsBitmap = true;
		} else {
			if (svgData != null) {
				insertSvgsIntoDiv();
			}
		}
	}
	
	function insertSvgsIntoDiv () :Void
	{
		//Insert the SVGdirectly into the DOM
		com.pblabs.util.Assert.isNotNull(svgData);
		com.pblabs.util.Assert.isNotNull(div);
		//Remove previous children
		while (div.hasChildNodes()) {
			div.removeChild(div.lastChild);
		}
		
		//Create a div for each svg
		var d = com.pblabs.components.scene2D.js.SceneComponent.createDiv();
		div.appendChild(d);
		d.innerHTML = _svgData;
	}
	
	override public function drawPixels (ctx :easel.display.Context2d)
	{
		com.pblabs.util.Assert.isNotNull(ctx);
		if (svgData == null) {
			_isContentsDirty = true;
			ctx.fillRect(0, 0, 30, 30);
			return;
		}
		SvgRenderTools.renderSvg(svgData, ctx.canvas);
	}
	
	override private function redrawBackBuffer ()
	{
		if (_backBuffer == null) {
			_backBuffer = cast js.Lib.document.createElement("canvas");
			com.pblabs.util.Assert.isNotNull(div);
		}
		super.redrawBackBuffer();
	}
	#end
	
	#if flash
	override function set_displayObject (d :flash.display.DisplayObject) :flash.display.DisplayObject
	{
		com.pblabs.util.Preconditions.checkArgument(_displayObject == null && !isRegistered);
		_displayObject = d;
		return d;
	}
	#end
	
	// public static function parseBounds (svg :Xml) :AABB2
	// {
	// 	com.pblabs.util.Assert.isNotNull(svg);
	// 	var bounds = new AABB2();
	// 	svg = svg.ensureNotDocument();
	// 	if (svg.get('viewBox') != null) {
	// 		var tokens = svg.get("viewBox").split(" ");
	// 		bounds.xmin = Std.parseFloat(tokens[0]);
	// 		bounds.ymin = Std.parseFloat(tokens[1]);
	// 		bounds.xmax = Std.parseFloat(tokens[2]);
	// 		bounds.ymax = Std.parseFloat(tokens[3]);
	// 	} else {
			
	// 		bounds.xmin = svg.get("x") != null ? Std.parseFloat(svg.get("x")) :0.0;
	// 		bounds.ymin = svg.get("y") != null ? Std.parseFloat(svg.get("y")) :0.0;
	// 		bounds.xmax = bounds.xmin + Std.parseFloat(svg.get("width"));
	// 		bounds.ymax = bounds.ymin + Std.parseFloat(svg.get("height"));
	// 	}
	// 	return bounds;
	// }
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
	
	#if (debug_hxhsl && flash)
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		var sigs :Array<Signaler<Dynamic>> = cast [renderCompleteSignal]; 
		for (sig in sigs) {
			if (sig.isListenedTo) {
				for (b in sig.getBonds()) {
					trace("Stuck bond on " + debugOwnerName + "=" + b);
				}
				com.pblabs.util.Assert.isFalse(sig.isListenedTo, debugOwnerName);
			}
		}
	}
	#end
}
