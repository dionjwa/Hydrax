/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
import com.pblabs.util.StringUtil;
using com.pblabs.components.scene.SceneUtil;

/**
  * Cross platform Image using Scene2D component.
  */
class ImageComponent
#if css
extends com.pblabs.components.scene.js.css.Base2DComponent
#elseif js
extends com.pblabs.components.scene.js.canvas.Canvas2DComponent
#elseif (flash || cpp)
	extends com.pblabs.components.scene.flash.Scene2DComponent  
#end
{
    /** The IResource name and item id.  Id can be null */
    public var resource  :ImageResource;
    
    #if (js && !css)
    public var displayObject (default, set_displayObject) :js.Dom.Image;
    function set_displayObject (val :js.Dom.Image) :js.Dom.Image
    {
    	this.displayObject = val;
        return val;
    }
    override public function draw (ctx :easel.display.Context2d) :Void
	{
		ctx.drawImage(displayObject, -displayObject.width / 2, -displayObject.height / 2);
	}
    #end
    
    public function new () :Void
    {
        super();
    }
    
    override public function containsScreenPoint (pos :Vector2) :Bool
    {
        #if (flash || cpp)
        //The flash pos argument is already transformed to the 
        //SceneManager coords.
        return RectangleTools.contains(x - displayObject.width / 2, y - displayObject.height / 2, displayObject.width, displayObject.height, pos);
        #elseif js
        // trace(pos + "==>" + parent.scene.translateScreenToWorld(pos));
        // trace(this + ".....hit? " + RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos)));
        return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos));
        //Translate coords
        #else
        return false;
        #end
    }
    
    #if debug
    public function toString () :String
    {
        return StringUtil.objectToString(this, ["x", "y", "_width", "_height"]);
    }
    #end
    
    override function onAdd () :Void
    {
        #if flash
        //An extra layer so the SVG can be offset so that the origin is the image center
        var s = context.allocate(flash.display.Sprite);
        s.mouseEnabled = s.mouseChildren = false;
        _displayObject = s;
        #end
        
        super.onAdd();
        com.pblabs.util.Assert.isNotNull(resource);
        
        #if js
        //Get the DomResource, this makes sure the inline image is loaded
        var image :js.Dom.Image = resource.create();//context.getManager(IResourceManager).create(resourceToken.v1, resourceToken.v2);
        Preconditions.checkNotNull(image, "image from resource is null " +resource);
        	// #if css
		displayObject = image;
        	// #else
        	// sprite = new com.pblabs.components.scene.js.canvas.ImageSprite(image);
        	// #end
		#elseif (flash || cpp)
        var image :flash.display.DisplayObject = resource.create();//context.getManager(IResourceManager).create(resourceToken.v1, resourceToken.v2);
        #end
        // trace("image=" + image);
        
        com.pblabs.util.Assert.isNotNull(image, "Image loaded from " + resource + " is null");
        
        #if css
        _width = image.width;
        _height = image.height;
        div.appendChild(displayObject);
        #elseif (flash || cpp)
        cast(_displayObject, flash.display.Sprite).addChild(image);
        //Offset so in the center
        image.x = -image.width / 2;
        image.y = -image.height / 2;
        #end
    }
    
    #if css
    override public function onFrame (dt :Float) :Void
    {
        if (isTransformDirty) {
            isTransformDirty = false;
            var xOffset = parent.xOffset - width / 2;
            var yOffset = parent.yOffset - height / 2;
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    
    override function set_width (val :Float) :Float
    {
        if (displayObject != null) { 
            displayObject.setAttribute("width", val + "px");
        }
        return super.set_width(val);
    }
    
    override function set_height (val :Float) :Float
    {
        if (displayObject != null) {
            displayObject.setAttribute("height", val + "px");
        }
        return super.set_height(val);
    }
    #end
    
    #if (flash || cpp)
    /**
	 * Update the object's transform based on its current state. Normally
	 * called automatically, but in some cases you might have to force it
	 * to update immediately.
	 * @param updateProps Read fresh values from any mapped properties.
	 */
	// public function updateTransform(?updateProps :Bool = false):Void
	// {
	// 	if(displayObject == null)
	// 		return;
		
			
			
	// 	if(updateProps)
	// 		updateProperties();
		
	// 	// If size is active, it always takes precedence over scale.
	// 	var tmpScaleX:Number = _scale.x;
	// 	var tmpScaleY:Number = _scale.y;
	// 	if(_size)
	// 	{
	// 		var localDimensions:Rectangle = displayObject.getBounds(displayObject);
	// 		tmpScaleX = _scale.x * (_size.x / localDimensions.width);
	// 		tmpScaleY = _scale.y * (_size.y / localDimensions.height);
	// 	}
		
		
	// 	_transformMatrix.identity();
	// 	_transformMatrix.scale(tmpScaleX, tmpScaleY);
	// 	_transformMatrix.translate(-_registrationPoint.x * tmpScaleX, -_registrationPoint.y * tmpScaleY);
	// 	_transformMatrix.rotate(PBUtil.getRadiansFromDegrees(_rotation) + _rotationOffset);
	// 	_transformMatrix.translate(_position.x + _positionOffset.x, _position.y + _positionOffset.y);
		
	// 	displayObject.transform.matrix = _transformMatrix;
	// 	displayObject.alpha = _alpha;
	// 	displayObject.blendMode = _blendMode;
	// 	displayObject.visible = (alpha > 0);
		
	// 	_transformDirty = false;
    //     }
    #end
    
    
}
