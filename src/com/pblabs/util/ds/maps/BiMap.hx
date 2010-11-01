/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.maps;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;

using com.pblabs.util.EqualableUtil;

/**
  * Bidirectional map, keys and values must be unique.
  */
class BiMap<K, V> extends ForwardingMap<K, V>
{
    public function new (source :Map<K, V>, inverse :Map<V, K>)
    {
        super(source);
        Preconditions.checkNotNull(inverse);
        _inverse = inverse;
        _inverseView = new ImmutableMap(_inverse);
        _inverse.clear();
        for (k in source.keys()) {
            set(k, source.get(k));
        }
    }
    
    override public function set (key :K, value :V) :Void
    {
        // checkInverse(value);
        if (_inverse != null && exists(key)) {
            _inverse.remove(get(key));
        }
        super.set(key, value);
        _inverse.set(value, key);
    }
    
    override public function remove (key :K) :Bool
    {
        if (exists(key)) {
            _inverse.remove(get(key));
        }
            
        return super.remove(key);
    }
    
    override public function clear () :Void
    {
        super.clear();
        inverse().clear();
    }
    
    /**
      * ImmutableMap map.
      */
    public function inverse () :Map<V, K>
    {
        // Preconditions.checkArgument(_inverse != null || size() > 0, "Cannot get the inverse before any non-null values are added, we cannot determine the inverse map type.");
        return _inverseView;
    }
    
    // function checkInverse (val :V) :Void
    // {
    //     if (_inverse != null) {
    //         return;
    //     }
    //     if (val == null) {
    //         //Cannot create an inverse map from a null value
    //         return;
    //     }
    //     _inverse = Maps.newHashMap(val);
    //     _inverseView = new ImmutableMap(_inverse);
    // }

    var _inverse :Map<V, K>;
    var _inverseView :ImmutableMap<V, K>;
}


