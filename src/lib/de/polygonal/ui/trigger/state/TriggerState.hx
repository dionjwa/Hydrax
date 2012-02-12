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
package de.polygonal.ui.trigger.state;

import de.polygonal.ui.trigger.Trigger;

using de.polygonal.ds.BitFlags;

class TriggerState
{
	inline public static var CLICK       =  0;
	inline public static var DISABLED    =  1;
	inline public static var DRAG        =  2;
	inline public static var DRAG_OUT    =  3;
	inline public static var DRAG_OVER   =  4;
	inline public static var DRAG_START  =  5;
	inline public static var DRAG_STOP   =  6;
	inline public static var ENABLED     =  7;
	inline public static var PRESS       =  8;
	inline public static var PRESS_OUT   =  9;
	inline public static var RELEASE     = 10;
	inline public static var RELEASE_OUT = 11;
	inline public static var ROLL_OUT    = 12;
	inline public static var ROLL_OVER   = 13;
	
	var _trigger:Trigger;
	var _stateMachine:TriggerStateMachine;
	var _type:Int;
	
	function new(fsm:TriggerStateMachine)
	{
		_stateMachine = fsm;
		_type = _getType();
	}
	
	public function free():Void
	{
		_trigger = null;
		_stateMachine = null;
	}
	
	public function execute():Void
	{
	}

	public function change(newState:Int):Void
	{
		_stateMachine.changeState(_stateMachine.resolveState(newState));
	}
	
	public function enter(trigger:Trigger, prevState:TriggerState):Void
	{
		_trigger = trigger;
		if (_type != -1) _trigger.notify(_type, trigger);
	}
	
	public function leave():Void
	{
	}
	
	/** The event type that is fired when this state is entered. */
	function _getType():Int
	{
		return -1;
	}
	
	inline function _getFlags(mask:Int):Int
	{
		return _trigger.getf(mask);
	}
}