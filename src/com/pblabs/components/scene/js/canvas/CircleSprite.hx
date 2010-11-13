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

class CircleSprite extends Sprite
{
    public var radius (default, setRadius) :Float;
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

    public inline function setRadius (radius :Dynamic)
    {
        this.radius = radius;
        dirtyContents();
        return this.radius;
    }

    public function new (radius :Float)
    {
        super();
        // FIXME
        boundingBox = [-radius, -radius, 2*radius, 2*radius];
        this.radius = radius;
    }

    override public function draw (ctx :Context2d)
    {
        // ctx.closePath();
        ctx.beginPath();
        ctx.arc(0, 0, radius, 0, Math.PI*2, true);
        if (fillStyle != null) {
            ctx.fillStyle = fillStyle;
            //ctx.beginPath();
            ctx.fill();
        }
        // ctx.closePath();
//        if (strokeStyle != null) {
//            ctx.strokeStyle = strokeStyle;
//            ctx.beginPath();
//            ctx.arc(0, 0, radius, 0, Math.PI*2, true);
//            ctx.stroke();
//        }
//        trace(ctx.strokeStyle);
//        trace(ctx.shadowColor);
//        ctx.stroke();
        //ctx.restore();
    }
}

