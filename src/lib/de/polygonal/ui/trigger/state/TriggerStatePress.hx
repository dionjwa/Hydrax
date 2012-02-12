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

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.ui.trigger.Trigger;
import de.polygonal.ui.trigger.TriggerEvent;

class TriggerStatePress extends TriggerState
{
	public var posEnter(default, null):Vec2;
	
	public function new(fsm:TriggerStateMachine)
	{
		super(fsm);
		posEnter = new Vec2(); 
	}
	
	override public function free():Void 
	{
		super.free();
		posEnter = null;
	}
	
	override public function execute():Void
	{
		switch (_getFlags(Trigger.BIT_TOUCHING | Trigger.BIT_DOWN | Trigger.BIT_TOUCH_MODE | Trigger.BIT_DRAG_ENABLED))
		{
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_DRAG_ENABLED | Trigger.BIT_TOUCHING |  Trigger.BIT_DOWN:
				var p = _trigger.pointer.position();
				var dx = p.x - posEnter.x;
				var dy = p.y - posEnter.y;
				if (Vec2Util.dot4(dx, dy, dx, dy) > 0)
					change(TriggerState.DRAG_START);
			
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_DRAG_ENABLED | Trigger.BIT_TOUCHING:
				change(TriggerState.RELEASE);
			
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_DRAG_ENABLED | Trigger.BIT_DOWN:
				change(TriggerState.DRAG_START);
			
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_TOUCHING:
				change(TriggerState.RELEASE);
			
			case Trigger.BIT_TOUCH_MODE | Trigger.BIT_DOWN:
				change(TriggerState.DRAG_OUT);
			
			case Trigger.BIT_TOUCH_MODE:
				change(TriggerState.RELEASE_OUT);
			
			case Trigger.BIT_DRAG_ENABLED | Trigger.BIT_DOWN | Trigger.BIT_TOUCHING:
				var p = _trigger.pointer.position();
				var dx = p.x - posEnter.x;
				var dy = p.y - posEnter.y;
				if (Vec2Util.dot4(dx, dy, dx, dy) > 0)
					change(TriggerState.DRAG_START);
			
			case Trigger.BIT_DRAG_ENABLED | Trigger.BIT_DOWN:
				change(TriggerState.DRAG_START);
			
			case Trigger.BIT_DRAG_ENABLED | Trigger.BIT_TOUCHING:
				change(TriggerState.RELEASE);
			
			case Trigger.BIT_DOWN:
				change(TriggerState.DRAG_OUT);
			
			case Trigger.BIT_TOUCHING:
				change(TriggerState.RELEASE);
		}
	}
	
	override function _getType():Int
	{
		return TriggerEvent.PRESS;
	}
	
	override public function enter(trigger:Trigger, prevState:TriggerState):Void
	{
		super.enter(trigger, prevState);
		if (_trigger == null) return;
		
		//record current pointer position for computing drag offset later on
		var p = _trigger.pointer.position();
		posEnter.x = p.x;
		posEnter.y = p.y;
	}
}