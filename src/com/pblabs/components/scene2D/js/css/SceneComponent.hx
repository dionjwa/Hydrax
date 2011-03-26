/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js.css;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.ReflectUtil;

import js.Dom;

class SceneComponent extends BaseSceneComponent<SceneLayer>,
    implements IAnimatedObject
{
    public var div (default, null) :HtmlDom;
    public var displayObject (get_displayObject, set_displayObject) :HtmlDom;
    
    public function new () :Void
    {
        super();
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
        
        parent.div.appendChild(div);
        
        com.pblabs.util.Assert.isNotNull(div.parentNode);
        onFrame(0);
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
        
        displayObject = _displayObject;
        super.onAdd();
    }
    
    function get_displayObject () :HtmlDom
    {
        return _displayObject;
    }
    
    function set_displayObject (val :HtmlDom) :HtmlDom
    {
    	if (_displayObject != null) {
    		if (_displayObject.parentNode != null) {
    			_displayObject.parentNode.removeChild(_displayObject);
    		}
    	}
        _displayObject = val;
        if (_displayObject != null) {
    		if (_displayObject.parentNode != null) {
    			_displayObject.parentNode.removeChild(_displayObject);
			}
        	if (div != null) {
        		div.appendChild(_displayObject);
        	}
        	if (Reflect.hasField(displayObject, "width")) {
        		_width = Std.parseInt(Reflect.field(displayObject, "width"));
        	}
        	if (Reflect.hasField(displayObject, "height")) {
        		_height = Std.parseInt(Reflect.field(displayObject, "height"));
        	}
        	if (_width == 0 || Math.isNaN(_width)) {
				_width = Std.parseFloat(displayObject.getAttribute("width"));
			} else {
				set_width(_width);
			}
			if (_height == 0 || Math.isNaN(_height)) {
				_height = Std.parseFloat(displayObject.getAttribute("width"));
			} else {
				set_height(_height);
			}
        }
        isTransformDirty = true;
        return val;
    }
    
    var _displayObject :HtmlDom;
}


