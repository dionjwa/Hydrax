/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js.canvas;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.js.canvas.SceneLayer;
import com.pblabs.components.scene2D.js.canvas.SceneManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Assert;
import com.pblabs.util.ReflectUtil;

import easel.display.Canvas;
import easel.display.Context2d;

typedef Matrix = Array<Float>;
typedef Rect = Array<Float>;

class SceneComponent extends BaseSceneComponent<SceneLayer>
{
	// public var sprite :Sprite;
	
	// public var alpha :Float;

	// TODO: Make both of these dirtyContents
//	public var mask :Sprite;
//	public var shadow :Bool;

	// public var visible :Bool;

	public var composite :String;
	// public var mask (default, setMask) :Sprite;

	public var shadowColor (default, setShadowColor) :String;
	public var shadowOffsetX (default, setShadowOffsetX) :Float;
	public var shadowOffsetY (default, setShadowOffsetY) :Float;
	public var shadowBlur (default, setShadowBlur) :Float;

	public var transform :Matrix;
	public var boundingBox :Rect;

	public inline var cacheAsBitmap (isCacheAsBitmap, setCacheAsBitmap) :Bool;
	public var centerX (default, setCenterX) :Float;
	public var centerY (default, setCenterY) :Float;
	
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
	
	public function new () :Void
	{
		super();
		// sprite = s;
		transform = new Matrix();
		visible = true;
		alpha = 1;
		boundingBox = [0.0, 0.0, 0.0, 0.0];
	}
	
	override function onReset () :Void
	{
		super.onReset();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		if (layer != null) {
			cast(layer, SceneLayer).isTransformDirty = true;
		}
	}
	
	
	override function set_isTransformDirty (val :Bool) :Bool
	{
		if (val && layer != null) {
			cast(layer, SceneLayer).isTransformDirty = true;
		}
		return super.set_isTransformDirty(val);
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
	
	public inline function dirtyTransform ()
	{
		isTransformDirty = true;
	}

	public inline function dirtyContents ()
	{
		_isContentsDirty = true;
	}
	
	private function updateTransform ()
	{
		// trace("updating transform");
		// trace("x=" + x);
		// trace("y=" + y);
		// trace("angle=" + angle);
		// trace("scale=" + scale);
		var cos = Math.cos(angle);
		var sin = Math.sin(angle);
		var cx = -centerX;
		var cy = -centerY;
		// var cx = -x;
		// var cy = -y;

		if (cacheAsBitmap) {
			cx += boundingBox[0];
			cy += boundingBox[1];
		}

		transform[0] = scaleX * cos;
		transform[1] = scaleY * sin;
		transform[2] = scaleX * -sin;
		transform[3] = scaleY * cos;
		// TODO: Disable pixel snapping?
		transform[4] = Math.floor(cx*transform[0] + cy*transform[2] + x);
		transform[5] = Math.floor(cx*transform[1] + cy*transform[3] + y);
		// trace("transform=" + transform);
		// trace("cx=" + cx);
		// trace("cx*transform[0]=" + (cx*transform[0]));
		// trace("(cy*transform[2])=" + (cy*transform[2]));
		// trace("x=" + x);
		// transform[4] = cx*transform[0] + cy*transform[2] + x;
		// transform[5] = cx*transform[1] + cy*transform[3] + y;
		// trace("transform=" + transform);
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
	
	public function render (ctx :Context2d) :Void
	{
		if (visible && alpha > 0) {
			ctx.save();

			if (isTransformDirty) {
				updateTransform();
			}
			if (_isContentsDirty && cacheAsBitmap) {
				redrawBackBuffer();
			}

			var t = transform;
			// trace("transform=" + transform);
			ctx.transform(t[0], t[1], t[2], t[3], t[4], t[5]);

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
		throw "Subclasses must override";	
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
	
	// override function get_x () :Float
	// {
	// 	return sprite.x;
	// }
	
	// override function set_x (val :Float) :Float
	// {
	// 	sprite.x = val;
	// 	isTransformDirty = true;
	// 	return val;
	// }
	
	// override function get_y () :Float
	// {
	// 	return sprite.y;
	// }
	
	// override function set_y (val :Float) :Float
	// {
	// 	sprite.y = val;
	// 	isTransformDirty = true;
	// 	return val;
	// }
	
	// override function get_angle () :Float
	// {
	// 	return sprite.rotation;
	// }
	
	// override function set_angle (val :Float) :Float
	// {
	// 	sprite.rotation = val;
	// 	isTransformDirty = true;
	// 	return val;
	// }
	
	private var _isContentsDirty :Bool;
	private var _backBuffer :Canvas;
}
