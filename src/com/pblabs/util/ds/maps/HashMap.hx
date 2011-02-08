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
 *	 notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *	 notice, this list of conditions and the following disclaimer in the
 *	 documentation and/or other materials provided with the distribution.
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
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.Set;
import com.pblabs.util.StringUtil;


/**
	A copy of HashMap but paramaterized for keys and values.
	Hashtable over a set of elements, using Objects as keys.
	Don't instatiate directly, use Maps.createNewHashMap().
**/
//TODO: This map shouldn't be created on platforms that don't support object (non-string) 
//dictionary maps.  Those platforms should use a String,IntMap, or HashableMap instead.
class HashMap<K, V> implements Map<K, V>  #if php ,implements php.IteratorAggregate<K, V> #end
{

	private var h : #if flash9 flash.utils.Dictionary #elseif php ArrayAccess<K, V> #else Dynamic #end;
	var _size :Int;

	/**
		Creates a new empty hashtable.
	**/
	public function new() : Void 
	{
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
		untyped {
			h = __js__("{}");
			if( h.__proto__ != null ) {
				h.__proto__ = null;
				__js__("delete")(h.__proto__);
			}
		}
		#elseif cpp
		h = {};
		#elseif php
		h = untyped __call__('array');
		#end
		_size = 0;
	}
	
	public function clear () :Void
	{
		createDictionary();
	}

	/**
		Set a value for the given key.
	**/
	public function set( key : K, value : V ) : V 
	{
		var previous = get(key);
		if (!exists(key)) {
			_size++;
		}
		#if flash
		untyped h[key] = value;
		#elseif js
		untyped h["$"+key] = value;
		#elseif neko
		untyped __dollar__hset(h,key.__s,value,null);
		#elseif cpp
		untyped h.__SetField(key,value);
		#elseif php
		untyped h[key] = value;
		#end
		return previous;
	}

	/**
		Get a value for the given key.
	**/
	public function get( key : K ) : Null<V> {
		#if flash
		return untyped h[key];
		#elseif js
		return untyped h["$"+key];
		#elseif neko
		return untyped __dollar__hget(h,key.__s,null);
		#elseif cpp
		return untyped h.__Field(key);
		#elseif php
		untyped __php__("if(!isset($this->h[$key])) return null");
		return untyped h[key];
		#else
		return null;
		#end
	}

	/**
		Tells if a value exists for the given key.
		In particular, it's useful to tells if a key has
		a [null] value versus no value.
	**/
	public function exists( key : K ) : Bool 
	{
		#if flash
		return untyped __in__(key, h);
		#elseif js
		try {
			//Untyped added here, so it compiles, but it's untested
			untyped key = "$" + key;
			return untyped this.hasOwnProperty.call(h,key);
		}catch(e:Dynamic){
			untyped __js__("
				for(var i in this.h)
					if( i == key ) return true;
			");
			return false;
		}
		#elseif neko
		return untyped __dollar__hmem(h,key.__s,null);
		#elseif cpp
		return untyped h.__Field(key)!=null;
		#elseif php
		return untyped __call__("array_key_exists", key, h);
		#else
		return false;
		#end
	}

	/**
		Removes a hashtable entry. Returns [true] if
		there was such entry.
	**/
	public function remove( key : K ) : V
	{
		#if flash
		if( untyped !__in__(key, h)) return null;
		_size--;
		var previous = get(key);
		untyped __delete__(h,key);
		return previous;
		#elseif js
		if (!exists(key)) return null;
		_size--;
		var previous = get(key);
		untyped __js__("delete")(h["$"+key]);
		return previous;
		#elseif neko
		if (exists(key))
			_size--;
		var previous = get(key);
		untyped __dollar__hremove(h,key.__s,null);
		return previous;
		#elseif cpp
		if (exists(key)) _size--;
		var previous = get(key);
		untyped __global__.__hxcpp_anon_remove(h,key);
		return previous;
		#elseif php
		if(!untyped __call__("isset", h[key])) return null;
		var previous = get(key);
		_size--;
		untyped __call__("unset", h[key]);
		return previous;
		#else
		throw "Unsupported platform";
		return false;
		#end
	}

	/**
		Returns an iterator of all keys in the hashtable.
	**/
	public function keys() : Iterator<K> {
		#if flash9
		return untyped __keys__(h).iterator();
		#elseif flash
		return untyped (__hkeys__(h))["iterator"]();
		#elseif js
		var a = new Array<K>();
		untyped __js__("
			for(var i in this.h)
				a.push(i.substr(1));
		");
		return a.iterator();
		#elseif neko
		var l = new List<K>();
		untyped __dollar__hiter(h,function(k,_) { l.push(k); });
		return l.iterator();
		#elseif cpp
		var a:Array<K> = [];
		untyped h.__GetFields(a);
		return a.iterator();
		#elseif php
		return untyped __call__("new _hx_array_iterator", __call__("array_keys", h));
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
			it : __keys__(h).iterator(),
			hasNext : function() { return this.it.hasNext(); },
			next : function() { var i : Dynamic = this.it.next(); return this.ref[i]; }
		};
		#elseif flash
		return untyped {
			ref : h,
			it : __keys__(h)["iterator"](),
			hasNext : function() { return this.it[__unprotect__("hasNext")](); },
			next : function() { var i = this.it[__unprotect__("next")](); return this.ref[i]; }
		};
		#elseif js
		return untyped {
			ref : h,
			it : keys(),
			hasNext : function() { return this.it.hasNext(); },
			next : function() { var i = this.it.next(); return this.ref["$"+i]; }
		};
		#elseif neko
		var l = new List<V>();
		untyped __dollar__hiter(h,function(_,v) { l.push(v); });
		return l.iterator();
		#elseif cpp
		var a:Array<String> = [];
		untyped h.__GetFields(a);
		var it = a.iterator();
		return untyped {
			hasNext : function() { return it.hasNext(); },
			next : function() { return  untyped h.__Field(it.next()); }
		};
		#elseif php
		return untyped __call__("new _hx_array_iterator", __call__("array_values", h));
		#else
		return null;
		#end
	}

	public function size () :Int
	{
	    return _size;
	}
	
	public function forEach (fn :K->V->Dynamic) :Void
    {
        for (k in keys()) {
        	fn(k, get(k));
        }
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


