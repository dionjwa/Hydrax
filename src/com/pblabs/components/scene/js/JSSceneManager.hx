package com.pblabs.components.scene.js;

import com.pblabs.components.scene.BaseScene2DManager;

import js.Dom;

import js.Lib;

using Lambda;

class JSSceneManager<Layer :JSLayer<Dynamic, Dynamic>> extends BaseScene2DManager<Layer>
{
    public var container (get_container, null) :HtmlDom;
    
    public function new ()
    {
        super();
    }
    
    override public function setLayerIndex (layer :Layer, index :Int) :Void
    {
        super.setLayerIndex(layer, index);
        index = getLayerIndex(layer);
        if (layer.div.parentNode == _rootContainer) { 
            _rootContainer.removeChild(layer.div);
        }
        _rootContainer.appendChild(layer.div);
        layer.fixPosition();
        
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        
        if (_rootContainer == null) {
            _rootContainer = sceneView.layer;
        }
        #if debug
        com.pblabs.util.Assert.isNotNull(_rootContainer);
        com.pblabs.util.Assert.isNotNull(_rootContainer.parentNode);
        #end
    }
    
    override function onRemove () :Void
    {
        super.onRemove();
        _rootContainer = null;
    }
    
    function get_container () :HtmlDom
    {
        return _rootContainer;
    }
    
    var _rootContainer :HtmlDom;
}


