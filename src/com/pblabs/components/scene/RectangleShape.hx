/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.StringUtil;

using com.pblabs.components.scene.SceneUtil;

class RectangleShape extends ShapeComponent
{
    public function new ()
    {
        super();
        var w :Float = 20;
        var h :Float = 10;
        #if css
        _rect = cast js.Lib.document.createElement("div");
        #elseif js
        boundingBox = [0, 0, w, h];
        #end
        width = w;
        height = h;
    }
    
    #if css
    override public function onFrame (dt :Float) :Void
    {
        com.pblabs.util.Assert.isNotNull(parent);
        
        if (isTransformDirty) {
            isTransformDirty = false;
            var xOffset = parent.xOffset - (width / 2);
            var yOffset = parent.yOffset- (height / 2);
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    #end
    
    override function onAdd () :Void
    {
        super.onAdd();
        
        #if css
        //Put the element in the base div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        div.appendChild(_rect);
        #end
        redraw();
        context.getManager(com.pblabs.engine.time.IProcessManager).callLater(redraw);
    }
    
    override function onReset () :Void
    {
    	super.onReset();
    	redraw();
    }
    
    override function redraw () :Void
    {
        #if flash
        var g = cast(_displayObject, flash.display.Sprite).graphics;
        g.clear();
        g.beginFill(this.fillColor, 1);
        g.drawRect(-width / 2, -height / 2, width, height);
        g.endFill();
        var lineThickness = 1.0;
        g.lineStyle(borderWidth, borderColor, lineThickness);
        g.drawRect(-width / 2, -height / 2, width - borderWidth, height - borderWidth);
        #elseif css
        _rect.style.cssText = " width:" + width + "px; height:" + height + "px; background-color:" + StringUtil.toColorString(fillColor, "#") + "; border-color:" + StringUtil.toColorString(borderColor, "#") + "; border-style:solid; border-width:" + borderWidth + "px;";
        #elseif js
		// sprite.dirtyContents();        
        #end
    }
    
    #if (js && !css)
    override public function draw (ctx :easel.display.Context2d)
	{
		ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
		ctx.fillRect(-width / 2, - height / 2, width, height);
		ctx.strokeStyle = StringUtil.toColorString(borderColor, "#");
		ctx.lineWidth = borderWidth;
		ctx.beginPath();
		ctx.rect(-width / 2, - height / 2, width, height);
		ctx.stroke();
		
	}
    #end
    
    #if css
    var _rect :js.Dom.HtmlDom;
    #end
}
