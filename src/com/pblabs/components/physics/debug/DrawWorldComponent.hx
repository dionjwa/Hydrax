package com.pblabs.components.physics.debug; 

import flash.display.Sprite;

import com.pblabs.components.physics.PhysicsManagerPhysaxe;

import com.pblabs.engine.util.PBUtil;
import com.pblabs.engine.core.PropertyReference;

import com.pblabs.engine.core.EntityComponent;

import phx.World;

class DrawWorldComponent extends SceneComponent,
    implements ITickedObject
{
    
    public var worldProperty :PropertyReference;
    
    public function new ()
    {
        super();
        worldProperty = PBUtil.singletonProp(PhysicsManagerPhysaxe, "world");
        _layer = new Sprite();
        _displayObject = _layer;
       .scene2D.ayerName = SceneManager.DEBUG_LAYER_NAME;
       .scene2D.ef = PBUtil.singletonProp(SceneManager);
    }
    
    override public function update (dt :Float) :Void
    {
        // clear the graphics
        var g = _layer.graphics;
        g.clear();
        // draw the world
        var fd = new phx.FlashDraw(g);
        fd.drawCircleRotation = true;
        fd.drawWorld(world);
        super.update(dt);
    }
    
    function get_world () :World
    {
        return owner.getProperty(worldProperty);
    }
    
    var world (get_world, null) :World;
    var _layer :Sprite;
}





