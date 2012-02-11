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

import de.polygonal.core.util.Assert;

/**
 * <p>A helper class for building tree structures.</p>
 * <p>The class manages two pointers: A "vertical" pointer and a "horizontal" pointer.<br/>
 * The vertical pointer moves up and down the tree using the node's <em>parent</em> field, while the horizontal pointer moves left/right over the children using the <em>prev</em> and <em>next</em> fields.</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class TreeBuilder<T>
#if generic
implements haxe.rtti.Generic
#end
{
	var _node:TreeNode<T>;
	var _child:TreeNode<T>;
	
	/**
	 * Creates a <em>TreeBuilder</em> object pointing to <code>node</code>.
	 * @throws de.polygonal.core.util.AssertionError node is null (debug only).
	 */
	public function new(node:TreeNode<T>)
	{
		D.assert(node != null, "node is null");
		
		_node = node;
		childStart();
	}
	
	/**
	 * Destroys this object by explicitly nullifying all pointers for GC'ing used resources.<br/>
	 * Improves GC efficiency/performance (optional).
	 * <o>1</o>
	 */
	public function free():Void
	{
		_node = _child = null;
	}
	
	/**
	 * Returns the data stored in the node that the tree builder is currently pointing at.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError vertical pointer is null (debug only).
	 */
	inline public function getVal():T
	{
		D.assert(valid(), "vertical pointer is null");
		return _node.val;
	}
	
	/**
	 * Stores the element <code>x</code> in the node that the tree builder is currently pointing at.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError vertical pointer is null (debug only).
	 */
	inline public function setVal(x:T):Void
	{
		D.assert(valid(), "vertical pointer is null");
		_node.val = x;
	}
	
	/**
	 * Returns the node that the tree builder is currently pointing at or null if invalid.
	 * <o>1</o>
	 */
	inline public function getNode():TreeNode<T>
	{
		return _node;
	}
	
	/**
	 * Returns the child node that the tree builder is currently pointing at or null if invalid.
	 * <o>1</o>
	 */
	inline public function getChildNode():TreeNode<T>
	{
		return _child;
	}
	
	/**
	 * Returns the data of the child pointer.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid child pointer (debug only).
	 */
	inline public function getChildVal():T
	{
		D.assert(childValid(), "invalid child node");
		return _child.val;
	}
	
	/**
	 * Returns true if the vertical pointer is valid.
	 * <o>1</o>
	 */
	inline public function valid():Bool
	{
		return _node != null;
	}
	
	/**
	 * Moves the vertical pointer to the root of the tree.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError invalid pointer (debug only).
	 */
	inline public function root():Void
	{
		D.assert(valid(), "invalid vertical pointer");
		
		while (_node.hasParent()) _node = _node.parent;
		_reset();
	}
	
	/**
	 * Moves the vertical pointer one level up.
	 * <o>1</o>
	 * @return true if the vertical pointer was updated or false if the node has no parent.
	 */
	inline public function up():Bool
	{
		D.assert(valid(), "invalid vertical pointer");
		
		if (_node.hasParent())
		{
			_node = _node.parent;
			_reset();
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Moves the vertical pointer one level down, so it points to the first child.
	 * <o>1</o>
	 * @return true if the vertical pointer was updated or false if the node has no children.
	 */
	inline public function down():Bool
	{
		D.assert(childValid(), "node has no children");
		
		if (_child != null)
		{
			_node = _child;
			_reset();
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Returns true if the horizonal pointer has a next child.
	 * <o>1</o>
	 */
	inline public function hasNextChild():Bool
	{
		return childValid() && _child.next != null;
	}
	
	/**
	 * Returns true if the horizonal pointer has a previous child.
	 * <o>1</o>
	 */
	inline public function hasPrevChild():Bool
	{
		return childValid() && _child.prev != null;
	}
	
	/**
	 * Moves the horizontal pointer to the next child.
	 * <o>1</o>
	 * @return true if the horizontal pointer was updated or false if there is no next child.
	 */
	inline public function nextChild():Bool
	{
		if (hasNextChild())
		{
			_child = _child.next;
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Moves the horizontal pointer to the previous child.
	 * <o>1</o>
	 * @return true if the horizontal pointer was updated or false if there is no previous child.
	 */
	inline public function prevChild():Bool
	{
		if (hasPrevChild())
		{
			_child = _child.prev;
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Moves the horizontal pointer to the first child of the node referenced by the vertical pointer.
	 * <o>1</o>
	 * @return true if the horizontal pointer was updated or false if there are no children.
	 */
	inline public function childStart():Bool
	{
		if (valid())
		{
			_child = _node.children;
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Moves the horizontal pointer to the first child of the node referenced by the vertical pointer.
	 * <o>1</o>
	 * @return true if the horizontal pointer was updated or false if there are no children.
	 */
	inline public function childEnd():Bool
	{
		if (childValid())
		{
			_child = _node.getLastChild();
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Returns true if the horizontal pointer is valid. 
	 * <o>1</o>
	 */
	inline public function childValid():Bool
	{
		return _child != null;
	}
	
	/**
	 * Appends a child node storing <code>x</code> to the children of the vertical pointer.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid vertical pointer (debug only).
	 */
	inline public function appendChild(x:T):TreeNode<T>
	{
		D.assert(valid(), "invalid vertical pointer");
		
		_child = _createChildNode(x, true);
		return _child;
	}
	
	/**
	 * Prepends a child node storing <code>x</code> to the children of the vertical pointer.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid vertical pointer (debug only).
	 */
	inline public function prependChild(x:T):TreeNode<T>
	{
		D.assert(valid(), "invalid vertical pointer");
		
		var childNode = _createChildNode(x, false);
		if (childValid())
		{
			childNode.next = _node.children;
			_node.children.prev = childNode;
			_node.children = childNode;
		}
		else
			_node.children = childNode;
		_child = childNode;
		return childNode;
	}
	
	/**
	 * Prepends a child node storing <code>x</code> to the child node referenced by the horizontal pointer.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid vertical pointer (debug only).
	 */
	inline public function insertBeforeChild(x:T):TreeNode<T>
	{
		D.assert(valid(), "invalid vertical pointer");
		
		if (childValid())
		{
			var childNode = _createChildNode(x, false);
			
			childNode.next = _child;
			childNode.prev = _child.prev;
			
			if (_child.hasPrevSibling())
				_child.prev.next = childNode;
			
			_child.prev = childNode;
			_child = childNode;
			
			return childNode;
		}
		else
			return appendChild(x);
	}
	
	/**
	 * Appends a child node storing <code>x</code> to the node referenced by the vertical pointer.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid vertical pointer (debug only).
	 */
	inline public function insertAfterChild(x:T):TreeNode<T>
	{
		D.assert(valid(), "invalid vertical pointer");
		
		if (childValid())
		{
			var childNode = _createChildNode(x, false);
			
			childNode.prev = _child;
			childNode.next = _child.next;
			
			if (_child.hasNextSibling())
				_child.next.prev = childNode;
			
			_child.next = childNode;
			_child = childNode;
			
			return childNode;
		}
		else
			return appendChild(x);
	}
	
	/**
	 * Removes the child node referenced by the horizontal pointer and moves the horizontal pointer to the next child.
	 * <o>1</o>
	 * @return true if the child node was successfully removed.
	 */
	inline public function removeChild():Bool
	{
		if (valid() && childValid())
		{
			_child.parent = null;
			
			var node = _child;
			_child = node.next;
			
			if (_node.children == node)
				_node.children = _child;
			
			if (node.hasPrevSibling()) node.prev.next = node.next;
			if (node.hasNextSibling()) node.next.prev = node.prev;
			node.parent = node.next = node.prev = null;
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Returns a string representing the current object. 
	 */
	public function toString():String
	{
		return "{TreeBuilder, V: " + (valid() ? _node.val : null) + ", H: " + (childValid() ? _child.val : null) + "}";
	}
	
	inline function _reset():Void
	{
		if (valid()) _child = _node.children;
	}
	
	inline function _createChildNode(x:T, append:Bool)
	{
		if (append)
			return new TreeNode<T>(x, _node);
		else
		{
			var node = new TreeNode<T>(x);
			node.parent = _node;
			return node;
		}
	}
	
	inline function _getTail(node:TreeNode<T>):TreeNode<T>
	{
		var tail = node;
		while (tail.hasNextSibling()) tail.next;
		return tail;
	}
}