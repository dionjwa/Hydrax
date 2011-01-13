/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.css;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.ReflectUtil;

import js.Dom;

class Base2DComponent extends BaseScene2DComponent<SceneLayer>,
    implements IAnimatedObject
{
    public var div (default, null) :HtmlDom;
    public var displayObject (get_displayObject, set_displayObject) :HtmlDom;
    
    public function new () :Void
    {
        super();
        _height = 0;
        _width = 0;
    }
    
    public function onFrame (dt :Float) :Void
    {
        com.pblabs.util.Assert.isNotNull(parent);
        
        if (isTransformDirty) {
            isTransformDirty = false;
            var xOffset = parent.xOffset;
            var yOffset = parent.yOffset;
            untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
        }
    }
    
    override function addedToParent () :Void
    {
        super.addedToParent();
        #if debug
        com.pblabs.util.Assert.isNotNull(div);
        // com.pblabs.util.Assert.isNotNull(div.parentNode);
        #end
        
        // var divlayer :SceneLayer = cast _layer;
        // if (divlayer != null) {
        //     divlayer.div.removeChild(div);
        // }
        // super.set_layer(layer);
        // divlayer = cast _layer;
        // if (divlayer != null) {
        //     divlayer.div.appendChild(div);
        // }
        parent.div.appendChild(div);
        
        com.pblabs.util.Assert.isNotNull(div.parentNode);
        onFrame(0);
        // return layer;
        
    }
    
    override function removingFromParent () :Void
    {
        super.removingFromParent();
        #if debug
        com.pblabs.util.Assert.isNotNull(div);
        // com.pblabs.util.Assert.isNotNull(div.parentNode);
        #end
        
        parent.div.removeChild(div);
        // var divlayer :SceneLayer = cast _layer;
        // if (divlayer != null) {
        //     divlayer.div.removeChild(div);
        // }
        // super.set_layer(layer);
        // divlayer = cast _layer;
        // if (divlayer != null) {
        //     divlayer.div.appendChild(div);
        // }
        
        // #if debug
        // com.pblabs.util.Assert.isNotNull(div.parentNode);
        // #end
        // onFrame(0);
        // return layer;
        
    }
    
    override function onAdd () :Void
    {
        //Create the image and containing div element
        //Why put it in a div?
        //http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
        div = cast js.Lib.document.createElement("div");
        div.setAttribute("disabled", "true");
        // div.style.cssText = "position:fixed";
        div.style.cssText = "position:absolute";
        // div.style.cssText = "position:relative";
        // div.style.cssText = "position:absolute;left:0px;top:0px;";
        super.onAdd();
    }
    
    function get_displayObject () :HtmlDom
    {
        return _displayObject;
    }
    
    function set_displayObject (val :HtmlDom) :HtmlDom
    {
    	if (_displayObject != null) {
    		
    	}
        _displayObject = val;
        div.appendChild(_displayObject);
        return val;
    }
    
    // override function set_layer (layer :SceneLayer) :SceneLayer
    // {
    //     var divlayer :SceneLayer = cast _layer;
    //     if (divlayer != null) {
    //         divlayer.div.removeChild(div);
    //     }
    //     super.set_layer(layer);
    //     divlayer = cast _layer;
    //     if (divlayer != null) {
    //         divlayer.div.appendChild(div);
    //     }
        
    //     #if debug
    //     com.pblabs.util.Assert.isNotNull(div.parentNode);
    //     #end
    //     onFrame(0);
    //     return layer;
    // }
    
    var _displayObject :HtmlDom;
}


