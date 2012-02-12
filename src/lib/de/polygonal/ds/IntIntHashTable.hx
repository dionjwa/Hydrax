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
package de.polygonal.ds;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.util.Instance;

#if flash10
#if alchemy
import de.polygonal.ds.mem.IntMemory;
import flash.Memory;
#else
import flash.Vector;
#end
#else
using de.polygonal.ds.ArrayUtil;
#end

private typedef IntIntHashTableFriend =
{
	#if flash10
	#if alchemy
	private var _hash:IntMemory;
	private var _data:IntMemory;
	#else
	private var _hash:Vector<Int>;
	private var _data:Vector<Int>;
	#end
	#else
	private var _hash:Array<Int>;
	private var _data:Array<Int>;
	#end
	
	private var _mask:Int;
	private var _capacity:Int;
}

import de.polygonal.core.util.Assert;

/**
 * <p>An array hash table for storing integer key/value pairs.</p>
 * <ul>
 * <li>The hash table can store duplicate keys, and multiple keys can map the same value. If duplicate keys exist, the order is FIFO.</li>
 * <li>The hash table is open: in the case of a "hash collision", a single slot stores multiple entries, which are searched sequentially.</li>
 * <li>The hash table is dynamic: the <em>capacity</em> is automatically increased and decreased.</li>
 * <li>The hash table is never rehashed automatically, because this operation is time-consuming. Instead the user can decide if rehashing is necessary by checking the load factor.
 * It's recommended to initialize big hash tables upfront with a large slot count which allows the entries to be inserted more efficiently.</li>
 * <li>The value 0x80000000 is reserved and cannot be associated with a key.</li>
 * </ul>
 * <p><o>Amortized running time in Big O notation</o></p>
 */
class IntIntHashTable implements Map<Int, Int>
{
	/**
	 * Return code for a non-existing key. 
	 */
	inline public static var KEY_ABSENT = Limits.INT32_MIN;
	
	/**
	 * Return code for a non-existing value. 
	 */
	inline public static var VAL_ABSENT = Limits.INT32_MIN;
	
	/**
	 * Used internally. 
	 */
	inline public static var EMPTY_SLOT = -1;
	
	/**
	 * Used internally. 
	 */
	inline public static var NULL_POINTER = -1;
	
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * The maximum allowed size of this hash table.<br/>
	 * Once the maximum size is reached, adding an element will fail with an error (debug only).<br/>
	 * A value of -1 indicates that the size is unbound.<br/>
	 * <warn>Always equals -1 in release mode.</warn>
	 */
	public var maxSize:Int;
	
	/**
	 * If true, reuses the iterator object instead of allocating a new one when calling <code>iterator()</code>.<br/>
	 * The default is false.<br/>
	 * <warn>If true, nested iterations are likely to fail as only one iteration is allowed at a time.</warn>
	 */
	public var reuseIterator:Bool;
	
	var _isResizable:Bool;
	
	#if flash10
	#if alchemy
	var _hash:IntMemory;
	var _data:IntMemory;
	var _next:IntMemory;
	#else
	var _hash:Vector<Int>;
	var _data:Vector<Int>;
	var _next:Vector<Int>;
	#end
	#else
	var _hash:Array<Int>;
	var _data:Array<Int>;
	var _next:Array<Int>;
	#end
	
	var _mask:Int;
	var _free:Int;
	
	var _capacity:Int;
	var _size:Int;
	var _sizeLevel:Int;
	var _iterator:IntIntHashTableValIterator;
	
	/**
	 * @param slotCount the total number of slots into which the hashed keys are distributed.
	 * This defines the space-time trade off of the hash table.
	 * Increasing the <code>slotCount</code> reduces the computation time (read/write/access) of the hash table at the cost of increased memory use.
	 * This value is fixed and can only be changed by calling <em>rehash()</em>, which rebuilds the hash table (expensive).
	 * 
	 * @param capacity the initial physical space for storing the key/value pairs at the time the hash table is created.
	 * This is also the minimum allowed size of the hash table and cannot be changed in the future. If omitted, the initial <em>capacity</em> equals <code>slotCount</code>.
	 * The <em>capacity</em> is automatically adjusted according to the storage requirements based on two rules:
	 * <ol>
	 * <li>If the hash table runs out of space, the <em>capacity</em> is doubled (if <code>isResizable</code> is true).</li>
	 * <li>If the size falls below a quarter of the current <em>capacity</em>, the <em>capacity</em> is cut in half while the minimum <em>capacity</em> can't fall below <code>capacity</code>.</li>
	 * </ol>
	 * 
	 * @param isResizable if false, the hash table is treated as fixed size table.
	 * Thus adding a value when <em>size()</em> equals <em>capacity</em> throws an error.
	 * Otherwise the <em>capacity</em> is automatically adjusted.
	 * Default is true.
	 * 
	 * @param maxSize the maximum allowed size of the stack.
	 * The default value of -1 indicates that there is no upper limit.
	 * 
	 * @throws de.polygonal.core.util.AssertionError <code>slotCount</code> is not a power of two (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>capacity</code> is not a power of two (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>capacity</code> is &lt; 2 (debug only).
	 */
	public function new(slotCount:Int, capacity = -1, isResizable = true, maxSize = -1)
	{
		#if debug
		D.assert(Mathematics.isPow2(slotCount), "slotCount is not a power of 2");
		#end
		
		if (capacity == -1)
			capacity = slotCount;
		else
		{
			#if debug
			D.assert(capacity >= 2, "minimum capacity is 2");
			D.assert(Mathematics.isPow2(slotCount), "capacity is not a power of 2");
			#end
		}
		
		_isResizable = isResizable;
		_free        = 0;
		_capacity    = capacity;
		_size        = 0;
		_mask        = slotCount - 1;
		_sizeLevel   = 0;
		_iterator    = null;
		
		#if debug
		this.maxSize = (maxSize == -1) ? Limits.INT32_MAX : maxSize;
		#else
		this.maxSize = -1;
		#end
		
		#if flash10
		#if alchemy
		_hash = new IntMemory(slotCount, "IntIntHashTable._hash");
		_hash.fill(EMPTY_SLOT);
		_data = new IntMemory(_capacity * 3, "IntIntHashTable._data");
		_next = new IntMemory(_capacity, "IntIntHashTable._next");
		#else
		_hash = new Vector<Int>(slotCount);
		for (i in 0...slotCount) _hash[i] = EMPTY_SLOT;
		_data = new Vector<Int>(_capacity * 3);
		_next = new Vector<Int>(_capacity);
		#end
		#else
		_hash = ArrayUtil.alloc(slotCount);
		_hash.fill(EMPTY_SLOT, slotCount);
		_data = ArrayUtil.alloc(_capacity * 3);
		_next = ArrayUtil.alloc(_capacity);
		#end
		
		var j = 2;
		for (i in 0...capacity)
		{
			__setData(j - 1, VAL_ABSENT);
			__setData(j, NULL_POINTER);
			j += 3;
		}
		
		for (i in 0..._capacity - 1) __setNext(i, i + 1);
		__setNext(_capacity - 1, NULL_POINTER);
		
		key = HashKey.next();
		reuseIterator = false;
	}
	
	/**
	 * The load factor measure the "denseness" of a hash table and is proportional to the time cost to look up an entry.<br/>
	 * E.g. assuming that the keys are perfectly distributed, a load factor of 4.0 indicates that each slot stores 4 keys, which have to be sequentially searched in order to find a value.<br/>
	 * A high load factor thus indicates poor performance.
	 * If the load factor gets too high, additional slots can be allocated by calling <em>rehash()</em>.
	 */
	public var loadFactor(_loadFactorGetter, never):Float;
	inline function _loadFactorGetter():Float { return size() / slotCount; }
	
	/**
	 * The total number of allocated slots. 
	 */
	public var slotCount(_slotCountGetter, never):Int;
	inline function _slotCountGetter():Int { return _mask + 1; }
	
	/**
	 * The size of the allocated storage space for the key/value pairs.<br/>
	 * If more space is required to accomodate new elements, the <em>capacity</em> is doubled every time <em>size()</em> grows beyond <em>capacity</em>, and split in half when <em>size()</em> is a quarter of <em>capacity</em>.
	 * The <em>capacity</em> never falls below the initial size defined in the constructor.
	 */
	public var capacity(_capacityGetter, never):Int;
	inline function _capacityGetter():Int { return _capacity; }
	
	/**
	 * Counts the total number of collisions.<br/>
	 * A collision occurs when two distinct keys are hashed into the same slot.
	 * <o>n</o>
	 */
	public function getCollisionCount():Int
	{
		var c = 0, j;
		for (i in 0...slotCount)
		{
			j = __getHash(i);
			if (j == EMPTY_SLOT) continue;
			j = __getData(j + 2);
			while (j != NULL_POINTER)
			{
				j = __getData(j + 2);
				c++;
			}
		}
		return c;
	}
	
	/**
	 * Returns the value that is mapped to <code>key</code> or <em>IntIntHashTable.KEY_ABSENT</em> if <code>key</code> does not exist.<br/>
	 * Uses move-to-front-on-access which reduces access time when similar keys are frequently queried.
	 * <o>1</o>
	 */
	inline public function getFront(key:Int):Int
	{
		var b = _hashCode(key);
		var i = __getHash(b);
		if (i == EMPTY_SLOT)
			return KEY_ABSENT;
		else
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i);
			if (Memory.getI32(o) == key)
				return Memory.getI32(o + 4);
			#else
			if (__getData(i) == key)
				return __getData(i + 1);
			#end
			else
			{
				var v = KEY_ABSENT;
				
				var first = i, i0 = first;
				
				#if (flash10 && alchemy)
				i = Memory.getI32(o + 8);
				#else
				i = __getData(i + 2);
				#end
				
				while (i != NULL_POINTER)
				{
					#if (flash10 && alchemy)
					o = _data.getAddr(i);
					if (Memory.getI32(o) == key)
					#else
					if (__getData(i) == key)
					#end
					{
						#if (flash10 && alchemy)
						v = Memory.getI32(o + 4);
						
						var o1 = _data.getAddr(i0 + 2);
						Memory.setI32(o1, Memory.getI32(o + 8));
						Memory.setI32(o + 8, first);
						
						__setHash(b, i);
						#else
						v = __getData(i + 1);
						__setData(i0 + 2, __getData(i + 2));
						__setData(i + 2, first);
						__setHash(b, i);
						#end
						break;
					}
					i = __getData((i0 = i) + 2);
				}
				return v;
			}
		}
	}
	
	/**
	 * Maps <code>val</code> to <code>key</code> in this map, but only if <code>key</code> does not exist yet.<br/>
	 * <o>1</o>
	 * @return true if <code>key</code> was mapped to <code>val</code> for the first time.
	 * @throws de.polygonal.core.util.AssertionError out of space - hash table is full but not resizable.
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function setIfAbsent(key:Int, val:Int):Bool
	{
		#if debug
		D.assert(val != KEY_ABSENT, "val 0x80000000 is reserved");
		#end
		
		var b = _hashCode(key);
		
		#if (flash10 && alchemy)
		var	o = _hash.getAddr(b);
		var j = Memory.getI32(o);
		#else
		var j = __getHash(b);
		#end
		if (j == EMPTY_SLOT)
		{
			#if debug
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
			#end
			
			if (_size == _capacity)
			{
				#if debug
				if (!_isResizable)
					D.assert(false, Sprintf.format("out of space (%d)", [capacity]));
				#end
				
				if (_isResizable)
					_expand();
			}
			
			var i = _free * 3;
			_free = __getNext(_free);
			
			#if (flash10 && alchemy)
			Memory.setI32(o, i);
			o = _data.getAddr(i);
			Memory.setI32(o    , key);
			Memory.setI32(o + 4, val);
			#else
			__setHash(b, i);
			__setData(i    , key);
			__setData(i + 1, val);
			#end
			
			_size++;
			return true;
		}
		else
		{
			#if (flash10 && alchemy)
			o = _data.getAddr(j);
			if (Memory.getI32(o) == key)
			#else
			if (__getData(j) == key)
			#end
				return false;
			else
			{
				#if (flash10 && alchemy)
				var t = Memory.getI32(o + 8);
				while (t != NULL_POINTER)
				{
					o = _data.getAddr(t);
					if (Memory.getI32(o) == key)
					{
						j = -1;
						break;
					}
					
					j = t;
					t = Memory.getI32(o + 8);
				}
				#else
				var t = __getData(j + 2);
				while (t != NULL_POINTER)
				{
					if (__getData(t) == key)
					{
						j = -1;
						break;
					}
					
					t = __getData((j = t) + 2);
				}
				#end
				
				if (j == -1)
					return false;
				else
				{
					if (_size == _capacity)
					{
						#if debug
						if (!_isResizable)
							D.assert(false, Sprintf.format("out of space (%d)", [capacity]));
						#end
						
						if (_isResizable)
							_expand();
					}
					
					var i = _free * 3;
					_free = __getNext(_free);
					
					__setData(j + 2, i);
					
					#if (flash10 && alchemy)
					o = _data.getAddr(i);
					Memory.setI32(o    , key);
					Memory.setI32(o + 4, val);
					#else
					__setData(i    , key);
					__setData(i + 1, val);
					#end
					
					_size++;
					return true;
				}
			}
		}
	}
	
	/**
	 * Redistributes all keys over <code>slotCount</code>.<br/>
	 * This is an expensive operations as the hash table is rebuild from scratch.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>slotCount</code> is not a power of two (debug only).
	 */
	public function rehash(slotCount:Int):Void
	{
		#if debug
		D.assert(Mathematics.isPow2(slotCount), "slotCount is not a power of 2");
		#end
		
		if (slotCount == this.slotCount) return;
		
		var tmp = new IntIntHashTable(slotCount, _capacity);
		
		#if (flash10 && alchemy)
		var o = _data.getAddr(0);
		for (i in 0..._capacity)
		{
			var v = Memory.getI32(o + 4);
			if (v != VAL_ABSENT) tmp.set(Memory.getI32(o), v);
			o += 12;
		}
		#else
		for (i in 0..._capacity)
		{
			var v = __getData((i * 3) + 1);
			if (v != VAL_ABSENT) tmp.set(__getData(i * 3), v);
		}
		#end
		
		#if (flash10 && alchemy)
		_hash.free();
		_data.free();
		_next.free();
		#end
		_hash = tmp._hash;
		_data = tmp._data;
		_next = tmp._next;
		
		_mask = tmp._mask;
		_free = tmp._free;
		_sizeLevel = tmp._sizeLevel;
	}
	
	/**
	 * Remaps the first occurrence of <code>key</code> to a new value <code>val</code>.
	 * <o>1</o>
	 * @return true if <code>val</code> was successfully remapped to <code>key</code>.
	 */
	inline public function remap(key:Int, val:Int):Bool
	{
		var i = __getHash(_hashCode(key));
		if (i == EMPTY_SLOT)
			return false;
		else
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i);
			if (Memory.getI32(o) == key)
			{
				Memory.setI32(o + 4, val);
				return true;
			}
			#else
			if (__getData(i) == key)
			{
				__setData(i + 1, val);
				return true;
			}
			#end
			else
			{
				#if (flash10 && alchemy)
				i = Memory.getI32(o + 8);
				while (i != NULL_POINTER)
				{
					o = _data.getAddr(i);
					if (Memory.getI32(o) == key)
					{
						Memory.setI32(o + 4, val);
						break;
					}
					i = Memory.getI32(o + 8);
				}
				#else
				i = __getData(i + 2);
				while (i != NULL_POINTER)
				{
					if (__getData(i) == key)
					{
						__setData(i + 1, val);
						break;
					}
					i = __getData(i + 2);
				}
				#end
				return i != NULL_POINTER;
			}
		}
	}
	
	/**
	 * Removes the first occurrence of <code>key</code> and returns the value mapped to it.
	 * <o>1</o>
	 * @return the value mapped to key or <em>IntIntHashTable.KEY_ABSENT</em> if <code>key</code> does not exist.
	 */
	inline public function extract(key:Int):Int
	{
		var b = _hashCode(key);
		var i = __getHash(b);
		if (i == EMPTY_SLOT)
			return IntIntHashTable.KEY_ABSENT;
		else
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i);
			if (key == Memory.getI32(o))
			{
				var val = Memory.getI32(o + 4);
			#else
			if (key == __getData(i))
			{
				var val = __getData(i + 1);
			#end
				#if (flash10 && alchemy)
				if (Memory.getI32(o + 8) == NULL_POINTER)
				#else
				if (__getData(i + 2) == NULL_POINTER)
				#end
					__setHash(b, EMPTY_SLOT);
				else
					__setHash(b, __getData(i + 2));
				
				var j = Std.int(i / 3);
				__setNext(j, _free);
				_free = j;
				
				#if (flash10 && alchemy)
				Memory.setI32(o + 4, VAL_ABSENT);
				Memory.setI32(o + 8, NULL_POINTER);
				#else
				__setData(i + 1, VAL_ABSENT);
				__setData(i + 2, NULL_POINTER);
				#end
				
				_size--;
				
				if (_sizeLevel > 0)
					if (_size == (_capacity >> 2))
						if (_isResizable)
							_shrink();
				
				return val;
			}
			else
			{
				var i0 = i;
				#if (flash10 && alchemy)
				i = Memory.getI32(o + 8);
				#else
				i = __getData(i + 2);
				#end
				
				var val = IntIntHashTable.KEY_ABSENT;
				
				while (i != NULL_POINTER)
				{
					#if (flash10 && alchemy)
					o = _data.getAddr(i);
					if (Memory.getI32(o) == key)
					{
						val = Memory.getI32(o + 4);
						break;
					}
					i0 = i;
					i = Memory.getI32(o + 8);
					#else
					if (__getData(i) == key)
					{
						val = __getData(i + 1);
						break;
					}
					i = __getData((i0 = i) + 2);
					#end
				}
				
				if (val != IntIntHashTable.KEY_ABSENT)
				{
					__setData(i0 + 2, __getData(i + 2));
					
					var j = Std.int(i / 3);
					__setNext(j, _free);
					_free = j;
					
					#if (flash10 && alchemy)
					o = _data.getAddr(i + 1);
					Memory.setI32(o    , VAL_ABSENT);
					Memory.setI32(o + 4, NULL_POINTER);
					#else
					__setData(i + 1, VAL_ABSENT);
					__setData(i + 2, NULL_POINTER);
					#end
					
					--_size;
					
					if (_sizeLevel > 0)
						if (_size == (_capacity >> 2))
							if (_isResizable)
								_shrink();
					
					return val;
				}
				else
					return IntIntHashTable.KEY_ABSENT;
			}
		}
	}
	
	/**
	 * Creates and returns an unordered array of all keys. 
	 */
	public function toKeyArray():Array<Int>
	{
		if (size() == 0) return new Array<Int>();
		
		var a:Array<Int> = ArrayUtil.alloc(size());
		var j = 0;
		for (i in 0..._capacity)
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i * 3);
			if (Memory.getI32(o + 4) != VAL_ABSENT)
				a[j++] = Memory.getI32(o);
			#else
			if (__getData((i * 3) + 1) != VAL_ABSENT)
				a[j++] = __getData(i * 3);
			#end
		}
		return a;
	}

	/**
	 * Creates and returns an unordered dense array of all keys. 
	 */
	public function toKeyDA():DA<Int>
	{
		var a = new DA<Int>(size());
		for (i in 0..._capacity)
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i * 3);
			if (Memory.getI32(o + 4) != VAL_ABSENT)
				a.pushBack(Memory.getI32(o));
			#else
			if (__getData((i * 3) + 1) != VAL_ABSENT)
				a.pushBack(__getData(i * 3));
			#end
		}
		return a;
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var hash = new de.polygonal.ds.IntIntHashTable(16);
	 * for (i in 0...4) {
	 *     hash.set(i, i);
	 * }
	 * trace(hash);</pre>
	 * <pre class="console">
	 * {IntIntHashTable, size: 4, load factor: 0.25}
	 * |<
	 *   0 -> 0
	 *   1 -> 1
	 *   2 -> 2
	 *   3 -> 3
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{IntIntHashTable, size/capacity: %d/%d, load factor: %.2f}", [size(), capacity, loadFactor]);
		if (isEmpty()) return s;
		s += "\n|<\n";
		
		var max = 0.;
		for (key in keys()) max = Mathematics.fmax(max, key);
		var i = 1;
		while (max != 0)
		{
			i++;
			max = Std.int(max / 10);
		}
		
		for (key in keys())
			s += Sprintf.format("  %- " + i + "d -> %d\n", [key, get(key)]);
		
		s += ">|";
		return s;
		#else
		return Sprintf.format("{IntIntHashTable, size/capacity: %d/%d, load factor: %.2f}", [size(), capacity, loadFactor]);
		#end
	}
	
	/*///////////////////////////////////////////////////////
	// map
	///////////////////////////////////////////////////////*/
	
	/**
	 * Returns true if this map contains a mapping for the value <code>val</code>.
	 * @throws de.polygonal.core.util.AssertionError value 0x80000000 is reserved (debug only).
	 */
	inline public function has(val:Int):Bool
	{
		#if debug
		D.assert(val != VAL_ABSENT, "val 0x80000000 is reserved");
		#end
		
		var exists = false;
		for (i in 0...capacity)
		{
			var v = __getData((i * 3) + 1);
			if (v == val)
			{
				exists = true;
				break;
			}
		}
		return exists;
	}
	
	/**
	 * Returns true if this map contains <code>key</code>.
	 */
	inline public function hasKey(key:Int):Bool
	{
		var i = __getHash(_hashCode(key));
		if (i == EMPTY_SLOT)
			return false;
		else
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i);
			if (Memory.getI32(o) == key)
				return true;
			#else
			if (__getData(i) == key)
				return true;
			#end
			else
			{
				var exists = false;
				#if (flash10 && alchemy)
				i = Memory.getI32(o + 8);
				while (i != NULL_POINTER)
				{
					o = _data.getAddr(i);
					if (Memory.getI32(o) == key)
					{
						exists = true;
						break;
					}
					i = Memory.getI32(o + 8);
				}
				#else
				i = __getData(i + 2);
				while (i != NULL_POINTER)
				{
					if (__getData(i) == key)
					{
						exists = true;
						break;
					}
					i = __getData(i + 2);
				}
				#end
				return exists;
			}
		}
	}
	
	/**
	 * Counts the number of mappings for <code>key</code>.
	 */
	inline public function count(key:Int):Int
	{
		var c = 0;
		var i = __getHash(_hashCode(key));
		if (i == EMPTY_SLOT)
			return c;
		else
		{
			#if (flash10 && alchemy)
			while (i != NULL_POINTER)
			{
				var o = _data.getAddr(i);
				if (Memory.getI32(o) == key) c++;
				i = Memory.getI32(o + 8);
			}
			#else
			while (i != NULL_POINTER)
			{
				if (__getData(i) == key) c++;
				i = __getData(i + 2);
			}
			#end
			return c;
		}
	}
	
	/**
	 * Returns the value that is mapped to <code>key</code> or <em>IntIntHashTable.KEY_ABSENT</em> if <code>key</code> does not exist.
	 */
	inline public function get(key:Int):Int
	{
		var i = __getHash(_hashCode(key));
		if (i == EMPTY_SLOT)
			return KEY_ABSENT;
		else
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i);
			if (Memory.getI32(o) == key)
				return Memory.getI32(o + 4);
			#else
			if (__getData(i) == key)
				return __getData(i + 1);
			#end
			else
			{
				var v = KEY_ABSENT;
				#if (flash10 && alchemy)
				i = Memory.getI32(o + 8);
				while (i != NULL_POINTER)
				{
					o = _data.getAddr(i);
					if (Memory.getI32(o) == key)
					{
						v = Memory.getI32(o + 4);
						break;
					}
					i = Memory.getI32(o + 8);
				}
				#else
				i = __getData(i + 2);
				while (i != NULL_POINTER)
				{
					if (__getData(i) == key)
					{
						v = __getData(i + 1);
						break;
					}
					i = __getData(i + 2);
				}
				#end
				return v;
			}
		}
	}
	
	/**
	 * Maps the value <code>val</code> to <code>key</code>.<br/>
	 * The method allows duplicate keys.<br/>
	 * <warn>To ensure unique keys either use <em>hasKey()</em> before <em>set()</em> or <em>setIfAbsent()</em></warn>
	 * @return true if <code>key</code> was added for the first time, false if another instance of <code>key</code> was inserted.
	 * @throws de.polygonal.core.util.AssertionError out of space - hash table is full but not resizable.
	 * @throws de.polygonal.core.util.AssertionError key/value 0x80000000 is reserved (debug only).
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function set(key:Int, val:Int):Bool
	{
		#if debug
		D.assert(val != KEY_ABSENT, "val 0x80000000 is reserved");
		D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		
		if (_size == _capacity)
		{
			#if debug
			if (!_isResizable)
				D.assert(false, Sprintf.format("out of space (%d)", [capacity]));
			#end
			
			if (_isResizable)
				_expand();
		}
		
		var i = _free * 3;
		_free = __getNext(_free);
		
		#if (flash10 && alchemy)
		var o = _data.getAddr(i);
		Memory.setI32(o    , key);
		Memory.setI32(o + 4, val);
		#else
		__setData(i    , key);
		__setData(i + 1, val);
		#end
		
		var b = _hashCode(key);
		
		#if (flash10 && alchemy)
		o = _hash.getAddr(b);
		var j = Memory.getI32(o);
		if (j == EMPTY_SLOT)
		{
			Memory.setI32(o, i);
			_size++;
			return true;
		}
		#else
		var j = __getHash(b);
		if (j == EMPTY_SLOT)
		{
			__setHash(b, i);
			_size++;
			return true;
		}
		#end
		else
		{
			#if (flash10 && alchemy)
			o = _data.getAddr(j);
			var first = flash.Memory.getI32(o) != key;
			var t = flash.Memory.getI32(o + 8);
			#else
			var first = __getData(j) != key;
			var t = __getData(j + 2);
			#end
			
			while (t != NULL_POINTER)
			{
				#if (flash10 && alchemy)
				o = _data.getAddr(t);
				if (flash.Memory.getI32(o) == key) first = false;
				j = t;
				t = flash.Memory.getI32(o + 8);
				#else
				if (__getData(t) == key) first = false;
				j = t;
				t = __getData(t + 2);
				#end
			}
			
			#if (flash10 && alchemy)
			flash.Memory.setI32(o + 8, i);
			#else
			__setData(j + 2, i);
			#end
			
			_size++;
			return first;
		}
	}
	
	/**
	 * Removes the first occurrence of <code>key</code>.
	 * @return true if <code>key</code> is successfully removed.
	 */
	inline public function clr(key:Int):Bool
	{
		var b = _hashCode(key);
		var i = __getHash(b);
		if (i == EMPTY_SLOT)
			return false;
		else
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(i);
			if (key == Memory.getI32(o))
			#else
			if (key == __getData(i))
			#end
			{
				#if (flash10 && alchemy)
				if (Memory.getI32(o + 8) == NULL_POINTER)
				#else
				if (__getData(i + 2) == NULL_POINTER)
				#end
					__setHash(b, EMPTY_SLOT);
				else
					__setHash(b, __getData(i + 2));
				
				var j = Std.int(i / 3);
				__setNext(j, _free);
				_free = j;
				
				#if (flash10 && alchemy)
				Memory.setI32(o + 4, VAL_ABSENT);
				Memory.setI32(o + 8, NULL_POINTER);
				#else
				__setData(i + 1, VAL_ABSENT);
				__setData(i + 2, NULL_POINTER);
				#end
				
				_size--;
				
				if (_sizeLevel > 0)
					if (_size == (_capacity >> 2))
						if (_isResizable)
							_shrink();
				
				return true;
			}
			else
			{
				var exists = false;
				
				var i0 = i;
				#if (flash10 && alchemy)
				i = Memory.getI32(o + 8);
				#else
				i = __getData(i + 2);
				#end
				
				while (i != NULL_POINTER)
				{
					#if (flash10 && alchemy)
					o = _data.getAddr(i);
					if (Memory.getI32(o) == key)
					{
						exists = true;
						break;
					}
					i0 = i;
					i = Memory.getI32(o + 8);
					#else
					if (__getData(i) == key)
					{
						exists = true;
						break;
					}
					i = __getData((i0 = i) + 2);
					#end
				}
				
				if (exists)
				{
					__setData(i0 + 2, __getData(i + 2));
					
					var j = Std.int(i / 3);
					__setNext(j, _free);
					_free = j;
					
					#if (flash10 && alchemy)
					o = _data.getAddr(i + 1);
					Memory.setI32(o    , VAL_ABSENT);
					Memory.setI32(o + 4, NULL_POINTER);
					#else
					__setData(i + 1, VAL_ABSENT);
					__setData(i + 2, NULL_POINTER);
					#end
					
					--_size;
					
					if (_sizeLevel > 0)
						if (_size == (_capacity >> 2))
							if (_isResizable)
								_shrink();
					
					return true;
				}
				else
					return false;
			}
		}
	}
	
	/**
	 * Creates an <em>IntHashSet</em> object of the values in this map. 
	 */
	public function toValSet():Set<Int>
	{
		var s = new IntHashSet(capacity);
		for (i in 0..._capacity)
		{
			var v = __getData((i * 3) + 1);
			if (v != VAL_ABSENT) s.set(v);
		}
		
		return s;
	}
	
	/**
	 * Creates an <em>IntHashSet</em> object of the keys in this map. 
	 */
	public function toKeySet():Set<Int>
	{
		var s = new IntHashSet(capacity);
		for (i in 0..._capacity)
		{
			var v = __getData((i * 3) + 1);
			if (v != VAL_ABSENT)
			{
				s.set(__getData(i * 3));
			}
		}
		
		return s;
	}
	
	/**
	 * Returns a new <em>IntIntHashTableKeyIterator</em> object to iterate over all keys stored in this map.
	 * The keys are visited in a random order.
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function keys():Itr<Int>
	{
		return new IntIntHashTableKeyIterator(this);
	}
	
	/*///////////////////////////////////////////////////////
	// collection
	///////////////////////////////////////////////////////*/
	
	/**
	 * Destroys this object by explicitly nullifying all key/values.<br/>
	 * <warn>If "alchemy memory" is used, always call this method when the life cycle of this object ends to prevent a memory leak.</warn>
	 */
	public function free():Void
	{
		#if (flash10 && alchemy)
		_hash.free();
		_data.free();
		_next.free();
		#end
		
		_hash = null;
		_data = null;
		_next = null;
		_iterator = null;
	}
	
	/**
	 * Same as <em>has()</em>. 
	 */
	inline public function contains(val:Int):Bool
	{
		return has(val);
	}
	
	/**
	 * Removes all occurrences of the value <code>val</code>.
	 * @return true if <code>val</code> was removed, false if <code>val</code> does not exist.
	 * @throws de.polygonal.core.util.AssertionError value 0x80000000 is reserved (debug only).
	 */
	inline public function remove(val:Int):Bool
	{
		#if debug
		D.assert(val != KEY_ABSENT, "val 0x80000000 is reserved");
		#end
		
		var c = 0;
		var keys = new Array<Int>();
		for (i in 0..._capacity)
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr((i * 3));
			if (Memory.getI32(o + 4) == val)
				keys[c++] = Memory.getI32(o);
			#else
			var v = __getData((i * 3));
			if (v == val)
				keys[c++] = __getData(i * 3);
			#end
		}
		
		if (c > 0)
		{
			for (key in keys) clr(key);
			return true;
		}
		else
			return false;
	}
	
	/**
	 * The total number of key/value pairs. 
	 */
	inline public function size():Int
	{
		return _size;
	}
	
	/**
	 * Removes all key/value pairs.<br/>
	 * @param purge If true, the hash table shrinks to the initial capacity defined in the constructor.
	 */
	public function clear(purge = false):Void
	{
		if (purge && _sizeLevel > 0)
		{
			_capacity >>= _sizeLevel;
			_sizeLevel = 0;
			
			#if flash10
			#if alchemy
			_data.resize(_capacity * 3);
			_next.resize(_capacity);
			#else
			_data = new Vector<Int>(_capacity * 3);
			_next = new Vector<Int>(_capacity);
			#end
			#else
			_data = ArrayUtil.alloc(_capacity * 3);
			_next = ArrayUtil.alloc(_capacity);
			#end
		}
		
		#if flash10
		#if alchemy
		_hash.fill(EMPTY_SLOT);
		#else
		for (i in 0...slotCount) _hash[i] = EMPTY_SLOT;
		#end
		#else
		_hash.fill(EMPTY_SLOT, slotCount);
		#end
		
		var j = 2;
		for (i in 0..._capacity)
		{
			__setData(j - 1, VAL_ABSENT);
			__setData(j, NULL_POINTER);
			j += 3;
		}
		for (i in 0..._capacity - 1) __setNext(i, i + 1);
		__setNext(_capacity - 1, NULL_POINTER);
		
		_free = 0;
		_size = 0;
	}

	/**
	 * Returns a new <em>IntIntHashTableValIterator</em> object to iterate over all values contained in this hash table.<br/>
	 * The values are visited in a random order.
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<Int>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
				_iterator = new IntIntHashTableValIterator(this);
			else
				_iterator.reset();
			return _iterator;
		}
		else
			return new IntIntHashTableValIterator(this);
	}
	
	/**
	 * Returns true if this hash table is empty. 
	 */
	inline public function isEmpty():Bool
	{
		return _size == 0;
	}
	
	/**
	 * Returns an unordered array containing all values in this hash table. 
	 */
	public function toArray():Array<Int>
	{
		var a:Array<Int> = ArrayUtil.alloc(size());
		var j = 0;
		for (i in 0..._capacity)
		{
			var v = __getData((i * 3) + 1);
				if (v != VAL_ABSENT) a[j++] = v;
		}
		return a;
	}
	
	#if flash10
	/**
	 * Returns an unordered Vector.&lt;T&gt; object containing all values in this hash table.
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(size());
		var j = 0;
		for (i in 0..._capacity)
		{
			var v = __getData((i * 3) + 1);
				if (v != VAL_ABSENT) a[j++] = v;
		}
		return a;
	}
	#end
	
	/**
	 * Returns an unordered dense array containing all values in this hash table. 
	 */
	public function toDA():DA<Int>
	{
		var a = new DA<Int>(size());
		for (i in 0..._capacity)
		{
			var v = __getData((i * 3) + 1);
			if (v != VAL_ABSENT) a.pushBack(v);
		}
		return a;
	}
	
	/**
	 * Duplicates this hash table by creating a deep copy.<br/>
	 * The <code>assign</code> and <code>copier</code> parameters are ignored.
	 */
	public function clone(assign:Bool = true, ?copier:Int->Int):Collection<Int>
	{
		var c:IntIntHashTable = Instance.createEmpty(IntIntHashTable);
		c.key = HashKey.next();
		c.maxSize = maxSize;
		
		#if flash10
		#if alchemy
		c._hash = _hash.clone();
		c._data = _data.clone();
		c._next = _next.clone();
		#else
		c._hash = new Vector<Int>(_hash.length);
		c._data = new Vector<Int>(_data.length);
		c._next = new Vector<Int>(_next.length);
		for (i in 0...Std.int(_hash.length)) c._hash[i] = _hash[i];
		for (i in 0...Std.int(_data.length)) c._data[i] = _data[i];
		for (i in 0...Std.int(_next.length)) c._next[i] = _next[i];
		#end
		#else
		c._hash = new Array<Int>();
		ArrayUtil.copy(_hash, c._hash);
		c._data = new Array<Int>();
		ArrayUtil.copy(_data, c._data);
		c._next = new Array<Int>();
		ArrayUtil.copy(_next, c._next);
		
		#end
		
		c._mask      = _mask;
		c._capacity   = _capacity;
		c._free      = _free;
		c._size      = _size;
		c._sizeLevel = _sizeLevel;
		
		return c;
	}
	
	inline function _hashCode(x:Int):Int
	{
		return (x * 73856093) & _mask;
	}
	
	function _expand()
	{
		_sizeLevel++;
		
		var oldSize = _capacity;
		var newSize = oldSize << 1;
		_capacity = newSize;
		
		#if flash10
		#if alchemy
		_next.resize(newSize);
		_data.resize(newSize * 3);
		#else
		var copy = new Vector<Int>(newSize);
		for (i in 0...oldSize) copy[i] = _next[i];
		_next = copy;
		var copy = new Vector<Int>(newSize  * 3);
		for (i in 0...oldSize * 3) copy[i] = _data[i];
		_data = copy;
		#end
		#else
		var copy:Array<Int> = ArrayUtil.alloc(newSize);
		ArrayUtil.copy(_next, copy, 0, oldSize);
		_next = copy;
		var copy:Array<Int> = ArrayUtil.alloc(newSize  * 3);
		ArrayUtil.copy(_data, copy, 0, oldSize * 3);
		_data = copy;
		#end
		
		for (i in oldSize - 1...newSize - 1) __setNext(i, i + 1);
		__setNext(newSize - 1, NULL_POINTER);
		_free = oldSize;
		
		var j = (oldSize * 3) + 2;
		for (i in 0...oldSize)
		{
			#if (flash10 && alchemy)
			var o = _data.getAddr(j - 1);
			Memory.setI32(o    , VAL_ABSENT);
			Memory.setI32(o + 4, NULL_POINTER);
			#else
			__setData(j - 1, VAL_ABSENT);
			__setData(j    , NULL_POINTER);
			#end
			
			j += 3;
		}
	}
	
	function _shrink()
	{
		_sizeLevel--;
		
		var oldSize = _capacity;
		var newSize = oldSize >> 1; 
		_capacity = newSize;
		
		#if (flash10 && alchemy)
		_data.resize((oldSize + (newSize >> 1)) * 3);
		var offset = oldSize * 3;
		var e = offset;
		
		var dst, src;
		dst = _data.getAddr(e);
		
		for (i in 0...slotCount)
		{
			var j = __getHash(i);
			if (j == EMPTY_SLOT) continue;
			
			__setHash(i, e - offset);
			
			src = _data.getAddr(j);
			flash.Memory.setI32(dst    , flash.Memory.getI32(src    ));
			flash.Memory.setI32(dst + 4, flash.Memory.getI32(src + 4));
			flash.Memory.setI32(dst + 8, NULL_POINTER);
			dst += 12;
			
			e += 3;
			j = __getData(j + 2);
			while (j != NULL_POINTER)
			{
				src = _data.getAddr(j);
				flash.Memory.setI32(dst - 4, e - offset);
				flash.Memory.setI32(dst    , flash.Memory.getI32(src));
				flash.Memory.setI32(dst + 4, flash.Memory.getI32(src + 4));
				flash.Memory.setI32(dst + 8, NULL_POINTER);
				dst += 12;
				
				e += 3;
				j = __getData(j + 2);
			}
		}
		
		var k = (newSize >> 1) * 3;
		
		dst = _data.getAddr(0);
		src = _data.getAddr(offset);
		var i = 0;
		var j = k << 2;
		while (i < j)
		{
			flash.Memory.setI32(dst + i, flash.Memory.getI32(src + i));
			i += 4;
		}
		
		dst = _data.getAddr(k);
		k = _data.getAddr(newSize * 3);
		while (dst < k)
		{
			flash.Memory.setI32(dst + 4, VAL_ABSENT);
			flash.Memory.setI32(dst + 8, NULL_POINTER);
			dst += 12;
		}
		
		_data.resize(newSize * 3);
		_next.resize(newSize);
		#else
		var k = newSize * 3;
		#if flash10
		var tmp = new Vector<Int>(k);
		_next = new Vector<Int>(newSize);
		#else
		var tmp:Array<Int> = ArrayUtil.alloc(k);
		_next = ArrayUtil.alloc(newSize);
		#end
		
		var e = 0;
		for (i in 0...slotCount)
		{
			var j = __getHash(i);
			if (j == EMPTY_SLOT) continue;
			
			__setHash(i, e);
			
			tmp[e    ] = __getData(j    );
			tmp[e + 1] = __getData(j + 1);
			tmp[e + 2] = NULL_POINTER;
			
			e += 3;
			j = __getData(j + 2);
			while (j != NULL_POINTER)
			{
				tmp[e - 1] = e;
				tmp[e    ] = __getData(j    );
				tmp[e + 1] = __getData(j + 1);
				tmp[e + 2] = NULL_POINTER;
				
				e += 3;
				j = __getData(j + 2);
			}
		}
		var i = k >> 1;
		while (i < k)
		{
			tmp[i + 1] = VAL_ABSENT;
			tmp[i + 2] = NULL_POINTER;
			i += 3;
		}
		_data = tmp;
		#end
		
		for (i in 0...newSize - 1) __setNext(i, i + 1);
		__setNext(newSize - 1, NULL_POINTER);
		_free = newSize >> 1;
	}
	
	inline function __getHash(i:Int)
	{
		#if (flash10 && alchemy)
		return _hash.get(i);
		#else
		return _hash[i];
		#end
	}
	inline function __setHash(i:Int, x:Int)
	{
		#if (flash10 && alchemy)
		_hash.set(i, x);
		#else
		_hash[i] = x;
		#end
	}
	
	inline function __getNext(i:Int)
	{
		#if (flash10 && alchemy)
		return _next.get(i);
		#else
		return _next[i];
		#end
	}
	inline function __setNext(i:Int, x:Int)
	{
		#if (flash10 && alchemy)
		_next.set(i, x);
		#else
		_next[i] = x;
		#end
	}
	
	inline function __getData(i:Int)
	{
		#if (flash10 && alchemy)
		return _data.get(i);
		#else
		return _data[i];
		#end
	}
	inline function __setData(i:Int, x:Int)
	{
		#if (flash10 && alchemy)
		_data.set(i, x);
		#else
		_data[i] = x;
		#end
	}
}

#if doc
private
#end
class IntIntHashTableValIterator implements de.polygonal.ds.Itr<Int>
{
	var _f:IntIntHashTableFriend;
	var _i:Int;
	var _s:Int;
	
	#if flash10
	#if alchemy
	var _data:IntMemory;
	#else
	var _data:Vector<Int>;
	#end
	#else
	var _data:Array<Int>;
	#end
	
	public function new(hash:IntIntHashTableFriend)
	{
		_f = hash;
		_data = _f._data;
		_i = 0;
		_s = _f._capacity;
		_scan();
	}
	
	inline public function reset():Itr<Int>
	{
		_data = _f._data;
		_i = 0;
		_s = _f._capacity;
		_scan();
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _i < _s;
	}
	
	inline public function next():Int
	{
		var val = __getData((_i++ * 3) + 1);
		_scan();
		return val;
	}
	
	inline public function remove():Void
	{
		throw 'unsupported operation';
	}
	
	inline function _scan()
	{
		while ((_i < _s) && (__getData((_i * 3) + 1) == IntIntHashTable.VAL_ABSENT)) _i++;
	}
	
	inline function __getData(i:Int)
	{
		#if (flash10 && alchemy)
		return _data.get(i);
		#else
		return _data[i];
		#end
	}
}

#if doc
private
#end
class IntIntHashTableKeyIterator implements de.polygonal.ds.Itr<Int>
{
	var _f:IntIntHashTableFriend;
	var _i:Int;
	var _s:Int;
	
	#if flash10
	#if alchemy
	var _data:IntMemory;
	#else
	var _data:Vector<Int>;
	#end
	#else
	var _data:Array<Int>;
	#end
	
	public function new(hash:IntIntHashTableFriend)
	{
		_f = hash;
		_data = _f._data;
		_i = 0;
		_s = _f._capacity;
		_scan();
	}
	
	inline public function reset():Itr<Int>
	{
		_data = _f._data;
		_i = 0;
		_s = _f._capacity;
		_scan();
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _i < _s;
	}
	
	inline public function next():Int
	{
		var key = __getData((_i++ * 3));
		_scan();
		return key;
	}
	
	inline public function remove():Void
	{
		throw 'unsupported operation';
	}
	
	inline function _scan()
	{
		while ((_i < _s) && (__getData((_i * 3) + 1) == IntIntHashTable.VAL_ABSENT)) _i++;
	}
	
	inline function __getData(i:Int)
	{
		#if (flash10 && alchemy)
		return _data.get(i);
		#else
		return _data[i];
		#end
	}
}