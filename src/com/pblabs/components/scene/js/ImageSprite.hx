/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js;

import js.Dom;

import easel.display.Context2d;

class ImageSprite extends Sprite
{
    public var frame (default, setFrame) :Int;
    public var numFrames (getNumFrames, never) :Int;

    public var frameWidth (default, null) :Float;
    public var frameHeight (default, null) :Float;

    public function new (image :Dynamic, ?frames = 1)
    {
        super();
        boundingBox = [0.0, 0.0, image.width/frames, image.height];
        _image = image;
        _frames = frames;
    }
//
//    public static function fromCanvas (source :Canvas, sx :Float, sy :Float, sw :Float, sh :Float)
//    {
//        var canvas :Canvas = cast js.Lib.document.createElement("canvas");
//        var ctx = canvas.getContext("2d");
//        ctx.drawImage(source, sx, sy, sw, sh, 0, 0, sw, sh);
//        return new ImageSprite(untyped canvas);
//    }

    public inline function setFrame (frame :Int)
    {
        this.frame = frame;
        dirtyContents();
        return this.frame;
    }

    public inline function getNumFrames ()
    {
        return _frames;
    }

    override public function draw (ctx :Context2d)
    {
        if (_frames > 1) {
            var w = Math.floor(width);
            var h = Math.floor(height);
            ctx.drawImage(_image, frame*w, 0, w, h, 0, 0, w, h);
        } else {
            ctx.drawImage(_image, 0, 0);
        }
    }

    private var _image :Dynamic;
    private var _frames :Int;
}
