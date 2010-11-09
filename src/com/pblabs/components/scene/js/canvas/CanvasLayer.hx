/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.canvas;

import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.components.scene.js.JSLayer;
import com.pblabs.components.scene.js.canvas.Canvas2DComponent;
import com.pblabs.engine.time.IAnimatedObject;

import easel.display.Canvas;
import easel.display.Context2d;

import js.Lib;

class CanvasLayer extends JSLayer<CanvasScene2D, Canvas2DComponent>,
    implements IAnimatedObject
{
    /** Children mark this when they're modified*/
    public var isDirty :Bool;
    public var canvas (default, null) :Canvas;
    public var ctx (default, null) :Context2d;
    
    public function new ()
    {
        super();
    }
    
    public function onFrame (dt :Float) :Void
    {
        if (!isDirty) {
            return;
        }
        //Fill transparent first
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        // Render
        if (children != null) {
            for (c in children) {
                c.render(ctx);
            }
        }
        isDirty = false;
    }
    
    override function addedToParent () :Void
    {
        if (canvas == null) {
            canvas = createCanvas();
            canvas.width = Std.int(parent.sceneView.width);
            canvas.height = Std.int(parent.sceneView.height);
            isDirty = true;
            ctx = canvas.getContext("2d");
            div.appendChild(canvas);
            super.addedToParent();
        }
        super.addedToParent();
    }
    
    override function onRemove () :Void
    {
        super.onRemove();
        ctx = null;
    }
    
    
    function createCanvas () :Canvas
    {
        var canvas :Canvas = cast Lib.document.createElement("CANVAS");
        canvas.style.position = "relative";
        canvas.style.left = "0px";
        canvas.style.top = "0px";
        return canvas;
    }
}


