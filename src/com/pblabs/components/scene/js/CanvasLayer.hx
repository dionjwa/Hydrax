/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js;

import easel.display.Canvas;
import easel.display.Context2d;

import com.pblabs.components.scene.js.Canvas2DComponent;

class CanvasLayer
{
    /** Children mark this when they're modified*/
    public var isDirty :Bool;
    public var name (default, null) :String;
    public var canvas (default, null) :Canvas;
    public var ctx (default, null) :Context2d;
    public var children :Array<Canvas2DComponent>;
    
    public function new (name :String, canvas :Canvas)
    {
        children = new Array();
        this.name = name;
        this.canvas = canvas;
        isDirty = true;
        ctx = canvas.getContext("2d");
    }
    
    public function render () :Void
    {
        if (!isDirty) {
            return;
        }
        //Fill transparent first
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        // Render
        for (c in children) {
            c.render(ctx);
        }
        isDirty = false;
    }
}


