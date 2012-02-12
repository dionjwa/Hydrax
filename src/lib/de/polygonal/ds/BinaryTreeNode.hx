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
import de.polygonal.core.util.Assert;

using de.polygonal.core.math.Mathematics;

/**
 * <p>A binary tree.</p>
 * <p>A tree data structure in which each node has at most two child nodes.</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class BinaryTreeNode<T> implements Collection<T>
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
	 * The node's data.
	 */
	public var val:T;
	
	/**
	 * The parent node or null if this node has no parent.
	 */
	public var p:BinaryTreeNode<T>;
	
	/**
	 * The left child node or null if this node has no left child.
	 */
	public var l:BinaryTreeNode<T>;
	
	/**
	 * The right child node or null if this node has no right child.
	 */
	public var r:BinaryTreeNode<T>;
	
	var _timestamp:Int;
	
	#if debug
	var _busy:Bool;
	#end
	
	/**
	 * Creates a new <em>BinaryTreeNode</em> object storing the element <code>x</code>.
	 */
	public function new(x:T)
	{
		this.val = x;
		p = l = r = null;
		
		#if debug
		_busy = false;
		#end
		
		_timestamp = 0;
		key = HashKey.next();
	}
	
	/**
	 * Performs a recursive preorder traversal.<br/>
	 * A preorder traversal performs the following steps:<br/>
	 * <ul>
	 * <li>Visit the node.</li>
	 * <li>Traverse the left subtree of the node.</li>
	 * <li>Traverse the right subtree of the node.</li>
	 * </ul>
	 * <o>n</o>
	 * @param process a function that is invoked on every traversed node.<br/>
	 * If omitted, element.<em>visit()</em> is used instead. <warn>In this case all elements have to implement <em>Visitable</em>.</warn><br/>
	 * The first argument holds a reference to the current node, while the second argument stores custom data specified by the userData parameter (default is null).<br/>
	 * Once <code>process</code> returns false, the traversal stops immediately and no further nodes are examined.<br/>
	 * @param iterative if true, an iterative traversal is used (default traversal style is recursive).
	 * @param userData custom data that is passed to every visited node via <code>process</code> or element.<em>visit()</em>. If omitted, null is used.
	 */
	public function preorder(?process:BinaryTreeNode<T>->Dynamic->Bool, iterative = false, ?userData:Dynamic):Void
	{
		if (iterative == false)
		{
			if (process == null)
			{
				var v:Visitable = untyped val;
				var run = v.visit(false, userData);
				if (run && hasL()) run = _preorderRecursiveVisitable(l, userData);
				if (run && hasR()) _preorderRecursiveVisitable(r, userData);
			}
			else
			{
				var run = process(this, userData);
				if (run && hasL()) run = _preorderRecursive(l, process, userData);
				if (run && hasR()) _preorderRecursive(r, process, userData);
			}
		}
		else
		{
			var stack = new Array<BinaryTreeNode<T>>();
			
			var top = 0;
			stack[top++] = this;
			
			if (process == null)
			{
				while (top != 0)
				{
					var node = stack[--top];
					var v:Visitable = untyped node.val;
					if (!v.visit(false, userData))
						return;
					if (node.hasR())
						stack[top++] = node.r;
					if (node.hasL())
						stack[top++] = node.l;
				}
			}
			else
			{
				while (top != 0)
				{
					var node = stack[--top];
					if (!process(node, userData))
						return;
					if (node.hasR())
						stack[top++] = node.r;
					if (node.hasL())
						stack[top++] = node.l;
				}
			}
		}
	}
	
	/**
	 * Performs a recursive inorder traversal.<br/>
	 * An inorder traversal performs the following steps:<br/>
	 * <ul>
	 * <li>Traverse the left subtree of the node.</li>
	 * <li>Visit the node.</li>
	 * <li>Traverse the right subtree of the node.</li>
	 * </ul>
	 * <o>n</o>
	 * @param process a function that is invoked on every traversed node.<br/>
	 * If omitted, element.<em>visit()</em> is used instead. <warn>In this case all elements have to implement <em>Visitable</em>.</warn><br/>
	 * The first argument holds a reference to the current node, while the second argument stores custom data specified by the userData parameter (default is null).<br/>
	 * Once <code>process</code> returns false, the traversal stops immediately and no further nodes are examined.<br/>
	 * @param iterative if true, an iterative traversal is used (default traversal style is recursive).
	 * @param userData custom data that is passed to every visited node via <code>process</code> or element.<em>visit()</em>. If omitted, null is used.
	 */
	public function inorder(?process:BinaryTreeNode<T>->Dynamic->Bool, iterative = false, ?userData:Dynamic):Void
	{
		if (iterative == false)
		{
			if (process == null)
			{
				if (hasL())
					if (!_inorderRecursiveVisitable(l, userData))
						return;
				
				var v:Visitable = untyped val;
				if (!v.visit(false, userData)) return;
				if (hasR())
					_inorderRecursiveVisitable(r, userData);
			}
			else
			{
				if (hasL())
					if (!_inorderRecursive(l, process, userData))
						return;
				if (!process(this, userData)) return;
				if (hasR())
					_inorderRecursive(r, process, userData);
			}
		}
		else
		{
			var stack = new Array<BinaryTreeNode<T>>();
			
			var top = 0;
			var node = this;
			
			if (process == null)
			{
				while (node != null)
				{
					while (node != null)
					{
						if (node.r != null)
							stack[top++] = node.r;
						stack[top++] = node;
						node = node.l;
					}
					
					node = stack[--top];
					while (top != 0 && node.r == null)
					{
						var v:Visitable = untyped node.val;
						if (!v.visit(false, userData))
							return;
						node = stack[--top];
					}
					
					var v:Visitable = untyped node.val;
					if (!v.visit(false, userData))
						return;
					node = (top != 0) ? stack[--top] : null;
				}
			}
			else
			{
				while (node != null)
				{
					while (node != null)
					{
						if (node.r != null)
							stack[top++] = node.r;
						stack[top++] = node;
						node = node.l;
					}
					
					node = stack[--top];
					while (top != 0 && node.r == null)
					{
						if (!process(node, userData))
							return;
						node = stack[--top];
					}
					
					if (!process(node, userData))
						return;
					node = (top != 0) ? stack[--top] : null;
				}
			}
		}
	}
	
	/**
	 * Performs a recursive postorder traversal.<br/>
	 * A postorder traversal performs the following steps:<br/>
	 * <ul>
	 * <li>Traverse the left subtree of the node.</li>
	 * <li>Traverse the right subtree of the node.</li>
	 * <li>Visit the node.</li>
	 * </ul>
	 * <o>n</o>
	 * @param process a function that is invoked on every traversed node.<br/>
	 * If omitted, element.<em>visit()</em> is used instead. <warn>In this case all elements have to implement <em>Visitable</em>.</warn><br/>
	 * The first argument holds a reference to the current node, while the second argument stores custom data specified by the userData parameter (default is null).<br/>
	 * Once <code>process</code> returns false, the traversal stops immediately and no further nodes are examined.<br/>
	 * @param iterative if true, an iterative traversal is used (default traversal style is recursive).
	 * @param userData custom data that is passed to every visited node via <code>process</code> or element.<em>visit()</em>. If omitted, null is used.
	 */
	public function postorder(?process:BinaryTreeNode<T>->Dynamic->Bool, iterative = false, ?userData:Dynamic):Void
	{
		if (iterative == false)
		{
			if (process == null)
			{
				if (hasL())
					if (!_postorderRecursiveVisitable(l, userData))
						return;
				if (hasR())
					if (!_postorderRecursiveVisitable(r, userData))
						return;
				
				var v:Visitable = untyped val;
				v.visit(false, userData);
			}
			else
			{
				if (hasL())
					if (!_postorderRecursive(l, process, userData))
						return;
				if (hasR())
					if (!_postorderRecursive(r, process, userData))
						return;
				process(this, userData);
			}
		}
		else
		{
			#if debug
			D.assert(_busy == false, "recursive call to iterative postorder");
			_busy = true;
			#end
			
			var time = _timestamp + 1;
			var stack = new Array<BinaryTreeNode<T>>();
			
			var top = 0;
			stack[top++] = this;
			
			if (process == null)
			{
				var v:Visitable = null;
				while (top != 0)
				{
					var node = stack[top - 1];
					if ((node.l != null) && (node.l._timestamp < time))
						stack[top++] = node.l;
					else
					{
						if ((node.r != null) && (node.r._timestamp < time))
							stack[top++] = node.r;
						else
						{
							v = untyped node.val;
							if (!v.visit(false, userData))
							{
								#if debug
								_busy = false;
								#end
								return;
							}
							node._timestamp++;
							top--;
						}
					}
				}
			}
			else
			{
				while (top != 0)
				{
					var node = stack[top - 1];
					if ((node.l != null) && (node.l._timestamp < time))
						stack[top++] = node.l;
					else
					{
						if ((node.r != null) && (node.r._timestamp < time))
							stack[top++] = node.r;
						else
						{
							if (!process(node, userData))
							{
								#if debug
								_busy = false;
								#end
								return;
							}
							node._timestamp++;
							top--;
						}
					}
				}
			}
			
			#if debug
			_busy = false;
			#end
		}
	}
	
	/**
	 * Returns true if this node has a left child node.
	 * <o>1</o>
	 */
	inline public function hasL():Bool
	{
		return l != null;
	}

	/**
	 * Adds a left child node storing the element <code>x</code>.<br/>
	 * If a left child exists, only the element is updated to <code>x</code>.
	 * <o>1</o>
	 */
	inline public function setL(x:T):Void
	{
		if (l == null)
		{
			l = new BinaryTreeNode<T>(x);
			l.p = this;
		}
		else
			l.val = x;
	}

	/**
	 * Returns true if this node has a right child node.
	 * <o>1</o>
	 */
	inline public function hasR():Bool
	{
		return r != null;
	}

	/**
	 * Adds a right child node storing the element <code>x</code>.<br/>
	 * If a right child exists, only the element is updated to <code>x</code>.
	 * <o>1</o>
	 */
	inline public function setR(x:T):Void
	{
		if (r == null)
		{
			r = new BinaryTreeNode<T>(x);
			r.p = this;
		}
		else
			r.val = x;
	}
	
	/**
	 * Returns true if this node is a left child as seen from its parent node.
	 * <o>1</o>
	 */
	inline public function isL():Bool
	{
		if (p == null)
			return false;
		else
			return p.l == this;
	}

	/**
	 * Returns true if this node is a right child as seen from its parent node.
	 * <o>1</o>
	 */
	inline public function isR():Bool
	{
		if (p == null)
			return false;
		else
			return p.r == this;
	}
	
	/**
	 * Returns true if this node is a root node (<em>p</em> is null).
	 * <o>1</o>
	 */
	inline public function isRoot():Bool
	{
		return p == null;
	}
	
	/**
	 * Calculates the depth of this node.<br/>
	 * The depth is defined as the length of the path from the root node to this node.<br/>
	 * The root node is at depth 0.
	 * <o>n</o>
	 */
	inline public function depth():Int
	{
		var node = p;
		var c = 0;
		while (node != null)
		{
			node = node.p;
			c++;
		}
		return c;
	}
	
	/**
	 * Computes the height of this sub tree.<br/>
	 * The height is defined as the path from the root node to the deepest node in a tree.<br/>
	 * A tree with only a root node has a height of one.
	 * <o>n</o>
	 */
	public function height():Int
	{
		return 1 + (l != null ? l.height() : 0).max(r != null ? r.height() : 0);
	}
	
	/**
	 * Disconnects this node from this sub tree.
	 * <o>1</o>
	 */
	inline public function unlink():Void
	{
		if (p != null)
		{
			if (isL()) p.l = null;
			else
			if (isR()) p.r = null;
			p = null;
		}
		l = r = null;
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var root = new de.polygonal.ds.BinaryTreeNode&lt;Int&gt;(0);
	 * root.setL(1);
	 * root.setR(2);
	 * root.l.setL(3);
	 * root.l.l.setR(4);
	 * trace(root);</pre>
	 * <pre class="console">
	 * {BinaryTreeNode, val: 0 size: 4, node depth: 0, tree height: 3}
	 * |<
	 *   0
	 *   L---1
	 *   |   L---3
	 *   |   |   R---4
	 *   R---2
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{BinaryTreeNode, val: %s size: %d, node depth: %d, tree height: %d}", [Std.string(val), size(), depth(), height()]);
		if (size() == 1) return s;
		s += "\n\n|<\n";
		var f = function(node:BinaryTreeNode<T>, userData:Dynamic):Bool
		{
			var d = node.depth();
			var t = "";
			for (i in 0...d)
			{
				if (i == d - 1)
					t += (node.isL() ? "L" : "R") + "---";
				else
					t += "|   ";
			}
			
			t = "  " + t;
			s += t + node.val + "\n";
			return true;
		}
		preorder(f);
		s += ">|\n";
		return s;
		#else
		return Sprintf.format("{BinaryTreeNode, val: %s size: %d, node depth: %d, tree height %d}", [Std.string(val), size(), depth(), height()]);
		#end
	}

	function _preorderRecursive(node:BinaryTreeNode<T>, process:BinaryTreeNode<T>->Dynamic->Bool, userData:Dynamic):Bool
	{
		var run = process(node, userData);
		if (run && node.hasL()) run = _preorderRecursive(node.l, process, userData);
		if (run && node.hasR()) run = _preorderRecursive(node.r, process, userData);
		return run;
	}
	
	function _preorderRecursiveVisitable(node:BinaryTreeNode<T>, userData:Dynamic):Bool
	{
		var v:Visitable = untyped node.val;
		var run = untyped v.visit(false, userData);
		if (run && node.hasL()) run = _preorderRecursiveVisitable(node.l, userData);
		if (run && node.hasR()) run = _preorderRecursiveVisitable(node.r, userData);
		return run;
	}
	
	function _inorderRecursive(node:BinaryTreeNode<T>, process:BinaryTreeNode<T>->Dynamic->Bool, userData:Dynamic):Bool
	{
		if (node.hasL())
			if (!_inorderRecursive(node.l, process, userData))
				return false;
		if (!process(node, userData)) return false;
		if (node.hasR())
			if (!_inorderRecursive(node.r, process, userData))
				return false;
		return true;
	}
	
	function _inorderRecursiveVisitable(node:BinaryTreeNode<T>, userData:Dynamic):Bool
	{
		if (node.hasL())
			if (!_inorderRecursiveVisitable(node.l, userData))
				return false;
		var v:Visitable = untyped node.val;
		if (!v.visit(false, userData))
			return false;
		if (node.hasR())
			if (!_inorderRecursiveVisitable(node.r, userData))
				return false;
		return true;
	}

	function _postorderRecursive(node:BinaryTreeNode<T>, process:BinaryTreeNode<T>->Dynamic->Bool, userData:Dynamic):Bool
	{
		if (node.hasL())
			if (!_postorderRecursive(node.l, process, userData))
				return false;
		if (node.hasR())
			if (!_postorderRecursive(node.r, process, userData))
				return false;
		return process(node, userData);
	}
	
	function _postorderRecursiveVisitable(node:BinaryTreeNode<T>, userData:Dynamic):Bool
	{
		if (node.hasL())
			if (!_postorderRecursiveVisitable(node.l, userData))
				return false;
		if (node.hasR())
			if (!_postorderRecursiveVisitable(node.r, userData))
				return false;
		var v:Visitable = untyped node.val;
		return v.visit(false, userData);
	}

	function _heightRecursive(node:BinaryTreeNode<T>):Int
	{
		var cl = -1;
		var cr = -1;
		if (node.hasL())
			cl = _heightRecursive(node.l);
		if (node.hasR())
			cr = _heightRecursive(node.r);
		return cl.max(cr) + 1;
	}
	
	/*///////////////////////////////////////////////////////
	// collection
	///////////////////////////////////////////////////////*/
	
	/**
	 * Destroys this object by explicitly nullifying all nodes, pointers and elements for GC'ing used resources.<br/>
	 * Improves GC efficiency/performance (optional).
	 * <o>n</o>
	 */
	public function free():Void
	{
		if (hasL()) l.free();
		if (hasR()) r.free();
		
		var NULL:Null<T> = null;
		val = NULL;
		r = l = p = null;
	}
	
	/**
	 * Returns true if the subtree rooted at this node contains the element <code>x</code>.
	 * <o>n</o>
	 */
	public function contains(x:T):Bool
	{
		var stack = new Array<BinaryTreeNode<T>>();
		stack[0] = this;
		var c = 1;
		var found = false;
		while (c > 0)
		{
			var node = stack[--c];
			if (node.val == val)
			{
				found = true;
				break;
			}
			if (node.hasL()) stack[c++] = node.l;
			if (node.hasR()) stack[c++] = node.r;
		}
		return found;
	}
	
	/**
	 * Runs a recursive preorder traversal that removes all occurrences of <code>x</code>.<br/>
	 * Tree nodes are not rearranged, so if a node storing <code>x</code> is removed, the subtree rooted at that node is unlinked and lost.
	 * <o>n</o>
	 * @return true if at least one occurrence of <code>x</code> was removed.
	 */
	public function remove(x:T):Bool
	{
		var found = false;
		if (val == x)
		{
			unlink();
			found = true;
		}
		
		if (hasL()) found = found || l.remove(x);
		if (hasR()) found = found || r.remove(x);
		
		return found;
	}
	
	/**
	 * Removes all child nodes.
	 * <o>1 or n if <code>purge</code> is true</o>
	 * @param purge if true, all nodes and elements of this subtree are recursively nullified.
	 */
	public function clear(purge = false):Void
	{
		if (purge)
		{
			if (hasL()) l.clear(purge);
			if (hasR()) r.clear(purge);
			
			l = r = p = null;
			var NULL:Null<T> = null;
			val = NULL;
		}
		else
		{
			l = r = null;
		}
	}
	
	/**
	 * Returns a new <em>BinaryTreeNodeIterator</em> object to iterate over all elements contained in the nodes of this subtree (including this node).<br/>
	 * The elements are visited by using a preorder traversal.
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<T>
	{
		return new BinaryTreeNodeIterator<T>(this);
	}

	/**
	 * Recursively counts the number of nodes in this subtree (including this node).
	 * <o>n</o>
	 */
	public function size():Int
	{
		var c = 1;
		if (hasL()) c += l.size();
		if (hasR()) c += r.size();
		return c;
	}
	
	/**
	 * Unsupported operation - always returns false in release mode.
	 */
	inline public function isEmpty():Bool
	{
		return false;
	}
	
	/**
	 * Returns an array containing all elements in this subtree.<br/>
	 * The elements are added by applying a preorder traversal.
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(size());
		var i = 0;
		preorder(function(node:BinaryTreeNode<T>, userData:Dynamic):Bool { a[i++] = node.val; return true; });
		return a;
	}
	
	#if flash10
	/**
	 * Returns a Vector.&lt;T&gt; object containing all elements in this subtree.<br/>
	 * The elements are added by applying a preorder traversal.
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(size());
		var i = 0;
		preorder(function(node:BinaryTreeNode<T>, userData:Dynamic):Bool { a[i++] = node.val; return true; });
		return a;
	}
	#end
	
	/**
	 * Returns a dense array containing all elements in this subtree.<br/>
	 * The elements are added by applying a preorder traversal.
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(size());
		preorder(function(node:BinaryTreeNode<T>, userData:Dynamic):Bool { a.pushBack(node.val); return true; });
		return a;
	}
	
	/**
	 * Duplicates this subtree. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		var stack = new Array<BinaryTreeNode<T>>();
		
		var copy = new BinaryTreeNode<T>(copier != null ? copier(val) : val);
		stack[0] = this;
		stack[1] = copy;
		var top = 2;
		
		if (assign)
		{
			while (top > 0)
			{
				var c = stack[--top];
				var n = stack[--top];
				if (n.hasR())
				{
					c.setR(n.r.val);
					stack[top++] = n.r;
					stack[top++] = c.r;
				}
				if (n.hasL())
				{
					c.setL(n.l.val);
					stack[top++] = n.l;
					stack[top++] = c.l;
				}
			}
		}
		else
		if (copier == null)
		{
			var t:Cloneable<T> = null;
			while (top > 0)
			{
				var c = stack[--top];
				var n = stack[--top];
				if (n.hasR())
				{
					D.assert(Std.is(n.r.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [n.r.val]));
					
					t = untyped n.r.val;
					c.setR(t.clone());
					stack[top++] = n.r;
					stack[top++] = c.r;
				}
				if (n.hasL())
				{
					D.assert(Std.is(n.l.val, Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [n.l.val]));
					
					t = untyped n.l.val;
					c.setL(t.clone());
					stack[top++] = n.l;
					stack[top++] = c.l;
				}
			}
		}
		else
		{
			while (top > 0)
			{
				var c = stack[--top];
				var n = stack[--top];
				if (n.hasR())
				{
					c.setR(copier(n.r.val));
					stack[top++] = n.r;
					stack[top++] = c.r;
				}
				if (n.hasL())
				{
					c.setL(copier(n.l.val));
					stack[top++] = n.l;
					stack[top++] = c.l;
				}
			}
		}
		return copy;
	}
}

#if doc
private
#end
class BinaryTreeNodeIterator<T> implements de.polygonal.ds.Itr<T>
#if generic
, implements haxe.rtti.Generic
#end
{
	var _node:BinaryTreeNode<T>;
	var _stack:Array<BinaryTreeNode<T>>;
	var _top:Int;
	var _c:Int;

	public function new(node:BinaryTreeNode<T>)
	{
		_stack = new Array<BinaryTreeNode<T>>();
		_node = node;
		reset();
	}

	inline public function reset():Itr<T>
	{
		_stack[0] = _node;
		_top = 1;
		_c = 0;
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _top > 0;
	}

	inline public function next():T
	{
		var node = _stack[--_top];
		_c = 0;
		if (node.hasL())
		{
			_stack[_top++] = node.l;
			_c++;
		}
		if (node.hasR())
		{
			_stack[_top++] = node.r;
			_c++;
		}
		return node.val;
	}
	
	inline public function remove():Void
	{
		_top -= _c;
	}
}