/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from source code from the easel library:
 * http://github.com/aduros/easel
 * Copyright (C) 2010 Bruno Garcia
 *
 * Currently no license is listed for the easel library, so for now, this 
 * code takes on the project default license.
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.canvas;

import easel.display.Canvas;
import easel.display.Context2d;

typedef Matrix = Array<Float>;
typedef Rect = Array<Float>;

class Sprite
{
	public var x (default, setX) :Float;
	public var y (default, setY) :Float;

	public var centerX (default, setCenterX) :Float;
	public var centerY (default, setCenterY) :Float;

	public var alpha :Float;

	// TODO: Make both of these dirtyContents
//	public var mask :Sprite;
//	public var shadow :Bool;

	public var visible :Bool;

	public var composite :String;

	public var scaleX (default, setScaleX) :Float;
	public var scaleY (default, setScaleY) :Float;
	public var rotation (default, setRotation) :Float;

	public var mask (default, setMask) :Sprite;

	public var shadowColor (default, setShadowColor) :String;
	public var shadowOffsetX (default, setShadowOffsetX) :Float;
	public var shadowOffsetY (default, setShadowOffsetY) :Float;
	public var shadowBlur (default, setShadowBlur) :Float;

	public var transform :Matrix;
	public var boundingBox :Rect;

	public var width (getWidth, setWidth) :Float;
	public var height (getHeight, setHeight) :Float;

	public inline var cacheAsBitmap (isCacheAsBitmap, setCacheAsBitmap) :Bool;

	public function new ()
	{
		transform = new Matrix();
		visible = true;
		alpha = 1;
		scaleX = 1;
		scaleY = 1;
		rotation = 0;
		centerX = 0;
		centerY = 0;
		x = 0;
		y = 0;

		boundingBox = [0.0, 0.0, 0.0, 0.0];
		//_isContentsDirty = false;
	}

	public inline function setX (x :Float) :Float
	{
		this.x = x;
		dirtyTransform();
		return this.x;
	}

	public inline function setY (y :Float) :Float
	{
		this.y = y;
		dirtyTransform();
		return this.y;
	}

	public inline function setCenterX (centerX :Float) :Float
	{
		this.centerX = centerX;
		dirtyTransform();
		return this.centerX;
	}

	public inline function setCenterY (centerY :Float) :Float
	{
		this.centerY = centerY;
		dirtyTransform();
		return this.centerY;
	}

	public inline function setScaleX (scaleX :Float) :Float
	{
		this.scaleX = scaleX;
		dirtyTransform();
		return this.scaleX;
	}

	public inline function setScaleY (scaleY :Float) :Float
	{
		this.scaleY = scaleY;
		dirtyTransform();
		return this.scaleY;
	}

	public inline function setRotation (rotation :Float) :Float
	{
		this.rotation = rotation;
		dirtyTransform();
		return this.rotation;
	}

	public inline function setMask (mask :Sprite) :Sprite
	{
		this.mask = mask;
		dirtyContents();
		return this.mask;
	}

	public inline function setShadowColor (shadowColor :String) :String
	{
		this.shadowColor = shadowColor;
		dirtyContents();
		return this.shadowColor;
	}

	public inline function setShadowOffsetX (shadowOffsetX :Float) :Float
	{
		this.shadowOffsetX = shadowOffsetX;
		dirtyContents();
		return this.shadowOffsetX;
	}

	public inline function setShadowOffsetY (shadowOffsetY :Float) :Float
	{
		this.shadowOffsetY = shadowOffsetY;
		dirtyContents();
		return this.shadowOffsetY;
	}

	public inline function setShadowBlur (shadowBlur :Float) :Float
	{
		this.shadowBlur = shadowBlur;
		dirtyContents();
		return this.shadowBlur;
	}

	public inline function setWidth (width :Float) :Float
	{
		boundingBox[2] = width;
		dirtyContents();
		return this.width;
	}

	public inline function getWidth ()
	{
		return boundingBox[2];
	}

	public inline function setHeight (height :Float) :Float
	{
		boundingBox[3] = height;
		dirtyContents();
		return this.height;
	}

	public inline function getHeight ()
	{
		return boundingBox[3];
	}

	public inline function dirtyTransform ()
	{
		_isTransformDirty = true;
	}

	public inline function dirtyContents ()
	{
		_isContentsDirty = true;
	}

	private function updateTransform ()
	{
		var cos = Math.cos(rotation);
		var sin = Math.sin(rotation);
		var cx = -centerX;
		var cy = -centerY;

		if (cacheAsBitmap) {
			cx += boundingBox[0];
			cy += boundingBox[1];
		}

		transform[0] = scaleX * cos;
		transform[1] = scaleX * sin;
		transform[2] = scaleY * -sin;
		transform[3] = scaleY * cos;
		// TODO: Disable pixel snapping?
		transform[4] = Math.floor(cx*transform[0] + cy*transform[2] + x);
		transform[5] = Math.floor(cx*transform[1] + cy*transform[3] + y);
//		transform[4] = cx*transform[0] + cy*transform[2] + x;
//		transform[5] = cx*transform[1] + cy*transform[3] + y;
//		transform[4] = Math.floor(x);
//		transform[5] = Math.floor(y);
//		trace("y is " + untyped __js__("typeof(this.y)"));
//		if (transform[5] < -1000) {
//			trace("cx = " + cx);
//			trace("cy = " + cy);
//			trace("y = " + y);
//			trace("transform = " + transform);
//		}

		_isTransformDirty = false;
	}

	public function setCacheAsBitmap (on :Bool)
	{
		if (on) {
			redrawBackBuffer();
		} else {
			_backBuffer = null;
		}
		return on;
	}

	public inline function isCacheAsBitmap () :Bool
	{
		return _backBuffer != null;
	}

	private function redrawBackBuffer ()
	{
		if (_backBuffer == null) {
			_backBuffer = cast js.Lib.document.createElement("canvas");
		}

		var ctx = _backBuffer.getContext("2d");

		packBounds();
//		_backBuffer.setAttribute("width", untyped Math.ceil(boundingBox[2]));//-boundingBox[0]);
//		_backBuffer.setAttribute("height", untyped Math.ceil(boundingBox[3]));////-boundingBox[1]);

		_backBuffer.width = Math.ceil(boundingBox[2]);//-boundingBox[0]);
		_backBuffer.height = Math.ceil(boundingBox[3]);////-boundingBox[1]);

		trace("Drawing backbuffer " + boundingBox);
		//ctx.save();
//		ctx.save();
//		ctx.fillStyle = "red";
//		ctx.rect(0, 0, boundingBox[2], boundingBox[3]);
//		ctx.fill();
//		ctx.restore();
		ctx.translate(-boundingBox[0], -boundingBox[1]);
		if (shadowColor != null) {
			ctx.shadowColor = shadowColor;
			ctx.shadowOffsetX = shadowOffsetX;
			ctx.shadowOffsetY = shadowOffsetY;
			ctx.shadowBlur = shadowBlur;
		}
		draw(ctx);
		trace(transform);
		//ctx.restore();

		_isContentsDirty = false;
	}

//	public function detach ()
//	{
//		if (parent != null) {
//			parent.remove(this);
//		}
//	}

	public function render (ctx :Context2d)
	{
		if (visible && alpha > 0) {
			ctx.save();

			if (_isTransformDirty) {
				updateTransform();
			}
			if (_isContentsDirty && cacheAsBitmap) {
				redrawBackBuffer();
			}

			var t = transform;
			ctx.transform(t[0], t[1], t[2], t[3], t[4], t[5]);

			var cab = cacheAsBitmap;

			if (mask != null) {
				if (cab) {
					ctx.save(); // TODO: Optimize, this doesn't have to be a saved state, just undo translate
					// TODO: Use cacheAsBitmap transform instead
					ctx.translate(-boundingBox[0], -boundingBox[1]);
					mask.render(ctx);
					ctx.restore();
				} else {
					mask.render(ctx);
				}
				ctx.clip();
			}
			if (alpha < 1) {
				ctx.globalAlpha *= alpha;
			}
			if (composite != null) {
				ctx.globalCompositeOperation = composite;
			}

			if (cab) {
				ctx.drawImage(_backBuffer, 0, 0);
			} else {
				if (shadowColor != null) {
					ctx.shadowColor = shadowColor;
					ctx.shadowOffsetX = shadowOffsetX;
					ctx.shadowOffsetY = shadowOffsetY;
					ctx.shadowBlur = shadowBlur;
				}
				draw(ctx);
			}

			ctx.restore();
		}
	}

	public function draw (ctx :Context2d)
	{
	}

	public function packBounds ()
	{
		if (shadowColor != null) {
			boundingBox[0] = Math.min(boundingBox[0]+shadowOffsetX-5, boundingBox[0]);
			boundingBox[1] = Math.min(boundingBox[1]+shadowOffsetY-5, boundingBox[1]);
			boundingBox[2] = Math.max(boundingBox[2]+shadowOffsetX+5, boundingBox[2]);
			boundingBox[3] = Math.max(boundingBox[3]+shadowOffsetY+5, boundingBox[3]);
		}
	}

	private var _isTransformDirty :Bool;
	private var _isContentsDirty :Bool;
	private var _backBuffer :Canvas;
}

