package com.pblabs.components.scene;

import com.pblabs.components.manager.NodeComponent;

/**
  * A 2D layer holding 2DSceneComponents.
  * TODO: migrate the parallax and independent location code.
  */
class BaseScene2DLayer<Scene :BaseScene2DManager<Dynamic>, Component :BaseScene2DComponent<Dynamic>> extends NodeComponent<Scene, Component>
{
    public var scene (get_scene, never) :Scene;
    public var index (get_index, set_index) :Int;

    public function new ()
    {
        super();
        _index = 0;
    }

    function get_scene () :Scene
    {
        return cast parent;
    }
    
    function get_index () :Int
    {
        return parent.getLayerIndex(this);
    }
    
    function set_index (val :Int) :Int
    {
        throw "Check here";
        if (parent != null) {
            parent.setLayerIndex(this, val);
            _index = parent.getLayerIndex(this);
        } else {
            _index = val;
        }
        return _index;
    }
    
    var _index :Int;
}


