/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.canvas;

import easel.display.Context2d;

class RectSprite extends Sprite
{
	public var fillStyle (default, setFillStyle) :Dynamic;
	public var strokeStyle (default, setStrokeStyle) :Dynamic;

	public inline function setStrokeStyle (strokeStyle :Dynamic)
	{
		this.strokeStyle = strokeStyle;
		dirtyContents();
		return this.strokeStyle;
	}

	public inline function setFillStyle (fillStyle :Dynamic)
	{
		this.fillStyle = fillStyle;
		dirtyContents();
		return this.fillStyle;
	}

	public function new (w :Float, h :Float)
	{
		super();
		// FIXME
		// boundingBox = [-w / 2, -h / 2, w, h];
		boundingBox = [0, 0, w, h];
	}

	override public function draw (ctx :Context2d)
	{
		// trace("drawing the rect");
		ctx.fillRect(-width / 2, - height / 2, width, height);
		// ctx.closePath();
		// ctx.beginPath();
		// ctx.rect(-width / 2, - height / 2, width, height);
		// ctx.arc(0, 0, 200, 0, Math.PI*2, true);
		// if (fillStyle != null) {
		// 	ctx.fillStyle = fillStyle;
		// 	// ctx.beginPath();
		// 	ctx.fill();
		// }
		// ctx.closePath();
//		if (strokeStyle != null) {
//			ctx.strokeStyle = strokeStyle;
//			ctx.beginPath();
//			ctx.arc(0, 0, radius, 0, Math.PI*2, true);
//			ctx.stroke();
//		}
//		trace(ctx.strokeStyle);
//		trace(ctx.shadowColor);
//		ctx.stroke();
		//ctx.restore();
	}
}

