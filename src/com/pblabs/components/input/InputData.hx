/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
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
