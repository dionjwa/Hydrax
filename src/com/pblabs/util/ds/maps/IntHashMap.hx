/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * Portions derived from Haxe std code.  Haxe std library license and copyright:
 *
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 ******************************************************************************/

package com.pblabs.util.ds.maps;

import com.pblabs.util.ds.Map;
/**
    A copy of IntMap but paramaterized for keys and values.
    Don't instatiate directly, use Maps.createNewHashMap().
**/
class IntHashMap<K, V> extends AbstractMap<K, V>, implements Map<K, V> #if php , implements php.IteratorAggregate<V> #end {

    private var h : #if flash9 flash.utils.Dictionary #elseif php ArrayAccess<K> #else Dynamic #end;

    /**
        Creates a new empty hashtable.
    **/
    public function new() : Void {
        super();
        createDictionary();
    }
    
    function createDictionary () :Void
    {
        #if flash9
        h = new flash.utils.Dictionary();
        #elseif flash
        h = untyped __new__(_global["Object"]);
        #elseif neko
        h = untyped __dollar__hnew(0);
        #elseif js
        h = untyped __js__("{}");
        untyped if( h.__proto__ != null ) {
            h.__proto__ = null;
            __js__("delete")(h.__proto__);
        };
        #elseif php
        h = untyped __call__('array');
        #elseif cpp
        h = untyped __global__.__int_hash_create();
        #end
    }
    
    override public function clear () :Void
    {
        super.clear();
        createDictionary();
    }

    /**
        Set a value for the given key.
    **/
    override public function set( key : K, value : V ) : Void {
        super.set(key, value);
        #if (flash || php)
        untyped h[key] = value;
        #elseif js
        untyped h[key] = value;
        #elseif neko
        untyped __dollar__hset(h,key,value,null);
        #elseif cpp
        untyped __global__.__int_hash_set(h,key,value);
        #end
    }

    /**
        Get a value for the given key.
    **/
    public function get( key : K ) : Null<V> {
        #if flash
        return untyped h[key];
        #elseif js
        return untyped h[key];
        #elseif neko
        return untyped __dollar__hget(h,key,null);
        #elseif php
        untyped __php__("if(!isset($this->h[$key])) return null");
        return untyped h[key];
        #elseif cpp
        return untyped __global__.__int_hash_get(h,key);
        #else
        return null;
        #end
    }

    /**
        Tells if a value exists for the given key.
        In particular, it's useful to tells if a key has
        a [null] value versus no value.
    **/
    override public function exists( key : K ) : Bool {
        #if flash9
        return untyped h.hasOwnProperty(key);
        #elseif flash
        return untyped h["hasOwnProperty"](key);
        #elseif js
        return untyped h[key] != null;
        #elseif neko
        return untyped __dollar__hmem(h,key,null);
        #elseif php
        return untyped __call__("isset", h[key]);
        #elseif cpp
        return untyped __global__.__int_hash_exists(h,key);
        #else
        return false;
        #end
    }

    /**
        Removes a hashtable entry. Returns [true] if
        there was such entry.
    **/
    override public function remove( key : K ) : Bool {
        #if flash9
        if( untyped !h.hasOwnProperty(key) ) return false;
        untyped __delete__(h,key);
        _size--;
        return true;
        #elseif flash
        if( untyped !h["hasOwnProperty"](key) ) return false;
        untyped __delete__(h,key);
        _size--;
        return true;
        #elseif js
        if( untyped h[key] == null ) return false;
        untyped  __js__("delete")(h[key]);
        _size--;
        return true;
        #elseif neko
        if (untyped __dollar__hremove(h,key,null)) {
            _size--;
            return true;
        } else {
            return false;
        }
        #elseif php
        if(!untyped __call__("isset", h[key])) return false;
        untyped __call__("unset", h[key]);
        _size--;
        return true;
        #elseif cpp
        if (untyped __global__.__int_hash_remove(h,key)) {
            _size--;    
        } else {
            return false;
        }
        #else
        return false;
        #end
    }

    /**
        Returns an iterator of all keys in the hashtable.
    **/
    public function keys() : Iterator<K> {
        #if flash9
        return untyped (__keys__(h)).iterator();
        #elseif flash
        var l : Array<K> = untyped __keys__(h);
        for( x in 0...l.length )
            l[x] = Std.int(l[x]);
        return l.iterator();
        #elseif js
        var a = new Array();
        untyped __js__("
            for( x in this.h )
                a.push(x);
        ");
        return a.iterator();
        #elseif neko
        var l = new List<K>();
        untyped __dollar__hiter(h,function(k,_) { l.push(k); });
        return l.iterator();
        #elseif php
        return untyped __call__("new _hx_array_iterator", __call__("array_keys", h));
        #elseif cpp
        var a:Array<K> = untyped __global__.__int_hash_keys(h);
        return a.iterator();
        #else
        return null;
        #end
    }

    /**
        Returns an iterator of all values in the hashtable.
    **/
    public function iterator() : Iterator<V> {
        #if flash9
        return untyped {
            ref : h,
            it : keys(),
            hasNext : function() { return this.it.hasNext(); },
            next : function() { var i = this.it.next(); return this.ref[i]; }
        };
        #elseif flash
        return untyped {
            ref : h,
            it : keys(),
            hasNext : function() { return this.it[__unprotect__("hasNext")](); },
            next : function() { var i = this.it[__unprotect__("next")](); return this.ref[i]; }
        };
        #elseif js
        return untyped {
            ref : h,
            it : keys(),
            hasNext : function() { return this.it.hasNext(); },
            next : function() { var i = this.it.next(); return this.ref[i]; }
        };
        #elseif neko
        var l = new List<V>();
        untyped __dollar__hiter(h,function(_,v) { l.push(v); });
        return l.iterator();
        #elseif php
        return untyped __call__("new _hx_array_iterator", __call__("array_values", h));
        #elseif cpp
        var a:Array<Dynamic> = untyped __global__.__int_hash_values(h);
        return a.iterator();
        #else
        return null;
        #end
    }

    /**
        Implement IteratorAggregate for native php iteration
    **/
    #if php
    function getIterator() {
        return iterator();
    }
    #end
}
