/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.multimaps;

class AbstractMultiMap <K, V>
{
    public var length (get_length, null) :Int;
    
    public function new () :Void
    {
        _size = 0;
    }
    
    public function set (key :K, value :V) :Void
    {
        _size++;
    }
    
    public function keys () :Iterator<K>
    {
        return null;
    }
    
    public function get (key :K) :Iterable<V>
    {
        return null;
    }

    public function clear () :Void
    {
        _size = 0;
    }
    
    public function toString () :String
    {
        var s = "{\n";
        for (k in keys()) {
            s += "  " + k + ": " + get(k) + "\n";
        }
        s += "}";
        return s;
    }
    
    inline function get_length () :Int
    {
        return _size;
    }
    
    var _size :Int;
}
