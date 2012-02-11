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
package de.polygonal.ui;

import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.time.Timebase;
import de.polygonal.ds.ArrayUtil;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DA;
import de.polygonal.ds.IntHashSet;
import de.polygonal.ds.IntIntHashTable;
import de.polygonal.ds.Itr;
import de.polygonal.ds.Set;

import Type;

#if js
import js.JQuery;
import js.Dom;
#end

using de.polygonal.ds.BitFlags;

class UI extends Observable
{
	inline static var BIT_CTRL       = Bits.BIT_01;
	inline static var BIT_ALT        = Bits.BIT_02;
	inline static var BIT_SHIFT      = Bits.BIT_03;
	inline static var BIT_MOUSE_DOWN = Bits.BIT_04;
	
	static var _instance:UI;
	public  static function instance():UI
	{
		if (_instance == null)
			_instance = new UI();
		return _instance;
	}
	
	#if !swc
	public static var get(_getGetter, never):UI;
	inline static function _getGetter():UI { return instance(); }
	#end
	
	/**
	 * Convenience method for <em>UI.instance().attach()</em>.
	 */
	public static function sAttach(o:IObserver, mask = 0):Void
	{
		instance().attach(o, mask);
	}
	
	/**
	 * Convenience method for <em>UI.instance().detach()</em>.
	 */
	public static function sDetach(o:IObserver, mask = 0):Void
	{
		instance().detach(o, mask);
	}
	
	public var currKeyHoldTime(_currKeyHoldTimeGetter, never):Float;
	function _currKeyHoldTimeGetter():Float { return _keyTimer; }
	
	public var currKeyCode(_currKeyCodeGetter, never):Int;
	function _currKeyCodeGetter():Int { return _currKeyCode; }
	
	public var currMouseHoldTime(_currMouseHoldTimeGetter, never):Float;
	function _currMouseHoldTimeGetter():Float
	{
		if (hasf(BIT_MOUSE_DOWN))
			return Timebase.instance().getRealTime() - _mouseTimer;
		return -1.;
	}
	
	public var isAnyKeyDown(_isAnyKeyDownGetter, never):Bool;
	function _isAnyKeyDownGetter():Bool { return !_keysDown.isEmpty(); }
	
	public var isCtrlDown(_isCtrlDownGetter, never):Bool;
	function _isCtrlDownGetter():Bool { return hasf(BIT_CTRL); }
	
	public var isAltDown(_isAltDownGetter, never):Bool;
	function _isAltDownGetter():Bool { return hasf(BIT_ALT); }
	
	public var isShiftDown(_isShiftDownGetter, never):Bool;
	function _isShiftDownGetter():Bool { return hasf(BIT_SHIFT); }
	
	public var isMouseDown(_isMouseDownGetter, never):Bool;
	function _isMouseDownGetter():Bool { return hasf(BIT_MOUSE_DOWN); }
	
	public var mouse(_mouseGetter, never):Vec2;
	function _mouseGetter():Vec2
	{
		_tmp.x = _mouse.x;
		_tmp.y = _mouse.y;
		return _tmp;
	}
	
	#if (flash || nme)
	var _mouseMoveEvent:flash.events.MouseEvent;
	#elseif js
	var _mouseMoveEvent:js.JqEvent;
	#end
	
	#if flash
	var _mouseWheelDelta:Float;
	var _keyLocation:flash.ui.KeyLocation;
	
	public var currCharCode(_currCharCodeGetter, never):Int;
	function _currCharCodeGetter():Int { return _currCharCode; }
	
	public var mouseWheelDelta(_mouseWheelDeltaGetter, never):Float;
	function _mouseWheelDeltaGetter():Float { return _mouseWheelDelta; }
	#end
	
	var _keysDown:IntHashSet;
	var _keysDownItr:Itr<Int>;
	var _keysDownTimer:IntIntHashTable;
	
	var _shortcutList:DA<Shortcut>;
	var _shortcutListItr:Itr<Shortcut>;
	
	var _sequenceList:DA<Sequence>;
	var _sequenceListItr:Itr<Sequence>;
	
	var _currKeyCode:Int;
	var _currCharCode:Int;
	
	var _mouse:Vec2;
	
	var _keyTimer:Float;
	var _mouseTimer:Float;
	
	var _bits:Int;
	
	var _tmp:Vec2;
	
	function new()
	{
		super();
		
		reserve(10);
		
		#if flash
		_mouseWheelDelta = .0;
		#end
		
		_mouse = new Vec2();
		_tmp = new Vec2();
		
		_keysDown = new IntHashSet(256);
		_keysDownItr = _keysDown.iterator();
		_keysDownTimer = new IntIntHashTable(256);
		
		_sequenceList = new DA<Sequence>();
		_sequenceListItr = cast _sequenceList.iterator();
		
		_registerEvents();
	}
	
	/**
	 * Destroys the system by removing all registered observers and explicitly nullifying all references for GC'ing used resources.
	 * The system is automatically reinitialized once an observer is attached.
	 */	
	override public function free()
	{
		_unregisterEvents();
		
		clear(true);
		
		_keysDown.free();
		_keysDownTimer.free();
		
		for (i in _shortcutList) i.free();
		_shortcutList.free();
		
		for (i in _sequenceList) i.free();
		_sequenceList.free();
		
		_sequenceList    = null;
		_sequenceListItr = null;
		_shortcutList    = null;
		_shortcutListItr = null;
		_keysDownTimer   = null;
		_keysDown        = null;
		
		_instance = null;
		
	}
	
	public function isKeyDown(keyCode:Int):Bool
	{
		return _keysDown.has(keyCode);
	}
	
	public function getKeyHoldTime(keyCode:Int):Float
	{
		var time = _keysDownTimer.get(keyCode);
		if (time != IntIntHashTable.VAL_ABSENT)
			return Timebase.instance().getRealTime() - (time / 65536.0);
		return -1;
	}
	
	public function registerShortcut(name:String, keyCodes:Array<Int>):Void
	{
		if (_shortcutList == null)
		{
			_shortcutList = new DA<Shortcut>();
			_shortcutListItr = _shortcutList.iterator();
		}
		
		D.assert(!Lambda.exists(_shortcutList, function(val:Shortcut) return val.name == name), "duplicate shortcut");
		_shortcutList.pushBack(new Shortcut(name, keyCodes));
	}
	
	public function unregisterShortcut(name:String):Void
	{
		for (shortcut in _shortcutList)
		{
			if (shortcut.name == name)
			{
				_shortcutList.remove(shortcut);
				break;
			}
		}
	}
	
	public function registerSequence(name:String, keyCodes:Array<Int>):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(!Lambda.exists(_sequenceList, function(val:Sequence) { return val.name == name; }),
			de.polygonal.core.fmt.Sprintf.format("sequence with id '%s' already exists", [name]));
		#end
		
		_sequenceList.pushBack(new Sequence(name, keyCodes));
	}
	
	public function unregisterSequence(name:String):Void
	{
		for (sequence in _sequenceList)
		{
			if (sequence.name == name)
			{
				_sequenceList.remove(sequence);
				break;
			}
		}
	}
	
	#if flash
	public function updateAfterEvent():Void
	{
		if (_mouseMoveEvent != null)
			_mouseMoveEvent.updateAfterEvent();
	}
	#end
	
	function _registerEvents():Void
	{
		#if (flash || nme)
		var stage = flash.Lib.current.stage;
		stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, _onKeyDown);
		stage.addEventListener(flash.events.KeyboardEvent.KEY_UP  , _onKeyUp);
		stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE , _onMouseMove);
		stage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN , _onMouseDown);
		stage.addEventListener(flash.events.MouseEvent.MOUSE_UP   , _onMouseUp);
			#if flash
			stage.addEventListener(flash.events.MouseEvent.MOUSE_WHEEL, _onMouseWheel);
			#end
		#elseif js
		var jq = new JQuery(js.Lib.document);
		jq.mousedown(_onMouseDown);
		jq.mouseup(_onMouseUp);
		jq.mousemove(_onMouseMove);
		jq.keydown(_onKeyDown);
		jq.keyup(_onKeyUp);
		#end
	}
	
	function _unregisterEvents():Void
	{
		#if (flash || nme)
		var stage = flash.Lib.current.stage;
		stage.removeEventListener(flash.events.KeyboardEvent.KEY_DOWN, _onKeyDown);
		stage.removeEventListener(flash.events.KeyboardEvent.KEY_UP  , _onKeyUp);
		stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE , _onMouseMove);
		stage.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN , _onMouseDown);
		stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP   , _onMouseUp);
			#if flash
			stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, _onMouseWheel);
			#end
		#elseif js
		var jq = new JQuery(js.Lib.document);
		jq.unbind("mousedown");
		jq.unbind("mouseup");
		jq.unbind("mousemove");
		jq.unbind("keydown");
		jq.unbind("keyup");
		#end
	}
	
	#if (flash || nme)
	function _onKeyDown(e:flash.events.KeyboardEvent):Void
	#elseif js
	function _onKeyDown(e:js.JqEvent):Void
	#end
	{
		var keyCode =
		#if (flash || nme)
		Std.int(e.keyCode);
		#else
		e.which;
		#end
		
		if (_keysDown.has(keyCode)) return;
		
		_keysDown.set(keyCode);
		_keysDownTimer.remove(keyCode);
		_keysDownTimer.set(keyCode, Std.int(Timebase.instance().getRealTime() * 65536.));
		
		#if flash
		setiff(BIT_CTRL , e.ctrlKey);
		setiff(BIT_ALT  , e.altKey);
		setiff(BIT_SHIFT, e.shiftKey);
		#end
		
		if (_shortcutList != null)
		{
			_shortcutListItr.reset();
			for (shortcut in _shortcutListItr)
			{
				shortcut.insert(keyCode);
				if (shortcut.isComplete) notify(UIEvent.SHORTCUT, shortcut.name);
			}
		}
		
		if (_sequenceList != null)
		{
			_sequenceListItr.reset();
			for (sequence in _sequenceListItr)
			{
				sequence.insert(keyCode);
				if (sequence.isComplete) notify(UIEvent.SEQUENCE, sequence.name);
			}
		}
		
		#if flash
		_currCharCode = Std.int(e.charCode);
		_keyLocation = e.keyLocation;
		#end
		
		_currKeyCode = keyCode;
		notify(UIEvent.KEY_DOWN, keyCode);
	}
	
	#if (flash || nme)
	function _onKeyUp(e:flash.events.KeyboardEvent):Void
	#elseif js
	function _onKeyUp(e:js.JqEvent):Void
	#end
	{
		var keyCode =
		#if (flash || nme)
		Std.int(e.keyCode);
		#else
		e.which;
		#end
		
		if (!_keysDown.contains(keyCode)) return;
		
		_keyTimer = (Timebase.instance().getRealTime() - (_keysDownTimer.get(keyCode) / 65536.0));
		D.assert(_keysDownTimer.clr(keyCode), "_keysDownTimer.clr(keyCode)");
		_keysDown.remove(keyCode);
		
		#if flash
		setiff(BIT_CTRL , e.ctrlKey);
		setiff(BIT_ALT  , e.altKey);
		setiff(BIT_SHIFT, e.shiftKey);
		#end
		
		if (_shortcutList != null)
		{
			_shortcutListItr.reset();
			for (shortcut in _shortcutListItr) shortcut.remove(keyCode);
		}
		
		_currKeyCode = keyCode;
		
		notify(UIEvent.KEY_UP, keyCode);
	}
	
	#if (flash || nme)
	function _onMouseMove(e:flash.events.MouseEvent):Void
	#elseif js
	function _onMouseMove(e:js.JqEvent):Void
	#end
	{
		_mouseMoveEvent = e;
		notify(UIEvent.MOUSE_MOVE, _getMouse(e));
	}
	
	#if (flash || nme)
	function _onMouseDown(e:flash.events.MouseEvent):Void 
	#elseif js
	function _onMouseDown(e:js.JqEvent):Void 
	#end
	{
		setf(BIT_MOUSE_DOWN);
		_mouseTimer = Timebase.instance().getRealTime();
		notify(UIEvent.MOUSE_DOWN, _getMouse(e));
	}
	
	#if (flash || nme)
	function _onMouseUp(e:flash.events.MouseEvent):Void 
	#elseif js
	function _onMouseUp(e:js.JqEvent):Void 
	#end
	{
		clrf(BIT_MOUSE_DOWN);
		notify(UIEvent.MOUSE_UP, _getMouse(e));
	}
	
	#if flash
	function _onMouseWheel(e:flash.events.MouseEvent):Void
	{
		_mouseWheelDelta = e.delta;
		notify(UIEvent.MOUSE_WHEEL, _mouseWheelDelta);
	}
	#end
	
	function _getMouse(e):Vec2
	{
		#if (flash || nme)
		_mouse.x = e.stageX;
		_mouse.y = e.stageY;
		#elseif js
		_mouse.x = e.pageX;
		_mouse.y = e.pageY;
		#end
		
		return _mouse;
	}
}

private class Shortcut
{
	public var name:String;
	public var isComplete:Bool;
	
	var _set:Set<Int>;
	var _cur:Set<Int>;
	
	public function new(name:String, keyCodes:Array<Int>)
	{
		this.name = name;
		_set  = new IntHashSet(256);
		
		for (i in 0...keyCodes.length) _set.set(keyCodes[i]);
		_cur = new IntHashSet(256);
	}
	
	public function free():Void
	{
		_set.free();
		_cur.free();
		
		_set = null;
		_cur = null;
	}
	
	public function insert(keyCode:Int):Void
	{
		if (_set.has(keyCode))
		{
			_cur.set(keyCode);
			if (_cur.size() == _set.size())
				if (!isComplete) isComplete = true;
		}
		else
			isComplete = false;
	}
	
	public function remove(keyCode:Int):Void
	{
		if (_cur.remove(keyCode))
			isComplete = false;
	}
}

private class Sequence
{
	public var name:String;
	public var isComplete:Bool;
	
	var _list:Array<Int>;
	var _curSize:Int;
	var _maxSize:Int;
	
	public function new(name:String, keyCodes:Array<Int>)
	{
		this.name = name;
		_list = new Array();
		ArrayUtil.copy(keyCodes, _list);
		_curSize = 0;
		_maxSize = _list.length;
	}
	
	public function free():Void
	{
		_list = null;
	}
	
	public function insert(keyCode:Int)
	{
		if (_list[_curSize] == keyCode)
		{
			_curSize++;
			if (_maxSize == _curSize)
			{
				_curSize = 0;
				isComplete = true;
			}
			else
				isComplete = false;
		}
		else
		{
			_curSize = 0;
			isComplete = false;
		}
	}
}