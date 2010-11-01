/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js;

import com.pblabs.engine.debug.Log;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.Preconditions;

import com.pblabs.util.Assert;

import easel.display.Canvas;
import easel.display.Context2d;

import js.Dom;

import js.Lib;

import com.pblabs.util.Predicates;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.js.Canvas2DComponent;
import com.pblabs.components.scene.js.CanvasLayer;

using Lambda;

class CanvasScene2D extends NodeComponent<Void, Canvas2DComponent>,
    implements IAnimatedObject
{
    inline public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
    
    public var canvasctx (default, null) :Context2d;
    public var width (getWidth, never) :Int;
    public var height (getHeight, never) :Int;
    public var layerCount (get_layerCount, never) :Int;
    public var canvasContainerId (get_canvasContainerId, set_canvasContainerId) :String;
    
    public function new (?canvasContainerId :String)
    {
        super();
        _canvasContainerId = canvasContainerId;
        _layers = new Array();
    }
    
    public function addLayer (?name :String = null, ?idx :Int = -1) :Void
    {
        Preconditions.checkArgument(isRegistered, "Component must first be registered");
        
        if (idx < 0) {
            idx = layerCount;
        } else {
            idx = Std.int(Math.min(idx, layerCount));
        }
        //Check if there's already a canvas at that index
        
        var canvas = createCanvas();
        var layer = new CanvasLayer(name, canvas);
        
        if (idx == layerCount) {
            _canvasContainer.appendChild(canvas);
            _layers.push(layer);
        }
        else {
            //Insertion
            var currentAtLocation = _layers[idx];
            _canvasContainer.insertBefore(canvas, currentAtLocation.canvas);
            _layers.insert(idx, layer);
        }
        canvas.style.zIndex = idx;
    }
    
    public function removeLayer (layer :CanvasLayer) :Void
    {
        _layers.remove(layer);
        _canvasContainer.removeChild(layer.canvas);
    }
    
    public function getDefaultLayer () :CanvasLayer
    {
        return getLayer(DEFAULT_LAYER_NAME);
    }

    public function getLayer (layerName :String) :CanvasLayer
    {
        for (layer in _layers) {
            if (null != layer && layer.name == layerName) {
                return layer;
            }
        }
        return null;
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        if (canvasContainerId == null) {
            var view = context.getManager(SceneView);
            if (view == null) {
                Log.warn("No SceneView");
            } else {
                canvasContainerId = view.elementRoot;
                if (canvasContainerId == null) {
                    Log.error("SceneView.elementRoot null");
                }
            }
        }
        Log.debug("canvasContainerId=" + canvasContainerId);
        Preconditions.checkNotNull(canvasContainerId, "canvasContainerId null");
        _canvasContainer = cast Lib.document.getElementById(canvasContainerId);
        Log.debug("_canvasContainer=" + _canvasContainer);
        addLayer(DEFAULT_LAYER_NAME);
    }
    
    inline function isLayer (name :String) :Bool
    {
        return getLayer(name) != null;
    }

    public function getLayerAt (idx :Int) :CanvasLayer
    {
        return _layers[idx];
    }
    
    public function onFrame (dt :Float) :Void
    {
        for (layer in _layers) {
            layer.render();
        }
    }
    
    public inline function getWidth () :Int
    {
        return Std.parseInt(_canvasContainer.style.width.split("px")[0]);
    }

    public inline function getHeight () :Int
    {
        return Std.parseInt(_canvasContainer.style.height.split("px")[0]);
    }
    
    function createCanvas () :Canvas
    {
        var canvas :Canvas = cast Lib.document.createElement("CANVAS");
        canvas.width = width;
        canvas.height = height;
        canvas.style.position = "absolute";
        canvas.style.left = "0px";
        canvas.style.top = "0px";
        return canvas;
    }
    
    function get_layerCount () :Int
    {
        return _layers.length;
    }
    
    override function childAdded (c :Canvas2DComponent) :Void
    {
        if (c.layerName == null) {
            c.layerName = DEFAULT_LAYER_NAME;
        }
        if (!isLayer(c.layerName)) {
            addLayer(c.layerName);
        }
        
        var layer = getLayer(c.layerName);
        layer.children.push(c);
        c.layer = layer;
    }
    
    override function childRemoved (c :Canvas2DComponent) :Void
    {
        var layer = getLayer(c.layerName);
        layer.children.remove(c);
        c.layer = null;
    }
    
    override function onRemove () :Void
    {
        super.onRemove();
        while (_layers.length > 0) {
            removeLayer(_layers[0]);
        }
        _canvasContainer = null;
        _layers = null;
        _canvasContainerId = null;
    }
    
    function get_canvasContainerId () :String
    {
        return _canvasContainerId;
    }
    
    function set_canvasContainerId (val :String) :String
    {
        Preconditions.checkArgument(_canvasContainerId == null, "Cannot change canvasId once set");
        _canvasContainerId = val;
        return val;
    }
    
    
    var _layers :Array<CanvasLayer>;
    var _canvasContainer :HtmlDom;
    var _canvasContainerId :String;
}


