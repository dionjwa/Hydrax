/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.PropertyReference;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.util.EqualableUtil;
/**
  * Signals state changes in a variable.  Only dispatches signal if the new value is 
  * not equal to the old value.
  */
class SignalVarAdvanced<T>
{
	public var signaler (default, null) :Signaler<StateChange<T>>;
	public var value (get_value, set_value) :T;
	
	public function new (initialValue :T)
	{
		signaler = new DirectSignaler(this);
		_value = initialValue;
		_change = new StateChange();
	}
	
	public function clear () :Void
	{
		// signaler.unbindAll();
		_change.clear();
		// _value = null;
	}
	
	function get_value () :T
	{
		return _value;
	}
	
	function set_value (val :T) :T
	{
		if (!_value.equals(val)) {
			_change.set(_value, val);
			_value = val;
			signaler.dispatch(_change);
			_change.clear();
		}
		return val;
	}
	var _value :T;
	var _change :StateChange<T>;
	
	#if debug
	public function toString () :String
	{
	    return Std.string(_value);
	}
	#end
}

class StateChange<T>
{
	public var oldValue :T;
	public var newValue :T;
	
	public function new (?oldvalue :T, ?newvalue: T)
	{
		set(oldvalue, newvalue);
	}
	
	public function set (oldvalue :T, newvalue: T) :Void
	{
		this.oldValue = oldvalue;
		this.newValue = newvalue;
	}
	
	public function clear () :Void
	{
	    oldValue = newValue = null;
	}
	
	#if debug
	public function toString () :String
	{
	    return "Change: " + oldValue + "->" +newValue;
	}
	#end
}
