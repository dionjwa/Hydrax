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
package de.polygonal.ui.trigger;

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.time.Timebase;
import de.polygonal.core.time.TimebaseEvent;
import de.polygonal.ds.Bits;
import de.polygonal.ds.Hashable;
import de.polygonal.ds.HashKey;
import de.polygonal.ds.TreeNode;
import de.polygonal.ds.Visitable;
import de.polygonal.motor.geom.inside.PointInsideAABB;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.ui.trigger.pointer.Pointer;
import de.polygonal.ui.trigger.state.TriggerStateMachine;
import de.polygonal.ui.trigger.surface.Surface;
import de.polygonal.ui.UI;
import de.polygonal.ui.UIEvent;

using de.polygonal.ds.BitFlags;

class Trigger implements IObservable, implements IObserver, implements Visitable, implements Hashable
{
	public static var DOUBLE_CLICK_THRESHOLD = .5;
	
	/* traversal types */
	inline static var TRAVERSAL_RESET         = 1;
	inline static var TRAVERSAL_UPDATE_STATE  = 2;
	inline static var TRAVERSAL_FIND_LEAF     = 3;
	inline static var TRAVERSAL_UPDATE_BOUND = 4;
	inline static var TRAVERSAL_DETACH        = 5;
	inline static var TRAVERSAL_RENDER        = 6;
	
	/* state flags */
	inline public static var BIT_TOUCHING         = Bits.BIT_01;
	inline public static var BIT_DOWN             = Bits.BIT_02;
	inline public static var BIT_TOUCH_MODE       = Bits.BIT_03;
	inline public static var BIT_DRAG_ENABLED     = Bits.BIT_04;
	inline public static var BIT_ENABLED          = Bits.BIT_05;
	inline public static var BIT_DRAG_LOCK_CENTER = Bits.BIT_06;
	inline public static var BIT_IS_DRAGGING      = Bits.BIT_07;
	inline public static var BIT_BUBBLE           = Bits.BIT_08;
	inline public static var BIT_SWEEP            = Bits.BIT_09;
	
	public var pointer(default, null):Pointer;
	public var surface(default, null):Surface;
	public var userData:Dynamic;
	
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * The tree node that stores this trigger.<br/>
	 * A <em>TreeNode</em> and a <em>Trigger</em> object cross-reference each other.
	 */
	inline public function getNode():TreeNode<Trigger>
	{
		return _node;
	}
	
	/**
	 * An AABB that spans over the subtree of this trigger.
	 */
	public function getBound():AABB2
	{
		return _bound;
	}
	
	var _observable:Observable;
	var _node:TreeNode<Trigger>;
	var _state:TriggerStateMachine;
	var _bound:AABB2;
	var _traversalState:TraversalState;
	var _bits:Int;
	
	public function new(pointer:Pointer, surface:Surface)
	{
		this.pointer            = pointer;
		this.surface            = surface;
		_observable             = new Observable(); 
		_bound                 = surface.getBound().clone();
		_traversalState         = new TraversalState();
		_traversalState.pointer = pointer;
		_node                   = new TreeNode<Trigger>(this);
		_state                  = new TriggerStateMachine(this);
		
		setf(Trigger.BIT_ENABLED);
		
		key = HashKey.next();
		
		_initializeTree(this);
	}
	
	/** Recursively destroys this trigger and all its children. */
	public function free():Void
	{
		_detach(this);
		
		if (_node == null) return;
		
		var child = _node.children;
		while (child != null)
		{
			var next = child.next;
			child.val.free();
			child = next;
		}
		
		_node.unlink();
		_state.free();
		_traversalState.free();
		_observable.free();
		
		pointer         = null;
		surface         = null;
		userData        = null;
		_node           = null;
		_state          = null;
		_bound         = null;
		_traversalState = null;
		_observable    =  null;
	}
	
	public var enabled(_enabledGetter, _enabledSetter):Bool;
	function _enabledGetter():Bool { return hasf(Trigger.BIT_ENABLED); }
	function _enabledSetter(x:Bool):Bool
	{
		if (x == hasf(Trigger.BIT_ENABLED)) return x;
		invf(Trigger.BIT_ENABLED);
		_evaluateTree();
		return x;
	}
	
	public var touchMode(_touchModeGetter, _touchModeSetter):Bool;
	function _touchModeGetter():Bool { return hasf(Trigger.BIT_TOUCH_MODE); }
	function _touchModeSetter(x:Bool):Bool
	{
		if (x == hasf(Trigger.BIT_TOUCH_MODE)) return x;
		invf(Trigger.BIT_TOUCH_MODE);
		_state.reset();
		_evaluateTree();
		return x;
	}
	
	public var dragEnabled(_dragEnabledGetter, _dragEnabledSetter):Bool;
	function _dragEnabledGetter():Bool { return hasf(Trigger.BIT_DRAG_ENABLED); }
	function _dragEnabledSetter(x:Bool):Bool
	{
		if (x == hasf(Trigger.BIT_DRAG_ENABLED)) return x;
		invf(Trigger.BIT_DRAG_ENABLED);
		_evaluateTree();
		return x;
	}
	
	public var dragLockCenter(_dragLockCenterGetter, _dragLockCenterSetter):Bool;
	function _dragLockCenterGetter():Bool { return hasf(Trigger.BIT_DRAG_LOCK_CENTER); }
	function _dragLockCenterSetter(x:Bool):Bool
	{
		if (x == hasf(Trigger.BIT_DRAG_LOCK_CENTER)) return x;
		invf(Trigger.BIT_DRAG_LOCK_CENTER);
		return x;
	}
	
	public var dynamicIntersection(_dynamicIntersectionGetter, _dynamicIntersectionSetter):Bool;
	function _dynamicIntersectionGetter():Bool { return hasf(BIT_SWEEP); }
	function _dynamicIntersectionSetter(x:Bool):Bool
	{
		if (x == hasf(Trigger.BIT_SWEEP)) return x;
		invf(Trigger.BIT_SWEEP);
		return x;
	}
	
	public var bubbleEnabled(_bubbleEnabledGetter, _bubbleEnabledSetter):Bool;
	function _bubbleEnabledGetter():Bool { return hasf(BIT_BUBBLE); }
	function _bubbleEnabledSetter(x:Bool):Bool
	{
		if (x == hasf(Trigger.BIT_BUBBLE)) return x;
		invf(Trigger.BIT_BUBBLE);
		return x;
	}
	
	public function toFront():Void
	{
		_node.setLast();
	}
	
	public function toBack():Void
	{
		_node.setFirst();
	}
	
	public function appendChild(x:Trigger):Void
	{
		D.assert(x != this, "x != this");
		_node.appendNode(x._node);
		_initializeTree(x);
	}
	
	public function prependChild(x:Trigger):Void
	{
		D.assert(x != this, "x != this");
		_node.prependNode(x._node);
		_initializeTree(x);
	}
	
	public function insertAfterChild(child:Trigger, x:Trigger):Void
	{
		_node.insertAfterChild(child._node, x._node);
		_initializeTree(x);
	}
	
	public function insertBeforeChild(child:Trigger, x:Trigger):Void
	{
		_node.insertBeforeChild(child._node, x._node);
		_initializeTree(x);
	}
	
	public function removeChild(x:Trigger):Void
	{
		D.assert(x._node.parent == _node, "given trigger is not a child of this trigger");
		
		//result is a tree or a leaf node
		x._node.unlink();
		
		//evaluation is only done by the root node
		var root = x._node.getRoot().val;
		root._preorder(TRAVERSAL_DETACH);
		_attach(root);
		
		//re-assign traversal state
		var state = new TraversalState();
		state.pointer = x.pointer;
		for (trigger in x._node) trigger._traversalState = state;
		
		x.evaluate();
		root.evaluate();
	}

	/**
	 * Iterates over all trigger objects in this tree.<br/>
	 * Same as <em>Trigger#getNode().iterator()</em>.
	 */
	public function iterator():Iterator<Trigger>
	{
		return _node.iterator();
	}
	
	/**
	 * Evaluate trigger state.
	 */
	public function evaluate():Void
	{
		D.assert(_node.isRoot(), "node.isRoot()");
		
		//use root pointer for all children
		_traversalState.pointer = pointer;
		
		//reset leaf node
		_traversalState.leafNode = null;
		
		//synchronize pointer
		_traversalState.pointer0 = pointer.position();
		pointer.update();
		_traversalState.pointer1 = pointer.position();
		
		//synchronize surfaces and reset node flags
		_preorder(TRAVERSAL_RESET);
		
		//find leaf node whose surface intersects the pointer
		_preorder(TRAVERSAL_FIND_LEAF);
		
		//if one exists, mark as touching
		if (_traversalState.leafNode != null)
			_traversalState.leafNode.val.setf(Trigger.BIT_TOUCHING);
		
		//update trigger state
		_preorder(TRAVERSAL_UPDATE_STATE);
		
		//synchronize BVH
		_postorder(TRAVERSAL_UPDATE_BOUND);
	}
	
	/**
	 * INTERFACE de.polygonal.core.event.IObserver
	 */
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		evaluate();
	}
	
	/**
	 * INTERFACE de.polygonal.ds.Visitable
	 */
	public function visit(preflight:Bool, userData:Dynamic):Bool
	{
		switch (_traversalState.id)
		{
			case TRAVERSAL_RESET:
				_traversalReset();
			
			case TRAVERSAL_FIND_LEAF:
				return _traversalFindLeaf();
			
			case TRAVERSAL_UPDATE_STATE:
				_traversalUpdateState();
			
			case TRAVERSAL_UPDATE_BOUND:
				//TODO optimize, add current bound to parent bound
				//TODO why update last?
				_traversalUpdateBound();
				
			case TRAVERSAL_DETACH:
				_traversalDetach();
		}
		
		return true;
	}
	
	public function burstBubble():Void
	{
		
	}
	
	public function attach(o:IObserver, mask = 0):Void 
	{
		_observable.attach(o, mask);
	}
	
	public function detach(o:IObserver, mask = 0):Void 
	{
		//free() destroys all children, so this might be null
		if (_observable == null) return;
			_observable.detach(o, mask);
	}
	
	public function notify(type:Int, userData:Dynamic = null):Void 
	{
		if (hasf(BIT_BUBBLE))
		{
			//this is a child, so bubble up to the root
			if (_node.isChild())
			{
				//notifiy observers that are listening to this trigger
				_observable.notify(type, userData);
				
				//bubble up
				_node.parent.val.notify(type, userData);
				return;
			}
			
			//this is a root node
			_observable.notify(type, userData);
		}
		else
		{
			//this is a child or root node
			_observable.notify(type, userData);
		}
	}
	
	public function toString():String
	{
		return Sprintf.format("{Trigger, userData: %s}", [Std.string(userData)]);
	}
	
	function _traversalReset()
	{
		surface.update();
		clrf(Trigger.BIT_TOUCHING | Trigger.BIT_DOWN);
		if (_traversalState.pointer.isActive()) setf(Trigger.BIT_DOWN);
	}
	
	function _traversalDetach()
	{
		_detach(this);
		return true;
	}
	
	function _traversalUpdateBound() 
	{
		//shrink to initial bound
		_bound.set(surface.getBound());
		
		//grow to encapsulate children
		var child = _node.children;
		while (child != null)
		{
			var childTrigger = child.val;
			_bound.addAABB(childTrigger._bound);
			child = child.next;
		}
	}
	
	function _traversalFindLeaf() 
	{
		var p = _traversalState.pointer;
		
		//determine if pointer touches BVH
		/*var hit;
		if (dynamicIntersection)
		{
			//assume linear motion; run an aabb vs. segment intersection test
			var p0 = p.p0;
			var p1 = p.p1;
			
			//run static test if segment is degenerated
			if (Mathematics.fabs(p1.x - p0.x) < Mathematics.EPS && Mathematics.fabs(p1.y - p0.y) < Mathematics.EPS)
				hit = PointInsideAABB.test2(p1, _bound);
			else
				hit = IntersectSegmentAABB.test5(p0.x, p0.y, p1.x, p1.y, _bound);
		}
		else*/
		var hit = PointInsideAABB.test2(p.position(), _bound);
		
		if (hit)
		{
			//false positive?
			if (surface.isTouching(p, dynamicIntersection))
			{
				//keep track of the deepest (topmost) node that touches the pointer
				_traversalState.leafNode = _node;
			}
		}
		else
		{
			//nothing hit; early out
			if (_node.isRoot())
				return false;
		}
		
		return true;
	}
	
	function _traversalUpdateState()
	{
		_state.evaluate();
	}
	
	function _initializeTree(x:Trigger)
	{
		var rootTrigger = _node.getRoot().val;
		
		//for each child node
		for (trigger in x._node)
		{
			//store root traversal state
			trigger._traversalState = rootTrigger._traversalState;
		}
		
		//only the root node evaluates the tree
		rootTrigger._preorder(TRAVERSAL_DETACH);
		_attach(rootTrigger);
		
		//update state
		_evaluateTree();
	}
	
	function _evaluateTree()
	{
		_node.getRoot().val.evaluate();
	}
	
	function _preorder(id:Int)
	{
		if (_node != null)
		{
			_traversalState.id = id;
			_node.preorder(null, false, false, _traversalState);
		}
	}
	
	function _postorder(id:Int)
	{
		if (_node != null)
		{
			_traversalState.id = id;
			_node.postorder(null, false, _traversalState);
		}
	}
	
	function _attach(observer:IObserver)
	{
		UI.sAttach(observer, UIEvent.MOUSE_DOWN | UIEvent.MOUSE_UP | UIEvent.MOUSE_MOVE);
	}
	
	function _detach(observer:IObserver)
	{
		UI.sDetach(observer);
		Timebase.sDetach(observer);
	}
}

private class TraversalState
{
	public var id:Int;
	
	public var pointer:Pointer;
	
	public var pointer0:Vec2;
	public var pointer1:Vec2;
	public var leafNode:TreeNode<Trigger>;
	
	public function new() {}
	
	public function free():Void
	{
		pointer  = null;
		pointer0 = null;
		pointer1 = null;
		leafNode = null;
	}
}