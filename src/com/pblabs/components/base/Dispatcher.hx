package com.pblabs.components.base;

import com.pblabs.engine.core.IPBManager;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

/**
  * Simply a central signal dispatcher that dispatches 
  * arbitrary signals.
  */
class Dispatcher 
	implements IPBManager
{
	/** General purpose signaler */
	public var dispatcher (default, null) :Signaler<Dynamic>;
	
	public function new ()
	{
		dispatcher = new DirectSignaler(this);	
	}
	
	public function dispatch (message :Dynamic) :Void
	{
		if (dispatcher.isListenedTo) {
			// com.pblabs.util.Log.debug("dispatching=" + Std.string(message));
			dispatcher.dispatch(message);
		} 
	}
	
	public function startup () :Void
	{
	}
	
	public function shutdown () :Void
	{
		#if (debug && !neko)
		var self = this;
		var sig = dispatcher;
		haxe.Timer.delay(function () :Void {
			if (sig.isListenedTo) {
				for (b in sig.getBonds()) {
					trace("Stuck bond=" + b);
				}
				com.pblabs.util.Assert.isFalse(sig.isListenedTo);
			}
		}, 40);
		#end
	}
}
