/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.css;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.ds.Tuple;

import js.Dom;

using com.pblabs.components.scene.SceneUtil;
using com.pblabs.geom.CircleUtil;

class ImageComponent extends Base2DComponent
{
    public var resourceKey  :Tuple<String, String>;
    public var image (default, null) :Image;
    
    public function new () :Void
    {
        super();
        // image = untyped __js__ ("new Image()");
    }
    
    override public function containsScreenPoint (pos :Vector2) :Bool
    {
        #if (flash || cpp)
        //The flash pos argument is already transformed to the 
        //SceneManager coords.
        return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, pos, angle);
        #elseif js
        return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos), angle);
        // return parent.scene.translateScreenToWorld(pos).isWithinCircle(x, y, Math.max(width, height));
        // return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos));
        //Translate coords
        #else
        return false;
        #end
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        com.pblabs.util.Assert.isNotNull(resourceKey);
        
        image = context.getManager(IResourceManager).create(resourceKey.v1, resourceKey.v2);
        
        if (_width != 0) {
            image.width = Std.int(_width);
        }
        
        if (_height != 0) {
            image.height = Std.int(_height);
        }
        
        //Create the image and containing div element
        //js.Lib.document.createElement("IMG") doesn't work.
        
        // image.src = imageUrl;
        // trace(image.width + ", " + image.height);
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        div.appendChild(image);
    }
    
    override function addedToParent () :Void
    {
        super.addedToParent();
        #if debug
        com.pblabs.util.Assert.isNotNull(image);
        com.pblabs.util.Assert.isTrue(image.parentNode == div);
        #end
    }
    
    #if css
    override public function onFrame (dt :Float) :Void
    {
        com.pblabs.util.Assert.isNotNull(parent);
        
        if (isDirty) {
            isDirty = false;
            var xOffset = parent.xOffset - (image.width / 2);
            var yOffset = parent.yOffset- (image.height / 2);
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    #end
    
    // override function get_width () :Float
    // {
    //     return image.width;
    // }
    
    override function set_width (val :Float) :Float
    {
        if (image != null) {
            image.width = Std.int(val);
        }
        return super.set_width(val);
    }
    
    // override function get_height () :Float
    // {
    //     return image.height;
    // }
    
    override function set_height (val :Float) :Float
    {
        if (image != null) {
            image.height = Std.int(val);
        }
        return super.set_height(val);
    }
}
