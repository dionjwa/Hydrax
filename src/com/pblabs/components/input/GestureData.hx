/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;
class GestureData extends InputData
{
    public var scale :Float;
    public var rotation :Float;
    
    public function new ()
    {
        super();
        scale = 1;
        rotation = 0;    
    }

}
