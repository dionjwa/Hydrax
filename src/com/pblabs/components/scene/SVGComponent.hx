package com.pblabs.components.scene;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.RectangleTools;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Tuple;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.scene.SceneUtil;
using com.pblabs.engine.resource.ResourceToken;

/**
  * !!Still experimental!
  * Cross platform SVG based Scene2D component.
  * Currently only tested in Flash, CSS coming soon, Canvas maybe
  */
class SVGComponent 
#if js
extends com.pblabs.components.scene.js.css.SceneComponent
#elseif (flash || cpp)
extends com.pblabs.components.scene.flash.SceneComponent 
#end
{
    /** The IResource name and item id */
    #if (flash || cpp)
    public var resourceToken :ResourceToken<flash.display.Sprite>;
    #else
    public var resourceToken :ResourceToken<Dynamic>;
    #end
    
    public function new () :Void
    {
        super();
    }
    
    #if debug
    public function toString () :String
    {
        return StringUtil.objectToString(this, ["x", "y", "_width", "_height"]);
    }
    #end
    
    override function onAdd () :Void
    {
        #if (flash || cpp)
        //An extra layer so the SVG can be offset so that the origin is the image center
        // var s = context.allocate(flash.display.Sprite);
        // s.mouseEnabled = s.mouseChildren = false;
        // _displayObject = s;
        #end
        
        
        
        #if js
        //Get the DomResource, this makes sure the inline svg is loaded
        super.onAdd();
        if (displayObject == null) {
        	if (resourceToken != null) {
        		var svg :js.Dom.HtmlDom = context.create(resourceToken);
				com.pblabs.util.Assert.isNotNull(svg, "SVG loaded from " + resourceToken + " is null");
				displayObject = svg;
        	}
        	// com.pblabs.util.Assert.isNotNull(resourceToken);
			
			
			
		// var _svgContainer :js.Dom.HtmlDom = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "svg");
		// var r = 30;
        // _svgContainer.setAttribute("width", (r * 2) + "px");
        // _svgContainer.setAttribute("height", (r * 2) + "px");
        // _svgContainer.setAttribute("version", "1.1");

        // var _svg = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "circle");
        // _svg.setAttribute("cx", r + "px");
        // _svg.setAttribute("cy", r + "px");
        // _svg.setAttribute( "r",  r + "px");
        // _svg.setAttribute("fill", StringUtil.toColorString(0x000000, "#"));
        // _svg.setAttribute( "stroke",  StringUtil.toColorString(0x000000, "#"));
        // _svg.setAttribute( "stroke-width",  "" + 1);
        // _svgContainer.appendChild(_svg);
        // displayObject = _svgContainer;
			
			
        } else if (resourceToken != null) {
        	com.pblabs.util.Log.warn("Both displayObject AND the resource token are not null");
        }
        
        // if (displayObject != null) {
		// 	if (_width == 0) {
		// 		_width = Std.parseFloat(displayObject.getAttribute("width"));
		// 	} else {
		// 		set_width(_width);
		// 	}
		// 	if (_height == 0) {
		// 		_height = Std.parseFloat(displayObject.getAttribute("width"));
		// 	} else {
		// 		set_height(_height);
		// 	}
        // }
        // trace("adding to div " + displayObject);
        // trace("div=" + div);
		#if debug
		com.pblabs.util.Assert.isFalse(Math.isNaN(_width));
		com.pblabs.util.Assert.isFalse(Math.isNaN(_height));
		#end
		
        isTransformDirty = true;
        #elseif (flash || cpp)
        throw "Not implemented";
        // var svg :flash.display.Sprite = resourceToken.create(context);
        // com.pblabs.util.Assert.isNotNull(svg);
        // _displayObject = svg;
        super.onAdd();
        // registrationPoint = new com.pblabs.geom.Vector2(_displayObject.width / 2, _displayObject.height / 2); 
        #end
        
        // #if js
        
        // #else
        
        #if (flash || cpp)
        // cast(_displayObject, flash.display.Sprite).addChild(svg);
        //Offset so in the center
        // svg.x = -svg.width / 2;
        // svg.y = -svg.height / 2;
        #end
        
        
    }
    
    #if js
    override public function onFrame (dt :Float) :Void
    {
        if (isTransformDirty && parent != null) {
            isTransformDirty = false;
            var xOffset = parent.xOffset;
            var yOffset = parent.yOffset;
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    
    override function set_width (val :Float) :Float
    {
        return super.set_width(val);
    }
    
    override function set_height (val :Float) :Float
    {
        return super.set_height(val);
    }
    #end
    
    
}
