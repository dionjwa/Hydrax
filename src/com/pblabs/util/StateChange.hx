/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;
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
