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
package de.polygonal.core.event;

import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.fmt.StringUtil;
import de.polygonal.ds.Array2;
import de.polygonal.ds.ArrayedStack;
import de.polygonal.ds.Bits;
import de.polygonal.ds.HashableItem;
import de.polygonal.ds.ListSet;
import de.polygonal.ds.pooling.DynamicObjectPool;

using de.polygonal.ds.Bits;

/**
 * <p>An object with state that is observed by an <em>IObserver</em> implementation.</p>
 * <p>See <a href="http://en.wikipedia.org/wiki/Observer_pattern" target="_blank">http://en.wikipedia.org/wiki/Observer_pattern</a>.</p>
 */
class Observable extends HashableItem, implements IObservable
{
	static var _nextGUID = 1;
	static var _registry:ListSet<Observable>;
	static function _getRegistry()
	{
		if (_registry == null)
			_registry = new ListSet<Observable>();
		return _registry;
	}
	
	/**
	 * Prints out a list of all installed observers (application-wide).
	 */
	public static function dump():String
	{
		var c = 0;
		var s = "";
		for (observable in _getRegistry())
		{
			c += observable.size();
			s += Sprintf.format("%-20s -> %s\n", [StringUtil.ellipsis(Std.string(observable), 20, true), observable.getObserverList().join(",")]);
		}
		return Sprintf.format("#observers: %03d\n", [c]) + s;
	}
	
	/**
	 * Clears all installed observers (application-wide).
	 */
	public static function release():Void
	{
		try
		{
			for (observable in _getRegistry())
			{
				observable.clear();
				observable.free();
			}
			_getRegistry().clear();
		}
		catch (unknown:Dynamic)
		{
		}
	}
	
	/**
	 * Counts the total number of observers (application-wide).
	 */
	public static function totalObserverCount():Int
	{
		var c = 0;
		for (observable in _getRegistry()) c += observable.size();
		return c;
	}
	
	/**
	 * Calls the function <code>f</code> whenever <code>source</code> triggers an update of the specified <code>type</code>, as long as <code>f</code> returns true.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.event.Observable;
	 * import de.polygonal.core.time.Timbase;
	 * import de.polygonal.core.time.TimbaseEvent;
	 * class Main {
	 *     static function main() {
	 *         var observer = function() {
	 *             trace("tick");
	 *             return true; //keep alive
	 *         }
	 *         Observable.bind(observer, Timebase.instance(), TimebaseEvent.TICK);
	 *     }
	 * }
	 * </pre>
	 */
	public static function bind(f:Void->Bool, source:IObservable, type:Int)
	{
		source.attach(Bind.get(f, type));
	}
	
	/**
	 * Calls the function <code>f</code> whenever <code>source</code> triggers an update of one of the specified <code>types</code>.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.event.Observable;
	 * import de.polygonal.core.time.Timbase;
	 * import de.polygonal.core.time.TimbaseEvent;
	 * class Main {
	 *     static function main() {
	 *         var observer = function(type) {
	 *             if (type == TimebaseEvent.TICK) {
	 *                 trace("tick");
	 *                 return false; //stop TICK updates, but keep RENDER updates
	 *             }
	 *             if (type == TimebaseEvent.RENDER) {
	 *                 trace("render");
	 *                 return true; //keep alive
	 *             }
	 *         }
	 *         Observable.bindMulti(observer, Timebase.instance(), TimebaseEvent.TICK | TimebaseEvent.RENDER);
	 *     }
	 * }
	 * </pre>
	 */
	public static function bindMulti(f:Int->Bool, source:IObservable, types:Int)
	{
		source.attach(MultiBind.get(f, types));
	}
	
	/**
	 * Delegates <em>IObserver.udpate()</em> to the given function <code>f</code>, as long as <code>f</code> returns true.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.event.Observable;
	 * import de.polygonal.core.time.TimbaseEvent;
	 * class Main
	 * {
	 *     static function main() {
	 *         var f = function(type:Int, source:Observable, userData:Dynamic):Bool {
	 *             trace(type);
	 *             return false; //detach from event source
	 *         }
	 *         var observable = new Observable();
	 *         observable.attach(Observable.delegate(f));
	 *     }
	 * }
	 * </pre>
	 */
	public static function delegate(f:Int->IObservable->Dynamic->Bool):IObserver
	{
		return Delegate.get(f);
	}
	
	var _source:IObservable;
	var _observer:ObserverNode;
	var _observerCount:Int;
	
	var _head:ObserverNode;
	var _tail:ObserverNode;
	var _hook:ObserverNode;
	
	var _blacklist:Int;
	var _poolSize:Int;
	var _poolCapacity:Int;
	
	var _freed:Bool;
	var _updating:Bool;
	var _stack:ArrayedStack<Dynamic>;
	var _type:Int;
	var _userData:Dynamic;
	var _nodeLookup:IntHash<ObserverNode>;
	
	/**
	 * @param poolSize because observers are stored internally in a linked list it's necessary to create a node object per observer.<br/>
	 * Thus it makes sense to reuse a node object when an observer is detached from this object instead of handling it over to the GC.<br/>
	 * A value > 0 sets up node pool capable of reusing up to <code>poolSize</code> node objects.<br/>
	 * Once the pool has reached its capacity new node objects are still created but not reused.<br/>
	 * To conserve memory node objects are not pre-allocated up front - instead the pool is filled incrementally when detaching observers.<br/>
	 * To force pre-allocation, call <em>reserve()</em>.
	 */
	public function new(poolSize = 0, source:IObservable = null)
	{
		super();
		
		_source        = (source == null) ? this : source;
		_observer      = null;
		_observerCount = 0;
		_head          =  new ObserverNode();
		_tail          = _head;
		_hook          = null;
		_blacklist     = 0;
		_poolSize      = 0;
		_poolCapacity  = poolSize;
		_freed         = false;
		_updating      = false;
		_stack         = new ArrayedStack<Dynamic>();
		_type          = 0;
		_userData      = null;
		_nodeLookup    = new IntHash();
	}
	
	/**
	 * Destroys this object by detaching all observers and explicitly nullifying all nodes, pointers and elements for GC'ing used resources.<br/>
	 * Improves GC efficiency/performance (optional).
	 */
	public function free():Void
	{
		if (_freed) return;
		
		clear();
		
		_stack.free();
		
		var n = _head;
		while (n != null)
		{
			var t      = n.next;
			n.prev     = null;
			n.next     = null;
			n.observer = null;
			n          = t;
		}
		
		_nodeLookup = null;
		_stack      = null;
		_head       = null;
		_tail       = null;
		_userData   = null;
		
		_freed = true;
	}
	
	/**
	 * Returns the total number of attached observers.
	 */
	public function size():Int
	{
		return _observerCount;
	}
	
	/**
	 * Explicitely allocates <code>x</code> node objects up front for storing observers.<br/>
	 * Because observers are stored internally in a linked list it's necessary to create a node object per observer.<br/>
	 * Thus it makes sense to reuse a node object when an observer is detached from this object instead of handling it over to the GC.<br/>
	 * This improves performance when observers are frequently attached and detached.
	 * This value can be adjusted at any time; a value of zero disables preallocation.
	 */
	public function reserve(x:Int):Void
	{
		_poolCapacity = x;
		if (x < _poolSize)
		{
			//shrink pool by (_poolSize - x)
			for (i in 0..._poolSize - x)
				_head = _head.next;
		}
		else
		{
			//grow pool by (x - _poolSize)
			for (i in 0...x - _poolSize)
			{
				_tail = _tail.next = new ObserverNode();
			}
		}
		_poolSize = x;
	}
	
	/**
	 * Removes all attached observers.<br/>
	 * The internal pool defined by <em>reserve()</em> is not altered.
	 * @param purge if true, the pool is emptied.
	 */
	public function clear(purge = false):Void
	{
		if (_observerCount > 0) _getRegistry().remove(this);
		
		_stack.clear();
		
		_userData      = false;
		_updating      = false;
		_hook          = null;
		_observer      = null;
		_observerCount = 0;
		_nodeLookup    = new IntHash();
		
		if (purge)
		{
			_poolSize = 0;
			var node = _head;
			while (node != null)
			{
				var next = node.next;
				node.prev = null;
				node.next = null;
				node.observer = null;
				node = next;
			}
			
			_head =  new ObserverNode();
			_tail = _head;
		}
	}
	
	inline function _findNode(o:IObserver)
	{
		return _nodeLookup.get(o.__guid);
	}
	
	/**
	 * Registers an observer object <code>o</code> with this object so it is updated when calling <em>notify()</em>.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.event.Observable;
	 * import de.polygonal.core.event.IObserver;
	 * 
	 * @:build(de.polygonal.core.event.ObserverMacro.create(
	 * &#091;
	 *     UPDATE_A,
	 *     UPDATE_B,
	 *     UPDATE_C
	 * &#093;))
	 * class MyEvent {}
	 * 
	 * class MyObserver implements IObserver {
	 *     public function new() {}
	 *     public function update(type:Int, source:Observable, userData:Dynamic):Void {}
	 * }
	 * 
	 * class Main {
	 *     public static function main() {
	 *         var observable = new Observable();
	 *         var observer = new MyObserver();
	 *         
	 *         //register with all updates (UPDATE_A, UPDATE_B, UPDATE_C)
	 *         observable.attach(observer);
	 *         
	 *         //or only register with a single update
	 *         observable.attach(observer, MyEvents.UPDATE_A);
	 *         
	 *         //or only register with a subset of updates
	 *         observable.attach(observer, MyEvents.UPDATE_A | MyEvents.UPDATE_B);
	 *     }
	 * }</pre>
	 * @param o the observer to register with.
	 * @param mask a bit field of bit flags defining which event types to register with.<br/>
	 * This can be used to select a subset of events from an event group.<br/>
	 * By default, <code>o</code> receives all updates from an event group.
	 */
	public function attach(o:IObserver, ?mask = 0):Void
	{
		if (_freed) //free() was called?
			return;
		
		//assign an id for fast node lookup
		if (o.__guid == 0) o.__guid = _nextGUID++;
		
		var n = _findNode(o);
		if (n != null) //observer exists?
		{
			//update bits only
			if (n.mask == Bits.ALL)
			{
				if (mask != 0)
					n.mask = mask & ObserverMacro.EVENT_MASK; //apply given mask
			}
			else
			{
				if (mask != 0)
					n.mask |= (mask & ObserverMacro.EVENT_MASK); //merge existing mask with new mask
				else
					n.mask = Bits.ALL; //allow all
			}
			return;
		}
		
		//get a node for storing the observer
		if (_poolCapacity == 0) //pooling is disabled?
			n = new ObserverNode(); //create a new node on-the-fly
		else
		{
			//get a node from the pool
			if (_poolSize == 0) //pool is empty?
				n = new ObserverNode(); //create and add node to pool
			else
			{
				//get next available node from pool
				n = _head;
				_head = _head.next;
				_poolSize--;
			}
		}
		
		//set up node object
		n.observer = o;
		n.mask = (mask == 0) ? Bits.ALL : (mask & ObserverMacro.EVENT_MASK);
		
		_nodeLookup.set(o.__guid, n);
		
		//prepend to observer list
		n.next = _observer;
		if (_observer != null) _observer.prev = n;
		_observer = n;
		_observerCount++;
		
		if (_observerCount == 1) //first observer?
			_getRegistry().set(this); //register with global observable list
	}
	
	/**
	 * Unregisters an observer object <code>o</code> from this object so it is no longer updated when calling <em>notify()</em>.
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.event.Observable;
	 * import de.polygonal.core.event.IObserver;
	 * 
	 * @:build(de.polygonal.core.event.ObserverMacro.create(
	 * &#091;
	 *     UPDATE_A,
	 *     UPDATE_B,
	 *     UPDATE_C
	 * &#093;))
	 * class MyEvent {}
	 * 
	 * class MyObserver implements IObserver {
	 *     public function new() {}
	 *     public function update(type:Int, source:Observable, userData:Dynamic):Void {}
	 * }
	 * 
	 * class Main {
	 *     public static function main() {
	 *         var observable = new Observable();
	 *         var observer = new MyObserver();
	 *         
	 *         //register with all updates (UPDATE_A, UPDATE_B, UPDATE_C, UPDATE_D)
	 *         observable.attach(observer);
	 *         
	 *         //only unregister from UPDATE_A
	 *         observable.detach(observer, MyEvents.UPDATE_A);
	 *         
	 *         //only unregister from UPDATE_B and UPDATE_C
	 *         observable.detach(observer, MyEvents.UPDATE_B | MyEvents.UPDATE_C);
	 *         
	 *         //unregister from event group (UPDATE_A, UPDATE_B, UPDATE_C, UPDATE_D)
	 *         observable.detach(observer);
	 *     }
	 * }</pre>
	 * @param o the observer to unregister from.
	 * @param mask a bit field of bit flags defining which event types to unregister from.<br/>
	 * This can be used to select a subset of events from an event group.<br/>
	 * By default, <code>o</code> is unregistered from the entire event group.
	 */
	public function detach(o:IObserver, ?mask = 0):Void
	{
		if (_freed) //free() was called?
			return;
		
		var n = _findNode(o);
		if (n == null) return; //observer exists?
		
		if (mask != 0)
		{
			//update bits
			#if !neko
			n.mask &= ~(mask & ObserverMacro.EVENT_MASK);
			#else
			n.mask &= haxe.Int32.toInt(haxe.Int32.complement(haxe.Int32.ofInt(mask & ObserverMacro.EVENT_MASK)));
			#end
			n.mask &= ObserverMacro.EVENT_MASK;
			if (n.mask > 0)
				return;
		}
		
		//unlink from observer list
		if (n.prev != null) n.prev.next = n.next;
		if (n.next != null) n.next.prev = n.prev;
		if (n == _observer) _observer = n.next;
		if (n == _hook) _hook = _hook.next;
		
		if (_updating) //update in progress?
		{
			var i = 0;
			var k = _stack.size();
			while (i < k)
			{
				if (_stack.get(i) == n) _stack.set(i, n.next);
				i += 3;
			}
		}
		
		_nodeLookup.remove(n.observer.__guid);
		
		//reset node
		n.observer = null;
		n.prev = n.next = null;
		
		if (_poolCapacity > 0) //pooling enabled?
		{
			if (_poolSize < _poolCapacity) //room available?
			{
				//reuse it
				_tail = _tail.next = n;
				_poolSize++;
			}
		}
		
		//remove node
		_observerCount--;
		
		if (_observerCount == 0) //last observer?
			_getRegistry().remove(this); //unregister from global observable list
	}
	
	/**
	 * Notifies all attached observers to indicate that the state of this object has changed.
	 * @param type the event type.
	 * @param userData additional event data. Default value is null.
	 */
	public function notify(type:Int, userData:Dynamic = null):Void
	{
		if (_observerCount == 0 || (type & _blacklist) == type)
			return; //early out
		
		var eventBits = type & ObserverMacro.EVENT_MASK;
		
		//when an observer calls notify() while an update is in progress, the current update stops
		//while the new update is carried out to all observers, e.g.:
		//we have 3 observers A,B and C - when B invokes an update the update order is [A, B, [A, B, C], C]
		
		if (_updating) //update still running?
		{
			//stop update and store state so it can be resumed later on
			_stack.push(_hook);
			_stack.push(_type);
			_stack.push(_userData);
			
			_type = type;
			_userData = userData;
			
			_update(_observer, type, eventBits, userData);
		}
		else
		{
			_updating = true;
			_type = type;
			_userData = userData;
			
			_update(_observer, type, eventBits, userData);
			
			if (_stack == null) //free() was called?
			{
				_hook = null;
				_observer = null;
				return;
			}
			
			if (_stack.size() > 0)
			{
				while (_stack.size() > 0) 
				{
					//restore state
					userData = _stack.pop();
					type     = _stack.pop();
					
					//resume update
					_update(_stack.pop(), type, eventBits, userData);
				}
			}
			
			_updating = false;
			_hook = null;
		}
	}
	
	/**
	 * Disables all updates of type <code>x</code>.<br/>
	 * Improves performance if an event group repeatedly fires frequent updates that are not handled by an application (e.g. mouse move events).
	 */
	public function mute(x:Int):Void
	{
		_blacklist |= x;
	}
	
	/**
	 * Removes the update type <code>x</code> from a blacklist of disabled updates, see <em>mute()</em>.<br/>
	 */
	public function unmute(x:Int):Void
	{
		#if !neko
		_blacklist = _blacklist & ~x;
		#else
		_blacklist = _blacklist & haxe.Int32.toInt(haxe.Int32.complement(haxe.Int32.ofInt(x)));
		#end
	}
	
	/**
	 * Returns true if <code>o</code> is registered with this object.
	 */
	public function contains(o:IObserver):Bool
	{
		var n = _observer;
		while (n != null)
		{
			if (n.observer == o) return true;
			n = n.next;
		}
		return false;
	}
	
	/**
	 * Returns an unordered list of all registered observers.
	 */
	public function getObserverList():Array<IObserver>
	{
		var v = new Array<IObserver>();
		var n = _observer;
		while (n != null)
		{
			v.push(n.observer);
			n = n.next;
		}
		return v;
	}
	
	/**
	 * Returns a new <em>ObservableIterator</em> object to iterate over all registered observers.<br/>
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Iterator<IObserver>
	{
		return new ObservableIterator<IObserver>(_observer);
	}
	
	inline function _update(node:ObserverNode, type:Int, eventBits:Int, userData:Dynamic)
	{
		//update all observers
		while (node != null)
		{
			//preserve reference to next node so a detach() doesn't break an update
			_hook = node.next;
			
			if ((node.mask & eventBits) > 0) //observer is suited for this update?
				node.observer.update(type, _source, userData); //update
			node = _hook;
		}
	}
}

class ObserverNode
{
	public var observer:IObserver;
	public var prev:ObserverNode;
	public var next:ObserverNode;
	public var mask:Int;
	
	public function new()
	{
		observer = null;
		prev     = null;
		next     = null;
		mask     = 0;
	}
}

private class ObservableIterator<T>
{
	var _walker:ObserverNode;

	public function new(head:ObserverNode)
	{
		_walker = head;
	}
	
	public function hasNext():Bool
	{
		return _walker != null;
	}

	public function next():IObserver
	{
		var val = _walker.observer;
		_walker = _walker.next;
		return val;
	}
}

private class Bind implements IObserver
{
	static var _pool:DynamicObjectPool<Bind>;
	inline public static function get(f:Void->Bool, type:Int):Bind
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<Bind>(Bind, null, null, 1024);
		
		#if warnings
		if (_pool.capacity() == _pool.size())
			de.polygonal.core.log.Log.getLog(Observable).warn('bind pool exhausted');
		#end
		
		var o = _pool.get();
		o._f = f;
		o._t = type;
		return o;
	}
	
	var _f:Void->Bool;
	var _t:Int;
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void 
	{
		if (_t == type)
		{
			if (!_f())
			{
				source.detach(this, type);
				_f = null;
				_pool.put(this);
				if (_pool.used() == 0)
					_pool.reclaim();
			}
		}
	}
}

private class MultiBind implements IObserver
{
	static var _pool:DynamicObjectPool<MultiBind>;
	inline public static function get(f:Int->Bool, type:Int):MultiBind
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<MultiBind>(MultiBind, null, null, 1024);
		
		#if warnings
		if (_pool.capacity() == _pool.size())
			de.polygonal.core.log.Log.getLog(Observable).warn("MultiBind pool exhausted.");
		#end
		
		var o = _pool.get();
		o._f = f;
		o._t = type;
		return o;
	}
	
	var _f:Int->Bool;
	var _t:Int;
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void 
	{
		if (_t.hasBits(type))
		{
			if (!_f(type))
			{
				_t = _t.clrBits(type);
				source.detach(this, type);
				if (_t == 0)
				{
					_f = null;
					_pool.put(this);
					if (_pool.used() == 0)
						_pool.reclaim();
				}
			}
		}
	}
}

private class Delegate implements IObserver
{
	static var _pool:DynamicObjectPool<Delegate>;
	inline public static function get(f:Int->IObservable->Dynamic->Bool):Delegate
	{
		if (_pool == null) _pool = new DynamicObjectPool<Delegate>(Delegate, null, null, 256);
		
		#if warnings
		if (_pool.capacity() == _pool.size())
			de.polygonal.core.log.Log.getLog(Observable).warn("Delegate pool exhausted.");
		#end
		
		var o = _pool.get();
		o._f = f;
		return o;
	}
	
	var _f:Int->IObservable->Dynamic->Bool;
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void 
	{
		if (!_f(type, source, userData))
		{
			source.detach(this);
			_f = null;
			_pool.put(this);
			if (_pool.used() == 0)
				_pool.reclaim();
		}
	}
}