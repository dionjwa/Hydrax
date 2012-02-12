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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.time.Timebase;
import de.polygonal.ui.trigger.Trigger;
import de.polygonal.ui.trigger.TriggerEvent;

class TriggerStateClick extends TriggerState
{
	var _past:Float;
	var _dt:Float;
	
	public function new(fsm:TriggerStateMachine)
	{
		super(fsm);
		
		_past = -1;
	}
	
	override public function execute():Void
	{
		switch (_getFlags(Trigger.BIT_TOUCH_MODE | Trigger.BIT_TOUCHING | Trigger.BIT_DOWN))
		{
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_TOUCHING | Trigger.BIT_DOWN:
				change(TriggerState.PRESS);
				
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_DOWN:
				change(TriggerState.PRESS_OUT);
				
			case Trigger.BIT_TOUCHING | Trigger.BIT_DOWN:
				change(TriggerState.PRESS);
				
			case Trigger.BIT_DOWN:
				change(TriggerState.DRAG_OUT);
			
			case 0:
				change(TriggerState.ROLL_OUT);
		}
	}
	
	override public function enter(trigger:Trigger, prevState:TriggerState):Void
	{
		super.enter(trigger, prevState);
		
		var now = Timebase.instance().getRealTime();
		if (_past == -1)
		{
			_past = now;
			_dt = Mathematics.POSITIVE_INFINITY;
		}
		else
		{
			_dt = now - _past;
			_past = now;
		}
		
		if (_dt < Trigger.DOUBLE_CLICK_THRESHOLD)
		{
			_trigger.notify(TriggerEvent.DOUBLE_CLICK, trigger);
			_past = 0;
		}
	}
	
	override function _getType():Int
	{
		return TriggerEvent.CLICK;
	}
}