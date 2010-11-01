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
import com.pblabs.engine.util.PBUtil;

import com.pblabs.util.Assert;

import easel.display.Canvas;
import easel.display.Context2d;

import com.pblabs.geom.Vector2;
import com.pblabs.util.ReflectUtil;

import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.js.CanvasLayer;
import com.pblabs.components.scene.js.CanvasScene2D;
import com.pblabs.components.scene.js.Sprite;

class Canvas2DComponent extends NodeComponent<CanvasScene2D, Void>
{
    public var sprite :Sprite;
    
    public var layerName :String;
    /** Managed by the parent */
    public var layer :CanvasLayer;
    
    public var x (get_x, set_x) :Float;
    public var y (get_y, set_y) :Float;
    public var angle (get_angle, set_angle) :Float;
    
    public function new (?s :Sprite, ?layerName :String) :Void
    {
        super();
        sprite = s;
        parentProperty = PBUtil.singletonProp(CanvasScene2D);
        this.layerName = layerName;
    }
    
    public function render (context :easel.display.Context2d) :Void
    {
        sprite.render(context);
    }
    
    public function setLocation (loc :Vector2) :Void
    {
        set_x(loc.x);
        set_y(loc.y);
    }
    
    override function onReset () :Void
    {
        super.onReset();
        Assert.isNotNull(parent, ReflectUtil.tinyClassName(this) + ".parent is null, prop=" + parentProperty);
        Assert.isNotNull(sprite);
        
        owner.lookupComponent(LocationComponent).signaller.unbind(setLocation);
        owner.lookupComponent(LocationComponent).signaller.bind(setLocation);
        
        owner.lookupComponent(AngleComponent).signaller.unbind(set_angle);
        owner.lookupComponent(AngleComponent).signaller.bind(set_angle);
        
    }
    
    override function onRemove () :Void
    {
        super.onRemove();
        owner.lookupComponent(LocationComponent).signaller.unbind(setLocation);
        owner.lookupComponent(AngleComponent).signaller.unbind(set_angle);
    }
    
    inline function get_x () :Float
    {
        return sprite.x;
    }
    
    inline function set_x (val :Float) :Float
    {
        sprite.x = val;
        layer.isDirty = true;
        return val;
    }
    
    inline function get_y () :Float
    {
        return sprite.y;
    }
    
    inline function set_y (val :Float) :Float
    {
        sprite.y = val;
        layer.isDirty = true;
        return val;
    }
    
    function get_angle () :Float
    {
        return sprite.rotation;
    }
    
    function set_angle (val :Float) :Float
    {
        sprite.rotation = val;
        layer.isDirty = true;
        return val;
    }
}


