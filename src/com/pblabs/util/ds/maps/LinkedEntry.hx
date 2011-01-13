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
/**
 * A special metastructure for keeping track of the ordering in a LinkedMap.
 * @private
 */
class LinkedEntry<K, V>
 {
    
    public var before:LinkedEntry<K, V>;
    public var after:LinkedEntry<K, V>;
    public var key:K;
    public var value:V;

    public function new (key :K, value :V)
    {
        this.key = key;
        this.value = value;
    }

    public function addBefore (existing :LinkedEntry<K, V>) :Void
    {
        after = existing;
        before = existing.before;
        before.after = this;
        after.before = this;
    }
    
    public function addAfter (existing :LinkedEntry<K, V>) :Void
    {
        after = existing.after;
        before = existing;
        before.after = this;
        after.before = this;
    }

    public function remove () :Void
    {
        before.after = after;
        after.before = before;
    }
}
