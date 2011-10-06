package com.pblabs.components.physics;

class CollisionData
{
    public function new ()
    {
    }
    
    public function clear() :Void
    {
        body1 = null;
        body2 = null;
        x = 0;
        y = 0;
    }
    
    public var body1 :IPhysicalObject;
    public var body2 :IPhysicalObject;
    public var x :Float;
    public var y :Float;

}
