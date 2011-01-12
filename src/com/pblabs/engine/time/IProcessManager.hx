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

import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.ITickedObject;
/**
 * The process manager manages all time related functionality in the engine.
 * It provides mechanisms for performing actions every frame, every tick, or
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
interface IProcessManager//, implements IPBManager
{
	/**
	 * The amount of time that has been processed by the process manager. This does
	 * take the time scale into account. Time is in milliseconds.
	 */
	 var virtualTime (get_virtualTime, set_virtualTime) :Int;
		
	/**
	 * Current time reported by getTimer(), updated every frame. Use this to avoid
	 * costly calls to getTimer(), or if you want a unique number representing the
	 * current frame.  Time is in milliseconds.
	 */
	 var platformTime (get_platformTime, set_platformTime) :Float;

	/**
	 * Starts the process manager. This is automatically called when the first object
	 * is added to the process manager. If the manager is stopped manually, then this
	 * will have to be called to restart it.
	 */
	function start():Void;

	/**
	 * Stops the process manager. This is automatically called when the last object
	 * is removed from the process manager, but can also be called manually to, for
	 * example, pause the game.
	 */
	function stop():Void;
	
	var paused (get_paused, set_paused) :Bool;
	
	/**
	 * Returns true if the process manager is advancing.
	 */ 
	var isTicking(get_isTicking, never):Bool;

	/**
	 * Registers an object to receive frame callbacks.
	 * 
	 * @param object The object to add.
	 * @param priority The priority of the object. Objects added with higher priorities
	 * will receive their callback before objects with lower priorities. The highest
	 * (first-processed) priority is Number.MAX_VALUE. The lowest (last-processed) 
	 * priority is -Number.MAX_VALUE.
	 */
	function addAnimatedObject(object:IAnimatedObject, ?priority:Float = 0.0):Void;

	/**
	 * Unregisters an object from receiving frame callbacks.
	 * 
	 * @param object The object to remove.
	 */
	function removeAnimatedObject(object:IAnimatedObject):Void;

	/**
	 * Registers an object to receive tick callbacks.
	 * 
	 * @param object The object to add.
	 * @param priority The priority of the object. Objects added with higher priorities
	 * will receive their callback before objects with lower priorities. The highest
	 * (first-processed) priority is Number.MAX_VALUE. The lowest (last-processed) 
	 * priority is -Number.MAX_VALUE.
	 */
	function addTickedObject(object:ITickedObject, ?priority:Float = 0.0):Void;

	/**
	 * Unregisters an object from receiving tick callbacks.
	 * 
	 * @param object The object to remove.
	 */
	function removeTickedObject(object:ITickedObject):Void;
		
	/**
	 * Deferred function callback - called back at start of processing for next frame. Useful
	 * any time you are going to do setTimeout(someFunc, 1) - it's a lot cheaper to do it 
	 * this way.
	 * @param method Function to call.
	 * @param args Any arguments.
	 */
	function callLater(method:Void->Dynamic):Void;
}

