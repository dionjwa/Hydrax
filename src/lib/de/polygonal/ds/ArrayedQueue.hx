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

private typedef ArrayedQueueFriend<T> =
{
	private var _a:Array<T>;
	private var _front:Int;
	private var _size:Int;
	private var _capacity:Int;
}

/**
 * <p>An arrayed queue based on an arrayed circular queue.</p>
 * <p>A queue is a linear list for which all insertions are made at one end of the list; all deletions (and usually all accesses) are made at the other end.</p>
 * <p>This is called a FIFO structure (First In, First Out).</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 * See <a href="http://lab.polygonal.de/2007/05/23/data-structures-example-the-queue-class/" target="_blank">http://lab.polygonal.de/2007/05/23/data-structures-example-the-queue-class/</a></p>
 */
class ArrayedQueue<T> implements Queue<T>
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * The maximum allowed size of this queque.<br/>
	 * Once the maximum size is reached, adding an element will fail with an error (debug only).
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
	
	var _a:Array<T>;
	
	var _size:Int;
	var _sizeLevel:Int;
	var _front:Int;
	var _capacity:Int;
	var _isResizable:Bool;
	var _iterator:ArrayedQueueIterator<T>;
	
	#if debug
	var _t0:Int;
	var _t1:Int;
	#end
	
	/**
	 * @param capacity the initial physical space for storing the elements at the time the queue is created.
	 * This is also the minimum size of this queue.
	 * The <em>capacity</em> is automatically adjusted according to the storage requirements based on three rules:
	 * <ol>
	 * <li>If this queue runs out of space, the <em>capacity</em> is doubled (if <code>isResizable</code> is true).</li>
	 * <li>If the <em>size()</em> falls below a quarter of the current <em>capacity</em>, the <em>capacity</em> is cut in half.</li>
	 * <li>The minimum <em>capacity</em> equals <code>capacity</code>.</li>
	 * </ol>
	 * 
	 * @param isResizable if true, the <em>capacity</em> is automatically adjusted.<br/>
	 * Otherwise <code>capacity</code> defines both the minimum and maximum allowed <em>capacity</em>.
	 * Default is true.
	 * 
	 * @param maxSize the maximum allowed size of this queue.<br/>
	 * The default value of -1 indicates that there is no upper limit.
	 * @throws de.polygonal.core.util.AssertionError reserved size is greater than allowed size (debug only).
	 */
	public function new(capacity:Int, isResizable = true, maxSize = -1)
	{
		#if debug
		_t0 = _t1 = 0;
		this.maxSize = (maxSize == -1) ? Limits.INT32_MAX : maxSize;
		#else
		this.maxSize = -1;
		#end
		
		#if debug
		_t0 = 0;
		_t1 = 0;
		#end
		
		_capacity     = capacity;
		_isResizable  = isResizable;
		_sizeLevel    = 0;
		_size         = _front = 0;
		_a            = ArrayUtil.alloc(_capacity);
		_iterator     = null;
		key           = HashKey.next();
		reuseIterator = false;
	}
	
	/**
	 * Returns the front element.<br/>
	 * This is the "oldest" element.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 */
	inline public function peek():T
	{
		D.assert(_size > 0, "queue is empty");
		return __get(_front);
	}
	
	/**
	 * Returns the rear element.<br/>
	 * This is the "newest" element.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 */
	inline public function back():T
	{
		D.assert(_size > 0, "queue is empty");
		return __get((_size - 1 + _front) % _capacity);
	}
	
	/**
	 * Enqueues the element <code>x</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 * @throws de.polygonal.core.util.AssertionError out of space - queue is full but not resizable.
	 */
	inline public function enqueue(x:T):Void
	{
		#if debug
		if (maxSize != -1)
			D.assert(_size < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		++_t1;
		#end
		
		if (_capacity == _size)
		{
			#if debug
			if (!_isResizable)
				D.assert(false, Sprintf.format("out of space (%d)", [capacity]));
			#end
			
			if (_isResizable)
			{
				_sizeLevel++;
				_pack(_capacity << 1);
				_front = 0;
				_capacity <<= 1;
			}
		}
		
		__set((_size++ + _front) % _capacity, x);
	}
	
	/**
	 * Dequeues and returns the front element.<br/>
	 * To allow instant garbage collection of the dequeued element call <em>dequeue()</em> followed by <em>dispose()</em>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 */
	inline public function dequeue():T
	{
		D.assert(_size > 0, "queue is empty");
		#if debug
		_t0 = ++_t1;
		#end
		
		var x = __get(_front++);
		if (_front == _capacity) _front = 0;
		_size--;
		
		if (_isResizable && _sizeLevel > 0)
		{
			if (_size == _capacity >> 2)
			{
				_sizeLevel--;
				_pack(_capacity >> 2);
				_front = 0;
				_capacity >>= 2;
			}
		}
		
		return x;
	}
	
	/**
	 * Nullifies the last dequeued element so it can be garbage collected.<br/>
	 * <warn>Use only directly after <em>dequeue()</em>.</warn>
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <em>dispose()</em> wasn't directly called after <em>dequeue()</em>(debug only).
	 */
	inline public function dispose():Void
	{
		#if debug
		D.assert(_t0 == _t1, "dispose() is only allowed directly after dequeue()");
		#end
		
		var NULL:Null<T> = null;
		__set((_front == 0 ? _capacity : _front) - 1, NULL);
	}
	
	/**
	 * For performance reasons the queue does nothing to ensure that empty locations contain null.<br/>
	 * <em>pack()</em> therefore nullifies all obsolete references.
	 * <o>n</o>
	 */
	public function pack():Void
	{
		var i = _front + _size;
		for (j in 0..._capacity - _size)
			__set((j + i) % _capacity, null);
	}
	
	/**
	 * Returns the element at index <code>i</code>.<br/>
	 * The index is measured relative to the index of the front element (= 0).
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function get(i:Int):T
	{
		D.assert(_size > 0, "queue is empty");
		D.assert(i < _size, Sprintf.format("i index out of range (%d)", [i]));
		
		return __get((i + _front) % _capacity);
	}

	/**
	 * Replaces the element at index <code>i</code> with the element <code>x</code>.<br/>
	 * The index is measured relative to the index of the front element (= 0).
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function set(i:Int, x:T):Void
	{
		D.assert(_size > 0, "queue is empty");
		D.assert(i < _size, Sprintf.format("i index out of range (%d)", [i]));
		
		__set((i + _front) % _capacity, x);
	}
	
	/**
	 * Swaps the element at index <code>i</code> with the element at index <code>j</code>.<br/>
	 * The index is measured relative to the index of the front element (= 0).
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function swp(i:Int, j:Int):Void
	{
		D.assert(_size > 0, "queue is empty");
		D.assert(i < _size, Sprintf.format("i index out of range (%d)", [i]));
		D.assert(j < _size, Sprintf.format("j index out of range (%d)", [j]));
		D.assert(i != j, Sprintf.format("i index equals j index (%d)", [i]));
		
		var t = get(i);
		cpy(i, j);
		set(j, t);
	}
	
	/**
	 * Replaces the element at index <code>i</code> with the element from index <code>j</code>.<br/>
	 * The index is measured relative to the index of the front element (= 0).
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError queue is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function cpy(i:Int, j:Int):Void
	{
		D.assert(_size > 0, "queue is empty");
		D.assert(i < _size, Sprintf.format("i index out of range (%d)", [i]));
		D.assert(j < _size, Sprintf.format("j index out of range (%d)", [j]));
		D.assert(i != j, Sprintf.format("i index equals j index (%d)", [i]));
		
		set(i, get(j));
	}
	
	/**
	 * Replaces up to <code>n</code> existing elements with objects of type <code>C</code>.
	 * <o>n</o>
	 * @param C the class to instantiate for each element.
	 * @param args passes additional constructor arguments to the class <code>C</code>.
	 * @param n the number of elements to replace. If 0, <code>n</code> is set to <em>capacity</em>.
	 * @throws de.polygonal.core.util.AssertionError <code>n</code> out of range (debug only).
	 */
	public function assign(C:Class<T>, ?args:Array<Dynamic>, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		var k = n > 0 ? n : capacity;
		D.assert(k <= capacity, Sprintf.format("n out of range (%d)", [n]));
		
		for (i in 0...k)
			__set((i + _front) % _capacity, Instance.create(C, args));
		
		_size = k;
	}
	
	/**
	 * Replaces up to <code>n</code> existing elements with the instance of <code>x</code>.
	 * <o>n</o>
	 * @param n the number of elements to replace. If 0, <code>n</code> is set to <em>capacity</em>.
	 * @throws de.polygonal.core.util.AssertionError <code>n</code> out of range (debug only).
	 */
	public function fill(x:T, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		var k = n > 0 ? n : capacity;
		D.assert(k <= capacity, Sprintf.format("n out of range (%d)", [n]));
		
		for (i in 0...k)
			__set((i + _front) % _capacity, x);
		
		_size = k;
	}
	
	/**
	 * Invokes the <code>process</code> function for each element.<br/>
	 * The function signature is: <em>process(oldValue, index):newValue</em>
	 * <o>n</o>
	 */
	public function walk(process:T->Int->T):Void
	{
		for (i in 0..._capacity)
		{
			var j = (i + _front) % _capacity;
			__set(j, process(__get(j), i));
		}
	}

	/**
	 * Shuffles the elements of this collection by using the Fisher-Yates algorithm.
	 * <o>n</o>
	 * @param rval a list of random double values in the range between 0 (inclusive) to 1 (exclusive) defining the new positions of the elements.
	 * If omitted, random values are generated on-the-fly by calling <em>Math.random()</em>.
	 * @throws de.polygonal.core.util.AssertionError insufficient random values (debug only).
	 */
	public function shuffle(?rval:DA<Float>):Void
	{
		var s = _size;
		if (rval == null)
		{
			var m = Math;
			while (s > 1)
			{
				s--;
				var i = (Std.int(m.random() * s) + _front) % _capacity;
				var t = __get(s);
				__set(s, __get(i));
				__set(i, t);
			}
		}
		else
		{
			D.assert(rval.size() >= _size, "insufficient random values");
			
			var j = 0;
			while (s > 1)
			{
				s--;
				var i = (Std.int(rval.get(j++) * s) + _front) % _capacity;
				var t = __get(s);
				__set(s, __get(i));
				__set(i, t);
			}
		}
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var queue = new de.polygonal.ds.ArrayedQueue&lt;Int&gt;(4);
	 * for (i in 0...queue.capacity) {
	 *     queue.enqueue(i);
	 * }
	 * trace(queue);</pre>
	 * <pre class="console">
	 * {ArrayedQueue, size/capacity: 4/4}
	 * |< front
	 *   0 -> 0
	 *   1 -> 1
	 *   2 -> 2
	 *   3 -> 3
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{ArrayedQueue, size/capacity: %d/%d}", [_size, capacity]);
		if (isEmpty()) return s;
		s += "\n|< front\n";
		for (i in 0..._size)
			s += Sprintf.format("  %4d -> %s\n", [i, Std.string(get(i))]);
		s += ">|";
		return s;
		#else
		return Sprintf.format("{ArrayedQueue, size/capacity: %d/%d}", [_size, capacity]);
		#end
	}
	
	/**
	 * The size of the allocated storage space for the elements.<br/>
	 * If more space is required to accomodate new elements, the <em>capacity</em> is doubled every time <em>size()</em> grows beyond <em>capacity</em>, and split in half when <em>size()</em> is a quarter of <em>capacity</em>.
	 * The <em>capacity</em> never falls below the initial size defined in the constructor.
	 * <o>1</o>
	 */
	public var capacity(_capacityGetter, never):Int;
	inline function _capacityGetter():Int { return _capacity; }
	
	/**
	 * Returns true if this queue is full.
	 * <o>1</o>
	 */
	inline public function isFull():Bool
	{
		return _size == _capacity;
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
		for (i in 0..._capacity) _a[i] = null;
		_a = null;
		_iterator = null;
	}
	
	/**
	 * Returns true if this queue contains the element <code>x</code>. 
	 * <o>n</o>
	 */
	public function contains(x:T):Bool
	{
		for (i in 0..._size)
		{
			if (__get((i + _front) % _capacity) == x)
				return true;
		}
		return false;
	}
	
	/**
	 * Removes and nullifies all occurrences of the element <code>x</code>.
	 * <o>n</o>
	 * @return true if at least one occurrence of <code>x</code> was removed.
	 */
	public function remove(x:T):Bool
	{
		if (isEmpty()) return false;
		
		var NULL:Null<T> = null;
		var s = _size;
		var found = false;
		while (_size > 0)
		{
			found = false;
			for (i in 0..._size)
			{
				if (__get((i + _front) % _capacity) == x)
				{
					found = true;
					__set((i + _front) % _capacity, NULL);
					
					if (i == 0)
					{
						if (++_front == _capacity) _front = 0;
						_size--;
					}
					else
					if (i == _size - 1)
						_size--;
					else
					{
						var i0 = (_front + i);
						var i1 = (_front + _size - 1);
						
						for (j in i0...i1)
							__set(j % _capacity, __get((j + 1) % _capacity));
						__set(i1 % _capacity, NULL);
						
						_size--;
					}
					break;
				}
			}
			
			if (!found) break;
		}
		
		if (_isResizable && _size < s)
		{
			if (_sizeLevel > 0 && _capacity > 2)
			{
				var s = _capacity;
				while (_size <= s >> 2)
				{
					s >>= 2;
					_sizeLevel--;
				}
				
				_pack(s);
				_front = 0;
				_capacity = s;
			}
		}
		
		return _size < s;
	}
	
	/**
	 * Removes all elements.
	 * <o>1 or n if <code>purge</code> is true</o>
	 * @param purge if true, elements are nullified upon removal and <em>capacity</em> is set to the initial <em>capacity</em> defined in the constructor.
	 */
	inline public function clear(purge = false):Void
	{
		if (purge)
		{
			var i = _front;
			var NULL:Null<T> = null;
			for (j in 0..._size) __set(i++ % _capacity, NULL);
			
			if (_isResizable && _sizeLevel > 0)
			{
				_capacity >>= _sizeLevel;
				_sizeLevel = 0;
				_a = ArrayUtil.alloc(_capacity);
			}
		}
		_front = _size = 0;
	}
	
	/**
	 * Returns a new <em>ArrayedQueueIterator</em> object to iterate over all elements contained in this queue.<br/>
	 * Preserves the natural order of a queue (First-In-First-Out).
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<T>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
				_iterator = new ArrayedQueueIterator<T>(this);
			else
				_iterator.reset();
			return _iterator;
		}
		else
			return new ArrayedQueueIterator<T>(this);
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
	 * Returns true if this queue is empty.
	 * <o>1</o>
	 */
	inline public function isEmpty():Bool
	{
		return _size == 0;
	}
	
	/**
	 * Returns an array containing all elements in this queue.<br/>
	 * Preserves the natural order of this queue (First-In-First-Out).
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(_size);
		for (i in 0..._size) a[i] = __get((i + _front) % _capacity);
		return a;
	}
	
	#if flash10
	/**
	 * Returns a Vector.&lt;T&gt; object containing all elements in this queue.<br/>
	 * Preserves the natural order of this queue (First-In-First-Out).
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(_size);
		for (i in 0..._size) a[i] = __get((i + _front) % _capacity);
		return a;
	}
	#end
	
	/**
	 * Returns a dense array containing all elements in this queue.<br/>
	 * Preserves the natural order of this queue (First-In-First-Out).
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(_size);
		for (i in 0..._size) a.pushBack(__get((i + _front) % _capacity));
		return a;
	}
	
	/**
	 * Duplicates this queue. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		var copy = new ArrayedQueue<T>(_capacity, _isResizable, maxSize);
		copy._sizeLevel = _sizeLevel;
		if (_capacity == 0) return copy;
		
		var t = copy._a;
		if (assign)
		{
			for (i in 0..._size)
				t[i] = __get(i);
		}
		else
		if (copier == null)
		{
			var c:Cloneable<T> = null;
			for (i in 0..._size)
			{
				D.assert(Std.is(__get(i), Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [__get(i)]));
				c = untyped __get(i);
				t[i] = c.clone();
			}
		}
		else
		{
			for (i in 0..._size)
				t[i] = copier(__get(i));
		}
		
		copy._front = _front;
		copy._size = _size;
		return copy;
	}
	
	inline function _pack(newSize:Int)
	{
		var tmp:Array<T> = ArrayUtil.alloc(newSize);
		for (i in 0..._size)
		{
			tmp[i] = __get(_front++);
			if (_front == _capacity) _front = 0;
		}
		_a = tmp;
	}
	
	inline function __get(i:Int) return _a[i]
	inline function __set(i:Int, x:T) _a[i] = x
}

#if doc
private
#end
class ArrayedQueueIterator<T> implements de.polygonal.ds.Itr<T>
{
	var _f:ArrayedQueue<T>;
	
	var _a:Array<T>;
	var _front:Int;
	var _capacity:Int;
	var _size:Int;
	var _i:Int;
	
	public function new(f:ArrayedQueue<T>)
	{
		_f = f;
		reset();
	}
	
	inline public function reset():Itr<T>
	{
		_a        = ArrayUtil.copy(__a(_f), new Array<T>());
		_front    = __front(_f);
		_capacity = __size(_f);
		_size     = __count(_f);
		_i        = 0;
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _i < _size;
	}

	inline public function next():T
	{
		return _a[(_i++ + _front) % _capacity];
	}
	
	inline public function remove():Void
	{
		D.assert(_i > 0, 'call next() before removing an element');
		_f.remove(_a[((_i - 1) + _front) % _capacity]);
	}
	
	inline function __a<T>(f:ArrayedQueueFriend<T>) return f._a
	inline function __front<T>(f:ArrayedQueueFriend<T>) return f._front
	inline function __size<T>(f:ArrayedQueueFriend<T>) return f._capacity
	inline function __count<T>(f:ArrayedQueueFriend<T>) return f._size
}