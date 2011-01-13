/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.css;
import com.pblabs.components.scene.ISpatialObject2D;
import com.pblabs.geom.Vector2;
import com.pblabs.util.StringUtil;

import js.Dom;

/**
  * Basic rectangle sprite for animating via CSS transforms.
  */
class Rectangle extends Base2DComponent,
    implements ISpatialObject2D
{
    public var centered (get_centered, set_centered) :Bool;
    public var fillColor (get_fillColor, set_fillColor) :Int;
    public var borderColor (get_borderColor, set_borderColor) :Int;
    public var borderWidth (get_borderWidth, set_borderWidth) :Float;
    
    /** From ISpatialObject */
    public var boundingRect (get_boundingRect, null) :com.pblabs.geom.Rectangle;
    
    var rect :HtmlDom;
    
    public function new () :Void
    {
        super();
        _width = 200;
        _height = 120;
        _fillColor = 0x00ff00;//Green
        _borderColor = 0x000000;//Black
        _borderWidth = 1;
        rect = cast js.Lib.document.createElement("DIV");
        _spatialRect = new com.pblabs.geom.Rectangle(0, 0, _width, _height);
    }
    
    /** From ISpatialObject */
    public function containsPoint (pos :Vector2) :Bool
    {
        updateBoundingRect();
        return _spatialRect.containsPoint(pos);
    }
    
    public function setRect (w :Float, h :Float) :Void
    {
        width = w;
        height = h;
        // redraw();
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        
        //Put the element in the base div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        redraw();
        div.appendChild(rect);
    }
    
    public function redraw () :Void
    {
        rect.style.cssText = " width:" + width + "px; height:" + height + "px; background-color:" + StringUtil.toColorString(fillColor, "#") + "; border-color:" + StringUtil.toColorString(borderColor, "#") + "; border-style:solid; border-width:" + borderWidth + "px;";
    }
    
    override public function onFrame (dt :Float) :Void
    {
        com.pblabs.util.Assert.isNotNull(parent);
        
        if (isDirty) {
            isDirty = false;
            var xOffset = parent.xOffset - (width / 2);
            var yOffset = parent.yOffset- (height / 2);
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    
    override function set_width (val :Float) :Float
    {
        _width = val;
        _spatialRect.width = _width;
        redraw();
        return val;
    }
    
    override function set_height (val :Float) :Float
    {
        _height = val;
        _spatialRect.height = _height;
        redraw();
        return val;
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
    
    function get_centered () :Bool
    {
        return true;
    }
    
    function set_centered (val :Bool) :Bool
    {
        throw "Cannot set the centering of CSS components.  They always rotate around the center";
        return true;
    }
    
    function get_boundingRect () :com.pblabs.geom.Rectangle
    {
        updateBoundingRect();
        return _spatialRect;
    }
    
    inline function updateBoundingRect () :Void
    {
        _spatialRect.x = this.x - _width / 2;
        _spatialRect.y = this.y - _height / 2;
        _spatialRect.width = _width;
        _spatialRect.height = _height;
    }
    
    var _fillColor :Int;
    var _borderColor :Int;
    var _borderWidth :Float;
    // var _width :Float;
    // var _height :Float;
    var _spatialRect :com.pblabs.geom.Rectangle;
}


