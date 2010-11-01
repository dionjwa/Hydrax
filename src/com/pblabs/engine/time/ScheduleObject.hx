/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.time;

import com.pblabs.engine.util.IPrioritizable;

/**
 * Helper class for internal use by ProcessManager. This is used to 
 * track scheduled callbacks from schedule().
 */
class ScheduleObject implements IPrioritizable 
{
    public function new() 
    { 
        dueTime = 0.0;
        thisObject = null;
        callBack = null;
        arguments = null;
    }
    
    public var priority(get_priority, set_priority) :Int;
    public var dueTime :Float;
    public var thisObject :Dynamic;
    public var callBack :Dynamic;
    public var arguments :Array<Dynamic>;
    
    function get_priority() :Int
    {
        return Std.int(-dueTime);
    }
    
    function set_priority(value :Int) :Int
    {
        throw "Unimplemented.";
        return value;
    }
}
