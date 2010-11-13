/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util.ds.sets;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.Set;
import com.pblabs.util.Preconditions;
using com.pblabs.util.ds.MapUtil;
/**
 * A Set that uses a Map for storing the elements.
 */
class MapSet<T> implements Set<T> 
{
    public function new (source :Map<T, T>)
    {
        _source = Preconditions.checkNotNull(source);
    }

    public function add (o :T) :Void
    {
        _source.set(o, o);
    }

    public function exists (o :T) :Bool
    {
        return _source.exists(o);
    }

    public function remove (o :T) :Bool
    {
        return _source.remove(o);
    }

    public function size () :Int
    {
        return _source.size();
    }

    public function isEmpty () :Bool
    {
        return _source.isEmpty();
    }

    public function clear () :Void
    {
        return _source.clear();
    }
    public function iterator() : Iterator<T>
    {
        //Iterate over values, not keys, since keys may be converted
        //to Ints or Strings by the underlying map
        return _source.iterator();
    }
    
    public function forEach (fn :Dynamic->Bool) :Void
    {
        _source.forEach(function (k :Dynamic, v :Dynamic) :Bool {
            return fn(v);
        });
    }
    
    #if debug
    public function toString () :String
    {
        return com.pblabs.util.ds.MapUtil.toString(_source);
    }
    #end
    
    
    /** The map used for our source. */
    var _source:Map<T, T>;
}

