/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.debug;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.PropertyReference;
/**
 * Hold a value in a component, just so we can use a property reference to get it.
 */
class ValueComponent<T> extends EntityComponent 
{
    public var value :T;

    public static function valueProperty<T> (componentName :String) :PropertyReference<T>
    {
        return new PropertyReference<T>("@" + componentName + ".value");
    }

    public function new (val :T)
    {
        super();
        value = val;
    }
    
    public function toString () :String
    {
        return "[value=" + value + "]";
    }

    public function globalValueProperty () :PropertyReference<T>
    {
        return new PropertyReference("#" + owner.name + "." + name + ".value");
    }

    public function localValueProperty () :PropertyReference<T>
    {
        return new PropertyReference("@" + name + ".value");
    }
}
