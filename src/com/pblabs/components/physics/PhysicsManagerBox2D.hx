package com.pblabs.components.physics; 



import org.transition9.util.Preconditions;

import net.hydrax.ITickedObject;
import com.pblabs.components.manager.NodeComponent;


class PhysicsManagerBox2D extends NodeComponent,
    implements ITickedObject
{
    public var world (default, null) :World;
    
    public function new (?gravity :Vec2)
    {
        super();
        _enabled = true;
        _gravity = gravity;
    }
    
    public function enable () :Void
    {
        _enabled = true;
        for (c in children) {
            cast(c, PhysicsComponentPhysaxe).enabled = true;
        }
    }
    
    public function disable () :Void
    {
        _enabled = false;
        for (c in children) {
            cast(c, PhysicsComponentPhysaxe).enabled = false;
        }
    }
    
    override function onAdd () :Void
    {
        // define the size of the world
        var size = new phx.col.AABB(-1000,-1000,1000,1000);
        // create the broadphase : this is the algorithm used to optimize collision detection
        var bf = new phx.col.SortedList();
        // initialize the world
        world = new World(size,bf);
        // // create one 50x50 box body at x=210,y=-50
        // var b1 = new Body(210,-50);
        // b1.addShape( Shape.makeBox(50,50) );
        // // create one 30 radius circle at x=200,y=250
        // var b2 = new phx.Body(200,250);
        // b2.addShape( new phx.Circle(30,new phx.Vector(0,0)) );
        // // create one 20x20 box body at x=100,y=270
        // var b3 = new phx.Body(100,270);
        // b3.addShape( phx.Shape.makeBox(20,20) );
        // // add the created bodies to the world
        // world.addBody(b1);
        // world.addBody(b2);
        // world.addBody(b3);
        // // creates a 270x50 box at x=0,y=280
        // var floor = phx.Shape.makeBox(270,50,0,280);
        // the floor is static, it can't move
        // world.addStaticShape(floor);
        // setup gravity
        if (_gravity != null) {
            world.gravity = new phx.Vector(_gravity.x, _gravity.y);
        }

    }
    
    public function update (dt :Float) :Void
    {
        // update the world
        if (_enabled) {
            world.step(dt / (1/30.0), 20);
        }
    }
    
    // public function add
    
    override function onRemove () :Void
    {
        super.onRemove();
    }
    
    override public function addChild (c :NodeComponent, ?calledFromChild :Bool = false) :Bool
    {
        
        if (!Std.is(c, PhysicsComponentPhysaxe)) {
            throw "Not a PhysicsComponentPhysaxe\n" + c.owner;
        }
        var added = super.addChild(c, calledFromChild);
        // trace("added=" + added);
        if (!added) {
            return false;
        }
        
        //Add the body
        // trace("adding child body");
        var b :PhysicsComponentPhysaxe = cast(c);
        Preconditions.checkNotNull(b.shape, "Shape is null");
        
        switch(b.shape) {
            case FIXED_BOX(x, y, w, h): world.addStaticShape(Shape.makeBox(w, h, x, y));
            default: world.addBody(b.body);
        }
        
        
        return true;
    }
    
    var _enabled :Bool;
    var _gravity :Vec2;
    
}
