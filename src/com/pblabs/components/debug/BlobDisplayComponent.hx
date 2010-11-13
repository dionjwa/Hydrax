/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.debug;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.engine.debug.Log;
import com.pblabs.geom.Circle;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.StringUtil;
using com.pblabs.components.scene.SceneUtil;
using com.pblabs.geom.CircleUtil;

/**
 * Display coloured, labelled circle with the angle marked.
 */
 @sets("IInteractiveComponent")
class BlobDisplayComponent
#if (js && jscss)
extends com.pblabs.components.scene.js.css.Base2DComponent,
// { public function new () { super (); }}
#elseif (flash || cpp)
extends com.pblabs.components.scene.flash.Scene2DComponent,
#elseif js
extends com.pblabs.components.scene.js.canvas.Canvas2DComponent,
#end
    implements IInteractiveComponent
{
    public var boundingRect (get_boundingRect, null) :Rectangle;
    public var fillColor (get_fillColor, set_fillColor) :Int;
    public var radius (get_radius, set_radius) :Float;
    public var borderColor (get_borderColor, set_borderColor) :Int;
    public var borderWidth (get_borderWidth, set_borderWidth) :Float;
    public var text (get_text, set_text) :String;
    
    public function new (?radius :Float = 60, ?fillColor :Int = 0xff0000, ?fill :Bool = true)
    {
        super();
        _radius = radius;
		_fillColor = fillColor;
		_borderWidth = 1;
		#if flash
        // sceneLayerName = com.pblabs.components.scene.flash.Scene2DManager.DEBUG_LAYER_NAME;
        _displayObject = new flash.display.Sprite();
        #elseif (js && jscss)
        _circleDom = cast js.Lib.document.createElement("DIV");
        #elseif js
        // _circleSprite = new com.pblabs.components.scene.js.canvas.CircleSprite(radius);
        // _circleSprite.fillStyle = StringUtil.toColorString(fillColor, "#");
        // this.sprite = _circleSprite;
        #end
		_fill = fill;
        redraw();
        _circle = new Circle(_radius);
    }
    
    override public function setLocation (loc :Vector2) :Void
    {
        super.setLocation(loc);
        _circle.x = x;
        _circle.y = y;
    }
    
    #if jscss
    override public function onFrame (dt :Float) :Void
    {
        if (isDirty) {
            isDirty = false;
            var xOffset = parent.xOffset - radius;
            var yOffset = parent.yOffset- radius;
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    #end
    
    public function containsScreenPoint (pos :Vector2) :Bool
    {
        #if (flash || cpp)
        //The flash pos argument is already transformed to the 
        //SceneManager coords.
        return _circle.containsPoint(pos);
        #elseif js
        // trace(_circle + " contains screen=" + pos + " translated to " + parent.scene.translateScreenToWorld(pos)); 
        // trace("containsScreenPoint " + pos);
        // trace("translated=" + parent.scene.translateScreenToWorld(pos));
        return _circle.containsPoint(parent.scene.translateScreenToWorld(pos));
        //Translate coords
        #else
        return false;
        #end
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        #if (js && jscss)
        //Put the element in the base div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        div.appendChild(_circleDom);
        #end
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
        _circle.radius = _radius;
        redraw();
        return _radius;
    }
    
    function get_radius () :Float
    {
        return _radius;
    }

    function redraw () :Void
    {
        #if (js && jscss)
       _circleDom.style.cssText = "width:" + (radius * 2) + "px; height:" + (radius * 2) + "px; background-color:" + StringUtil.toColorString(fillColor, "#") + "; border-color:" + StringUtil.toColorString(borderColor, "#") + "; border-style:solid; border-width:" + borderWidth + "px;" + "-webkit-border-radius: " + radius + "px; -moz-border-radius: " + radius + "px;";
       // _circleDom.style.cssText = "width:" + (radius * 2) + "px; height:" + (radius * 2) + "px; background-color:" + StringUtil.toColorString(fillColor, "#") + "; border-color:" + StringUtil.toColorString(borderColor, "#") + "; border-style:solid; border-width:" + borderWidth + "px;" + "-webkit-border-radius: " + radius + "px; -moz-border-radius: " + radius + "px;";
       isDirty = true;
        #elseif flash
        var g :flash.display.Graphics = cast(_displayObject, flash.display.Sprite).graphics;
        g.clear();
        
        // if (_fill) {
            g.beginFill(_fillColor);
            g.drawCircle(0, 0, _radius);
            g.endFill();
            g.lineStyle(2, 0x000000);
            g.moveTo(0,0);
            g.lineTo(_radius, 0);
        // } else {
        //     g.lineStyle(2, _fillColor);
        //     g.drawCircle(0, 0, _radius);
        //     g.moveTo(0,0);
        //     g.lineTo(_radius, 0);
        // }
        #elseif js
        _circleSprite = new com.pblabs.components.scene.js.canvas.CircleSprite(radius);
        _circleSprite.fillStyle = StringUtil.toColorString(fillColor, "#");
        // _circleSprite.
        this.sprite = _circleSprite;
        #end
    }
    
    function get_boundingRect () :Rectangle
    {
        Log.error("Not implemented " + Log.getStackTrace());
        return null;
    }
    
    function get_borderWidth () :Float
    {
        return _borderWidth;
    }
    
    function set_borderWidth (val :Float) :Float
    {
        _borderWidth = val;
        redraw();
        return val;
    }
    
    function get_borderColor () :Int
    {
        return _borderColor;
    }
    
    function set_borderColor (val :Int) :Int
    {
        _borderColor = val;
        redraw();
        return val;
    }
    
    function get_text () :String
    {
        return "";
    }
    
    function set_text (val :String) :String
    {
        #if flash
        if (_textField == null) {
            _textField = new flash.text.TextField();
            cast(_displayObject, flash.display.Sprite).addChild(_textField);
        }
        _textField.text = val;
        #end
        return val;
    }
	
    var _circle :Circle;
    var _fillColor :Int;
    var _radius :Float;
    var _fill :Bool;
    var _borderColor :Int;
    var _borderWidth :Float;
    
    #if (js && jscss)
    var _circleDom :js.Dom.HtmlDom;
    #elseif js
    var _circleSprite :com.pblabs.components.scene.js.canvas.CircleSprite;
    #elseif (flash || cpp)
    var _textField :flash.text.TextField;
    //Assume flash/cpp
    #end
}
