package com.pblabs.components.input;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.geom.Vector2;

/**
  * Merge various event type data to a component specific container.
  */
class InputData
{
    public var inputComponent :MouseInputComponent;
    public var inputLocation :Vector2;
    public var touchCount :Int;
    public var isMouseDown :Bool;
    
    public function new () 
    {
        touchCount = 1;
        isMouseDown = false;
    }
}
