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
