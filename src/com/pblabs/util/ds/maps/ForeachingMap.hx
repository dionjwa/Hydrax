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
import com.pblabs.util.ds.Map;

/**
 * A forwarding Map that runs keys() and values() through forEach(), to take
 * advantage of subclass logic therein.
 * @private
 */
class ForeachingMap<K,V> extends ForwardingMap<K,V> {
    
    public function new (source :Map<K,V>)
    {
        super(source);
    }

    /** @inheritDoc */
    public override function keys () :Iterator<K>
    {
        var arr = new Array<K>();
        forEach(function (k :K, v :V) :Void {
            arr.push(k);
        });
        return arr.iterator();
    }

    /** @inheritDoc */
    public override function iterator() : Iterator<V>
    {
        var arr = new Array<V>();
        forEach(function (k :K, v :V) :Void {
            arr.push(v);
        });
        return arr.iterator();
    }
}
