/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.time; 

import com.pblabs.engine.debug.Log;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.IQueuedObject;
import com.pblabs.engine.time.ITickedObject;

import com.pblabs.util.ReflectUtil;

#if flash
import flash.utils.Timer;
import flash.display.Stage;
import flash.events.TimerEvent;
#else
import com.pblabs.engine.time.Timer;
#end

import com.pblabs.util.MathUtil;

import com.pblabs.util.ds.MultiMap;
using com.pblabs.util.NumberUtil;

/** It provides mechanisms for performing actions every frame, every tick, or
 * at a specific time in the future.
 * 
 * <p>A tick happens at a set interval defined by the TICKS_PER_SECOND constant.
 * Using ticks for various tasks that need to happen repeatedly instead of
 * performing those tasks every frame results in much more consistent output.
 * However, for animation related tasks, frame events should be used so the
 * display remains smooth.</p>
 * 
 * @see ITickedObject
 * @see IAnimatedObject
 */
class ProcessManager implements IProcessManager 
{
    public var paused (get_paused, set_paused) :Bool;
    public var started (get_started, set_started) :Bool;
    public var TimeScale(get_timeScale, set_timeScale) : Float;
    public var frameCounter(get_frameCounter, null) : Int;
    public var interpolationFactor(get_interpolationFactor, null) : Float;
    public var isTicking(get_isTicking, null) : Bool;
    public var listenerCount(get_listenerCount, null) : Int;
    public var platformTime(get_platformTime, set_platformTime) : Float;
    public var timeScale(get_timeScale, set_timeScale) : Float;
    public var virtualTime (get_virtualTime, set_virtualTime) : Float;
    
    /**
     * Process managers can be under external control.
     */
    public var isUsingInternalTimer :Bool;
    
    public function new() 
    { 
        disableSlowWarning = true;
        TICKS_PER_SECOND = 30;
        TICK_RATE = 1.0 / TICKS_PER_SECOND;
        TICK_RATE_MS = Std.int(TICK_RATE * 1000);
        MAX_TICKS_PER_FRAME = 5;
        // deferredMethodQueue = [];
        started = false;
        virtualTime = 0.0;
        _interpolationFactor = 0.0;
        timeScale = 1.0;
        lastTime = -1.0;
        elapsed = 0;
        animatedObjects = new Array();
        tickedObjects = new Array();
        needPurgeEmpty = false;
        _platformTime = 0;
        _frameCounter = 0;
        _duringAdvance = false;
        // thinkHeap = new SimplePriorityQueue(4096);
        isUsingInternalTimer = true;
        paused = false;
    }
    
    
    // public var game:PBGame;
    
    /**
     * If true, disables warnings about losing ticks.
     */
    public var disableSlowWarning :Bool;
    
    /**
     * The number of ticks that will happen every second.
     */
    public var TICKS_PER_SECOND :Int;
    
    /**
     * The rate at which ticks are fired, in seconds.
     */
    public var TICK_RATE :Float;
    
    /**
     * The rate at which ticks are fired, in milliseconds.
     */
    public var TICK_RATE_MS :Int;
    
    /**
     * The maximum number of ticks that can be processed in a frame.
     * 
     * <p>In some cases, a single frame can take an extremely long amount of
     * time. If several ticks then need to be processed, a game can
     * quickly get in a state where it has so many ticks to process
     * it can never catch up. This is known as a death spiral.</p>
     * 
     * <p>To prevent this we have a safety limit. Time is dropped so the
     * system can catch up in extraordinary cases. If your game is just
     * slow, then you will see that the ProcessManager can never catch up
     * and you will constantly get the "too many ticks per frame" warning,
     * if you have disableSlowWarning set to true.</p>
     */
    public var MAX_TICKS_PER_FRAME :Int;
    

    /**
     * The scale at which time advances. If this is set to 2, the game
     * will play twice as fast. A value of 0.5 will run the
     * game at half speed. A value of 1 is normal.
     */
    function get_timeScale():Float
    {
        return timeScale;
    }
    
    function set_timeScale(value:Float):Float
    {
        _timeScale = value;
        return value;
    }
    
    /**
     * Used to determine how far we are between ticks. 0.0 at the start of a tick, and
     * 1.0 at the end. Useful for smoothly interpolating visual elements.
     */
    function get_interpolationFactor():Float
    {
        return _interpolationFactor;
    }
    
    /**
     * The amount of time that has been processed by the process manager. This does
     * take the time scale into account. Time is in milliseconds.
     */
    function get_virtualTime():Float
    {
        return virtualTime;
    }
    
    function set_virtualTime (time :Float) :Float
    {
        _virtualTime = time;
        return time;
    }
    
    /**
     * Current time reported by getTimer(), updated every frame. Use this to avoid
     * costly calls to getTimer(), or if you want a unique number representing the
     * current frame.
     */
    function get_platformTime():Float
    {
        return _platformTime;
    }
    
    function set_platformTime (time :Float) :Float
    {
        throw "Cannot set platform time in this version";
        return time;
    }
    
    /**
     * Integer identifying this frame. Incremented by one for every frame.
     */
    function get_frameCounter():Int
    {
        return _frameCounter;
    }
    
    /**
     * Starts the process manager. This is automatically called when the first object
     * is added to the process manager. If the manager is stopped manually, then this
     * will have to be called to restart it.
     */
    public function start ():Void
    {
        Log.info("Starting ProcessManager");
        
        if (started) {
            Log.warn("The ProcessManager is already started.");
            return;
        }
        
        lastTime = -1.0;
        elapsed = 0;
        
        if (_timer == null && isUsingInternalTimer) {
            #if flash
            _timer = new Timer(untyped flash.Lib.current.stage["frameRate"]);
            _timer.addEventListener(TimerEvent.TIMER, onFrame);
            _timer.start();
            #else
            _timer = new Timer(Std.int(1000/30));
            _timer.run = onFrame;
            #end
        }
        
        // if (timer == null)
        //     timer = new Timer(32);
        // timer.delay = 1000 / game.mainStage.frameRate;
        // timer.start();
        // timer.addEventListener(TimerEvent.TIMER, onFrame);
        started = true;
        #if flash
        Log.info("Started at " + (untyped flash.Lib.current.stage["frameRate"]) + "Hz");
        #end
    }
    
    /**
     * Stops the process manager. This is automatically called when the last object
     * is removed from the process manager, but can also be called manually to, for
     * example, pause the game.
     */
    public function stop():Void
    {
        paused = true;
        if (!started)
        {
            Log.warn("The ProcessManager isn't started.");
            return;
        }
        
        Log.info("Stopping ProcessManager");
        
        if (isUsingInternalTimer) {
            _timer.stop();
            #if flash
            _timer.removeEventListener(TimerEvent.TIMER, onFrame);
            #end
            // untyped flash.Lib.current.stage.removeEventListener(Event.ENTER_FRAME, onFrame);
            // game.mainStage.removeEventListener(Event.ENTER_FRAME, onFrame);
        }
        started = false;
        
    }
    
    /**
     * Returns true if the process manager is advancing.
     */ 
    public function get_isTicking():Bool
    {
        return started && _timeScale > 0;
    }
    
    /**
     * Schedules a function to be called at a specified time in the future.
     * 
     * @param delay The number of milliseconds in the future to call the function.
     * @param thisObject The object on which the function should be called. This
     * becomes the 'this' variable in the function.
     * @param callback The function to call.
     * @param arguments The arguments to pass to the function when it is called.
     */
    // public function schedule(delay:Float, thisObject:Dynamic, callBack:Dynamic, arguments:Array<Dynamic>):Void
    // {
    //     if (!started)
    //         start();
        
    //     var schedule:ScheduleObject = new ScheduleObject();
    //     schedule.dueTime = virtualTime + delay;
    //     schedule.thisObject = thisObject;
    //     schedule.callBack = callBack;
    //     schedule.arguments = arguments;
        
    //     thinkHeap.enqueue(schedule);
    // }
    
    /**
     * Registers an object to receive frame callbacks.
     * 
     * @param object The object to add.
     * @param priority The priority of the object. Objects added with higher priorities
     * will receive their callback before objects with lower priorities. The highest
     * (first-processed) priority is Math.POSITIVE_INFINITY. The lowest (last-processed) 
     * priority is -Math.POSITIVE_INFINITY.
     */
    public function addAnimatedObject(object:IAnimatedObject, ?priority:Float = 0.0):Void
    {
        addObject(object, priority, animatedObjects);
    }
    
    /**
     * Registers an object to receive tick callbacks.
     * 
     * @param object The object to add.
     * @param priority The priority of the object. Objects added with higher priorities
     * will receive their callback before objects with lower priorities. The highest
     * (first-processed) priority is Math.POSITIVE_INFINITY. The lowest (last-processed) 
     * priority is -Math.POSITIVE_INFINITY.
     */
    public function addTickedObject(object:ITickedObject, ?priority:Float = 0.0):Void
    {
        addObject(object, priority, tickedObjects);
    }
    
    /**
     * Queue an IQueuedObject for callback. This is a very cheap way to have a callback
     * happen on an object. If an object is queued when it is already in the queue, it
     * is removed, then added.
     */
    // public function queueObject(object:IQueuedObject):Void
    // {
    //     // Assert if this is in the past.
    //     if(object.nextThinkTime < _virtualTime)
    //         throw "Tried to queue something into the past, but no flux capacitor is present!";
        
    //     if(object.nextThinkTime >= _virtualTime && thinkHeap.contains(object))
    //         thinkHeap.remove(object);
        
    //     if(!thinkHeap.enqueue(object))
    //         Log.print(this, "Thinking queue length maxed out!");
    // }
    
    /**
     * Remove an IQueuedObject for consideration for callback. No error results if it
     * was not in the queue.
     */
    // public function dequeueObject(object:IQueuedObject):Void
    // {
    //     if(thinkHeap.contains(object))
    //         thinkHeap.remove(object);
    // }
    
    /**
     * Unregisters an object from receiving frame callbacks.
     * 
     * @param object The object to remove.
     */
    public function removeAnimatedObject(object:IAnimatedObject):Void
    {
        removeObject(object, animatedObjects);
    }
    
    /**
     * Unregisters an object from receiving tick callbacks.
     * 
     * @param object The object to remove.
     */
    public function removeTickedObject(object:ITickedObject):Void
    {
        removeObject(object, tickedObjects);
    }
    
    /**
     * Forces the process manager to advance by the specified amount. This should
     * only be used for unit testing.
     * 
     * @param amount The amount of time to simulate.
     */
    public function testAdvance(amount:Float):Void
    {
        advanceInternal(amount * _timeScale, true);
    }
    
    /**
     * Forces the process manager to seek its virtualTime by the specified amount.
     * This moves virtualTime without calling advance and without processing ticks or frames.
     * WARNING: USE WITH CAUTION AND ONLY IF YOU REALLY KNOW THE CONSEQUENCES!
     */
    public function seek(amount:Float):Void
    {
        _virtualTime += amount;
    }
    
    // public function callLater(method:Dynamic, ?args:Array<Dynamic> = null):Void
    // {
    //     PBUtil.callLater(method, args);
    // }
    
    /**
     * @return How many objects are depending on the ProcessManager right now?
     */
    function get_listenerCount():Int
    {
        return tickedObjects.length + animatedObjects.length;
    }
    
    /**
     * Internal function add an object to a list with a given priority.
     * @param object Object to add.
     * @param priority Priority; this is used to keep the list ordered.
     * @param list List to add to.
     */
    function addObject(object:Dynamic, priority:Float, list:Array<Dynamic>):Void
    {
        // If we are in a tick, defer the add.
        if(_duringAdvance)
        {
            //TODO: call later
            // PBUtil.callLater(addObject, [ object, priority, list]);
            trace("during advance, we'll call later, or will we?");
            return;
        }
        
        if (!started)
            start();
        
        var position:Int = -1;
        for (i in 0...list.length)
        {
            if(!list[i])
                continue;
            
            if (list[i].listener == object)
            {
                Log.warn("This object has already been added to the process manager.");
                return;
            }
            
            if (list[i].priority < priority)
            {
                position = i;
                break;
            }
        }
        
        var processObject:ProcessObject = new ProcessObject();
        processObject.listener = object;
        processObject.priority = priority;
        processObject.profilerKey = ReflectUtil.getClassName(object);
        
        if (position < 0 || position >= list.length)
            list.push(processObject);
        else
            list.insert(position, processObject);
    }
    
    /**
     * Peer to addObject; removes an object from a list. 
     * @param object Object to remove.
     * @param list List from which to remove.
     */
    function removeObject(object:Dynamic, list:Array<Dynamic>):Void
    {
        if (listenerCount == 1)// && thinkHeap.size == 0)
            stop();
        
        for (i in 0...list.length)
        {
            if(!list[i])
                continue;
            
            if (list[i].listener == object)
            {
                if(_duringAdvance)
                {
                    list[i] = null;
                    needPurgeEmpty = true;
                }
                else
                {
                    list.splice(i, 1);                        
                }
                
                return;
            }
        }
        
        Log.warn(object + ": object has not been added to the process manager.");
    }
    
    /**
     * Main callback; this is called every frame and allows game Logic to run. 
     */
    public function onFrame (#if flash event:TimerEvent #end):Void
    {
        // This is called from a system event, so it had better be at the 
        // root of the profiler stack!
        #if profiler
        com.pblabs.engine.debug.Profiler.ensureAtRoot();
        #end
        
        // trace("started=" + started + ",  paused=" + paused);
        // Safety for when we've stop()'ed.
        if(!started || paused) {
            lastTime = haxe.Timer.stamp();
            return;
        }
        
        // Track current time.
        var currentTime = haxe.Timer.stamp();
        if (lastTime < 0)
        {
            lastTime = currentTime;
            Log.debug("lastTime < 0");
            return;
        }
        
        _timer.stop();
        
        // Bump the frame counter.
        _frameCounter++;
        
        // Calculate time since last frame and advance that much.
        var deltaTime = (currentTime - lastTime) * _timeScale;
        advanceInternal(deltaTime);
        
        // Note new last time.
        lastTime = currentTime;
        
        // Rejigger our events so we get called back soon.
        _timer.start();
        #if flash
        event.updateAfterEvent();
        untyped flash.Lib.current.stage.invalidate();
        #end
        // if(game.mainStage)
        //     game.mainStage.invalidate();
    }
    
    public function advance (deltaTime:Float):Void
    {
        advanceInternal(deltaTime);
    }
    
    function advanceInternal (deltaTime:Float, ?suppressSafety:Bool = false):Void
    {
        // Update platform time, to avoid lots of costly calls to getTimer.
        _platformTime = haxe.Timer.stamp();
        
        // Note virtual time we started advancing from.
        var startTime = _virtualTime;
        
        // Add time to the accumulator.
        elapsed += Std.int(deltaTime * 1000);
        
        // Perform ticks, respecting tick caps.
        var tickCount:Int = 0;
        while (elapsed >= TICK_RATE_MS && (suppressSafety || tickCount < MAX_TICKS_PER_FRAME))
        {
            // Ticks always happen on interpolation boundary.
            _interpolationFactor = 0.0;
            
            // Process pending events at this tick.
            // This is done in the loop to ensure the correct order of events.
            // processScheduledObjects();
            
            // Do the onTick callbacks, noting time in profiler appropriately.
            #if profiler
            com.pblabs.engine.debug.Profiler.enter("Tick");
            #end
            
            _duringAdvance = true;
            for(j in 0...tickedObjects.length)
            {
                var object:ProcessObject = cast( tickedObjects[j], ProcessObject);
                if(object == null)
                    continue;
                
                #if profiler
                com.pblabs.engine.debug.Profiler.enter(object.profilerKey);
                #end
                (cast( object.listener, ITickedObject)).onTick(TICK_RATE);
                #if profiler
                com.pblabs.engine.debug.Profiler.exit(object.profilerKey);
                #end
            }
            _duringAdvance = false;
            
            #if profiler
            com.pblabs.engine.debug.Profiler.exit("Tick");
            #end
            
            // Update virtual time by subtracting from accumulator.
            _virtualTime += TICK_RATE_MS;
            elapsed -= TICK_RATE_MS;
            tickCount++;
        }
        
        // Safety net - don't do more than a few ticks per frame to avoid death spirals.
        if (tickCount >= MAX_TICKS_PER_FRAME && !suppressSafety && !disableSlowWarning)
        {
            // By default, only show when profiling.
            Log.warn(["advance", "Exceeded maximum number of ticks for frame (" + elapsed.toFixed(1) + "ms dropped) ."]);
        }
        
        // Make sure that we don't fall behind too far. This helps correct
        // for short-term drops in framerate as well as the scenario where
        // we are consistently running behind.
        elapsed = MathUtil.clamp(elapsed, 0, 300);
        
        // Make sure we don't lose time to accumulation error.
        // Not sure this gains us anything, so disabling -- BJG
        //virtualTime = startTime + deltaTime;
        
        // We process scheduled items again after tick processing to ensure between-tick schedules are hit
        // Commenting this out because it can cause too-often calling of callLater methods. -- BJG
        // processScheduledObjects();
        
        // Update objects wanting OnFrame callbacks.
        #if profiler
        com.pblabs.engine.debug.Profiler.enter("frame");
        #end
        _duringAdvance = true;
        _interpolationFactor = elapsed / TICK_RATE_MS;
        for(i in 0...animatedObjects.length)
        {
            var animatedObject:ProcessObject = cast( animatedObjects[i], ProcessObject);
            if(animatedObject == null)
                continue;
            
            #if profiler
            com.pblabs.engine.debug.Profiler.enter(animatedObject.profilerKey);
            #end
            (cast( animatedObject.listener, IAnimatedObject)).onFrame(deltaTime / 1000);
            #if profiler
            com.pblabs.engine.debug.Profiler.exit(animatedObject.profilerKey);
            #end
        }
        _duringAdvance = false;
        #if profiler
        com.pblabs.engine.debug.Profiler.exit("frame");
        #end
        
        // Pump the call later queue.
        // Profiler.enter("callLater_postFrame");
        // PBUtil.processCallLaters();
        // Profiler.exit("callLater_postFrame");
        
        // Purge the lists if needed.
        if(needPurgeEmpty)
        {
            needPurgeEmpty = false;
            
            #if profiler
            com.pblabs.engine.debug.Profiler.enter("purgeEmpty");
            #end
            
            var j :Int = 0;
            while (j < animatedObjects.length) {
                if(animatedObjects[j] == null) {
                    j++;
                    continue;
                }
                animatedObjects.splice(j, 1);
            }
            // for(j in 0...animatedObjects.length)
            // {
                
                
            //     j--;
            // }
            j = 0;
            while (j < tickedObjects.length) {
                if(tickedObjects[j] == null) {
                    j++;
                    continue;
                }
                tickedObjects.splice(j, 1);
            }
            
            // for(k in 0...tickedObjects.length)
            // {                    
            //     if(tickedObjects[k])
            //         continue;
                
            //     tickedObjects.splice(k, 1);
            //     k--;
            // }
            
            #if profiler
            com.pblabs.engine.debug.Profiler.exit("purgeEmpty");
            #end
        }
        
        #if profiler
        com.pblabs.engine.debug.Profiler.ensureAtRoot();
        #end
    }
    
    // function processScheduledObjects():Void
    // {
    //     // Pump the call later queue.
    //     Profiler.enter("callLater");
    //     PBUtil.processCallLaters();
    //     Profiler.exit("callLater");
        
    //     // Process any queued items.
    //     if(thinkHeap.size)
    //     {
    //         Profiler.enter("Queue");
            
    //         while(thinkHeap.size && thinkHeap.front.priority >= -virtualTime)
    //         {
    //             var itemRaw:IPrioritizable = thinkHeap.dequeue();
    //             var qItem:IQueuedObject = cast( itemRaw, IQueuedObject);
    //             var sItem:ScheduleObject = cast( itemRaw, ScheduleObject);
                
    //             var type:String = TypeUtility.getObjectClassName(itemRaw);
                
    //             Profiler.enter(type);
    //             if(qItem)
    //             {
    //                 // Check here to avoid else block that throws an error - empty callback
    //                 // means it unregistered.
    //                 if(qItem.nextThinkCallback != null)
    //                     qItem.nextThinkCallback();
    //             }
    //             else if(sItem && sItem.callback != null)
    //             {
    //                 sItem.callback.apply(sItem.thisObject, sItem.arguments);                    
    //             }
    //             else
    //             {
    //                 throw "Unknown type found in thinkHeap.";
    //             }
    //             Profiler.exit(type);                    
                
    //         }
            
    //         Profiler.exit("Queue");                
    //     }
    // }
    
    function get_started () :Bool
    {
        return _isStarted;
    }
    
    function set_started (value :Bool) :Bool
    {
        _isStarted = value;
        return value;
    }
    
    function get_paused () :Bool
    {
        return _paused;
    }
    
    function set_paused (val :Bool) :Bool
    {
        // trace("Paused=" + val + "      " + Log.getStackTrace());
        _paused = val;
        return val;
    }
    
    var _paused :Bool;
    var _timer :Timer;
    var _virtualTime :Float;
    var _timeScale :Float;
    var _isStarted :Bool;
    var _interpolationFactor :Float;
    var lastTime :Float;
    var elapsed :Int;
    var animatedObjects:Array<Dynamic>;
    var tickedObjects:Array<Dynamic>;
    var needPurgeEmpty:Bool;
    
    var _deferredCallbacks :MultiMap<Int, Void->Void>;
    var _platformTime :Float;
    var _frameCounter :Int;
    var _duringAdvance :Bool;
}

class ProcessObject
{
    public function new () 
    {
        profilerKey = null;
        priority = 0.0;
        listener = null;
    }
    
	public var profilerKey :String;
	public var listener :Dynamic;
	public var priority :Float;
}


