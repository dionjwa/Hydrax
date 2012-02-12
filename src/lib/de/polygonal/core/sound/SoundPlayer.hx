/*
 *                          _/                                                    _/   
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
package de.polygonal.core.sound;

import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.log.Log;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.time.Timebase;
import de.polygonal.core.time.TimebaseEvent;
import de.polygonal.core.tween.ease.Ease;
import de.polygonal.core.tween.Tween;
import de.polygonal.core.tween.TweenTarget;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.ArrayedQueue;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DLL;
import de.polygonal.ds.DLLNode;
import de.polygonal.ds.HashMap;
import de.polygonal.ds.pooling.ObjectPool;
import de.polygonal.flash.SwfAssets;
import flash.events.Event;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundMixer;
import flash.media.SoundTransform;

using de.polygonal.core.fmt.StringUtil;

class SoundPlayer extends Observable
{	
	inline static var MAX_AUDIO_CHANNELS = 32;
	inline static var FADE_IN            = 1;
	inline static var FADE_OUT           = 2;
	
	static var _soundPool:Hash<Sound>;
	
	static var _instance:SoundPlayer = null;
	public  static function instance():SoundPlayer
	{
		if (_instance == null)
			_instance = new SoundPlayer();
		return _instance;
	}
	
	#if !swc
	public static var get(_getGetter, never):SoundPlayer;
	inline static function _getGetter():SoundPlayer { return instance(); }
	#end
	
	public static function sAttach(o:IObserver, mask = 0):Void
	{
		instance().attach(o, mask);
	}
	
	public static function sDetach(o:IObserver, mask = 0):Void
	{
		instance().detach(o, mask);
	}
	
	static public function resolveSound(key:String):Sound
	{
		D.assert(_soundPool.exists(key), Sprintf.format('sound with id \'%s\' does not exist', [key]));
		return _soundPool.get(key);
	}
	
	static public function registerSound(key:String, sound:Sound):Void
	{
		D.assert(sound != null, 'sound != null');
		if (_soundPool == null) _soundPool = new Hash();
		D.assert(!_soundPool.exists(key), '!_soundPool.exists(key)');
		_soundPool.set(key, sound);
	}
	
	public static function play(key:String, fadeInDuration = .0, fadeInVolume = 1., repeat = 0, offset = 0):Int
	{
		return instance()._play(key, fadeInDuration, fadeInVolume, repeat, offset);
	}
	
	public static function stop(key:Dynamic, fadeOutDuration = .0):Void
	{
		instance()._stop(key, fadeOutDuration);
	}
	
	public static function stopAll():Void
	{
		instance()._stopAll();
	}
	
	public static function isMuted():Bool
	{
		return instance()._isMuted();
	}
	
	public static function mute(x:Bool):Void
	{
		instance()._setMute(x);
	}
	
	public static function muteToggle():Void
	{
		instance()._muteToggle();
	}
	
	public static function isPlaying(key:Dynamic):Bool
	{
		return instance()._isPlaying(key);
	}
	
	public static function enablePlayback(x:Bool):Void
	{
		instance()._playbackEnabled = x;
	}
	
	var _globalSoundTransform:SoundTransform;
	var _soundNodePool:ObjectPool<SoundNode>;
	var _channelList:DLL<SoundNode>;
	var _dup:HashMap<String, Bool>;
	var _tmp:ArrayedQueue<SoundNode>;
	var _playbackEnabled:Bool;
	
	function new()
	{
		super();
		
		_soundNodePool   = new ObjectPool(MAX_AUDIO_CHANNELS);
		_channelList     = new DLL<SoundNode>();
		_dup             = new HashMap();
		_tmp             = new ArrayedQueue<SoundNode>(MAX_AUDIO_CHANNELS);
		_playbackEnabled = true;
		_soundNodePool.allocate(false, function() return new SoundNode(this));
		Observable.bind(_clearDups, Timebase.instance(), TimebaseEvent.TICK);
	}
	
	override public function free():Void
	{
		super.free();
		
		_channelList.free();
		_dup.free();
		_soundNodePool.free();
		
		_dup = null;
		_soundNodePool = null;
		_channelList = null;
		
		_stopAll();
		_tmp.clear();
	}
	
	public function setVolume(soundId:Int, vol:Float, pan = .0):Void
	{
		for (node in _channelList)
		{
			if (node.id == soundId)
			{
				node.setVolume(vol, pan);
				break;
			}
		}
	}
	
	function _play(key:String, fadeInDuration:Float, fadeInVolume:Float, repeat:Int, offset:Int):Int
	{
		if (_isMuted() || !_playbackEnabled) return -1;
		
		if (_channelList.size() == 32)
		{
			Log.getLog(SoundPlayer).warn('all sound channels occupied');
			return -1;
		}
		
		
		if (_dup.hasKey(key))
			return -1; //skip playing duplicate sound per tick
		
		_dup.set(key, true);
		
		var id            = _soundNodePool.next();
		var node          = _soundNodePool.get(id);
		node.player       = this;
		node.id           = id;
		node.sound        = (_soundPool != null && _soundPool.exists(key)) ? _soundPool.get(key) : SwfAssets.createSound(key);
		node.key          = key;
		node.id           = id;
		node.transform    = new SoundTransform(1, 0);
		node.repeat       = repeat;
		node.soundChannel = node.sound.play(offset, repeat, node.transform);
		
		if (node.soundChannel == null)
		{
			Log.getLog(SoundPlayer).warn('no sound hardware available');
			return -1;
		}
		
		node.soundChannel.addEventListener(Event.SOUND_COMPLETE, node.onSoundComplete);
		node.listNode = _channelList.append(node);
		
		if (fadeInDuration > 0)
		{
			node.setVolume(0, 0);
			if (node.fadeVolume(fadeInDuration, fadeInVolume))
				node.fade = FADE_IN;
		}
		else
			node.setVolume(fadeInVolume, 0);
		
		notify(SoundPlayerEvent.PLAY, id);
		return id;
	}
	
	function _stop(key:Dynamic, fadeOutDuration:Float):Void
	{
		D.assert(_tmp.isEmpty(), "_tmp.isEmpty()");
		
		var f = function(node:SoundNode)
		{
			if (fadeOutDuration > 0)
			{
				if (node.fade == FADE_OUT) return;
				
				if (node.fadeVolume(fadeOutDuration, 0))
				{
					node.fade = FADE_OUT;
					return;
				}
			}
			
			_tmp.enqueue(node);
		}
		
		if (Std.is(key, Int))
		{
			for (node in _channelList)
			{
				if (node.id == key)
				{
					f(node);
					break;
				}
			}
		}
		else
		{
			for (node in _channelList)
			{
				if (node.key == key)
				{
					f(node);
				}
			}
		}
		
		while (!_tmp.isEmpty())
		{
			var node = _tmp.dequeue();
			notify(SoundPlayerEvent.STOP, node.id);
			node.reset();
		}
	}
	
	function _stopAll():Void
	{
		D.assert(_tmp.isEmpty(), "_tmp.isEmpty()");
		
		for (node in _channelList)
			_tmp.enqueue(node);
		
		for (i in 0..._tmp.size())
		{
			var node = _tmp.dequeue();
			notify(SoundPlayerEvent.STOP, node.id);
			node.reset();
		}
	}

	function _isMuted():Bool
	{
		return SoundMixer.soundTransform.volume == 0;
	}
	
	function _setMute(x:Bool):Void
	{
		SoundMixer.soundTransform = new SoundTransform(x ? 0 : 1, 0);
	}

	function _muteToggle():Void
	{
		_setMute(!_isMuted());
	}
	
	function _isPlaying(key:Dynamic):Bool
	{
		if (Std.is(key, Int))
		{
			for (node in _channelList)
			{
				if (node.id == key)
					return true;
			}
		}
		else
		{
			for (node in _channelList)
			{
				if (node.key == key)
					return true;
			}
		}
		return false;
	}
	
	function _getName(soundId:Int):String
	{
		for (node in _channelList)
		{
			if (node.id == soundId)
				return node.key;
		}
		
		return null;
	}
	
	function _clearDups():Bool
	{
		if (_dup == null) return false;
		_dup.clear();
		return true;
	}
	
	public function toString():String
	{
		var s = '';
		
		if (_isMuted()) s+= 'MUTE\n';
		
		var i = 1;
		var walker = _channelList.head;
		while (walker != null)
		{
			var node = walker.val;
			
			if (node.fade != 0)
			{
				var t = node.fade == 1 ? 'in' : 'out';
				s += Sprintf.format('channel %02d | name: %-20s id: %02d | pos: %#4.2f%% vol: %#4.2f rep: %02d [fade %s %d%%]\n',
					[i++, node.key.ellipsis(20, false), node.id, node.soundChannel.position / node.sound.length, node.soundChannel.soundTransform.volume, node.repeat, t, node.tween.progress * 100]);
			}
			else
			{
				s += Sprintf.format('channel %02d | name: %-20s id: %02d | pos: %4.2f%% vol: %4.2f rep: %02d\n',
					[i++, node.key.ellipsis(20, false), Bits.ntz(node.id), node.soundChannel.position / node.sound.length, node.soundChannel.soundTransform.volume, node.repeat]);
			}
			
			walker = walker.next;
		}
		return s;
	}
}

class SoundNode implements TweenTarget
{
	inline static var SKIP_FADE__VOLUME_THRESHOLD  = .1;
	inline static var SKIP_FADE_DURATION_THRESHOLD = .25;
	
	public var id:Int;
	public var key:String;
	public var listNode:DLLNode<SoundNode>;
	public var player:SoundPlayer;
	public var sound:Sound;
	public var soundChannel:SoundChannel;
	public var transform:SoundTransform;
	public var repeat:Int;
	public var fade:Int;
	public var tween:Tween;
	
	public function new(player:SoundPlayer)
	{
		this.player = player;
		tween       = new Tween(this, Ease.PowIn(2), 0, 0).onComplete(_onTweenComplete);
	}
	
	public function get():Float 
	{
		if (transform == null) return 0;
		return transform.volume;
	}
	
	public function set(x:Float):Void 
	{
		setVolume(x);
	}
	
	inline public function setVolume(vol:Float, pan = .0):Void
	{
		if (transform != null)
		{
			transform.volume = vol;
			transform.pan = pan;
			soundChannel.soundTransform = transform;
		}
	}
	
	public function reset():Void
	{
		D.assert(id != -1, 'id != -1');
		
		var f:{ private var _soundNodePool:ObjectPool<SoundNode>; } = player;
		f._soundNodePool.put(id);
		id = -1;
		
		soundChannel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		
		if (fade > 0)
		{
			player.notify(SoundPlayerEvent.FADE_COMPLETE, id); //TODO needed?
			
			tween.cancel();
			tween = null;
		}
		
		listNode.unlink();
		soundChannel.stop();
		
		key          = null;
		sound        = null;
		soundChannel = null;
		listNode     = null;
		transform    = null;
		id           = -1;
		fade         = 0;
		repeat       = 0;
	}
	
	public function fadeVolume(duration:Float, volume:Float):Bool
	{
		if (fade > 0) tween.cancel();
		
		if (Mathematics.fabs(soundChannel.soundTransform.volume - volume) < SKIP_FADE__VOLUME_THRESHOLD) return false;
		duration = Mathematics.fmin(sound.length - .05, duration);
		if (duration <= SKIP_FADE_DURATION_THRESHOLD) return false;
		
		tween.to(volume).duration(duration).run();
		return true;
	}
	
	public function onSoundComplete(e:Event):Void
	{
		soundChannel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		player.notify(SoundPlayerEvent.COMPLETE, id);
		reset();
	}
	
	function _onTweenComplete()
	{
		fade = 0;
		player.notify(SoundPlayerEvent.FADE_COMPLETE, id);
	}
}