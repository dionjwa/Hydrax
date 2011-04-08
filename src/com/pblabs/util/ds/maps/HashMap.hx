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
#if flash
class HashMap<K, V> implements Map<K, V>
{

	private var h :flash.utils.Dictionary;
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
		h = new flash.utils.Dictionary();
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
		untyped h[key] = value;
		return previous;
	}

	/**
		Get a value for the given key.
	**/
	public function get( key : K ) : Null<V> 
	{
		return untyped h[key];
	}

	/**
		Tells if a value exists for the given key.
		In particular, it's useful to tells if a key has
		a [null] value versus no value.
	**/
	public function exists( key : K ) : Bool 
	{
		return untyped __in__(key, h);
	}

	/**
		Removes a hashtable entry. Returns [true] if
		there was such entry.
	**/
	public function remove( key : K ) : V
	{
		if( untyped !__in__(key, h)) return null;
		_size--;
		var previous = get(key);
		untyped __delete__(h,key);
		return previous;
	}

	/**
		Returns an iterator of all keys in the hashtable.
	**/
	public function keys() : Iterator<K> 
	{
		return untyped __keys__(h).iterator();
	}

	/**
		Returns an iterator of all values in the hashtable.
	**/
	public function iterator() : Iterator<V> {
		return untyped {
			ref : h,
			it : __keys__(h).iterator(),
			hasNext : function() { return this.it.hasNext(); },
			next : function() { var i : Dynamic = this.it.next(); return this.ref[i]; }
		};
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
}

#else
class HashMap<V> implements Map<String, V>
{
	var _hash :Hash<V>;
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
		_hash = new Hash();
		_size = 0;
	}
	
	public function clear () :Void
	{
		createDictionary();
	}

	/**
		Set a value for the given key.
	**/
	public function set( key : String, value : V ) : V 
	{
		com.pblabs.util.Assert.isNotNull(key);
		if (!exists(key)) {
			_size++;
		}
		var prev = get(key);
		_hash.set(key, value);
		return prev;
	}

	/**
		Get a value for the given key.
	**/
	public function get( key : String ) : Null<V> 
	{
		// com.pblabs.util.Assert.isNotNull(key);
		return _hash.get(key);	
	}

	/**
		Tells if a value exists for the given key.
		In particular, it's useful to tells if a key has
		a [null] value versus no value.
	**/
	public function exists( key : String ) : Bool 
	{
		return _hash.exists(key);
	}

	/**
		Removes a hashtable entry. Returns [true] if
		there was such entry.
	**/
	public function remove( key : String ) : V
	{
		if (exists(key)) {
			_size--;
		}
		var prev = get(key);
		_hash.remove(key);
		return prev;
	}

	/**
		Returns an iterator of all keys in the hashtable.
	**/
	public function keys() : Iterator<String>
	{
		return _hash.keys();
	}

	/**
		Returns an iterator of all values in the hashtable.
	**/
	public function iterator() : Iterator<V> 
	{
		return _hash.iterator();
	}

	public function size () :Int
	{
	    return _size;
	}
	
	public function forEach (fn :String->V->Dynamic) :Void
    {
        for (k in keys()) {
        	fn(k, get(k));
        }
    }
	
}
#end
