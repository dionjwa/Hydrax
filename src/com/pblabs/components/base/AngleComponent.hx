/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;

import com.pblabs.components.base.NotifyingValueComponent;
import com.pblabs.engine.core.PropertyReference;

class AngleComponent extends NotifyingValueComponent
{
    public static var P_ANGLE :PropertyReference<Float> = new PropertyReference("@AngleComponent.angle");
    
    public var angle (get_angle, set_angle) : Float;

    public function new ()
    {
        super();
    }
    
    public function toString () :String
    {
        return "Angle=" + angle; 
    }
    
    function get_angle () :Float
    {
        return super.get_value();
    }
    
    function set_angle (val :Float) :Float
    {
        return super.set_value(val);
    }
}


