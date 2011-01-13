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
    
    public function new (?r :Float = 10, ?color :Int = 0xff0000)
    {
        super(color);
        
        #if css
        _svgContainer = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "svg");
        _svgContainer.setAttribute("width", (r * 2) + "px");
        _svgContainer.setAttribute("height", (r * 2) + "px");
        _svgContainer.setAttribute("version", "1.1");

        _svg = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "circle");
        _svgContainer.appendChild(_svg);
        #elseif js
        boundingBox = [-r / 2, -r / 2, r, r];
        #end
        radius = r;
    }
    
    override public function containsScreenPoint (pos :Vector2) :Bool
    {
        return CircleUtil.isWithinCircle(parent.scene.translateScreenToWorld(pos), x, y, width);
        // #if (flash || cpp)
        // //The flash pos argument is already transformed to the 
        // //SceneManager coords.
        // // return false;
        // // .contains(x - displayObject.width / 2, y - displayObject.height / 2, displayObject.width, displayObject.height, pos);
        // #elseif js
        // // trace(pos + "==>" + parent.scene.translateScreenToWorld(pos));
        // // trace(this + ".....hit? " + RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos)));
        // return CircleUtil.isWithinCircle(parent.scene.translateScreenToWorld(pos), x, y, width);
        // // return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos), angle);
        // //Translate coords
        // #else
        // return false;
        // #end
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
    
    // #if css
    // override public function onFrame (dt :Float) :Void
    // {
    //     #if debug
    //     com.pblabs.util.Assert.isNotNull(parent);
    //     #end
        
    //     if (isDirty) {
    //         isDirty = false;
    //         var xOffset = parent.xOffset - (width / 2);
    //         var yOffset = parent.yOffset- (height / 2);
    //         untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
    //     }
    // }
    // #end
    
    #if css
    override function onAdd () :Void
    {
        super.onAdd();
        
        //Put the element in the base div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        redraw();
        div.appendChild(_svgContainer);
    }
    #end
    
    override function redraw () :Void
    {
        #if flash
        var g = cast(_displayObject, flash.display.Sprite).graphics;
        g.beginFill(this.fillColor, 1);
        g.drawCircle(0, 0, radius);
        g.endFill();
        g.lineStyle(borderWidth, borderColor, 1);
        g.drawCircle(0, 0, radius);
        g.lineStyle(2, 0x000000);
        g.moveTo(0,0);
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
        return width;
    }
    
    override function set_height (val :Float) :Float
    {
        super.set_width(val);
        return val;
    }
    
    function get_radius () :Float
    {
        return width;
    }
    
    function set_radius (val :Float) :Float
    {
        width = val;
        return val;
    }

    #if css
    var _svgContainer :js.Dom.HtmlDom;
    var _svg :js.Dom.HtmlDom;
    #end

}
