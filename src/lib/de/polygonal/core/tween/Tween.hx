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
package de.polygonal.core.tween;

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.math.interpolation.Interpolation;
import de.polygonal.core.math.interpolation.Mapping;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.time.Timebase;
import de.polygonal.core.time.TimebaseEvent;
import de.polygonal.core.time.Timeline;
import de.polygonal.core.time.TimelineEvent;
import de.polygonal.core.tween.ease.Ease;
import de.polygonal.core.tween.ease.EaseFactory;
import de.polygonal.ds.DA;

class Tween implements IObservable, implements IObserver
{
	static var _activeTweens:DA<Tween>;
	
	static var _map:Hash<Tween>;
	
	public static function stopActiveTweens():Void
	{
		for (i in _activeTweens) i.free();
		if (_activeTweens.isEmpty()) _activeTweens = null;
	}
	
	public static function get(key:String):Tween
	{
		if (_map == null) return null;
		return _map.get(key);
	}
	
	public static function purge():Void
	{
		for (i in _map.keys())
		{
			var tween = _map.get(i);
			if (tween._id == -1)
			{
				tween.free();
				_map.remove(i);
			}
		}
	}
	
	var _id:Int;
	var _key:String;
	var _target:TweenTarget;
	var _a:Float;
	var _b:Float;
	var _min:Float;
	var _max:Float;
	var _ease:Interpolation<Float>;
	var _interpolate:Bool;
	var _duration:Float;
	var _delay:Float;
	var _yoyo:Bool;
	var _repeat:Int;
	var _onComplete:Void->Void;
	
	var _observable:Observable;
	var _timeline:Timeline;
	
	public function new(?key:String, target:TweenTarget, ease:Ease, to:Float, duration:Float, ?interpolateState = true)
	{
		if (ease == null) ease = Ease.None;
		
		_key         = key;
		_target      = target;
		_ease        = EaseFactory.create(ease);
		_min         = target.get();
		_max         = to;
		_duration    = duration;
		_delay       = 0;
		_interpolate = interpolateState;
		_observable  = null;
		_timeline    = Timeline.instance();
		_yoyo        = false;
		_repeat      = 0;
	}
	
	public function free():Void
	{
		Timeline.sDetach(this);
		Timeline.sCancel(_id);
		if (_interpolate) Timebase.sDetach(this);
		
		if (_key != null) _map.remove(_key);
		if (_observable != null) _observable.free();
		
		_target     = null;
		_observable = null;
		_timeline   = null;
		_onComplete = null;
		
		if (_activeTweens != null)
			_activeTweens.remove(this);
	}
	
	public var progress(_progressGetter, never):Float;
	inline function _progressGetter():Float
	{
		return Mapping.map(_b, _min, _max, 0, 1);
	}
	
	public function run(?onComplete:Void->Void):Tween
	{
		if (_key != null)
		{
			if (_map == null) _map = new Hash();
			
			if (_map.exists(_key))
			{
				var tween = _map.get(_key);
				//stop running tween
				if (tween._id != -1)
				{
					tween.cancel();
				}
			}
			else
				_map.set(_key, this);
		}
		
		_min = _target.get();
		if (onComplete != null)
			_onComplete = onComplete;
		
		Timeline.sAttach(this);
		_id = Timeline.sSchedule(_duration, _delay);
		return this;
	}
	
	public function once():Tween
	{
		_yoyo = false;
		return this;
	}
	
	public function yoyo(repeat = 0):Tween
	{
		_repeat = repeat + 1;
		_yoyo = true;
		return this;
	}
	
	public function ease(x:Ease):Tween
	{
		_ease = EaseFactory.create(x);
		return this;
	}
	
	public function from(x:Float):Tween
	{
		_min = x;
		return this;
	}
	
	public function to(x:Float):Tween
	{
		_max = x;
		return this;
	}
	
	public function duration(x:Float):Tween
	{
		_duration = x;
		return this;
	}
	
	public function delay(x:Float):Tween
	{
		_delay = x;
		return this;
	}
	
	public function onComplete(x:Void->Void):Tween
	{
		_onComplete = x;
		return this;
	}
	
	public function cancel():Tween
	{
		Timeline.sCancel(_id);
		return this;
	}
	
	public function attach(o:IObserver, mask:Int = 0):Void 
	{
		if (_observable == null) _observable = new Observable(0, this);
		_observable.attach(o, mask);
	}
	
	public function detach(o:IObserver, mask:Int = 0):Void 
	{
		if (_observable != null) _observable.attach(o, mask);
	}
	
	public function notify(type:Int, userData:Dynamic = null):Void 
	{
		if (_observable != null) _observable.notify(type, userData);
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void 
	{
		if (TimelineEvent.has(type))
		{
			if (_timeline.id == _id)
			{
				switch (type)
				{
					case TimelineEvent.INTERVAL_START:
						if (_activeTweens == null) _activeTweens = new DA();
						_activeTweens.pushBack(this);
						if (_interpolate) Timebase.sAttach(this, TimebaseEvent.RENDER);
						_a = _b = _min;
						if (!_interpolate) _target.set(_b);
						notify(TweenEvent.START);
					
					case TimelineEvent.INTERVAL_PROGRESS:
						var alpha:Float = _timeline.progress;
						_a = _b; _b = Mathematics.lerp(_min, _max, _ease.interpolate(alpha));
						if (!_interpolate) _target.set(_b);
						notify(TweenEvent.ADVANCE, _b);
					
					case TimelineEvent.INTERVAL_END:
						source.detach(this);
						_id = -1;
						_a = _b = _max;
						_target.set(_b);
						
						if (_yoyo && _repeat-- > 0)
						{
							var tmp = _min; _min = _max; _max = tmp;
							run(_onComplete);
							return;
						}
						else
						{
							_activeTweens.remove(this);
							notify(TweenEvent.FINISH);
							if (_onComplete != null)
								_onComplete();
						}
						
						if (_key == null && _id == -1) free();
					
					case TimelineEvent.CANCEL:
						_activeTweens.remove(this);
						source.detach(this);
						_id = -1;
						_target.set(_b);
						notify(TweenEvent.FINISH);
						if (_onComplete != null) _onComplete();
						if (_key == null && _id == -1) free();
				}
			}
		}
		else
		if (type == TimebaseEvent.RENDER)
		{
			if (_id == -1)
			{
				source.detach(this);
				return;
			}
			
			var alpha:Float = userData;
			_target.set(Mathematics.lerp(_a, _b, alpha));
		}
	}
}