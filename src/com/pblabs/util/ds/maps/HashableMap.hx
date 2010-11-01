/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/

package com.pblabs.util.ds.maps;

import com.pblabs.util.ds.maps.HashableMap;
import com.pblabs.util.ds.maps.KeyListMap;
import com.pblabs.util.ds.Hashable;
import com.pblabs.util.ds.Map;
import haxe.FastList;

/**
 * Keys are objects that implement Hashable, useful for platforms 
 * where no object dictionary exists, such as js, php (others?).
 * It's not as fast as a String or Int key based map however.
 */
class HashableMap<K, V> extends KeyListMap<K, V>,
    implements Map<K, V>
{
    public function new()
    { 
        super();
        _intMap = new IntHash();
    }

    override public function set (key :K, value :V) :Void
    {
        var hash = getHash(key);
        if (!_intMap.exists(hash)) {
            super.set(key, value);
        }
        _intMap.set(hash, value);
    }

    public function get (key :K) :V
    {
        return _intMap.get(getHash(key));
    }

    override public function exists (key :K) :Bool
    {
        return _intMap.exists(getHash(key));
    }

    override public function remove (key :K) :Bool
    {
        var hash = getHash(key);
        if (!_intMap.exists(hash)) {
            return false;
        }
        super.remove(key);
        var oldVal:V = _intMap.get(hash);
        _intMap.remove(hash);
        return oldVal != null;
    }

    override public function clear () :Void
    {
        super.clear();
        _intMap = new IntHash<V>();
    }
    
    public function iterator() : Iterator<V>
    {
        return _intMap.iterator();
    }
    
    inline function getHash (key :K) :Int
    {
        var hashable = cast(key, Hashable);
        return hashable.hashCode();
    }
    
    var _intMap :IntHash<V>;
}

