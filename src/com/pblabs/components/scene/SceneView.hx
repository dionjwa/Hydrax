/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.PBObject;
import com.pblabs.engine.debug.Log;

/**
 * This class can be set as the SceneView on the BaseDisplayComponent class and is used
 * as the canvas to draw the objects that make up the scene. It defaults to the size
 * of the stage.
 *
 * <p>Currently this is just a stub, and exists for clarity and potential expandability in
 * the future.</p>
 */
class SceneView 
    implements IPBManager, implements haxe.rtti.Infos
{
    public var height(get_height, set_height) : Float;
    public var width(get_width, set_width) : Float;

    #if (flash || cpp)    
    public var layer (get_layer, null) :flash.display.Sprite;
    var _layer :flash.display.Sprite;
    #elseif js
    public var elementRoot (get_elementRoot, set_elementRoot) :String;
    #end
    
    @inject
    public var context :IPBContext;
    
    var _height:Float;
    var _width:Float;
    
    #if js
    public function new (?elementRootName :String, ?width :Int = 0, ?height :Int = 0)
    #else
    public function new (?width :Int = 0, ?height :Int = 0)
    #end
    {
        _width = width;
        _height = height;
       
        #if js
        _elementRoot = elementRootName;
        #elseif (flash || cpp)
        _layer = new flash.display.Sprite();
        _layer.name = "SceneView";
        if (width <= 0 || height <= 0) {
            _layer.addEventListener(flash.events.Event.ADDED_TO_STAGE, handleAddedToStage);
        } else {
            // _layer.width = width;
            // _layer.height = height;
        }
        #end        
        
    }
    
    public function startup():Void
    {
        #if (flash || cpp)
        context.displayContainer.addChild(_layer);
        #end
    }
    
    public function shutdown():Void
    {
        #if (flash || cpp)
        context.displayContainer.removeChild(_layer);
        #end
    }
    
    function get_height ():Float{
        return _height;
    }

    function set_height (value :Float):Float
    {
        _height = value;
    	return value;
    }

    function get_width ():Float
    {
        return _width;
    }

    function set_width (value :Float):Float
    {
        _width = value;
    	return value;
    }

    #if (flash || cpp)
    function get_layer() :flash.display.Sprite
    {
        return _layer;
    }
    
    public function addDisplayObject (dobj :flash.display.DisplayObject) :Void
    {
        _layer.addChild(dobj);
    }

    public function clearDisplayObjects () :Void
    {
        while (_layer.numChildren > 0) {
            _layer.removeChildAt(0);
        }
    }

    public function removeDisplayObject (dObj :flash.display.DisplayObject) :Void
    {
        _layer.removeChild(dObj);
    }

    public function setDisplayObjectIndex (dObj :flash.display.DisplayObject, index :Int) :Void
    {
        _layer.setChildIndex(dObj, index);
    }

    function handleAddedToStage (ignored :Dynamic) :Void
    {
        _layer.removeEventListener(flash.events.Event.ADDED_TO_STAGE, handleAddedToStage);
        // Intelligent default size.
        // _layer.width = flash.Lib.current.stage.stageWidth;
        // _layer.height = flash.Lib.current.stage.stageHeight;
        
        Log.debug("added to stage " + _layer.width + " " + _layer.height);
    }
    #end
    
    #if js
    function get_elementRoot () :String
    {
        return _elementRoot;
    }
    
    function set_elementRoot (val :String) :String
    {
        _elementRoot = val;
        return val;
    }
    
    var _elementRoot :String;
    #end
}


