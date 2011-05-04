/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.ReflectUtil;

import easel.display.Canvas;
import easel.display.Context2d;

import js.Dom;

// typedef Matrix = Array<Float>;
typedef Rect = Array<Float>;

/**
  * Base JS SceneComponent class.  Can be rendering on a Canvas layer, or 
  * rendered in a DOM based scene and transformed via CSS.
  */
class SceneComponent extends BaseSceneComponent<JSLayer>,
	implements IAnimatedObject
{
	/** Set this when added to the parent */
	public var isOnCanvas(default, null) :Bool;
	public var div (default, null) :HtmlDom;
	public var displayObject (get_displayObject, set_displayObject) :HtmlDom;
	public var cacheAsBitmap (get_cacheAsBitmap, set_cacheAsBitmap) :Bool;
	var _displayObject :HtmlDom;
	
	// public var transform :Matrix;
	public var boundingBox :Rect;
	
	private var _isContentsDirty :Bool;
	private var _backBuffer :Canvas;
	
	public function new () :Void
	{
		super();
		isOnCanvas = false;
		_isContentsDirty = true;
		boundingBox = [0.0, 0.0, 0.0, 0.0];
		//Create the image and containing div element
		//Why put it in a div?
		//http ://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
		div = cast js.Lib.document.createElement("div");
		//The default origin for css elements is the center, but change it to the top left to be consistent
		//with other platforms.
		//Why -webkit-transform:translateZ(0px)?  It triggers gpu acceleration on iOs
		//http://sebleedelisle.com/2011/04/html5javascript-platform-game-optimised-for-ipad/
		div.style.cssText = "position:absolute;-webkit-transform-origin:0% 0%;-moz-transform-origin:0% 0%;-webkit-transform:translateZ(0px)";
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (isOnCanvas) {
		} else {
			com.pblabs.util.Assert.isNotNull(parent);
			if (isTransformDirty) {
				updateTransform();
				var xOffset = 0;//parent.xOffset;
				var yOffset = 0;//parent.yOffset;
				untyped div.style.webkitTransform = _transformMatrix.toString();
			}
		}
	}
	
	public inline function dirtyContents ()
	{
		_isContentsDirty = true;
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		
		isOnCanvas = Std.is(parent, com.pblabs.components.scene2D.js.canvas.SceneLayer);
		
		#if debug
		if (isOnCanvas)
			com.pblabs.util.Assert.isNotNull(div);
		#end
		
		if (isOnCanvas) {
		} else {
			layer.div.appendChild(div);
			com.pblabs.util.Assert.isNotNull(div.parentNode);
		}
	}
	
	override function removingFromParent () :Void
	{
		super.removingFromParent();
		#if debug
		com.pblabs.util.Assert.isNotNull(div);
		#end
		
		if (isOnCanvas) {
		} else {
			parent.div.removeChild(div);
		}
		
	}
	
	override function set_isTransformDirty (val :Bool) :Bool
	{
		if (val && layer != null) {
			layer.isTransformDirty = true;
		}
		return super.set_isTransformDirty(val);
	}
	
	function get_displayObject () :HtmlDom
	{
		return _displayObject;
	}
	
	function set_displayObject (val :HtmlDom) :HtmlDom
	{
		if (isOnCanvas) {
			trace("?");
			return val;
		}
		if (_displayObject != null) {
			if (_displayObject.parentNode != null) {
				_displayObject.parentNode.removeChild(_displayObject);
			}
		}
		_displayObject = val;
		if (_displayObject != null) {
			if (_displayObject.parentNode != null) {
				_displayObject.parentNode.removeChild(_displayObject);
			}
			if (div != null) {
				div.appendChild(_displayObject);
			}
			if (Reflect.hasField(displayObject, "width")) {
				_width = Std.parseInt(Reflect.field(displayObject, "width"));
			}
			if (Reflect.hasField(displayObject, "height")) {
				_height = Std.parseInt(Reflect.field(displayObject, "height"));
			}
			if (_width == 0 || Math.isNaN(_width)) {
				_width = Std.parseFloat(displayObject.getAttribute("width"));
			} else {
				set_width(_width);
			}
			if (_height == 0 || Math.isNaN(_height)) {
				_height = Std.parseFloat(displayObject.getAttribute("width"));
			} else {
				set_height(_height);
			}
		}
		isTransformDirty = true;
		return val;
	}
	
	function createCanvas () :Canvas
	{
		var canvas :Canvas = cast js.Lib.document.createElement("canvas");
		canvas.style.cssText = "position:relative;left:0px;top:0px;-webkit-transform:translateZ(0px)";
		// canvas.style.position = "relative";
		// canvas.style.left = "0px";
		// canvas.style.top = "0px";
		return canvas;
	}
	
	function set_cacheAsBitmap (val :Bool) :Bool
	{
		if (val) {
			redrawBackBuffer();
		} else {
			_backBuffer = null;
		}
		return val;
	}
	
	inline function get_cacheAsBitmap () :Bool
	{
		return _backBuffer != null;
	}
	
	private function redrawBackBuffer ()
	{
		if (_backBuffer == null) {
			_backBuffer = cast js.Lib.document.createElement("canvas");
			_backBuffer.width = 300;
			_backBuffer.height = 300;
			// _backBuffer.style.cssText = "position:absolute;visibility:hidden;display:block";
			// div.style.cssText = "position:absolute;visibility:hidden;display:block";
			_backBuffer.style.position = "absolute";
			_backBuffer.style.visibility = "hidden";
			_backBuffer.style.display = "block";
// 			obj.style.position='absolute';
// obj.style.visibility='hidden';
// obj.style.display='block';
			//Add to the div display object, so it can be rendered to either CSS or Canvas layers.
			com.pblabs.util.Assert.isNotNull(div);
			// js.Lib.document.getElementById('dump').appendChild(_backBuffer);
			div.appendChild(_backBuffer);
			// trace("_backBuffer.width=" + _backBuffer.width);
			// trace("div.clientWidth=" + div.clientWidth);
		}
		// trace("redrawBackBuffer");

		// packBounds();
//		_backBuffer.setAttribute("width", untyped Math.ceil(boundingBox[2]));//-boundingBox[0]);
//		_backBuffer.setAttribute("height", untyped Math.ceil(boundingBox[3]));////-boundingBox[1]);

		// _backBuffer.width = Math.ceil(boundingBox[2]);//-boundingBox[0]);
		// _backBuffer.height = Math.ceil(boundingBox[3]);////-boundingBox[1]);

		// _backBuffer.width = Std.int(width);
		// _backBuffer.height = Std.int(height);
		
		var ctx = _backBuffer.getContext("2d");
		
		//ctx.save();
//		ctx.save();
//		ctx.fillStyle = "red";
//		ctx.rect(0, 0, boundingBox[2], boundingBox[3]);
//		ctx.fill();
//		ctx.restore();
		// ctx.translate(-boundingBox[0], -boundingBox[1]);
		// if (shadowColor != null) {
		// 	ctx.shadowColor = shadowColor;
		// 	ctx.shadowOffsetX = shadowOffsetX;
		// 	ctx.shadowOffsetY = shadowOffsetY;
		// 	ctx.shadowBlur = shadowBlur;
		// }
		_isContentsDirty = false;
		draw(ctx);
		// trace(transform);
		//ctx.restore();

		
	}
	
	public function render (ctx :Context2d) :Void
	{
		com.pblabs.util.Assert.isNotNull(ctx, "Null Context2d?");
		// trace("visible=" + visible);
		// trace("alpha=" + alpha);
		// trace("ctx=" + ctx);
		if (visible && alpha > 0) {
			ctx.save();
			// trace(1);
			if (isTransformDirty) {
				updateTransform();
			}
			// trace(2);
			if (_isContentsDirty && cacheAsBitmap) {
				redrawBackBuffer();
			}
			// trace(3);
			com.pblabs.util.Assert.isNotNull(_transformMatrix, "Null _transformMatrix?");
			untyped ctx.transform(
				_transformMatrix.a.toFixed(4), 
				_transformMatrix.b.toFixed(4), 
				_transformMatrix.c.toFixed(4), 
				_transformMatrix.d.toFixed(4), 
				_transformMatrix.tx.toFixed(4), 
				_transformMatrix.ty.toFixed(4));

			var cab = cacheAsBitmap;

			// if (mask != null) {
			// 	if (cab) {
			// 		ctx.save(); // TODO: Optimize, this doesn't have to be a saved state, just undo translate
			// 		// TODO: Use cacheAsBitmap transform instead
			// 		ctx.translate(-boundingBox[0], -boundingBox[1]);
			// 		mask.render(ctx);
			// 		ctx.restore();
			// 	} else {
			// 		mask.render(ctx);
			// 	}
			// 	ctx.clip();
			// }
			if (alpha < 1) {
				ctx.globalAlpha *= alpha;
			}
			// if (composite != null) {
			// 	ctx.globalCompositeOperation = composite;
			// }
			// trace(4);
			if (cab) {
				// trace("drawing backbuffer " + _backBuffer);
				ctx.drawImage(_backBuffer, 0, 0);
			} else {
				// if (shadowColor != null) {
				// 	ctx.shadowColor = shadowColor;
				// 	ctx.shadowOffsetX = shadowOffsetX;
				// 	ctx.shadowOffsetY = shadowOffsetY;
				// 	ctx.shadowBlur = shadowBlur;
				// }
				// trace("drawing direct");
				draw(ctx);
			}

			ctx.restore();
		}
	}
	
	public function draw (ctx :Context2d)
	{
		throw "Subclasses must override";	
	}
	
	override function set_visible (val :Bool) :Bool
	{
		super.set_visible(val);
		div.style.visibility = _visible ? "visible" : "hidden";
		return val;
	}
}
