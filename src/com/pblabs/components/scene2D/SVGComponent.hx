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

import de.polygonal.motor2.geom.primitive.AABB2;
import de.polygonal.motor2.geom.math.XY;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import flash.geom.Matrix;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.resource.ResourceToken;

using com.pblabs.util.XMLUtil;
using com.pblabs.util.StringUtil;
using StringTools;

#if flash
using com.pblabs.util.DisplayUtils;
#end
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
	public static var ANCHOR_PREFIX = "anchor";
	#if (flash || cpp)
	/** Fired when the svgweb renderer completes */
	public var renderCompleteSignal (default, null):Signaler<Void>;
	#end
	/** The IResources */
	/** Load the svg(s) as a raw strings.  They're inserted in the dom, or parsed and rendered to the canvas. */
	public var resources :Array<ResourceToken<String>>;
	public var svgData (get_svgData, set_svgData) :Array<String>;
	var _svgData :Array<String>;
	function get_svgData () :Array<String> { return _svgData; }
	function set_svgData (val :Array<String>) :Array<String>
	{
		com.pblabs.util.Assert.isNotNull(val, "SVG data is null");
		//Create copies
		_svgData = [];
		for (svg in val) {
			_svgData.push(processReplacements(new String(svg), svgRegexReplacements));
		}
		_individualBounds = [];
		var boundsUnion = new AABB2();
		
		for (ii in 0..._svgData.length) {
			#if js
			var idx = _svgData[ii].indexOf("<svg");
			if (idx > -1) {
				//SVG documents added to the dom via innerHTML are *not* allowed to have any preamble.
				_svgData[ii] = _svgData[ii].substr(idx);
			}
			#end
			var svgXml = Xml.parse(_svgData[ii]).ensureNotDocument();
			var b = parseBounds(svgXml);
			_individualBounds.push(b);
			
			//Parse the first image for anchor elements, and only use the first element for mouse bounds
			if (ii == 0) {
				boundsUnion.addAABB(b);
				_relativeTransforms = parseAnchors(svgXml);
				_relativeTransforms.unshift(new Vector2());
			} else if (_relativeTransforms[ii] != null) {
				_relativeTransforms[ii].x -= b.intervalX / 2;
				_relativeTransforms[ii].y -= b.intervalY / 2;
			}
		}
		//Set the identity transform to the first svg
		registrationPoint.x = boundsUnion.intervalX / 2;
		registrationPoint.y = boundsUnion.intervalY / 2;
		_unscaledBounds = boundsUnion;
		_bounds = _unscaledBounds.clone();
		
		
		#if (flash || cpp)
		_displayObject.removeAllChildren();
		for (ii in 0...svgData.length) {
			var svgString = svgData[ii];
			//Transform it
			var svg = new org.svgweb.SVGViewerFlash();
			cast(_displayObject, flash.display.Sprite).addChild(svg);
			svg.xml = new flash.xml.XML(svgString);
			if (ii > 0) {
				var v = _relativeTransforms[ii];
				if (v != null && v.x != 0 && v.y != 0) {
					svg.x = v.x;
					svg.y = v.y;
				}
			}
			var self = this;
			com.pblabs.util.EventDispatcherUtil.addOnceListener(svg.svgRoot, org.svgweb.events.SVGEvent.SVGLoad, 
			function (ignored :Dynamic) :Void {
				self.renderCompleteSignal.dispatch();
			});
		}
		#end
		
		return val;
	}
	
	/** Dynamically replace text in the svg string.  Allows e.g. custom text */
	public var svgRegexReplacements :Array<Tuple<EReg, String>>;
	
	var _relativeTransforms :Array<XY>;
	var _individualBounds :Array<AABB2>;
	
	public function new () :Void
	{
		super();
		svgRegexReplacements = [];
		_relativeTransforms = [];
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
	
	override function onAdd () :Void
	{
		super.onAdd();
		loadFromResource();
	}
	
	function loadFromResource () :Void
	{
		com.pblabs.util.Assert.isNotNull(resources);
		var svgs = [];
		for (rs in resources) {
			var svgString = context.get(rs);
			com.pblabs.util.Assert.isNotNull(svgString, "Missing svgString from " + rs);
			svgs.push(Std.string(svgString));
		}
		svgData = svgs;
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_svgData = null;
	}
	
	#if js
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
			//Remove previous children
			while (div.hasChildNodes()) {
				div.removeChild(div.lastChild);
			}
			//Create a div for each svg
			for (ii in 0...svgData.length) {
				var svg = svgData[ii];
				var d = com.pblabs.components.scene2D.js.SceneComponent.createDiv();
				div.appendChild(d);
				d.innerHTML = svg;
				//Transform it
				var v = _relativeTransforms[ii];
				if (v != null && v.x != 0 && v.y != 0) {
					var t :Matrix = new Matrix(1, 0, 0, 1, v.x, v.y);
					untyped d.style.webkitTransform = t.toString();
				}
			}
		}
	}
	
	override public function draw (ctx :easel.display.Context2d)
	{
		com.pblabs.util.Assert.isNotNull(ctx);
		if (svgData == null) {
			_isContentsDirty = true;
			ctx.fillRect(0, 0, 30, 30);
			return;
		}
		//Temporary hack: use canvg library for rendering SVGs to canvas
		for (ii in 0...svgData.length) {
			var svg = svgData[ii];
			var args = { ignoreMouse: true, ignoreAnimation: true, ignoreDimensions: true, ignoreClear: true };
			//Transform it
			var v = _relativeTransforms[ii];
			if (v != null && v.x != 0 && v.y != 0) {
				Reflect.setField(args, "offsetX", v.x);
				Reflect.setField(args, "offsetY", v.y);
			}
			Reflect.setField(args, "scaleWidth", width);
			Reflect.setField(args, "scaleHeight", height);
			untyped canvg(ctx.canvas, svg, args);
		}
	}
	
	override private function redrawBackBuffer ()
	{
		if (_backBuffer == null) {
			_backBuffer = cast js.Lib.document.createElement("canvas");
			com.pblabs.util.Assert.isNotNull(div);
			div.appendChild(_backBuffer);
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
	
	public static function parseBounds (svg :Xml) :AABB2
	{
		com.pblabs.util.Assert.isNotNull(svg);
		var bounds = new AABB2();
		svg = svg.ensureNotDocument();
		if (svg.get('viewBox') != null) {
			var tokens = svg.get("viewBox").split(" ");
			bounds.xmin = Std.parseFloat(tokens[0]);
			bounds.ymin = Std.parseFloat(tokens[1]);
			bounds.xmax = Std.parseFloat(tokens[2]);
			bounds.ymax = Std.parseFloat(tokens[3]);
		} else {
			var w = Std.parseFloat(svg.get("width"));
			var h = Std.parseFloat(svg.get("height"));
			bounds.xmin = 0;
			bounds.xmax = w;
			bounds.ymin = 0;
			bounds.ymax = h;
		}
		return bounds;
	}
	
	static function parseAnchors(svg :Xml) :Array<XY>
	{
		var anchors = new Array<XY>();
		for (element in svg.elements()) {
			if (element.nodeName.endsWith("rect")) {
				if (element.get("inkscape:label") != null && element.get("inkscape:label").startsWith(ANCHOR_PREFIX)) {
					var x = Std.parseFloat(element.get("x"));
					var y = Std.parseFloat(element.get("y"));
					var w = Std.parseFloat(element.get("width"));
					var h = Std.parseFloat(element.get("height"));
					var anchor = new Vector2(x + w / 2, y + h / 2);
					anchors.push(anchor);
				}
			}
			
		}
		return anchors;
	}
	
	static function processReplacements(svg :String, replacements :Array<Tuple<EReg, String>>) :String
	{
		if (replacements == null || replacements.length == 0) {
			//Clone the String anyway
			return new String(svg);
		}
		var result = new String(svg.toString());
		for (r in replacements) {
   			result = r.v1.replace(result, r.v2);
		}
		return result;
	}
	
	#if debug
	public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
	
	#if (debug && flash)
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
