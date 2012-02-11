/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.ds.mem;

import de.polygonal.core.util.Assert;
import de.polygonal.ds.Hashable;
import de.polygonal.ds.HashKey;

/**
 * <p>Abstract class that grants read/write access to a chunk of fast "alchemy memory".</p>
 */
class MemoryAccess implements Hashable
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * The number of allocated bytes. 
	 */
	public var bytes(__bytes, never):Int;
	inline function __bytes() return _bytes
	
	/**
	 * The memory offset in bytes. 
	 */
	public var offset(__offset, never):Int;
	inline function __offset() return _offset
	
	public var name:String;
	
	var _bytes:Int;
	var _offset:Int;
	var _memory:Dynamic;
	
	function new(bytes:Int, name = "?")
	{
		D.assert(bytes > 0, "bytes > 0");
		
		_bytes = bytes;
		this.name = name;
		
		#if alchemy
		MemoryManager.malloc(this, bytes);
		#else
		_memory = {};
		#end
		
		key = HashKey.next();
	}
	
	/**
	 * Destroys this object by explicitly nullifying all pointers and instantly releases any memory that was allocated by this accessor.<br/>
	 * <warn>Invoke this method when the life cycle of this object ends to prevent a memory leak.</warn><br/>
	 * This is not optional if <em>MemoryManager.AUTO_RECLAIM_MEMORY</em> is true.
	 * @throws de.polygonal.core.util.AssertionError memory was already deallocated (debug only).
	 */
	public function free():Void
	{
		D.assert(_memory != null, "memory deallocated");
		
		#if alchemy
		MemoryManager.dealloc(this);
		#else
		_memory = null;
		#end
	}
	
	/**
	 * Sets all bytes to 0.
	 * @throws de.polygonal.core.util.AssertionError memory was already deallocated (debug only).
	 */
	public function clear():Void
	{
		#if alchemy
		for (i in 0..._bytes)
			flash.Memory.setByte(_offset + i, 0);
		#end
	}
	
	/**
	 * Resizes the memory to <code>byteSize</code> bytes.
	 * @throws de.polygonal.core.util.AssertionError bytes <= 0 (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory was already deallocated (debug only).
	 */
	public function resize(byteSize:Int):Void
	{
		D.assert(byteSize > 0, "byteSize > 0");
		D.assert(_memory != null, "memory deallocated");
		
		_bytes = byteSize;
		
		#if alchemy
		MemoryManager.realloc(this, byteSize);
		#end
	}
}