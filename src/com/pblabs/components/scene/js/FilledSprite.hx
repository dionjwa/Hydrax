/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js;

import easel.display.Context2d;

class FilledSprite extends Sprite
{
    public var fillStyle (default, setFillStyle) :Dynamic;
    public var strokeStyle (default, setStrokeStyle) :Dynamic;
    public var lineWidth (default, setLineWidth) :Float;

    public function new (fillStyle :Dynamic, ?width = 0, ?height = 0)
    {
        super();
        this.width = width;
        this.height = height;
        this.fillStyle = fillStyle;
        this.lineWidth = 1;
    }

    public inline function setFillStyle (fillStyle :Dynamic)
    {
        this.fillStyle = fillStyle;
        dirtyContents();
        return this.fillStyle;
    }

    public inline function setStrokeStyle (strokeStyle :Dynamic)
    {
        this.strokeStyle = strokeStyle;
        dirtyContents();
        return this.strokeStyle;
    }

    public inline function setLineWidth (lineWidth :Float)
    {
        this.lineWidth = lineWidth;
        dirtyContents();
        return this.lineWidth;
    }

    override public function draw (ctx :Context2d)
    {
        var w = (width > 0) ? width : ctx.canvas.width;
        var h = (height > 0) ? height : ctx.canvas.height;

        if (fillStyle != null) {
            ctx.fillStyle = fillStyle;
            ctx.fillRect(0, 0, w, h);
        }
//        ctx.beginPath();
//        ctx.rect(0,0,w,h);
        if (strokeStyle != null) {
            ctx.strokeStyle = strokeStyle;
            ctx.lineWidth = lineWidth;
            ctx.strokeRect(0, 0, w, h);
        }
    }
}

