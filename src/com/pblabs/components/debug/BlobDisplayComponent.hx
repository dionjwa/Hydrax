/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.debug;

import com.pblabs.util.StringUtil;

/**
 * Display coloured, labelled circle with the angle marked.
 */
 
 
class BlobDisplayComponent
#if jscss
extends com.pblabs.components.scene.js.css.Circle
{ public function new () { super (); }}
#else

#if (flash || cpp)
extends com.pblabs.components.scene.flash.Scene2DComponent
#elseif js
extends com.pblabs.components.scene.js.Canvas2DComponent
#end
{
    
    public var fillColor (get_fillColor, set_fillColor) :Int;
    public var radius (get_radius, set_radius) :Float;
    
    public function new (?radius :Float = 10, ?fillColor :Int = 0xff0000, ?fill :Bool = true)
    {
        super();
        _radius = radius;
		_fillColor = fillColor;
		#if flash
        // sceneLayerName = com.pblabs.components.scene.flash.Scene2DManager.DEBUG_LAYER_NAME;
        _displayObject = new flash.display.Sprite();
        #elseif js
        // _circle = new com.pblabs.components.scene.js.CircleSprite(radius);
        // circle.fillStyle = StringUtil.toColorString(fillColor, "#");
        // this.sprite = circle;
        #end
		_fill = fill;
        redraw();
    }
    
    function set_fillColor (val :Int) :Int
    {
        _fillColor = val;
        redraw();
        return val;
    }
    
    function get_fillColor () :Int
    {
        return _fillColor;
    }
	
    function set_radius (val :Float) :Float
    {
        _radius = val;
        redraw();
        return _radius;
    }
    
    function get_radius () :Float
    {
        return _radius;
    }

    function redraw () :Void
    {
        #if flash
        var g :flash.display.Graphics = cast(_displayObject, flash.display.Sprite).graphics;
        g.clear();
        
        if (_fill) {
            g.beginFill(_fillColor);
            g.drawCircle(0, 0, _radius);
            g.endFill();
            g.lineStyle(2, 0x000000);
            g.moveTo(0,0);
            g.lineTo(_radius, 0);
        } else {
            g.lineStyle(2, _fillColor);
            g.drawCircle(0, 0, _radius);
            g.moveTo(0,0);
            g.lineTo(_radius, 0);
        }
        #elseif js
        _circle = new com.pblabs.components.scene.js.CircleSprite(radius);
        _circle.fillStyle = StringUtil.toColorString(fillColor, "#");
        this.sprite = _circle;
        #end
    }
	
    var _fillColor :Int;
    var _radius :Float;
    var _fill :Bool;
    #if js
    var _circle :com.pblabs.components.scene.js.CircleSprite;
    #end
}

#end
