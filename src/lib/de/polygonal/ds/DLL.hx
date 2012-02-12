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

private typedef DLLNodeFriend<T> =
{
	public var next:DLLNode<T>;
	private function _insertAfter(node:DLLNode<T>):Void;
	private function _insertBefore(node:DLLNode<T>):Void;
	private function _unlink():DLLNode<T>;
	private var _list:DLL<T>;
}

/**
 * <p>A doubly linked list.</p>
 * <p>See <a href="http://lab.polygonal.de/2007/08/13/data-structures-example-linked-lists/" target="_blank">http://lab.polygonal.de/2007/08/13/data-structures-example-linked-lists/</a></p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class DLL<T> implements Collection<T>
#if generic
, implements haxe.rtti.Generic
#end
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * The head of this list or null if this list is empty. 
	 */
	public var head(default, null):DLLNode<T>;
	
	/**
	 * The tail of this list or null if this list is empty. 
	 */
	public var tail(default, null):DLLNode<T>;
	
	/**
	 * The maximum allowed size of this list.<br/>
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
	
	var _size:Int;
	var _reservedSize:Int;
	var _poolSize:Int;
	
	var _headPool:DLLNode<T>;
	var _tailPool:DLLNode<T>;
	
	var _circular:Bool;
	var _iterator:Itr<T>;
	
	/**
	 * @param reservedSize if &gt; 0, this list maintains an object pool of node objects.<br/>
	 * Prevents frequent node allocation and thus increases performance at the cost of using more memory.
	 * @param maxSize the maximum allowed size of this list.<br/>
	 * The default value of -1 indicates that there is no upper limit.
	 * @throws de.polygonal.core.util.AssertionError reserved size is greater than allowed size (debug only).
	 */
	public function new(reservedSize = 0, maxSize = -1)
	{
		#if debug
		if (reservedSize > 0)
		{
			if (maxSize != -1)
				D.assert(reservedSize <= maxSize, "reserved size is greater than allowed size");
		}
		this.maxSize = (maxSize == -1) ? Limits.INT32_MAX : maxSize;
		#else
		this.maxSize = -1;
		#end
		
		_reservedSize = reservedSize;
		_size         = 0;
		_poolSize     = 0;
		_circular     = false;
		_iterator     = null;
		
		if (reservedSize > 0)
		{
			var NULL:Null<T> = null;
			_headPool = _tailPool = new DLLNode<T>(NULL, this);
		}
		
		head = tail = null;
		key = HashKey.next();
		reuseIterator = false;
	}
	
	/**
	 * Returns true if this list is circular.<br/>
	 * A list is circular if the tail points to the head and vice versa.
	 * <o>1</o>
	 */
	public function isCircular():Bool
	{
		return _circular;
	}
	
	/**
	 * Makes this list circular by connecting the tail to the head and vice versa.<br/>
	 * Silently fails if this list is already closed.
	 * <o>1</o>
	 */
	public function close():Void
	{
		if (_circular) return;
		_circular = true;
		if (_valid(head))
		{
			tail.next = head;
			head.prev = tail;
		}
	}
	
	/**
	 * Makes this list non-circular by disconnecting the tail from the head and vice versa.<br/>
	 * Silently fails if this list is already non-circular.
	 * <o>1</o>
	 */
	public function open():Void
	{
		if (!_circular) return;
		_circular = false;
		if (_valid(head))
		{
			tail.next = null;
			head.prev = null;
		}
	}
	
	/**
	 * Appends the element <code>x</code> to the tail of this list by creating a <em>DLLNode</em> object storing <code>x</code>.
	 * <o>1</o>
	 * @return the appended node storing <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function append(x:T):DLLNode<T>
	{
		#if debug
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		
		var node = _getNode(x);
		if (_valid(tail))
		{
			tail.next = node;
			node.prev = tail;
		}	
		else
			head = node;
		tail = node;
		
		if (_circular)
		{
			tail.next = head;
			head.prev = tail;
		}
		
		_size++;
		return node;
	}
	
	/**
	 * Prepends the element <code>x</code> to the head of this list by creating a <em>DLLNode</em> object storing <code>x</code>.
	 * <o>1</o>
	 * @return the prepended node storing <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function prepend(x:T):DLLNode<T>
	{
		#if debug
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		
		var node = _getNode(x);
		node.next = head;
		if (_valid(head))
		{
			head.prev = node;
		}
		else
			tail = node;
		head = node;
		
		if (_circular)
		{
			tail.next = head;
			head.prev = tail;
		}
		
		_size++;
		return node;
	}
	
	/**
	 * Inserts the element <code>x</code> after <code>node</code> by creating a <em>DLLNode</em> object storing <code>x</code>.
	 * <o>1</o>
	 * @return the inserted node storing <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError <code>node</code> is null or not managed by this list (debug only).
	 */
	inline public function insertAfter(node:DLLNode<T>, x:T):DLLNode<T>
	{
		#if debug
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		D.assert(_valid(node), "node is null");
		D.assert(node.getList() == this, "node is not managed by this list");
		
		var t = _getNode(x);
		__insertAfter(node, t);
		if (node == tail)
		{
			tail = t;
			if (_circular)
				tail.next = head;
		}
		
		_size++;
		return t;
	}
	
	/**
	 * Inserts the element <code>x</code> before <code>node</code> by creating a <em>DLLNode</em> object storing <code>x</code>.
	 * <o>1</o>
	 * @return the inserted node storing <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError <code>node</code> is null or not managed by this list (debug only).
	 */
	inline public function insertBefore(node:DLLNode<T>, x:T):DLLNode<T>
	{
		#if debug
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		D.assert(_valid(node), "node is null");
		D.assert(node.getList() == this, "node is not managed by this list");
		
		var t = _getNode(x);
		__insertBefore(node, t);
		if (node == head)
		{
			head = t;
			if (_circular)
				head.prev = tail;
		}
		
		_size++;
		return t;
	}
	
	/**
	 * Unlinks <code>node</code> from this list and returns <code>node</code>.<em>next</em>;
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError list is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>node</code> is null or not managed by this list (debug only).
	 */
	public function unlink(node:DLLNode<T>):DLLNode<T>
	{
		D.assert(_valid(node), "node is null");
		D.assert(node.getList() == this, "node is not managed by this list");
		D.assert(_size > 0, "list is empty");
		
		var hook = node.next;
		if (node == head)
		{
			head = head.next;
			if (_circular)
			{
				if (head == tail)
					head = null;
				else
					tail.next = head;
			}
			
			if (head == null) tail = null;
		}
		else
		if (node == tail)
		{
			tail = tail.prev;
			if (_circular)
				head.prev = tail;
				
			if (tail == null) head = null;
		}
		
		__unlink(node);
		_putNode(node);
		_size--;
		
		return hook;
	}
	
	/**
	 * Returns the node at "index" <code>i</code>.<br/>
	 * The index is measured relative to the head node (= index 0).
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError list is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function getNodeAt(i:Int):DLLNode<T>
	{
		D.assert(_size > 0, "list is empty");
		D.assert(i >= 0 || i < _size, Sprintf.format("i index out of range (%d)", [i]));
		
		var node = head;
		for (j in 0...i) node = node.next;
		return node;
	}
	
	/**
	 * Removes the head node and returns the element stored in this node.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError list is empty (debug only).
	 */
	inline public function removeHead():T
	{
		D.assert(_size > 0, "list is empty");
		
		var node = head;
		if (head == tail)
			head = tail = null;
		else
		{
			head = head.next;
			node.next = null;
			
			if (_circular)
			{
				head.prev = tail;
				tail.next = head;
			}
			else
				head.prev = null;
		}
		_size--;
		
		return _putNode(node);
	}
	
	/**
	 * Removes the tail node and returns the element stored in this node.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError list is empty (debug only).
	 */
	inline public function removeTail():T
	{
		D.assert(_size > 0, "list is empty");
		
		var node = tail;
		if (head == tail)
			head = tail = null;
		else
		{
			tail = tail.prev;
			node.prev = null;
			
			if (_circular)
			{
				tail.next = head;
				head.prev = tail;
			}
			else
				tail.next = null;
		}
		
		_size--;
		
		return _putNode(node);
	}
	
	/**
	 * Unlinks the head node and appends it to the tail.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError list is empty (debug only).
	 */
	inline public function shiftUp():Void
	{
		D.assert(_size > 0, "list is empty");
		if (_size > 1)
		{
			var t = head;
			if (head.next == tail)
			{
				head = tail;
				head.prev = null;
				
				tail = t;
				tail.next = null;
				
				head.next = tail;
				tail.prev = head;
			}
			else
			{
				head = head.next;
				head.prev = null;
				
				tail.next = t;
				
				t.next = null;
				t.prev = tail;
				
				tail = t;
			}
			
			if (_circular)
			{
				tail.next = head;
				head.prev = tail;
			}
		}
	}
	
	/**
	 * Unlinks the tail node and prepends it to the head.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError list is empty (debug only).
	 */
	inline public function popDown():Void
	{
		D.assert(_size > 0, "list is empty");
		if (_size > 1)
		{
			var t = tail;
			if (tail.prev == head)
			{
				tail = head;
				tail.next = null;
				
				head = t;
				head.prev = null;
				
				head.next = tail;
				tail.prev = head;
			}
			else
			{
				tail = tail.prev;
				tail.next = null;
				
				head.prev = t;
				
				t.prev = null;
				t.next = head;
				
				head = t;
			}
			
			if (_circular)
			{
				tail.next = head;
				head.prev = tail;
			}
		}
	}
	
	/**
	 * Searches for the element <code>x</code> in this list from head to tail starting at node <code>from</code>.
	 * <o>n</o>
	 * @return the node containing <code>x</code> or null if such a node does not exist.<br/>
	 * If <code>from</code> is null, the search starts at the head of this list.
	 * @throws de.polygonal.core.util.AssertionError <code>from</code> is not managed by this list (debug only).
	 */
	public function nodeOf(x:T, ?from:DLLNode<T>):DLLNode<T>
	{
		#if debug
		if (_valid(from))
			D.assert(from.getList() == this, "node is not managed by this list");
		#end
		
		var node = (from == null) ? head : from;
		if (_circular)
		{
			while (node != tail)
			{
				if (node.val == x) return node;
				node = node.next;
			}
			if (node.val == x) return node;
		}
		else
		{
			while (_valid(node))
			{
				if (node.val == x) return node;
				node = node.next;
			}
		}
		return null;
	}
	
	/**
	 * Searches for the element <code>x</code> in this list from tail to head starting at node <code>from</code>.
	 * <o>n</o>
	 * @return the node containing <code>x</code> or null if such a node does not exist.<br/>
	 * If <code>from</code> is null, the search starts at the tail of this list.
	 * @throws de.polygonal.core.util.AssertionError <code>from</code> is not managed by this list (debug only).
	 */
	public function lastNodeOf(x:T, ?from:DLLNode<T>):DLLNode<T>
	{
		#if debug
		if (_valid(from))
			D.assert(from.getList() == this, "node is not managed by this list");
		#end
		
		var node = (from == null) ? tail : from;
		if (_circular)
		{
			while (node != head)
			{
				if (node.val == x) return node;
				node = node.prev;
			}
			if (node.val == x) return node;
		}
		else
		{
			while (_valid(node))
			{
				if (node.val == x) return node;
				node = node.prev;
			}
		}
		return null;
	}
	
	/**
	 * Sorts the elements of this list using the merge sort algorithm.
	 * <o>n log n for merge sort and n&sup2; for insertion sort</o>
	 * @param compare a comparison function.<br/>
	 * If null, the elements are compared using element.<em>compare()</em>.<br/>
	 * <warn>In this case all elements have to implement <em>Comparable</em>.</warn>
	 * @param useInsertionSort if true, the linked list is sorted using the insertion sort algorithm.
	 * This is faster for nearly sorted lists.
	 * @throws de.polygonal.core.util.AssertionError element does not implement <em>Comparable</em> (debug only).
	 */
	public function sort(compare:T->T->Int, useInsertionSort = false):Void
	{
		if (_size > 1)
		{
			if (_circular)
			{
				tail.next = null;
				head.prev = null;
			}
			
			if (compare == null)
			{
				head = useInsertionSort ? _insertionSortComparable(head) : _mergeSortComparable(head);
			}
			else
			{
				head = useInsertionSort ? _insertionSort(head, compare) : _mergeSort(head, compare);
			}
			
			if (_circular)
			{
				tail.next = head;
				head.prev = tail;
			}
		}
	}
	
	/**
	 * Merges this list with the list <code>x</code> by linking both lists together.<br/>
	 * <warn>The merge operation destroys x so it should be discarded.</warn>
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> is null or this list equals <code>x</code> (debug only).
	 */
	public function merge(x:DLL<T>):Void
	{
		#if debug
		if (maxSize != -1)
			D.assert(size() + x.size() <= maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		D.assert(x != this, "x equals this list");
		D.assert(x != null, "x is null");
		
		if (_valid(x.head))
		{
			var node = x.head;
			for (i in 0...x.size())
			{
				__list(node, this);
				node = node.next;
			}
				
			if (_valid(head))
			{
				tail.next = x.head;
				x.head.prev = tail;
				tail = x.tail;
			}
			else
			{
				head = x.head;
				tail = x.tail;
			}
			
			_size += x.size();
			
			if (_circular)
			{
				tail.next = head;
				head.prev = tail;
			}
		}
	}
	
	/**
	 * Concatenates this list with the list <code>x</code> by appending all elements of <code>x</code> to this list.<br/>
	 * This list and <code>x</code> are untouched.
	 * <o>n</o>
	 * @return a new list containing the elements of both lists.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> is null or this equals <code>x</code> (debug only).
	 */
	public function concat(x:DLL<T>):DLL<T>
	{
		D.assert(x != null, "x is null");
		D.assert(x != this, "x equals this list");
		
		var c = new DLL<T>();
		var k = x.size();
		if (k > 0)
		{
			var node = x.tail;
			var t = c.tail = new DLLNode<T>(node.val, c);
			node = node.prev;
			var i = k - 1;
			while (i-- > 0)
			{
				var copy = new DLLNode<T>(node.val, c);
				copy.next = t;
				t.prev = copy;
				t = copy;
				node = node.prev;
			}
			
			c.head = t;
			c._size = k;
			
			if (_size > 0)
			{
				var node = tail;
				var i = _size;
				while (i-- > 0)
				{
					var copy = new DLLNode<T>(node.val, c);
					copy.next = t;
					t.prev = copy;
					t = copy;
					node = node.prev;
				}
				c.head = t;
				c._size += _size;
			}
		}
		else
		if (_size > 0)
		{
			var node = tail;
			var t = c.tail = new DLLNode<T>(node.val, this);
			node = node.prev;
			var i = _size - 1;
			while (i-- > 0)
			{
				var copy = new DLLNode<T>(node.val, this);
				copy.next = t;
				t.prev = copy;
				t = copy;
				node = node.prev;
			}
			
			c.head = t;
			c._size = _size;
		}
		
		return c;
	}
	
	/**
	 * Reverses the linked list in place.
	 * <o>n</o>
	 */
	public function reverse():Void
	{
		if (_size <= 1)
			return;
		else
		if (_size <= 3)
		{
			var t = head.val;
			head.val = tail.val;
			tail.val = t;
		}
		else
		{
			var head = head;
			var tail = tail;
			for (i in 0..._size >> 1)
			{
				var t = head.val;
				head.val = tail.val;
				tail.val = t;
				
				head = head.next;
				tail = tail.prev;
			}
		}
	}
	
	/**
	 * Converts the data in the linked list to strings, inserts <code>x</code> between the elements, concatenates them, and returns the resulting string.
	 * <o>n</o>
	 */
	public function join(x:String):String
	{
		var s = "";
		if (_size > 0)
		{
			var node = head;
			for (i in 0..._size - 1)
			{
				s += Std.string(node.val) + x;
				node = node.next;
			}
			s += Std.string(node.val);
		}
		return s;
	}
	
	/**
	 * Replaces up to <code>n</code> existing elements with objects of type <code>C</code>.
	 * <o>n</o>
	 * @param C the class to instantiate for each element.
	 * @param args passes additional constructor arguments to <code>C</code>.
	 * @param n the number of elements to replace. If 0, <code>n</code> is set to <em>size()</em>.
	 * @throws de.polygonal.core.util.AssertionError <code>n</code> out of range (debug only).
	 */
	public function assign(C:Class<T>, args:Array<Dynamic> = null, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		if (n > 0)
		{
			#if debug
			if (maxSize != -1)
				D.assert(n <= size(), Sprintf.format("n out of range (%d)", [n]));
			#end
		}
		else
			n = size();
		
		var node = head;
		for (i in 0...n)
		{
			node.val = Instance.create(C, args);
			node = node.next;
		}
	}
	
	/**
	 * Replaces up to <code>n</code> existing elements with the instance of <code>x</code>.
	 * <o>n</o>
	 * @param n the number of elements to replace. If 0, <code>n</code> is set to <em>size()</em>.
	 * @throws de.polygonal.core.util.AssertionError <code>n</code> out of range (debug only).
	 */
	public function fill(x:T, args:Array<Dynamic> = null, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		if (n > 0)
		{
			#if debug
			if (maxSize != -1)
				D.assert(n <= size(), Sprintf.format("n out of range (%d)", [n]));
			#end
		}
		else
			n = size();
		
		var node = head;
		for (i in 0...n)
		{
			node.val = x;
			node = node.next;
		}
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
		var s = _size;
		if (rval == null)
		{
			var m = Math;
			while (s > 1)
			{
				s--;
				var i = Std.int(m.random() * s);
				var node1 = head;
				for (j in 0...s) node1 = node1.next;
				
				var t = node1.val;
				
				var node2 = head;
				for (j in 0...i) node2 = node2.next;
				
				node1.val = node2.val;
				node2.val = t;
			}
		}
		else
		{
			D.assert(rval.size() >= size(), "insufficient random values");
			
			var j = 0;
			while (s > 1)
			{
				s--;
				var i = Std.int(rval.get(j++) * s);
				var node1 = head;
				for (j in 0...s) node1 = node1.next;
				
				var t = node1.val;
				
				var node2 = head;
				for (j in 0...i) node2 = node2.next;
				
				node1.val = node2.val;
				node2.val = t;
			}
		}
		
		if (_circular)
		{
			tail.next = head;
			head.prev = tail;
		}
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var dll = new de.polygonal.ds.DLL&lt;Int&gt;();
	 * for (i in 0...4) {
	 *     dll.append(i);
	 * }
	 * trace(dll);</pre>
	 * <pre class="console">
	 * {DLL, size: 4, circular: false}
 	 * |< head 
	 *   0
	 *   1
	 *   2
	 *   3
	 * tail >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{DLL, size: %d, circular: %s}", [size(), isCircular()]);
		if (isEmpty()) return s;
		s += "\n|< head \n";
		var node = head;
		for (i in 0..._size)
		{
			s += Sprintf.format("  %s\n", [Std.string(node.val)]);
			node = node.next;
		}
		s += " tail >|";
		return s;
		#else
		return Sprintf.format("{DLL, size: %d, circular: %s}", [size(), isCircular()]);
		#end
	}
	
	/*///////////////////////////////////////////////////////
	// collection
	///////////////////////////////////////////////////////*/
	
	/**
	 * Destroys this object by explicitly nullifying all nodes, pointers and data for GC'ing used resources.<br/>
	 * Improves GC efficiency/performance (optional).
	 * <o>n</o>
	 */
	public function free():Void
	{
		var NULL:Null<T> = null;
		var node = head;
		for (i in 0..._size)
		{
			var next = node.next;
			node.next = node.prev = null;
			node.val = NULL;
			node = next;
		}
		head = tail = null;
		
		var node = _headPool;
		while (_valid(node))
		{
			var next = node.next;
			node.next = null;
			node.val = NULL;
			node = next;
		}
		
		_headPool = _tailPool = null;
		_iterator = null;
	}
	
	/**
	 * Returns true if this list contains a node storing the element <code>x</code>.
	 * <o>n</o>
	 */
	public function contains(x:T):Bool
	{
		var node = head;
		for (i in 0..._size)
		{
			if (node.val == x)
				return true;
			node = node.next;
		}
		return false;
	}
	
	/**
	 * Removes all nodes storing the element <code>x</code>.
	 * <o>n</o>
	 * @return true if at least one occurrence of <code>x</code> was removed.
	 */
	public function remove(x:T):Bool
	{
		var s = size();
		if (s == 0) return false;
		
		var node = head;
		while (_valid(node))
		{
			if (node.val == x)
				node = unlink(node);
			else
				node = node.next;
		}
		
		return size() < s;
	}
	
	/**
	 * Removes all elements.
	 * <o>1 or n if <code>purge</code> is true</o>
	 * @param purge if true, nodes, pointers and elements are nullified upon removal.
	 */
	inline public function clear(purge = false):Void
	{
		if (purge || _reservedSize > 0)
		{
			var node = head;
			for (i in 0..._size)
			{
				var next = node.next;
				node.prev = null;
				node.next = null;
				_putNode(node);
				node = next;
			}
		}
		
		head = tail = null;
		_size = 0;
	}
	
	/**
	 * Returns a new <em>DLLIterator</em> object to iterate over all elements contained in this doubly linked list.<br/>
	 * Uses a <em>CircularDLLIterator</em> iterator object if <em>circular</em> is true. 
	 * The elements are visited from head to tail.<br/>
	 * If performance is crucial, use the following loop instead:<br/><br/>
	 * <pre class="prettyprint">
	 * //open list:
	 * var node = myDLL.head;
	 * while (node != null)
	 * {
	 *     var element = node.val;
	 *     node = node.next;
	 * }
	 * 
	 * //circular list:
	 * var node = myDLL.head;
	 * for (i in 0...list.size())
	 * {
	 *     var element = node.val;
	 *     node = node.next;
	 * }
	 * </pre>
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 * 
	 */
	public function iterator():Itr<T>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
			{
				if (_circular)
					return new CircularDLLIterator<T>(this);
				else
					return new DLLIterator<T>(this);
			}
			else
				_iterator.reset();
			return _iterator;
		}
		else
		{
			if (_circular)
				return new CircularDLLIterator<T>(this);
			else
				return new DLLIterator<T>(this);
		}
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
	 * Returns true if this list is empty.
	 * <o>1</o>
	 */
	inline public function isEmpty():Bool
	{
		return _size == 0;
	}
	
	/**
	 * Returns an array containing all elements in this doubly linked list.<br/>
	 * Preserves the natural order of this linked list.
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(size());
		var node = head;
		for (i in 0..._size)
		{
			a[i] = node.val;
			node = node.next;
		}
		return a;
	}
	
	#if flash10
	/**
	 * Returns a vector.&lt;T&gt; objec containing all elements in this doubly linked list.<br/>
	 * Preserves the natural order of this linked list.
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(size());
		var node = head;
		for (i in 0..._size)
		{
			a[i] = node.val;
			node = node.next;
		}
		return a;
	}
	#end
	
	/**
	 * Returns a dense array containing all elements in this doubly linked list.<br/>
	 * Preserves the natural order of this linked list.
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(size());
		var node = head;
		for (i in 0..._size)
		{
			a.pushBack(node.val);
			node = node.next;
		}
		return a;
	}

	/**
	 * Duplicates this linked list. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		if (_size == 0)
		{
			var copy = new DLL<T>(_reservedSize, maxSize);
			if (_circular) copy._circular = true;
			return copy;
		}
		
		var copy = new DLL<T>();
		copy._size = _size;
		
		if (assign)
		{
			var srcNode = head;
			var dstNode = copy.head = new DLLNode<T>(head.val, copy);
			
			if (_size == 1)
			{
				copy.tail = copy.head;
				if (_circular) copy.tail.next = copy.head;
				return copy;
			}
			
			var dstNode0;
			srcNode = srcNode.next;
			for (i in 1..._size - 1)
			{
				dstNode0 = dstNode;
				var srcNode0 = srcNode;
				
				dstNode = dstNode.next = new DLLNode<T>(srcNode.val, copy);
				dstNode.prev = dstNode0;
				
				srcNode0 = srcNode;
				srcNode = srcNode0.next;
			}
			
			dstNode0 = dstNode;
			copy.tail = dstNode.next = new DLLNode<T>(srcNode.val, copy);
			copy.tail.prev = dstNode0;
		}
		else
		if (copier == null)
		{
			var srcNode = head;
			
			D.assert(Std.is(head.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [head.val]));
			var c:Cloneable<T> = untyped head.val;
			var dstNode = copy.head = new DLLNode<T>(c.clone(), copy);
			
			if (_size == 1)
			{
				copy.tail = copy.head;
				if (_circular) copy.tail.next = copy.head;
				return copy;
			}
			
			var dstNode0;
			srcNode = srcNode.next;
			for (i in 1..._size - 1)
			{
				dstNode0 = dstNode;
				var srcNode0 = srcNode;
				
				D.assert(Std.is(srcNode.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [srcNode.val]));
				c = untyped srcNode.val;
				dstNode = dstNode.next = new DLLNode<T>(c.clone(), copy);
				dstNode.prev = dstNode0;
				
				srcNode0 = srcNode;
				srcNode = srcNode0.next;
			}
			
			D.assert(Std.is(srcNode.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [srcNode.val]));
			c = untyped srcNode.val;
			dstNode0 = dstNode;
			copy.tail = dstNode.next = new DLLNode<T>(c.clone(), copy);
			copy.tail.prev = dstNode0;
		}
		else
		{
			var srcNode = head;
			var dstNode = copy.head = new DLLNode<T>(copier(head.val), copy);
			
			if (_size == 1)
			{
				copy.tail = copy.head;
				if (_circular) copy.tail.next = copy.head;
				return copy;
			}
			
			var dstNode0;
			srcNode = srcNode.next;
			for (i in 1..._size - 1)
			{
				dstNode0 = dstNode;
				var srcNode0 = srcNode;
				
				dstNode = dstNode.next = new DLLNode<T>(copier(srcNode.val), copy);
				dstNode.prev = dstNode0;
				
				srcNode0 = srcNode;
				srcNode = srcNode0.next;
			}
			
			dstNode0 = dstNode;
			copy.tail = dstNode.next = new DLLNode<T>(copier(srcNode.val), copy);
			copy.tail.prev = dstNode0;
		}
		
		if (_circular) copy.tail.next = copy.head;
		return copy;
	}
	
	function _mergeSortComparable(node:DLLNode<T>):DLLNode<T>
	{
		var h = node;
		var p, q, e, tail = null;
		var insize = 1;
		var nmerges, psize, qsize, i;
		
		while (true)
		{
			p = h;
			h = tail = null;
			nmerges = 0;
			
			while (_valid(p))
			{
				nmerges++;
				
				psize = 0; q = p;
				for (i in 0...insize)
				{
					psize++;
					q = q.next;
					if (q == null) break;
				}
				
				qsize = insize;
				
				while (psize > 0 || (qsize > 0 && _valid(q)))
				{
					if (psize == 0)
					{
						e = q; q = q.next; qsize--;
					}
					else
					if (qsize == 0 || q == null)
					{
						e = p; p = p.next; psize--;
					}
					else
					{
						D.assert(Std.is(p.val, Comparable), Sprintf.format("element is not of type Comparable (%s)", [p.val]));
						
						if (untyped p.val.compare(q.val) >= 0)
						{
							e = p; p = p.next; psize--;
						}
						else
						{
							e = q; q = q.next; qsize--;
						}
					}
					
					if (_valid(tail))
						tail.next = e;
					else
						h = e;
					
					e.prev = tail;
					tail = e;
				}
				p = q;
			}
			
			tail.next = null;
			if (nmerges <= 1) break;
			insize <<= 1;
		}
		
		h.prev = null;
		this.tail = tail;
		
		return h;
	}
	
	function _mergeSort(node:DLLNode<T>, cmp:T->T->Int):DLLNode<T>
	{
		var h = node;
		var p, q, e, tail = null;
		var insize = 1;
		var nmerges, psize, qsize, i;
		
		while (true)
		{
			p = h;
			h = tail = null;
			nmerges = 0;
			
			while (_valid(p))
			{
				nmerges++;
				
				psize = 0; q = p;
				for (i in 0...insize)
				{
					psize++;
					q = q.next;
					if (q == null) break;
				}
				
				qsize = insize;
				
				while (psize > 0 || (qsize > 0 && _valid(q)))
				{
					if (psize == 0)
					{
						e = q; q = q.next; qsize--;
					}
					else
					if (qsize == 0 || q == null)
					{
						e = p; p = p.next; psize--;
					}
					else
					if (cmp(q.val, p.val) >= 0)
					{
						e = p; p = p.next; psize--;
					}
					else
					{
						e = q; q = q.next; qsize--;
					}
					
					if (_valid(tail))
						tail.next = e;
					else
						h = e;
					
					e.prev = tail;
					tail = e;
				}
				p = q;
			}
			
			tail.next = null;
			if (nmerges <= 1) break;
			insize <<= 1;
		}
		
		h.prev = null;
		this.tail = tail;
		
		return h;
	}
	
	function _insertionSortComparable(node:DLLNode<T>):DLLNode<T>
	{
		var h = node;
		var n = h.next;
		while (_valid(n))
		{
			var m = n.next;
			var p = n.prev;
			var v = n.val;
			
			D.assert(Std.is(p.val, Comparable), Sprintf.format("element is not of type Comparable (%s)", [p.val]));
			
			if (untyped p.val.compare(v) < 0)
			{
				var i = p;
				
				while (i.hasPrev())
				{
					D.assert(Std.is(i.prev.val, Comparable), Sprintf.format("element is not of type Comparable (%s)", [i.prev.val]));
					
					if (untyped i.prev.val.compare(v) < 0)
						i = i.prev;
					else
						break;
				}
				if (_valid(m))
				{
					p.next = m;
					m.prev = p;
				}
				else
				{
					p.next = null;
					tail = p;
				}
				
				if (i == h)
				{
					n.prev = null;
					n.next = i;
					
					i.prev = n;
					h = n;
				}
				else
				{
					n.prev = i.prev;
					i.prev.next = n;
					
					n.next = i;
					i.prev = n;
				}
			}
			n = m;
		}
		
		return h;
	}
	
	function _insertionSort(node:DLLNode<T>, cmp:T->T->Int):DLLNode<T>
	{
		var h = node;
		var n = h.next;
		while (_valid(n))
		{
			var m = n.next;
			var p = n.prev;
			var v = n.val;
			
			if (cmp(v, p.val) < 0)
			{
				var i = p;
				
				while (i.hasPrev())
				{
					if (cmp(v, i.prev.val) < 0)
						i = i.prev;
					else
						break;
				}
				if (_valid(m))
				{
					p.next = m;
					m.prev = p;
				}
				else
				{
					p.next = null;
					tail = p;
				}
				
				if (i == h)
				{
					n.prev = null;
					n.next = i;
					
					i.prev = n;
					h = n;
				}
				else
				{
					n.prev = i.prev;
					i.prev.next = n;
					
					n.next = i;
					i.prev = n;
				}
			}
			n = m;
		}
		
		return h;
	}
	
	inline function _valid(node:DLLNode<T>):Bool
	{
		return node != null;
	}
	
	inline function _getNode(x:T)
	{
		if (_reservedSize == 0 || _poolSize == 0)
			return new DLLNode<T>(x, this);
		else
		{
			var n = _headPool;
			
			D.assert(n.prev == null, "node.prev == null");
			D.assert(_valid(n.next), "node.next != null");
			
			_headPool = _headPool.next;
			_poolSize--;
			
			n.next = null;
			n.val = x;
			return n;
		}
	}
	
	inline function _putNode(x:DLLNode<T>):T
	{
		var val = x.val;
		if (_reservedSize > 0 && _poolSize < _reservedSize)
		{
			_tailPool = _tailPool.next = x;
			var NULL:Null<T> = null;
			x.val = NULL;
			
			D.assert(x.next == null, "x.next == null");
			D.assert(x.prev == null, "x.prev == null");
			
			_poolSize++;
		}
		else
			__list(x, null);
		
		return val;
	}
	
	inline function __insertAfter(f:DLLNodeFriend<T>, x:DLLNode<T>) f._insertAfter(x)
	inline function __insertBefore(f:DLLNodeFriend<T>, x:DLLNode<T>) f._insertBefore(x)
	inline function __unlink(f:DLLNodeFriend<T>) f._unlink()
	inline function __list(f:DLLNodeFriend<T>, x:DLL<T>) f._list = x
}

#if doc
private
#end
class DLLIterator<T> implements de.polygonal.ds.Itr<T>
#if generic
, implements haxe.rtti.Generic
#end
{
	var _f:DLL<T>;
	var _walker:DLLNode<T>;
	var _hook:DLLNode<T>;
	
	public function new(f:DLL<T>)
	{
		_f = f;
		reset();
	}
	
	inline public function reset():Itr<T>
	{
		_walker = _f.head;
		_hook = null;
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _walker != null;
	}

	inline public function next():T
	{
		var x = _walker.val;
		_hook = _walker;
		_walker = _walker.next;
		return x;
	}
	
	inline public function remove():Void
	{
		D.assert(_hook != null, 'call next() before removing an element');
		_f.unlink(_hook);
	}
}

#if doc
private
#end
class CircularDLLIterator<T> implements de.polygonal.ds.Itr<T>
#if generic
, implements haxe.rtti.Generic
#end
{
	var _f:DLL<T>;
	var _walker:DLLNode<T>;
	var _i:Int;
	var _s:Int;
	var _hook:DLLNode<T>;
	
	public function new(f:DLL<T>)
	{
		_f = f;
		reset();
	}
	
	inline public function reset():Itr<T>
	{
		_walker = _f.head;
		_s = _f.size();
		_i = 0;
		_hook = null;
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _i < _s;
	}

	inline public function next():T
	{
		var x = _walker.val;
		_hook = _walker;
		_walker = _walker.next;
		_i++;
		return x;
	}
	
	inline public function remove():Void
	{
		D.assert(_i > 0, 'call next() before removing an element');
		_f.unlink(_hook);
		_i--;
		_s--;
	}
}