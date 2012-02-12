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

import de.polygonal.ds.DA;
import de.polygonal.ui.trigger.state.TriggerState;
import de.polygonal.ui.trigger.state.TriggerStateDisabled;
import de.polygonal.ui.trigger.Trigger;

using de.polygonal.ds.BitFlags;

class TriggerStateMachine
{
	var _trigger:Trigger;
	
	var _prevState:TriggerState;
	var _currState:TriggerState;
	
	var _states:DA<TriggerState>;
	
	var _disabledState:TriggerState;
	
	public function new(trigger:Trigger)
	{
		_trigger = trigger;
		_states = new DA<TriggerState>();
		_states.fill(null, 16);
		_disabledState = resolveState(TriggerState.DISABLED);
		_currState = resolveState(TriggerState.ENABLED);
		_currState.enter(_trigger, null);
	}
	
	public function free():Void
	{
		_trigger = null;
		
		for (state in _states)
		{
			if (state != null) state.free();
		}
		_states.free();
		_states = null;
		_disabledState = null;
		
		_prevState = null;
		_currState = null;
	}
	
	public function getState():TriggerState
	{
		return _currState;
	}
	
	public function reset():Void
	{
		if (_currState == _disabledState) return;
		changeState(resolveState(TriggerState.ENABLED));
	}
	
	public function evaluate():Void
	{
		if (_currState != _disabledState)
		{
			if (!_trigger.enabled)
			{
				changeState(_disabledState);
				return;
			}
		}
		
		_currState.execute();
	}
	
	public function changeState(newState:TriggerState):Void
	{
		//trace('change state from %s to %s', _currState, newState);
		
		_prevState = _currState;
		_currState.leave(); 
		_currState = newState;
		
		_currState.enter(_trigger, _prevState);
	}
	
	public function resolveState(id:Int):TriggerState
	{
		var state = _states.get(id);
		if (state == null)
		{
			switch (id)
			{
				case TriggerState.CLICK       : state = new TriggerStateClick(this);
				case TriggerState.DISABLED    : state = new TriggerStateDisabled(this);
				case TriggerState.DRAG        : state = new TriggerStateDrag(this);
				case TriggerState.DRAG_OUT    : state = new TriggerStateDragOut(this);
				case TriggerState.DRAG_OVER   : state = new TriggerStateDragOver(this);
				case TriggerState.DRAG_START  : state = new TriggerStateDragStart(this);
				case TriggerState.DRAG_STOP   : state = new TriggerStateDragStop(this);
				case TriggerState.ENABLED     : state = new TriggerStateEnabled(this);
				case TriggerState.PRESS       : state = new TriggerStatePress(this);
				case TriggerState.PRESS_OUT   : state = new TriggerStatePressOut(this);
				case TriggerState.RELEASE     : state = new TriggerStateRelease(this);
				case TriggerState.RELEASE_OUT : state = new TriggerStateReleaseOut(this);
				case TriggerState.ROLL_OUT    : state = new TriggerStateRollOut(this);
				case TriggerState.ROLL_OVER   : state = new TriggerStateRollOver(this);
			}
			
			_states.set(id, state);
		}
		
		return state;
	}
}