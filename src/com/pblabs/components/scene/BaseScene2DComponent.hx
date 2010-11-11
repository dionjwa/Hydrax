package com.pblabs.components.scene;

import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

class BaseScene2DComponent<Layer :BaseScene2DLayer<Dynamic, Dynamic>> extends NodeComponent<Layer, Dynamic>
{
    public var layer (get_layer, null) :Layer;
    public var x (get_x, set_x) :Float;
    public var y (get_y, set_y) :Float;
    public var angle (get_angle, set_angle) :Float;
    public var scale (get_scale, set_scale) :Float;
    public var isDirty (get_isDirty, set_isDirty) :Bool;
    
    public function new ()
    {
        super();
        _x = 0;
        _y = 0;
        _angle = 0;
        _scale = 1;
        _isDirty = true;
    }
    
    @inject("@LocationComponent.signaller")
    public function setLocation (loc :Vector2) :Void
    {
        set_x(loc.x);
        set_y(loc.y);
    }
    
    override function onReset () :Void
    {
        super.onReset();
        Preconditions.checkNotNull(parentProperty, "parentProperty is null");
        #if debug
        com.pblabs.util.Assert.isNotNull(parent, com.pblabs.util.ReflectUtil.tinyClassName(this) + ".parent is null, prop=" + parentProperty);
        #end
        
        owner.lookupComponent(LocationComponent).signaller.unbind(setLocation);
        owner.lookupComponent(LocationComponent).signaller.bind(setLocation);
        
        owner.lookupComponent(AngleComponent).signaller.unbind(set_angle);
        owner.lookupComponent(AngleComponent).signaller.bind(set_angle);
        
        //TODO: Bind scale component, not yet implemented
    }
    
    override function onRemove () :Void
    {
        super.onRemove();
        owner.lookupComponent(LocationComponent).signaller.unbind(setLocation);
        owner.lookupComponent(AngleComponent).signaller.unbind(set_angle);
        //TODO: unbind scale component
    }
    
    function get_layer () :Layer
    {
        return cast parent;
    }
    
    function get_x () :Float
    {
        return _x;
    }
    
    function set_x (val :Float) :Float
    {
        _x = val;
        _isDirty = true;
        return val;
    }
    
    function get_y () :Float
    {
        return _y;
    }
    
    function set_y (val :Float) :Float
    {
        _y = val;
        _isDirty = true;
        return val;
    }
    
    function get_angle () :Float
    {
        return _angle;
    }
    
    @inject("@AngleComponent.signaller")
    function set_angle (val :Float) :Float
    {
        _angle = val;
        _isDirty = true;
        return val;
    }
    
    function get_scale () :Float
    {
        return _scale;
    }
    
    function set_scale (val :Float) :Float
    {
        _scale = val;
        return val;
    }
    
    function get_isDirty () :Bool
    {
        return _isDirty;
    }
    
    function set_isDirty (val :Bool) :Bool
    {
        _isDirty = val;
        return val;
    }
    
    var _x :Float;
    var _y :Float;
    var _angle :Float;
    var _scale :Float;
    var _isDirty :Bool;
}


