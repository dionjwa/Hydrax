/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.geom.CircleUtil;
import com.pblabs.geom.Vector2;
import com.pblabs.util.StringUtil;
using com.pblabs.components.scene.SceneUtil;

class CircleShape extends ShapeComponent
{
    public var radius (get_radius, set_radius) :Float;
    
    public function new ()
    {
        super();
        
        var r = 20.0;
        #if css
        _svgContainer = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "svg");
        _svgContainer.setAttribute("width", (r * 2) + "px");
        _svgContainer.setAttribute("height", (r * 2) + "px");
        _svgContainer.setAttribute("version", "1.1");

        _svg = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "circle");
        _svgContainer.appendChild(_svg);
        #elseif js
        boundingBox = [-4 / 2, -r / 2, r, r];
        #end
        radius = r;
    }
    
    override public function containsScreenPoint (pos :Vector2) :Bool
    {
        return CircleUtil.isWithinCircle(parent.scene.translateScreenToWorld(pos), x, y, width);
    }
    
    #if css
    override public function onFrame (dt :Float) :Void
    {
        com.pblabs.util.Assert.isNotNull(parent);
        
        if (isTransformDirty) {
            isTransformDirty = false;
            var xOffset = parent.xOffset - width;
            var yOffset = parent.yOffset - height;
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    #end
    
    #if css
    override function onAdd () :Void
    {
    	com.pblabs.util.Log.debug("");
        super.onAdd();
        
        //Put the element in the base div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        redraw();
        div.appendChild(_svgContainer);
        com.pblabs.util.Log.debug("finished");
    }
    #end
    
    override public function redraw () :Void
    {
        #if flash
        var zoom = parent != null && parent.parent != null ? parent.parent.zoom : 1.0;
        var g = cast(_displayObject, flash.display.Sprite).graphics;
        g.clear();
        g.beginFill(fillColor);
        g.drawCircle(0, 0, radius);
        g.endFill();
        g.lineStyle(borderWidth / zoom, borderColor);
        g.drawCircle(0, 0, radius);
        g.lineStyle(2 / zoom, borderColor);
        g.moveTo(0, 0);
        g.lineTo(radius, 0);
        #elseif css
        _svg.setAttribute("cx", radius + "px");
        _svg.setAttribute("cy", radius + "px");
        _svg.setAttribute( "r",  radius + "px");
        _svg.setAttribute("fill", StringUtil.toColorString(fillColor, "#"));
        _svg.setAttribute( "stroke",  StringUtil.toColorString(borderColor, "#"));
        _svg.setAttribute( "stroke-width",  "" + borderWidth);
        
        _svgContainer.setAttribute("width", (radius * 2) + "px");
        _svgContainer.setAttribute("height", (radius * 2) + "px");
        #end
    }
    
    #if (js && !css)
    override public function draw (ctx :easel.display.Context2d)
	{
		ctx.beginPath();
		ctx.arc(0, 0, radius, 0, Math.PI*2, true);
		ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
		ctx.fill();
		ctx.closePath();
		ctx.strokeStyle = StringUtil.toColorString(borderColor, "#");
		ctx.lineWidth = borderWidth;
		ctx.beginPath();
		ctx.arc(0, 0, radius, 0, Math.PI*2, true);
		ctx.stroke();
	}
    #end
    
    override function get_height () :Float
    {
        return get_width();
    }
    
    override function set_height (val :Float) :Float
    {
        return super.set_width(val);
    }
    
    function get_radius () :Float
    {
        return get_width();
    }
    
    function set_radius (val :Float) :Float
    {
        return set_width(val);
    }
    
    #if css
    var _svgContainer :js.Dom.HtmlDom;
    var _svg :js.Dom.HtmlDom;
    #end

}
