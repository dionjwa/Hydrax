﻿/*
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
import de.polygonal.core.util.Assert;
import de.polygonal.core.util.Instance;

private typedef DAFriend<T> = 
{
	private var _a:Array<T>;
	private var _size:Int;
}
 
/**
 * <p>A dense, dynamic array.</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class DA<T> implements Collection<T>
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	var _a:Array<T>;
	var _size:Int;
	var _iterator:DAIterator<T>;
	
	/**
	 * The maximum allowed size of this dense array.<br/>
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
	
	/**
	 * @param reservedSize the initial capacity of the internal container. See <em>reserve()</em>.
	 * @param maxSize the maximum allowed size of this dense array.<br/>
	 * The default value of -1 indicates that there is no upper limit.
	 * @throws de.polygonal.core.util.AssertionError reserved size is greater than allowed size (debug only).
	 */
	public function new(reservedSize = 0, maxSize = -1)
	{
		_size = 0;
		_iterator = null;
		
		#if debug
		this.maxSize = (maxSize == -1) ? Limits.INT32_MAX : maxSize;
		#else
		this.maxSize = -1;
		#end
		
		if (reservedSize > 0)
		{
			#if debug
			D.assert(reservedSize <= this.maxSize, "reserved size is greater than allowed size");
			#end
			_a = ArrayUtil.alloc(reservedSize);
		}
		else
			_a = new Array<T>();
		
		key = HashKey.next();
		reuseIterator = false;
	}
	
	/**
	 * For performance reasons the dense array does nothing to ensure that empty locations contain null.<br/>
	 * <em>pack()</em> therefore nullifies all obsolete references and shrinks the container to the actual size allowing the garbage collector to reclaim used memory.
	 * <o>n</o>
	 */
	public function pack():Void
	{
		var s = _a.length;
		if (s == size()) return;
		var tmp = _a;
		_a = ArrayUtil.alloc(size());
		for (i in 0...size()) __set(i, tmp[i]);
		for (i in size()...tmp.length) tmp[i] = null;
	}
	
	/**
	 * Preallocates internal space for storing <code>x</code> elements.<br/>
	 * This is useful if the expected size is known in advance - many platforms can optimize memory usage if an exact size is specified.
	 * <o>n</o>
	 */
	public function reserve(x:Int):Void
	{
		if (size() == x) return;
		
		var tmp = _a;
		_a = ArrayUtil.alloc(x);
		if (size() < x)
		{
			for (i in 0...size())
				_a[i] = tmp[i];
		}
	}
	
	/**
	 * Trims the dense array by cutting of <em>size()</em> - <code>x</code> elements.<br/>
	 * <warn>This only modifies the <em>size()</em>.</warn>
	 * To enable instant garbage collection of all cut off elements and to shrink the internal array to the new size, call <em>pack()</em> afterwards.
	 * <o>1</o>
	 * @param x the new size of this dense array.
	 * @throws de.polygonal.core.util.AssertionError new size &gt; current <em>size()</em> (debug only).
	 */
	inline public function trim(x:Int):Void
	{
		D.assert(x <= size(), Sprintf.format("new size > current size (%d/%d)", [x, size()]));
		_size = x;
	}
	
	/**
	 * Returns the element stored at index <code>i</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function get(i:Int):T
	{
		D.assert(i >= 0 && i < _size, Sprintf.format("the index %d is out of range %d", [i, _size - 1]));
		
		return __get(i);
	}
	
	/**
	 * Returns the element stored at index <code>i</code> + 1.<br/>
	 * The index wraps around when <code>i</code> equals <em>size()</em>.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function getNext(i:Int):T
	{
		D.assert(i >= 0 && i < _size, Sprintf.format("the index %d is out of range %d", [i, _size - 1]));
		return __get((i + 1) == _size ? 0 : i + 1);
	}
	
	/**
	 * Returns the element stored at index <code>i</code> - 1.<br/>
	 * The index wraps around when <code>i</code> equals 0.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function getPrev(i:Int):T
	{
		D.assert(i >= 0 && i < _size, Sprintf.format("the index %d is out of range %d", [i, _size - 1]));
		return __get(((i - 1) == -1) ? (_size - 1) : (i - 1));
	}
	
	/**
	 * Replaces the element at index <code>i</code> with the element <code>x</code>.<br/>
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range or maximum size reached (debug only).
	 */
	inline public function set(i:Int, x:T):Void
	{
		D.assert(i >= 0 && i <= _size, Sprintf.format("the index %d is out of range %d", [i, _size]));
		
		#if debug
		D.assert(i < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		
		__set(i, x);
		if (i >= _size) _size++;
	}
	
	/**
	 * Swaps the element stored at index <code>i</code> with the element stored at index <code>j</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range or <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function swp(i:Int, j:Int):Void
	{
		D.assert(i != j, Sprintf.format("i index equals j index (%d)", [i]));
		
		var tmp = get(i);
		cpy(i, j);
		set(j, tmp);
	}
	
	/**
	 * Replaces the element at index <code>i</code> with the element from index <code>j</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range or <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function cpy(i:Int, j:Int):Void
	{
		D.assert(i != j, Sprintf.format("i index equals j index (%d)", [i]));
		
		set(i, get(j));
	}
	
	/**
	 * Returns the first element.<br/>
	 * This is the element at index 0.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function front():T
	{
		return get(0);
	}
	
	/**
	 * Returns the last element.<br/>
	 * This is the element at index <em>size()</em> - 1.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function back():T
	{
		return get(_size - 1);
	}
	
	/**
	 * Removes and returns the last element.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError array is empty (debug only).
	 */
	inline public function popBack():T
	{
		var x = get(_size - 1);
		_size--;
		return x;
	}
	
	/**
	 * Appends the element <code>x</code> to the last element.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function pushBack(x:T):Void
	{
		set(_size, x);
	}
	
	/**
	 * Removes and returns the first element.<br/>
	 * To fill the gap, any subsequent elements are shifted to the left (indices - 1).
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError array is empty (debug only).
	 */
	inline public function popFront():T
	{
		return removeAt(0);
	}
	
	/**
	 * Prepends the element <code>x</code> to the first element.<br/>
	 * Shifts the first element (if any) and any subsequent elements to the right (indices + 1).
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function pushFront(x:T):Void
	{
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		
		insertAt(0, x);
	}
	
	/**
	 * Inserts <code>x</code> at the specified index <code>i</code>.<br/>
	 * Shifts the element currently at that position (if any) and any subsequent elements to the right (indices + 1).
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function insertAt(i:Int, x:T):Void
	{
		D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		D.assert(i >= 0 && i <= size(), Sprintf.format("i index out of range (%d)", [i]));
		
		var p = _size;
		while (p > i)
		{
			#if cpp
			__cpy(p, p - 1); p--;
			#else
			__cpy(p--, p);
			#end
		}
		__set(i, x);
		_size++;
	}
	
	/**
	 * Removes the element at the specified index <code>i</code>.<br/>
	 * Shifts any subsequent elements to the left (indices - 1).
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function removeAt(i:Int):T
	{
		D.assert(i >= 0 && i < size(), Sprintf.format("the index %d is out of range %d", [i, size()]));
		
		var x = __get(i);
		var k = size() - 1;
		var p = i;
		while (p < k)
		{
			#if cpp
			__cpy(p, p + 1); p++;
			#else
			__cpy(p++, p);
			#end
		}
		_size--;
		return x;
	}
	
	/**
	 * Swaps the element at the index <code>i</code> with the last element.<br/>
	 * If followed by <em>popBack()</em>, this allows fast removal if the order of the elements doesn't matter.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function swapWithBack(i:Int):Void
	{
		D.assert(i >= 0 && i < size(), Sprintf.format("the index %d is out of range %d", [i, size()]));
		
		var s = size() - 1;
		if (i < s)
		{
			var tmp = back();
			__set(s, __get(i));
			__set(i, tmp);
		}
    }
	
	/**
	 * Removes <code>n</code> elements starting at the specified index <code>i</code> in the range &#091;<code>i</code>, <code>i</code> + <code>n</code>&#093;.
	 * <o>n</o>
	 * @param output stores the removed elements. If omitted, the removed elements are lost.
	 * @return a dense array storing all removed elements or null if <code>output</code> is omitted.
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> or <code>n</code> out of range (debug only).
	 */
	public function removeRange(i:Int, n:Int, ?output:DA<T>):DA<T>
	{
		D.assert(i >= 0 && i <= size(), Sprintf.format("i index out of range (%d)", [i]));
		D.assert(n > 0 && n <= size() && (i + n <= size()), Sprintf.format("n out of range (%d)", [n]));
		
		if (output == null)
		{
			var s = size();
			var p = i + n;
			while (p < s)
			{
				__set(p - n, __get(p));
				p++;
			}
		}
		else
		{
			var s = size();
			var p = i + n;
			var e:T, j;
			while (p < s)
			{
				j = p - n;
				e = __get(j);
				output.pushBack(e);
				__cpy(j, p++);
			}
		}
		
		_size -= n;
		
		return output;
	}
	
	/**
	 * Concatenates this array with <code>x</code> by appending all elements of <code>x</code> to this array.
	 * <o>n</o>
	 * @param copy if true, returns a new array instead of modifying this array.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> is null (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> equals this if <code>copy</code>=false (debug only).
	 */
	public function concat(x:DA<T>, copy = false):DA<T>
	{
		D.assert(x != null, "x is null");
		
		if (copy)
		{
			var copy = new DA<T>();
			copy._size = size() + x.size();
			for (i in 0...size()) copy.set(i, __get(i));
			for (i in size()...size() + x.size()) copy.set(i, x.get(i - size()));
			return copy;
		}
		else
		{
			D.assert(x != this, "x equals this");
			
			var j = _size;
			_size += x.size();
			for (i in 0...x.size()) __set(j++, x.get(i));
			return this;
		}
	}
	
	/**
	 * Finds the first occurrence of the element <code>x</code> (by incrementing indices - from left to right).
	 * <o>n</o>
	 * @param from the index to start from. The default value is 0.
	 * @param binarySearch use the binary search algorithm. Requires that the elements are sorted.
	 * @param comparator a comparison function for the binary search. If omitted, the method assumes that all elements implement <em>Comparable</em>.
	 * @return the index storing the element <code>x</code> or -1 if <code>x</code> was not found.<br/>
	 * If <code>binarySearch</code> is true, returns the index of <code>x</code> or the bitwise complement (~) of the index where the <code>x</code> would be inserted (guaranteed to be a negative number).<br/>
	 * <warn>The insertion point is only valid if<code>from</code>=0.</warn>
	 * @throws de.polygonal.core.util.AssertionError <code>from</code> index out of range (debug only).
	 */
	public function indexOf(x:T, from = 0, binarySearch = false, ?comparator:T->T->Int):Int
	{
		if (size() == 0)
			return -1;
		else
		{
			D.assert(from >= 0 && from < size(), Sprintf.format("from index out of range (%d)", [from]));
			
			if (binarySearch)
			{
				if (comparator != null)
					return ArrayUtil.bsearchComparator(_a, x, from, size() - 1, comparator);
				else
				{
					D.assert(Std.is(x, Comparable), Sprintf.format("element is not of type Comparable (%s)", [x]));
					
					var k = size();
					var l = from, m, h = k;
					while (l < h)
					{
						m = l + ((h - l) >> 1);
						
						D.assert(Std.is(_a[m], Comparable), Sprintf.format("element is not of type Comparable (%s)", [_a[m]]));
						
						if (untyped _a[m].compare(x) < 0)
							l = m + 1;
						else
							h = m;
					}
					
					D.assert(Std.is(_a[l], Comparable), Sprintf.format("element is not of type Comparable (%s)", [_a[l]]));
					return ((l <= k) && (untyped _a[l].compare(x)) == 0) ? l : -l;
				}
			}
			else
			{
				var i = from;
				var j = -1;
				var k = size() - 1;
				do
				{
					if (__get(i) == x)
					{
						j = i;
						break;
					}
				}
				while (i++ < k);
				return j;
			}
		}
	}
	
	/**
	 * Finds the first occurrence of <code>x</code> (by decrementing indices - from right to left) and returns the index storing the element <code>x</code> or -1 if <code>x</code> was not found.
	 * <o>n</o>
	 * @param from the index to start from. By default, the method starts from the last element in this dense array.
	 * @throws de.polygonal.core.util.AssertionError <code>from</code> index out of range (debug only).
	 */
	public function lastIndexOf(x:T, from = -1):Int
	{
		if (size() == 0)
			return -1;
		else
		{
			if (from < 0) from = size() + from;
			
			D.assert(from >= 0 && from < size(), Sprintf.format("from index out of range (%d)", [from]));
			
			var j = -1;
			var i = from;
			
			do
			{
				if (__get(i) == x)
				{
					j = i;
					break;
				}
			}
			while (i-- > 0);
			return j;
		}
	}
	
	/**
	 * Reverses this dense array in place.
	 * <o>n</o>
	 */
	public function reverse():Void
	{
		if (_a.length > size())
			_a = ArrayUtil.shrink(_a, size());
		_a.reverse();
	}
	
	/**
	 * Replaces up to <code>n</code> existing elements with objects of type <code>C</code>.
	 * <o>n</o>
	 * @param C the class to instantiate for each element.
	 * @param args passes additional constructor arguments to the class <code>C</code>.
	 * @param n the number of elements to replace. If 0, <code>n</code> is set to <em>size()</em>.
	 * @throws de.polygonal.core.util.AssertionError <code>n</code> out of range (debug only).
	 */
	public function assign(C:Class<T>, ?args:Array<Dynamic>, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		if (n > 0)
		{
			D.assert(n <= maxSize, Sprintf.format("n out of range (%d)", [n]));
			_size = n;
		}
		else
			n = size();
		
		for (i in 0...n) __set(i, Instance.create(C, args)); 
	}
	
	/**
	 * Replaces up to <code>n</code> existing elements with the instance of <code>x</code>.
	 * <o>n</o>
	 * @param n the number of elements to replace. If 0, <code>n</code> is set to <em>size()</em>.
	 * @throws de.polygonal.core.util.AssertionError <code>n</code> out of range (debug only).
	 */
	public function fill(x:T, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		if (n > 0)
		{
			D.assert(n <= maxSize, Sprintf.format("n out of range (%d)", [n]));
			_size = n;
		}
		else
			n = size();
		
		for (i in 0...n)
			__set(i, x);
	}
	
	/**
	 * Copies <code>n</code> elements from the location pointed by the index <code>source</code> to the location pointed by the index <code>destination</code>.<br/>
	 * Copying takes place as if an intermediate buffer was used, allowing the destination and source to overlap.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError invalid <code>destination</code>, <code>source</code> or <code>n</code> value (debug only).
	 * @see <a href="http://www.cplusplus.com/reference/clibrary/cstring/memmove/" target="_blank">http://www.cplusplus.com/reference/clibrary/cstring/memmove/</a>
	 */
	inline public function memmove(destination:Int, source:Int, n:Int):Void
	{
		D.assert(destination >= 0 && source >= 0 && n >= 0, "destination >= 0 && source >= 0 && n >= 0");
		D.assert(source < size(), "source < size()");
		D.assert(destination + n <= size(), "destination + n <= size()");
		D.assert(n <= size(), "n <= size()");
		
		if (source == destination)
			return;
		else
		if (source <= destination)
		{
			var i = source + n;
			var j = destination + n;
			for (k in 0...n)
			{
				i--;
				j--;
				__set(j, __get(i));
			}
		}
		else
		{
			var i = source;
			var j = destination;
			for (k in 0...n)
			{
				__set(j, __get(i));
				i++;
				j++;
			}
		}
	}
		
	/**
	 * Converts the data in this dense array to strings, inserts <code>x</code> between the elements, concatenates them, and returns the resulting string.
	 * <o>n</o>
	 */
	public function join(x:String):String
	{
		if (size() == 0) return "";
		if (size() == 1) return Std.string(front());
		var s = Std.string(front()) + x;
		for (i in 1...size() - 1)
		{
			s += Std.string(get(i));
			s += x;
		}
		s += Std.string(back());
		return s;
	}
	
	/**
	 * Sorts the elements of this dense array using the quick sort algorithm.<br/>
	 * <o>n&sup2;</o>
	 * @param compare a comparison function.<br/>If null, the elements are compared using element.<em>compare()</em>.<br/>
	 * <warn>In this case all elements have to implement <em>Comparable</em>.</warn>
	 * @param useInsertionSort if true, the dense array is sorted using the insertion sort algorithm. This is faster for nearly sorted lists.
	 * @param first sort start index. The default value is 0.
	 * @param count the number of elements to sort (range: <arg>&#091;<code>first</code>, <code>first</code> + <code>count</code>&#093;</arg>).<br/>
	 * If omitted, <code>count</code> is set to <code>size()</code>.
	 * @throws de.polygonal.core.util.AssertionError element does not implement <em>Comparable</em> (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>first</code> or <code>count</code> out of bound (debug only).
	 */
	public function sort(compare:T->T->Int, useInsertionSort = false, first = 0, count = 0):Void
	{
		if (size() > 1)
		{
			D.assert(first >= 0 && first <= size() - 1 && first + count <= size(), "first out of bound");
			D.assert(count >= 0 && count <= size(), "count out of bound");
			
			if (count == 0) count = size();
			
			if (compare == null)
				useInsertionSort ? _insertionSortComparable(first, count) : _quickSortComparable(first, count);
			else
			{
				if (useInsertionSort)
					_insertionSort(first, count, compare);
				else
				{
					#if (flash || js)
					if (first == 0 && count == size())
					{
						ArrayUtil.shrink(_a, size());
						_a.sort(compare);
					}
					else
						_quickSort(first, count, compare);
					#else
					_quickSort(first, count, compare);
					#end
				}
			}
		}
	}
	
	/**
	 * Returns true if the index <code>i</code> is valid.
	 * <o>1</o>
	 */
	inline public function inRange(i:Int):Bool
	{
		return i >= 0 && i <= _size;
	}
	
	/**
	 * Grants access to the internal array storing the elements of this dense array.<br/>
	 * Useful for fast iteration or low-level operations.<br/>
	 * <warn>The length of the array doesn't have to match <code>size()</code>.</warn>
	 * <o>1</o>
	 */
	inline public function getArray():Array<T>
	{
		return _a;
	}
	
	/*///////////////////////////////////////////////////////
	// collection
	///////////////////////////////////////////////////////*/
	
	/**
	 * Destroys this object by explicitly nullifying all elements for GC'ing used resources.<br/>
	 * Improves GC efficiency/performance (optional).
	 * <o>n</o>
	 */
	public function free():Void
	{
		var NULL:Null<T> = null;
		for (i in 0..._a.length) __set(i, NULL);
		_a = null;
		_iterator = null;
	}
	
	/**
	 * Returns true if this queue contains the element <code>x</code>. 
	 * <o>n</o>
	 */
	inline public function contains(x:T):Bool
	{
		var found = false;
		for (i in 0...size())
		{
			if (__get(i) == x)
			{
				found = true;
				break;
			}
		}
		return found;
	}
	
	/**
	 * Removes and nullifies all occurrences of the element <code>x</code>.<br/>
	 * <o>n</o>
	 * @return true if at least one occurrence of <code>x</code> was removed.
	 */
	public function remove(x:T):Bool
	{
		if (isEmpty()) return false;
		
		var i = 0;
		var s = size();
		while (i < s)
		{
			if (__get(i) == x)
			{
				s--;
				var p = i;
				while (p < s)
				{
					__cpy(p, p + 1);
					++p;
				}
				continue;
			}
			i++;
		}
		
		var found = (size() - s) != 0;
		_size = s;
		return found;
	}

	/**
	 * Removes all elements.
	 * <o>1 or n if <code>purge</code> is true</o>
	 * @param purge if true, elements are nullified upon removal.
	 */
	inline public function clear(purge = false):Void
	{
		if (purge)
		{
			var NULL:Null<T> = null;
			for (i in 0..._a.length) __set(i, NULL);
		}
		_size = 0;
	}
	
	/**
	 * Returns a new <em>DAIterator</em> object to iterate over all elements contained in this dense array.<br/>
	 * Preserves the natural order of an array.
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<T>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
				_iterator = new DAIterator<T>(this);
			else
				_iterator.reset();
			return _iterator;
		}
		else
			return new DAIterator<T>(this);
	}
	
	/**
	 * The total number of elements. 
	 * <o>1</o>
	 */
	inline public function size():Int
	{
		return _size;
	}
	
	/**
	 * Returns true if this dense array is empty.
	 * <o>1</o>
	 */
	inline public function isEmpty():Bool
	{
		return size() == 0;
	}
	
	/**
	 * Returns an array containing all elements in this dense array.<br/>
	 * Preserves the natural order of this array.
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(size());
		for (i in 0...size()) a[i] = __get(i);
		return a;
	}
	
	#if flash10
	/**
	 * Returns a Vector.&lt;T&gt; object containing all elements in this dense array.<br/>
	 * Preserves the natural order of this array.
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(size());
		for (i in 0...size()) a[i] = __get(i);
		return a;
	}
	#end
	
	/**
	 * Returns a dense array containing all elements in this queue.<br/>
	 * Preserves the natural order of this array.
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(size());
		for (i in 0...size()) a.pushBack(__get(i));
		return a;
	}
	
	/**
	 * Duplicates this dense array. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		var copy = new DA<T>(size(), maxSize);
		copy._size = _size;
		if (assign)
		{
			for (i in 0...size())
				copy.__set(i, __get(i));
		}
		else
		if (copier == null)
		{
			var c:Cloneable<T> = null;
			for (i in 0...size())
			{
				D.assert(Std.is(__get(i), Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [__get(i)]));
				c = untyped __get(i);
				copy.__set(i, c.clone());
			}
		}
		else
		{
			for (i in 0...size())
				copy.__set(i, copier(__get(i)));
		}
		
		return copy;
	}
	
	/**
	 * Shuffles the elements of this collection by using the Fisher-Yates algorithm.<br/>
	 * <o>n</o>
	 * @param rval a list of random double values in the range between 0 (inclusive) to 1 (exclusive) defining the new positions of the elements.
	 * If omitted, random values are generated on-the-fly by calling <em>Math.random()</em>.
	 * @throws de.polygonal.core.util.AssertionError insufficient random values (debug only).
	 */
	public function shuffle(?rval:DA<Float>):Void
	{
		var s = size();
		if (rval == null)
		{
			var m = Math;
			while (--s > 1)
			{
				var i = Std.int(m.random() * s);
				var t = __get(s);
				__cpy(s, i);
				__set(i, t);
			}
		}
		else
		{
			D.assert(rval.size() >= size(), "insufficient random values");
			
			var j = 0;
			while (--s > 1)
			{
				var i = Std.int(rval.get(j++) * s);
				var t = __get(s);
				__cpy(s, i);
				__set(i, t);
			}
		}
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var da = new de.polygonal.ds.DA&lt;Int&gt;(10);
	 * for (i in 0...3) {
	 *     da.set(i, i);
	 * }
	 * trace(da);</pre>
	 * <pre class="console">
	 * {DA, size/max: 3/10}
	 * |<
	 *   0 -> 0
	 *   1 -> 1
	 *   2 -> 2
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{DA, size: %d}", [size()]);
		if (isEmpty()) return s;
		s += "\n|<\n";
		for (i in 0...size())
			s += Sprintf.format("  %4d -> %s\n", [i, Std.string(__get(i))]);
		s += ">|";
		return s;
		#else
		return Sprintf.format("{DA, size: %d}", [size()]);
		#end
	}
	
	function _quickSort(first:Int, k:Int, cmp:T->T->Int):Void
	{
		var last = first + k - 1;
		var lo = first;
		var hi = last;
		if (k > 1)
		{
			var i0 = first;
			var i1 = i0 + (k >> 1);
			var i2 = i0 + k - 1;
			var t0 = __get(i0);
			var t1 = __get(i1);
			var t2 = __get(i2);
			var mid;
			var t = cmp(t0, t2);
			if (t < 0 && cmp(t0, t1) < 0)
				mid = cmp(t1, t2) < 0 ? i1 : i2;
			else
			{
				if (cmp(t1, t0) < 0 && cmp(t1, t2) < 0)
					mid = t < 0 ? i0 : i2;
				else
					mid = cmp(t2, t0) < 0 ? i1 : i0;
			}
			
			var pivot = __get(mid);
			__cpy(mid, first);
			
			while (lo < hi)
			{
				while (cmp(pivot, __get(hi)) < 0 && lo < hi) hi--;
				if (hi != lo) 
				{
					__cpy(lo, hi);
					lo++;
				}
				while (cmp(pivot, __get(lo)) > 0 && lo < hi) lo++;
				if (hi != lo)
				{
					__cpy(hi, lo);
					hi--;
				}
			}
			__set(lo, pivot);
			_quickSort(first, lo - first, cmp);
			_quickSort(lo + 1, last - lo, cmp);
		}
	}
	
	function _quickSortComparable(first:Int, k:Int):Void
	{
		var last = first + k - 1;
		var lo = first;
		var hi = last;
		if (k > 1)
		{
			var i0 = first;
			var i1 = i0 + (k >> 1);
			var i2 = i0 + k - 1;
			var t0 = __get(i0);
			var t1 = __get(i1);
			var t2 = __get(i2);
			
			D.assert(Std.is(t0, Comparable), Sprintf.format("element is not of type Comparable (%s)", [Std.string(t0)]));
			D.assert(Std.is(t1, Comparable), Sprintf.format("element is not of type Comparable (%s)", [Std.string(t1)]));
			D.assert(Std.is(t2, Comparable), Sprintf.format("element is not of type Comparable (%s)", [Std.string(t2)]));
			
			var mid;
			var t = untyped t0.compare(t2);
			if (t < 0 && untyped t0.compare(t1) < 0)
				mid = untyped t1.compare(t2) < 0 ? i1 : i2;
			else
			{
				if (untyped t0.compare(t1) < 0 && t1.compare(t2) < 0)
					mid = t < 0 ? i0 : i2;
				else
					mid = untyped t2.compare(t0) < 0 ? i1 : i0;
			}
			
			var pivot = __get(mid);
			__cpy(mid, first);
			
			while (lo < hi)
			{
				D.assert(Std.is(__get(lo), Comparable), Sprintf.format("element is not of type Comparable (%s)", [Std.string(__get(lo))]));
				D.assert(Std.is(__get(hi), Comparable), Sprintf.format("element is not of type Comparable (%s)", [Std.string(__get(hi))]));
				D.assert(Std.is(pivot, Comparable), Sprintf.format("element is not of type Comparable (%s)", [Std.string(pivot)]));
				
				while (untyped pivot.compare(__get(hi)) < 0 && lo < hi) hi--;
				if (hi != lo) 
				{
					__cpy(lo, hi);
					lo++;
				}
				while (untyped pivot.compare(__get(lo)) > 0 && lo < hi) lo++;
				if (hi != lo)
				{
					__cpy(hi, lo);
					hi--;
				}
			}
			__set(lo, pivot);
			_quickSortComparable(first, lo - first);
			_quickSortComparable(lo + 1, last - lo);
		}
	}
	
	function _insertionSort(first:Int, k:Int, cmp:T->T->Int):Void
	{
		for (i in first + 1...first + k)
		{
			var x = __get(i);
			var j = i;
			while (j > first)
			{
				var y = __get(j - 1);
				if (cmp(y, x) > 0)
				{
					__set(j, y);
					j--;
				}
				else
					break;
			}
			__set(j, x);
		}
	}
	
	function _insertionSortComparable(first:Int, k:Int):Void
	{
		for (i in first + 1...first + k)
		{
			var x = __get(i);
			
			D.assert(Std.is(x, Comparable), "element is not of type Comparable");
			
			var j = i;
			while (j > first)
			{
				var y = __get(j - 1);
				
				D.assert(Std.is(y, Comparable), "element is not of type Comparable");
				
				if (untyped y.compare(x) > 0)
				{
					__set(j, y);
					j--;
				}
				else
					break;
			}
			__set(j, x);
		}
	}
	
	inline function __get(i:Int) return _a[i]
	inline function __set(i:Int, x:T) _a[i] = x
	inline function __cpy(i:Int, j:Int) _a[i] = _a[j]
}

#if doc
private
#end
class DAIterator<T> implements de.polygonal.ds.Itr<T>
{
	var _f:DA<T>;
	var _a:Array<T>;
	var _i:Int;
	var _s:Int;
	
	public function new(f:DA<T>)
	{
		_f = f;
		reset();
	}
	
	inline public function reset():Itr<T>
	{
		_a = __a(_f);
		_s = __size(_f);
		_i = 0;
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _i < _s;
	}

	inline public function next():T
	{
		return _a[_i++];
	}
	
	inline public function remove():Void
	{
		D.assert(_i > 0, 'call next() before removing an element');
		_f.removeAt(--_i);
		_s--;
	}
	
	inline function __a(f:DAFriend<T>) return f._a
	inline function __size(f:DAFriend<T>) return f._size
}