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
package de.polygonal.core.time;

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.ArrayedQueue;
import de.polygonal.ds.Cloneable;
import de.polygonal.ds.Collection;
import de.polygonal.ds.Comparable;
import de.polygonal.ds.DLL;
import de.polygonal.ds.HashableItem;
import de.polygonal.ds.Heap;
import de.polygonal.ds.Heapable;
import de.polygonal.ds.pooling.ObjectPool;

/**
 * A service that can schedule events to run after a given delay for a given amount of time, or periodically.
 */
class Timeline extends Observable, implements IObserver
{
	public static var POOL_SIZE = 512;
	
	static var _instance:Timeline = null;
	static var _initialized = false;
	public static function instance():Timeline
	{
		if (_instance == null)
			_instance = new Timeline();
		if (!_initialized)
		{
			_initialized = true;
			_instance._init();
		}
		return _instance;
	}
	
	#if !swc
	public static var get(_getGetter, never):Timeline;
	inline static function _getGetter():Timeline { return instance(); }
	#end
	
	/**
	 * If <code>x</code> is true, <code>advance()</code> is called at the rate defined by <code>Timebase.instance().getTickRate()</code>,
	 * otherwise the user is responsible for calling <code>advance()</code>.
	 */
	public static function sRun(x:Bool):Void
	{
		if (x)
			Timebase.instance().attach(Timeline.instance(), TimebaseEvent.TICK);
		else
			Timebase.instance().detach(Timeline.instance());
	}
	
	/**
	 * Convenience method for <em>Timeline.instance().attach()</em>.
	 */
	public static function sAttach(o:IObserver, mask = 0):Void
	{
		instance().attach(o, mask);
	}
	
	/**
	 * Convenience method for <em>Timeline.instance().detach()</em>.
	 */
	public static function sDetach(o:IObserver, mask = 0):Void
	{
		instance().detach(o, mask);
	}
	
	/**
	 * Convenience method for <em>Timeline.instance().schedule()</em>.
	 */
	public static function sSchedule(duration:Float, delay = .0, repeatCount = 0, repeatInterval = .0):Int
	{
		return instance().schedule(duration, delay, repeatCount, repeatInterval);
	}
	
	/**
	 * Convenience method for <em>Timeline.instance().cancel()</em>.
	 */
	public static function sCancel(id:Int):Bool
	{
		return instance().cancel(id);
	}
	
	var _timebase:Timebase;
	var _idCounter:Int;
	
	var _currTick:Int;
	var _currSubTick:Int;
	var _currInterval:TimeInterval;
	
	var _runningIntervals:DLL<TimeInterval>;
	var _pendingAdditions:ArrayedQueue<TimeInterval>;
	
	var _intervalHeap:Heap<TimeInterval>;
	var _intervalPool:ObjectPool<TimeInterval>;
	
	var _all:Array<Collection<TimeInterval>>;
	
	#if debug
	var _tickRate:Float;
	#end
	
	function _init()
	{
		reserve(100);
		
		_timebase         = Timebase.instance();
		_idCounter        = 0;
		_runningIntervals = new DLL<TimeInterval>(POOL_SIZE);
		_pendingAdditions = new ArrayedQueue<TimeInterval>(POOL_SIZE);
		_intervalHeap     = new Heap<TimeInterval>();
		_intervalPool     = new ObjectPool<TimeInterval>(POOL_SIZE);
		_currTick         = _timebase.getProcessedTicks();
		_currInterval     = new TimeInterval();
		_currSubTick      = 0;
		#if debug
		_tickRate         = 0;
		#end
		
		_intervalPool.allocate(false, TimeInterval);
		
		_all = new Array();
		_all.push(_runningIntervals);
		_all.push(_pendingAdditions);
		_all.push(_intervalHeap);
	}
	
	/**
	 * Destroys the system by removing all registered observers and explicitly nullifying all references for GC'ing used resources.
	 * The system is automatically reinitialized once an observer is attached.
	 */	
	override public function free()
	{
		for (collection in _all)
			for (interval in collection)
				_notify(TimelineEvent.CANCEL, interval);
		
		_timebase.detach(this);
		_runningIntervals.free();
		_pendingAdditions.free();
		_intervalHeap.free();
		_intervalPool.free();
		
		_timebase         = null;
		_runningIntervals = null;
		_pendingAdditions = null;
		_intervalHeap     = null;
		_intervalPool     = null;
		_currInterval     = null;
		_all              = null;
		
		clear(true);
		
		_initialized = false;
	}
	
	/**
	 * Schedules an event to run after <code>delay</code> seconds, for a period of <code>duration</code> seconds.<br/>
	 * If <code>repeatCount</code> &gt; zero, the event repeats <code>repeatCount</code> times, each time waiting for <code>interval</code> seconds before the event is carried out.<br/>
	 * If <code>repeatCount</code> &gt; zero and <em>repeatInterval</em> is omitted, <code>delay</code> is used in place of <code>repeatInterval</code>.
	 * If repeatCount equals minus one the event runs periodically until cancelled.
	 * @return an id that identifies the event. The id can be used to cancel a pending activity by calling <em>Timeline.instance().cancel()</em>.
	 */
	public function schedule(duration:Float, delay = .0, repeatCount = 0, repeatInterval = .0):Int
	{
		D.assert(duration >= .0, "duration >= .0");
		D.assert(delay >= .0, "delay >= .0");
		D.assert(repeatCount >= 0 || repeatCount == -1, "repeatCount >= 0 || repeatCount == -1");
		D.assert(repeatInterval >= 0, "repeatInterval >= 0");
		
		#if debug
		if (_tickRate == 0)
			_tickRate = _timebase.getTickRate();
		else
		if (_timebase.getTickRate() != _tickRate)
		{
			var c = _pendingAdditions.size() + _intervalHeap.size() + _runningIntervals.size();
			D.assert(c == 0, "tick rate changed");
		}
		#end
		
		if (repeatCount != 0 && repeatInterval == .0)
			repeatInterval = delay; //use delay as interval
		
		var delayTicks = Mathematics.round(delay / _timebase.getTickRate());
		var ageTicks = _currTick + delayTicks;
		
		var interval           = _getInterval();
		interval.id            = _idCounter++;
		interval.ageTicks      = ageTicks;
		interval.birthTicks    = ageTicks;
		interval.deathTicks    = ageTicks + Timebase.secondsToTicks(duration);
		interval.subTicks      = _currSubTick++;
		interval.intervalTicks = Timebase.secondsToTicks(repeatInterval);
		interval.iterations    = repeatCount;
		interval.iteration     = 0;
		_pendingAdditions.enqueue(interval);
		return interval.id;
	}
	
	/**
	 * Cancels a pending/running event.<br/>
	 * Triggers a <em>TimelineEvent.CANCEL</em> update for this event.
	 * @param id the id of the event.
	 * @return true if the event was successfully cancelled.
	 */
	public function cancel(id:Int):Bool
	{
		if (id < 0) return false;
		
		for (collection in _all)
		{
			for (interval in collection)
			{
				if (interval.id == id)
				{
					interval.cancel();
					return true;
				}
			}
		}
		
		return false;
	}
	
	/**
	 * Cancels all pending/running events.<br/>
	 * Triggers a <em>TimelineEvent.CANCEL</em> update for each cancelled event.
	 */
	public function cancelAll():Void
	{
		for (collection in _all)
		{
			for (interval in collection)
				interval.cancel();
		}
	}
	
	/**
	 * The current event progress in the range <arg>&#091;0, 1&#093;</arg>.
	 */
	public var progress(_progressGetter, never):Float;
	inline function _progressGetter():Float { return _currInterval.ratio(); }
	
	/**
	 * The id of the current event.
	 */
	public var id(_idGetter, never):Int;
	inline function _idGetter():Int { return _currInterval.id; }
	
	/**
	 * The iteration for the current event (0=first iteration).<br/>
	 * Returns -1 if the event runs periodically.
	 */
	public var iteration(_iterationGetter, never):Int;
	inline function _iterationGetter():Int
	{
		if (_currInterval.iterations == -1)
			return -1;
		else
			return _currInterval.iteration;
	}
	
	/**
	 * Binds a function <code>f</code> to an interval; <code>f</code> is invoked while the interval is running.
	 * @param f the first parameter stores the interpolation parameter in the interval <arg>&#091;0, 1&#093;</arg>.
	 * @param id the interval id returned by <code>Timeline.instance().schedule()</code>.
	 */
	public function bind(f:Float->Bool, id:Int):Void
	{
		var o = Timeline.instance();
		o.attach(Observable.delegate(
			function(type, source, userData)
			{
				if (id == userData)
					if (type == TimelineEvent.CANCEL || !f(o.progress)) return false;
				return true;
			}));
	}
	
	/**
	 * Binds a function <code>f</code> to an interval; <code>f</code> is invoked when the interval completes.
	 * @param id the interval id returned by <em>Timeline.instance().schedule()</em>.
	 */
	public function onComplete(f:Void->Void, id:Int):Void
	{
		Timeline.instance().attach(Observable.delegate(
			function(type, source, userData)
			{
				if (id == userData)
				{
					f();
					return false;
				}
				return true;
			}
		), TimelineEvent.CANCEL | TimelineEvent.INTERVAL_END);
	}
	
	/**
	 * Interface de.polygonal.core.event.IObserver.
	 */
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		advance();
	}

	/**
	 * Updates the timeline.
	 */
	public function advance():Void
	{
		_currTick = _timebase.getProcessedTicks();
		_currSubTick = 0;
		
		var interval, node;
		
		//additions are buffered to optimize cancelling of pending intervals (heap removal is expensive)
		for (i in 0..._pendingAdditions.size())
		{
			interval = _pendingAdditions.dequeue();
			if (interval.isCancelled())
				_notify(TimelineEvent.CANCEL, interval);
			else
			{
				D.assert(!_intervalHeap.contains(interval), "!_intervalHeap.contains(interval)");
				_intervalHeap.add(interval);
			}
		}
		
		//process active events
		node = _runningIntervals.head;
		while (node != null)
		{
			interval = node.val;
			if (interval.isCancelled())
			{
				node = node.unlink();
				_notify(TimelineEvent.CANCEL, interval);
				continue;
			}
			
			interval.ageTicks++;
			_notify(TimelineEvent.INTERVAL_PROGRESS, interval);
			
			//die?
			if (interval.ageTicks == interval.deathTicks)
			{
				node = node.unlink();
				_notify(TimelineEvent.INTERVAL_END, interval);
				
				//loop or repeat?
				if (interval.iterations != 0)
				{
					interval.rise();
					interval.subTicks = _currSubTick++;
					_pendingAdditions.enqueue(interval);
				}
				else
					_putInterval(interval);
			}
			else
				node = node.next;
		}
		
		//process pending events
		while (true)
		{
			if (_intervalHeap.isEmpty()) break;
			
			//get next upcoming event
			var interval = _intervalHeap.top();
			
			if (interval.isCancelled())
			{
				_intervalHeap.pop();
				_putInterval(interval);
				_notify(TimelineEvent.CANCEL, interval);
				continue;
			}
			
			//ready?
			if (interval.ageTicks <= _currTick)
			{
				_intervalHeap.pop();
				
				//blip?
				if (interval.ageTicks == interval.deathTicks)
				{
					_notify(TimelineEvent.BLIP, interval);
					
					//loop or repeat?
					if (interval.doRepeat())
					{
						interval.rise();
						interval.subTicks = _currSubTick++;
						_pendingAdditions.enqueue(interval);
					}
					else
						_putInterval(interval);
				}
				else
				{
					_runningIntervals.append(interval);
					_notify(TimelineEvent.INTERVAL_START, interval);
					_notify(TimelineEvent.INTERVAL_PROGRESS, interval);
				}
				continue;
			}
			break;
		}
	}
	
	inline function _getInterval()
	{
		if (_intervalPool.isEmpty())
		{
			#if warnings
			de.polygonal.core.log.Log.getLog(Timeline).warn("TimeInterval pool exhausted");
			#end
			return new TimeInterval();
		}
		else
		{
			var poolId = _intervalPool.next();
			var interval = _intervalPool.get(poolId);
			interval.poolId = poolId;
			return interval;
		}
	}
	
	inline function _putInterval(x)
	{
		_intervalPool.put(x.poolId);
	}
	
	inline function _notify(type, interval)
	{
		_currInterval = interval;
		notify(type, interval.id);
	}
}

private class TimeInterval implements Heapable<TimeInterval>, implements Cloneable<TimeInterval>
{
	public var id:Int;
	public var poolId:Int;
	public var birthTicks:Int;
	public var ageTicks:Int;
	public var deathTicks:Int;
	public var intervalTicks:Int;
	public var subTicks:Int;
	public var iterations:Int;
	public var iteration:Int;
	
	public var position:Int;
	
	public function new()
	{
	}
	
	inline public function ratio()
	{
		return (ageTicks - birthTicks) / life();
	}
	
	inline public function life()
	{
		return (deathTicks - birthTicks);
	}
	
	inline public function rise()
	{
		var delayTicks = life() + intervalTicks;
		birthTicks += delayTicks;
		deathTicks += delayTicks;
		ageTicks = birthTicks;
		
		if (iterations != -1)
		{
			iterations--;
			iteration++;
		}
	}
	
	inline public function cancel()
	{
		ageTicks = -1;
	}
	
	inline public function isCancelled()
	{
		return ageTicks == -1;
	}
	
	inline public function doRepeat()
	{
		return iterations != 0;
	}
	
	public function compare(other:TimeInterval):Int
	{
		var dt = other.ageTicks - ageTicks;
		return dt == 0 ? (other.subTicks - subTicks) : dt;
	}
	
	public function clone():TimeInterval
	{
		var interval           = new TimeInterval();
		interval.id            = id;
		interval.birthTicks    = birthTicks;
		interval.ageTicks      = ageTicks;
		interval.deathTicks    = deathTicks;
		interval.intervalTicks = intervalTicks;
		interval.subTicks      = subTicks;
		interval.iterations    = iterations;
		return interval;
	}
	
	public function toString():String
	{
		var s = "";
		if (iterations == -1)
			s = "repeat=inf";
		else
		if (iterations > 0)
			s = Sprintf.format("repeat=%d", [iterations]);
			
		if (life() == 0)
			return Sprintf.format("Blip id=%d[%d] start=%d %s", [id, subTicks, birthTicks, s]);
		else
			return Sprintf.format("Event id=%d[%d] from=%d to=%d progress %.2f %s", [id, subTicks, birthTicks, deathTicks, ratio(), s]);
	}
}