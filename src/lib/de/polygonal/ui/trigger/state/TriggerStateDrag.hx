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
import de.polygonal.ui.trigger.surface.AbstractSurface;
import de.polygonal.ui.trigger.Trigger;
import de.polygonal.ui.trigger.TriggerEvent;

class TriggerStateDrag extends TriggerState
{
	var _mouseOffset:Vec2;
	
	var _isTouching:Int;
	
	public function new(fsm:TriggerStateMachine)
	{
		super(fsm);
		
		_mouseOffset = new Vec2();
	}
	
	override public function free():Void 
	{
		_mouseOffset = null;
		super.free();
	}
	
	override public function execute():Void
	{
		if (_getFlags(Trigger.BIT_DRAG_ENABLED) == 0)
		{
			change(TriggerState.DRAG_STOP);
			return;
		}
		
		//synchronize trigger region with pointer
		var p = _trigger.pointer.position();
		var s = _trigger.surface;
		
		if (_getFlags(Trigger.BIT_DRAG_LOCK_CENTER) > 0)
		{
			//lock to center
			s.setX(p.x);
			s.setY(p.y);
		}
		else
		{
			//keep surface-mouse offset
			s.setX(p.x + _mouseOffset.x);
			s.setY(p.y + _mouseOffset.y);
		}
		
		//center has changed, perform instant update
		s.update();
		
		if (_getFlags(Trigger.BIT_DOWN) > 0)
		{
			if (_getFlags(Trigger.BIT_TOUCHING) != _isTouching)
			{
				_isTouching = _getFlags(Trigger.BIT_TOUCHING);
				_trigger.notify(_getFlags(Trigger.BIT_TOUCHING) > 0 ? TriggerEvent.DRAG_OVER : TriggerEvent.DRAG_OUT, _trigger);
			}
		}
		else
		{
			change(TriggerState.DRAG_STOP);
			return;
		}
		
		_trigger.notify(TriggerEvent.DRAG, _trigger);
	}
	
	override function _getType():Int
	{
		return TriggerEvent.DRAG;
	}
	
	override public function enter(trigger:Trigger, prevState:TriggerState):Void
	{
		super.enter(trigger, prevState);
		if (_trigger == null) return;
		
		//compute drag offset
		var state:TriggerStatePress = cast _stateMachine.resolveState(TriggerState.PRESS);
		var p0 = state.posEnter;
		
		_mouseOffset.x = _trigger.surface.getX() - p0.x; 
		_mouseOffset.y = _trigger.surface.getY() - p0.y;
	}
}