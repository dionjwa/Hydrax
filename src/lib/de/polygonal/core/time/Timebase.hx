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
package de.polygonal.core.time;

import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.util.Assert;
import haxe.Timer;

/**
 * A Timebase is a constantly ticking source of time.
 */
class Timebase extends Observable
{
	static var _instance:Timebase;
	public  static function instance():Timebase
	{
		if (_instance == null)
			_instance = new Timebase();
		return _instance;
	}
	
	#if !swc
	public static var get(_getGetter, never):Timebase;
	inline static function _getGetter():Timebase { return instance(); }
	#end
	
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
	 * Converts <code>x</code> seconds to ticks.
	 */
	inline public static function secondsToTicks(x:Float):Int
	{
		return Mathematics.round(x / instance().getTickRate());
	}
	
	/**
	 * Converts <code>x</code> ticks to seconds.
	 */
	inline public static function ticksToSeconds(x:Int):Float
	{
		return x * instance().getTickRate();
	}
	
	var _tickRate:Float;
	var _nTicks:Int;
	var _nFrames:Int;
	var _timeScale:Float;
	var _realTime:Float;
	var _gameTime:Float;
	var _gameTimeDelta:Float;
	var _realTimeDelta:Float;
	var _past:Float;
	var _accumulator:Float;
	var _accumulatorLimit:Float;
	var _freezeDelay:Float;
	var _halted:Bool;
	
	#if js
	var _timer:haxe.Timer;
	#end
	
	function new()
	{
		super(100);
		
		#if (flash || cpp)
		flash.Lib.current.addEventListener(flash.events.Event.ENTER_FRAME, _onEnterFrame);
		#elseif js
		_timer = new haxe.Timer(33);
		_timer.run = _step;
		#end
		
		useFixedTimeStep  = true;
		_tickRate         = 1 / 60;
		_accumulatorLimit = 10 * _tickRate;
		_accumulator      = 0;
		_nTicks           = 0;
		_nFrames          = 0;
		_timeScale        = 1;
		_realTime         = 0;
		_gameTime         = 0;
		_gameTimeDelta    = 0;
		_realTimeDelta    = 0;
		_past             = _stamp();
	}
	
	/**
	 * Destroys the system by removing all registered observers and explicitly nullifying all references for GC'ing used resources.
	 * The system is automatically reinitialized once an observer is attached.
	 */	
	override public function free()
	{
		if (_instance == null) return;
		_instance = null;
		
		super.free();
		
		#if (flash || cpp)
		flash.Lib.current.removeEventListener(flash.events.Event.ENTER_FRAME, _onEnterFrame);
		#elseif js
		_timer.stop();
		_timer.run = null;
		_timer = null;
		#end
	}
	
	/**
	 * If true, time is consumed using a fixed time step (see <em>Timebase.instance().getTickRate()</em>).<br/>
	 * Default is true.
	 */
	public var useFixedTimeStep:Bool;
	
	/**
	 * The update rate measured in seconds per tick.<br/>
	 * The default update rate is 60 ticks per second (or ~16.6ms per step).
	 */
	inline public function getTickRate():Float
	{
		return _tickRate;
	}
	
	/**
	 * Sets the update rate measured in ticks per second, e.g. a value of 60 indicates that <em>TimebaseEvent.TICK</em> is fired 60 times per second (or every ~16.6ms).
	 * @param max The accumulator limit in seconds. If omitted, <code>max</code> is set to ten times <code>ticksPerSecond</code>.
	 */
	public function setTickRate(ticksPerSecond:Int, max = -1.):Void
	{
		_tickRate         = 1 / ticksPerSecond;
		_accumulator      = 0.;
		_accumulatorLimit = (max == -1. ? 10 : max * _tickRate);
	}
	
	/**
	 * Processed time in seconds.
	 */
	inline public function getRealTime():Float
	{
		return _realTime;
	}
	
	/**
	 * Processed 'virtual' time in seconds (includes scaling).
	 */
	inline public function getGameTime():Float
	{
		return _gameTime;
	}
	
	/**
	 * Frame delta time in seconds.
	 */
	inline public function getRealTimeDelta():Float
	{
		return _realTimeDelta;
	}
	
	/**
	 * 'Virtual' frame delta time in seconds (includes scaling).
	 */
	inline public function getGameTimeDelta():Float
	{
		return _gameTimeDelta;
	}
	
	/**
	 * Returns the current time scale.
	 */
	inline public function getScale():Float
	{
		return _timeScale;
	}
	
	/**
	 * Scales the time by the factor <code>x</code>.
	 */
	inline public function setScale(x:Float)
	{
		D.assert(x >= 0, "x >= 0");
		_timeScale = x;
	}
	
	/**
	 * The total number of processed ticks since the first observer received a <em>TimebaseEvent.TICK</em> update.
	 */
	inline public function getProcessedTicks():Int
	{
		return _nTicks;
	}
	
	/**
	 * The total number of rendered frames since the first observer received a <em>TimebaseEvent.RENDER</em> update.
	 */
	inline public function getProcessedFrames():Int
	{
		return _nFrames;
	}
	
	/**
	 * Stops the flow of time.<br/>
	 * Triggers a <em>TimebaseEvent.HALT</em> update.
	 */
	public function halt():Void
	{
		if (!_halted)
		{
			_halted = true;
			notify(TimebaseEvent.HALT);
		}
	}
	
	/**
	 * Resumes the flow of time.<br/>
	 * Triggers a <em>TimebaseEvent.RESUME</em> update.
	 */
	public function resume():Void
	{
		if (_halted)
		{
			_halted = false;
			_accumulator = 0.;
			_past = _stamp();
			notify(TimebaseEvent.RESUME);
		}
	}
	
	/**
	 * Freezes the flow of time for <code>x</code> seconds.<br/>
	 * Triggers a <em>TimebaseEvent.FREEZE_BEGIN</em> update.
	 */
	public function freeze(x:Float):Void
	{
		_freezeDelay = x;
		_accumulator = 0;
		notify(TimebaseEvent.FREEZE_BEGIN);
	}
	
	/**
	 * Performs a manual update step.<br/>
	 * Silently fails if <code>halt()</code> hasn't been called before.
	 */
	public function manualStep():Void
	{
		if (_halted)
		{
			_realTimeDelta = _tickRate;
			_realTime += _realTimeDelta;
			
			_gameTimeDelta = _tickRate * _timeScale;
			_gameTime += _gameTimeDelta;
			
			notify(TimebaseEvent.TICK, _tickRate);
			_nTicks++;
			
			notify(TimebaseEvent.RENDER, 1);
			_nFrames++;
		}
	}
	
	function _step()
	{
		if (_halted) return;
		
		var now = _stamp();
		var dt = (now - _past);
		_past = now;
		
		_realTimeDelta = dt;
		_realTime += _realTimeDelta;
		
		if (_freezeDelay > 0.)
		{
			_freezeDelay -= _realTimeDelta;
			notify(TimebaseEvent.TICK  , 0.);
			notify(TimebaseEvent.RENDER, 1.);
			
			if (_freezeDelay <= 0.)
				notify(TimebaseEvent.FREEZE_END);
			return;
		}
		
		if (useFixedTimeStep)
		{
			_accumulator += _realTimeDelta * _timeScale;
			
			//clamp accumulator to prevent 'spiral of death'
			if (_accumulator >= _accumulatorLimit)
			{
				#if warnings
				de.polygonal.core.log.Log.getLog(Timebase).warn(Sprintf.format("accumulator clamped from %.2f to %.2f seconds", [_accumulator, _accumulatorLimit]));
				#end
				notify(TimebaseEvent.CLAMP, _accumulator);
				_accumulator = _accumulatorLimit;
			}
			
			_gameTimeDelta = _tickRate * _timeScale;
			while (_accumulator >= _tickRate)
			{
				_accumulator -= _tickRate;
				_gameTime += _gameTimeDelta;
				notify(TimebaseEvent.TICK, _tickRate);
				_nTicks++;
			}
			
			var alpha = _accumulator / _tickRate;
			notify(TimebaseEvent.RENDER, alpha);
			_nFrames++;
		}
		else
		{
			_accumulator = 0;
			_gameTimeDelta = dt * _timeScale;
			_gameTime += _gameTimeDelta;
			notify(TimebaseEvent.TICK, _gameTimeDelta);
			notify(TimebaseEvent.RENDER, 1.);
		}
	}
	
	#if (flash || cpp)
	function _onEnterFrame(e:flash.events.Event):Void 
	{
		_step();
	}
	#end
	
	inline function _stamp():Float
	{
		return
		#if flash
		Date.now().getTime() / 1000
		#else
		haxe.Timer.stamp()
		#end
		;
	}
}