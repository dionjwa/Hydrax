/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.css;
import com.pblabs.util.StringUtil;

import js.Dom;

/**
  * Basic rectangle sprite for animating via CSS transforms.
  */
class Circle extends Base2DComponent
{
    public var fillColor (get_fillColor, set_fillColor) :Int;
    public var borderColor (get_borderColor, set_borderColor) :Int;
    public var borderWidth (get_borderWidth, set_borderWidth) :Float;
    public var radius (get_radius, set_radius) :Float;
    
    var circle :HtmlDom;
    
    public function new () :Void
    {
        super();
        _radius = 50;
        _fillColor = 0x00ff00;//Green
        _borderColor = 0x000000;//Black
        _borderWidth = 1;
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        
        //Create the rect and put it in the base div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        circle = cast js.Lib.document.createElement("DIV");
        redraw();
        div.appendChild(circle);
    }
    
    override public function onFrame (dt :Float) :Void
    {
        com.pblabs.util.Assert.isNotNull(parent);
        
        if (isDirty) {
            isDirty = false;
            var xOffset = parent.xOffset - (radius / 2);
            var yOffset = parent.yOffset- (radius / 2);
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    
    public function redraw () :Void
    {
       circle.style.cssText = "width:" + radius + "px; height:" + radius + "px; background-color:" + StringUtil.toColorString(fillColor, "#") + "; border-color:" + StringUtil.toColorString(borderColor, "#") + "; border-style:solid; border-width:" + borderWidth + "px;" + "-webkit-border-radius: " + (radius / 2) + "px; -moz-border-radius: " + (radius / 2) + "px;";
    }
    
    function get_fillColor () :Int
    {
        return _fillColor;
    }
    
    function set_fillColor (val :Int) :Int
    {
        _fillColor = val;
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
    
    function get_radius () :Float
    {
        return _radius;
    }
    
    function set_radius (val :Float) :Float
    {
        _radius = val;
        redraw();
        return val;
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
    
    var _fillColor :Int;
    var _borderColor :Int;
    var _radius :Float;
    var _borderWidth :Float;
}


