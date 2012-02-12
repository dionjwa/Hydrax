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

private typedef LinkedStackFriend<T> =
{
	private var _head:LinkedStackNode<T>;
	private function _removeNode(x:LinkedStackNode<T>):Void;
}

/**
 * <p>A stack based on a linked list.</p>
 * <p>A stack is a linear list for which all insertions and deletions (and usually all accesses) are made at one end of the list.</p>
 * <p>This is called a FIFO structure (First In, First Out).</p>
 * <p>See <a href="http://lab.polygonal.de/2007/05/23/data-structures-example-the-queue-class/" target="_blank">http://lab.polygonal.de/2007/05/23/data-structures-example-the-queue-class/</a></p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class LinkedStack<T> implements Stack<T>
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * The maximum allowed size of this stack.<br/>
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
	
	var _head:LinkedStackNode<T>;
	
	var _top:Int;
	var _reservedSize:Int;
	var _poolSize:Int;
	
	var _headPool:LinkedStackNode<T>;
	var _tailPool:LinkedStackNode<T>;
	
	var _iterator:LinkedStackIterator<T>;
	
	/**
	 * @param reservedSize if &gt; 0, this stack maintains an object pool of node objects.<br/>
	 * Prevents frequent node allocation and thus increases performance at the cost of using more memory.
	 * @param maxSize the maximum allowed size of the stack.<br/>
	 * The default value of -1 indicates that there is no upper limit.
	 * @throws de.polygonal.core.util.AssertionError reserved size is greater than allowed size (debug only).
	 */
	public function new(reservedSize = 0, maxSize = -1)
	{
		if (reservedSize > 0)
		{
			if (maxSize != -1)
				D.assert(reservedSize <= maxSize, "reserved size is greater than allowed size");
		}
		#if debug
		this.maxSize = (maxSize == -1) ? Limits.INT32_MAX : maxSize;
		#else
		this.maxSize = -1;
		#end
		
		_reservedSize = reservedSize;
		_top          = 0;
		_poolSize     = 0;
		_head         = null;
		_iterator     = null;
		
		if (reservedSize > 0)
		{
			var NULL:Null<T> = null;
			_headPool = _tailPool = new LinkedStackNode<T>(NULL);
		}
		else
		{
			_headPool = null;
			_tailPool = null;
		}
		
		key = HashKey.next();
		reuseIterator = false;
	}
	
	/**
	 * Returns the top element of this stack.<br/>
	 * This is the "newest" element.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError stack is empty (debug only).
	 */
	inline public function top():T
	{
		D.assert(_top > 0, "stack is empty");
		return _head.val;
	}
	
	/**
	 * Pushes the element <code>x</code> onto the stack.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function push(x:T):Void
	{
		#if debug
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		
		var node = _getNode(x);
		node.next = _head;
		_head = node;
		_top++;
	}
	
	/**
	 * Pops data off the stack.
	 * <o>1</o>
	 * @return the top element.
	 * @throws de.polygonal.core.util.AssertionError stack is empty (debug only).
	 */
	inline public function pop():T
	{
		D.assert(_top > 0, "stack is empty");
		
		_top--;
		var node = _head;
		_head = _head.next;
		
		return _putNode(node);
	}
	
	/**
	 * Pops the top element of the stack, and pushes it back twice, so that an additional copy of the former top item is now on top, with the original below it.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError stack is empty (debug only).
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> equals <em>maxSize</em> (debug only).
	 */
	inline public function dup():Void
	{
		D.assert(_top > 0, "stack is empty");
		#if debug
		if (maxSize != -1)
			D.assert(size() < maxSize, Sprintf.format("size equals max size (%d)", [maxSize]));
		#end
		
		var node = _getNode(_head.val);
		node.next = _head;
		_head = node;
		_top++;
	}
	
	/**
	 * Swaps the two topmost items on the stack.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> < 2 (debug only).
	 */
	inline public function exchange():Void
	{
		D.assert(_top > 1, "size() < 2");
		
		var tmp = _head.val;
		_head.val = _head.next.val;
		_head.next.val = tmp;
	}
	
	/**
	 * Moves the <code>n</code> topmost elements on the stack in a rotating fashion.<br/>
	 * Example:
	 * <pre>
	 * top
	 * |3|               |0|
	 * |2|  rotate right |3|
	 * |1|      -->      |2|
	 * |0|               |1|</pre>
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> >= <code>n</code> (debug only).
	 */
	inline public function rotRight(n:Int):Void
	{
		D.assert(_top >= n, "size() < n");
		
		var node = _head;
		for (i in 0...n - 2)
			node = node.next;
		
		var bot = node.next;
		node.next = bot.next;
		
		bot.next = _head;
		_head = bot;
	}
	
	/**
	 * Moves the <code>n</code> topmost elements on the stack in a rotating fashion.<br/>
	 * Example:
	 * <pre>
	 * top
	 * |3|              |2|
	 * |2|  rotate left |1|
	 * |1|      -->     |0|
	 * |0|              |3|</pre>
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <em>size()</em> >= <code>n</code> (debug only).
	 */
	inline public function rotLeft(n:Int):Void
	{
		D.assert(_top >= n, "size() < n");
		
		var top = _head;
		_head = _head.next;
		
		var node = _head;
		for (i in 0...n - 2)
			node = node.next;
		
		top.next = node.next;
		node.next = top;
	}
	
	/**
	 * Returns the element stored at index <code>i</code>.<br/>
	 * An index of 0 indicates the bottommost element.<br/>
	 * An index of <em>size()</em> - 1 indicates the topmost element.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError stack is empty or index out of range (debug only).
	 */
	inline public function get(i:Int):T
	{
		D.assert(_top > 0, "stack is empty");
		D.assert(i >= 0 && i < _top, Sprintf.format("i index out of range (%d)", [i]));
		
		var node = _head;
		i = size() - i;
		while (--i > 0) node = node.next;
		return node.val;
	}
	
	/**
	 * Replaces the element at index <code>i</code> with the element <code>x</code>.<br/>
	 * An index of 0 indicates the bottommost element.<br/>
	 * An index of <em>size()</em> - 1 indicates the topmost element.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError stack is empty or index out of range (debug only).
	 */
	inline public function set(i:Int, x:T):Void
	{
		D.assert(_top > 0, "stack is empty");
		D.assert(i >= 0 && i < _top, Sprintf.format("i index out of range (%d)", [i]));
		
		var node = _head;
		i = size() - i;
		while (--i > 0) node = node.next;
		node.val = x;
	}
	
	/**
	 * Swaps the element stored at <code>i</code> with the element stored at index <code>j</code>.<br/>
	 * An index of 0 indicates the bottommost element.<br/>
	 * An index of <em>size()</em> - 1 indicates the topmost element.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError stack is empty. (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function swp(i:Int, j:Int):Void
	{
		D.assert(_top > 0, "stack is empty");
		D.assert(i >= 0 && i < _top, Sprintf.format("i index out of range (%d)", [i]));
		D.assert(j >= 0 && j < _top, Sprintf.format("j index out of range (%d)", [j]));
		D.assert(i != j, Sprintf.format("i index equals j index (%d)", [i]));
		
		var node = _head;
		
		if (i < j)
		{
			i ^= j;
			j ^= i;
			i ^= j;
		}
		
		var k = _top - 1;
		while (k > i)
		{
			node = node.next;
			k--;
		}
		var a = node;
		while (k > j)
		{
			node = node.next;
			k--;
		}
		var tmp = a.val;
		a.val = node.val;
		node.val = tmp;
	}
	
	/**
	 * Overwrites the element at index <code>i</code> with the element from index <code>j</code>.<br/>
	 * An index of 0 indicates the bottommost element.<br/>
	 * An index of <em>size()</em> - 1 indicates the topmost element.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError stack is empty. (debug only).
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function cpy(i:Int, j:Int):Void
	{
		D.assert(_top > 0, "stack is empty");
		D.assert(i >= 0 && i < _top, Sprintf.format("i index out of range (%d)", [i]));
		D.assert(j >= 0 && j < _top, Sprintf.format("j index out of range (%d)", [j]));
		D.assert(i != j, Sprintf.format("i index equals j index (%d)", [i]));
		
		var node = _head;
		
		if (i < j)
		{
			i ^= j;
			j ^= i;
			i ^= j;
		}
		
		var k = _top - 1;
		while (k > i)
		{
			node = node.next;
			k--;
		}
		var val = node.val;
		while (k > j)
		{
			node = node.next;
			k--;
		}
		node.val = val;
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
			#if debug
			if (maxSize != -1)
				D.assert(n <= maxSize, Sprintf.format("n out of range (%d)", [n]));
			#end
		}
		else
			n = size();
		
		var node = _head;
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
	public function fill(x:T, n = 0):Void
	{
		D.assert(n >= 0, "n >= 0");
		
		if (n > 0)
		{
			#if debug
			if (maxSize != -1)
				D.assert(n <= maxSize, Sprintf.format("n out of range (%d)", [n]));
			#end
		}
		else
			n = size();
		
		var node = _head;
		for (i in 0...n)
		{
			node.val = x;
			node = node.next;
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
		var s = _top;
		
		if (rval == null)
		{
			var m = Math;
			while (s > 1)
			{
				s--;
				var i = Std.int(m.random() * s);
				var node1 = _head;
				for (j in 0...s) node1 = node1.next;
				
				var t = node1.val;
				
				var node2 = _head;
				for (j in 0...i) node2 = node2.next;
				
				node1.val = node2.val;
				node2.val = t;
			}
		}
		else
		{
			D.assert(rval.size() >= size(), "insufficient random values");
			
			var k = 0;
			while (s > 1)
			{
				s--;
				var i = Std.int(rval.get(k++) * s);
				var node1 = _head;
				for (j in 0...s) node1 = node1.next;
				
				var t = node1.val;
				
				var node2 = _head;
				for (j in 0...i) node2 = node2.next;
				
				node1.val = node2.val;
				node2.val = t;
			}
		}
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var ls = new de.polygonal.ds.LinkedStack&lt;Int&gt;();
	 * ls.push(0);
	 * ls.push(1);
	 * ls.push(2);
	 * trace(ls);</pre>
	 * <pre class="console">
	 * {LinkedStack size: 3}
	 * |< top
	 *     0 -> 2
	 *     1 -> 1
	 *     2 -> 0
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{LinkedStack size: %d}", [size()]);
		if (isEmpty()) return s;
		s += "\n|< top\n";
		var node = _head;
		var i = _top - 1;
		while (i >= 0)
		{
			s += Sprintf.format("  %d -> %s\n", [i--, Std.string(node.val)]);
			node = node.next;
		}
		s += ">|";
		return s;
		#else
		return Sprintf.format("{LinkedStack size: %d}", [size()]);
		#end
	}
	
	/*///////////////////////////////////////////////////////
	// collection
	///////////////////////////////////////////////////////*/
	
	/**
	 * Destroys this object by explicitly nullifying all nodes, pointers and elements.<br/>
	 * Improves GC efficiency/performance (optional).
	 * <o>n</o>
	 */
	public function free():Void
	{
		var NULL:Null<T> = null;
		var node = _head;
		while (node != null)
		{
			var next = node.next;
			node.next = null;
			node.val = NULL;
			node = next;
		}
		
		_head = null;
		
		var node = _headPool;
		while (node != null)
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
	 * Returns true if this stack contains the element <code>x</code>.
	 * <o>n</o>
	 */
	public function contains(x:T):Bool
	{
		var node = _head;
		while (node != null)
		{
			if (node.val == x)
				return true;
			node = node.next;
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
		
		var found = false;
		var node0 = _head;
		var node1 = _head.next;
		
		var NULL:Null<T> = null;
		
		while (node1 != null)
		{
			if (node1.val == x)
			{
				found = true;
				var node2 = node1.next;
				node0.next = node2;
				_putNode(node1);
				node1 = node2;
				_top--;
			}
			else
			{
				node0 = node1;
				node1 = node1.next;
			}
		}
		
		if (_head.val == x)
		{
			found = true;
			var head1 = _head.next;
			_putNode(_head);
			_head = head1;
			_top--;
		}
		
		return found;
	}
	
	/**
	 * Removes all elements.
	 * <o>1 or n if <code>purge</code> is true</o>
	 * @param purge if true, elements are nullified upon removal.
	 */
	public function clear(purge = false):Void
	{
		if (_top == 0) return;
		
		if (purge || _reservedSize > 0)
		{
			var node = _head;
			while (node != null)
			{
				var next = node.next;
				_putNode(node);
				node = next;
			}
		}
		
		_head.next = null;
		_head.val = null;
		_top = 0;
	}

	/**
	 * Returns a new <em>LinkedStackIterator</em> object to iterate over all elements contained in this stack.<br/>
	 * Preserves the natural order of the stack (First-In-Last-Out).
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<T>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
				return new LinkedStackIterator<T>(this);
			else
				_iterator.reset();
			return _iterator;
		}
		else
			return new LinkedStackIterator<T>(this);
	}

	/**
	 * Returns true if this stack is empty.
	 * <o>1</o>
	 */
	inline public function isEmpty():Bool
	{
		return _top == 0;
	}
	
	/**
	 * The total number of elements.
	 * <o>1</o>
	 */
	inline public function size():Int
	{
		return _top;
	}
	
	/**
	 * Returns an array containing all elements in this stack.<br/>
	 * Preserves the natural order of this stack (First-In-Last-Out).
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(size());
		ArrayUtil.fill(a, null, size());
		var node = _head;
		for (i in 0..._top)
		{
			a[_top - i - 1] = node.val;
			node = node.next;
		}
		return a;
	}
	
	#if flash10
	/**
	 * Returns a Vector.&lt;T&gt; object containing all elements in this stack.<br/>
	 * Preserves the natural order of this stack (First-In-Last-Out).
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(size());
		var node = _head;
		for (i in 0..._top)
		{
			a[_top - i - 1] = node.val;
			node = node.next;
		}
		return a;
	}
	#end

	/**
	 * Returns a dense array containing all elements in this stack.<br/>
	 * Preserves the natural order of this stack (First-In-Last-Out).
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(size());
		a.fill(null, size());
		
		var tmp = new Array<T>();
		var node = _head;
		for (i in 0..._top)
		{
			a.set(_top - i - 1, node.val);
			node = node.next;
		}
		return a;
	}
	
	/**
	 * Duplicates this stack. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		var copy = new LinkedStack<T>(_reservedSize, maxSize);
		if (_top == 0) return copy;
		
		var copy = new LinkedStack<T>(_reservedSize, maxSize);
		copy._top = _top;
		
		if (assign)
		{
			var srcNode = _head;
			var dstNode = copy._head = new LinkedStackNode<T>(srcNode.val);
			
			srcNode = srcNode.next;
			while (srcNode != null)
			{
				dstNode = dstNode.next = new LinkedStackNode<T>(srcNode.val);
				srcNode = srcNode.next;
			}
		}
		else
		if (copier == null)
		{
			var srcNode = _head;
			
			D.assert(Std.is(srcNode.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [srcNode.val]));
			var c:Cloneable<T> = untyped srcNode.val;
			var dstNode = copy._head = new LinkedStackNode<T>(c.clone());
			
			srcNode = srcNode.next;
			while (srcNode != null)
			{
				D.assert(Std.is(srcNode.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [srcNode.val]));
				c = untyped srcNode.val;
				
				dstNode = dstNode.next = new LinkedStackNode<T>(c.clone());
				srcNode = srcNode.next;
			}
		}
		else
		{
			var srcNode = _head;
			var dstNode = copy._head = new LinkedStackNode<T>(copier(srcNode.val));
			
			srcNode = srcNode.next;
			while (srcNode != null)
			{
				dstNode = dstNode.next = new LinkedStackNode<T>(copier(srcNode.val));
				srcNode = srcNode.next;
			}
		}
		
		return copy;
	}
	
	inline function _getNode(x:T)
	{
		if (_reservedSize == 0 || _poolSize == 0)
			return new LinkedStackNode<T>(x);
		else
		{
			var n = _headPool;
			_headPool = _headPool.next;
			_poolSize--;
			
			n.val = x;
			return n;
		}
	}
	
	inline function _putNode(x:LinkedStackNode<T>):T
	{
		var val = x.val;
		
		if (_reservedSize > 0 && _poolSize < _reservedSize)
		{
			_tailPool = _tailPool.next = x;
			var NULL:Null<T> = null;
			x.next = null;
			x.val = NULL;
			_poolSize++;
		}
		return val;
	}
	
	inline function _removeNode(x:LinkedStackNode<T>)
	{
		var n = _head;
		if (x == n)
			_head = x.next;
		else
		{
			while (n.next != x) n = n.next;
			n.next = x.next;
		}
		
		_putNode(x);
		_top--;
	}
}

#if doc
private
#end
class LinkedStackNode<T>
#if generic
implements haxe.rtti.Generic
#end
{
	public var val:T;
	public var next:LinkedStackNode<T>;
	
	public function new(x:T)
	{
		val = x;
	}
	
	public function toString():String
	{
		return Std.string(val);
	}
}

#if doc
private
#end
class LinkedStackIterator<T> implements de.polygonal.ds.Itr<T>
#if generic
, implements haxe.rtti.Generic
#end
{
	var _f:LinkedStack<T>;
	var _walker:LinkedStackNode<T>;
	var _hook:LinkedStackNode<T>;

	public function new(f:LinkedStack<T>)
	{
		_f = f;
		reset();
	}

	inline public function reset():Itr<T>
	{
		_walker = __head(_f);
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
		
		#if flash
		__remove(_f, _hook);
		#else
		var f:LinkedStackFriend<T> = _f;
		f._removeNode(_hook);
		#end
	}
	
	inline function __head(f:LinkedStackFriend<T>) return f._head
	
	#if flash
	inline function __remove(f:LinkedStackFriend<T>, x:LinkedStackNode<T>) return f._removeNode(x)
	#end
}