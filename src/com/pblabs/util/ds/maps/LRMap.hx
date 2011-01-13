/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript aspirin library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * aspirin library - Taking some of the pain out of Actionscript development.
 * Copyright (C) 2007-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/ooo-aspirin/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pblabs.util.ds.maps;
import com.pblabs.util.ArrayUtil;
import com.pblabs.util.ds.Map;

/**
 * A Map that disposes of key/value mappings that were least-recently used or inserted
 * after filling up.
 * Re-inserting a value for a key updates the ordering.
 * Note: this implementation is O(n) for maintaining the ordering. This was done
 * (rather than using a linked map implementation) because it was easy, it works
 * with a HashMap or DictionaryMap underneath, and we don't really need more.
 * Does not work with a weak-value map as the source.
 */
class LRMap <K, V> extends LinkedMap<K, V>
{
    
    public function new (source :Map<K, V>, maxSize :Int, ?accessOrder :Bool = true)
    {
        super(source);
        _maxSize = maxSize;
        _accessOrder = accessOrder;
    }

    /** @inheritDoc */
    public override function set (key :K, value :V) :V
    {
        var wasKey :Bool = exists(key);
        var oldVal:V = super.set(key, value);
        if (wasKey && (size() > _maxSize)) {
            // remove the oldest entry
            remove(_anchor.after.key);
        }
        return oldVal;
    }

    /** @private */
    override function getEntry (key :K) :LinkedEntry<K, V>
    {
        var val:LinkedEntry<K, V> = super.getEntry(key);
        if ((val != null) && _accessOrder) {
            var le :LinkedEntry<K, V> = cast val;
            le.remove();
            le.addBefore(_anchor);
        }
        return val;
    }

    /** The maximum size before we roll off entries. @private */
    var _maxSize:Int;

    /** Are we keeping in access order, or merely insertion order? @private */
    var _accessOrder:Bool;
}
