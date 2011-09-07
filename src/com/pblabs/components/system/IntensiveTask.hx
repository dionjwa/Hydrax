package com.pblabs.components.system;

import de.polygonal.ds.Prioritizable;

class IntensiveTask
	implements Prioritizable
{
	public var priority :Float;
	public var position :Int;
	public var k :Int;
	
	/** Returns true if finished */
	var _onFrame :Float->Bool;
	var _onFinish :Bool->Void;
	
	public function new (priority:Int, ?doALittleBit :Float->Bool, ?onFinish :Bool->Void) :Void
	{
		k = com.pblabs.engine.util.PBUtil.KEY_COUNT++;
		this.priority = priority;
		_onFrame = doALittleBit;
		_onFinish = onFinish;
	}
	
	/** Returns true if finished */
	public function onFrame (dt :Float) :Bool
	{
		if (_onFrame != null) {
			return _onFrame(dt);
		}
		return true;
	}
	
	public function shutdown () :Void
	{
		if (_onFinish != null) {
			_onFinish(false);
		}
		_onFrame = null;
		_onFinish = null;
	}
	
	public function finish () :Void
	{
		if (_onFinish != null) {
			_onFinish(true);
			_onFinish = null;
		}
		shutdown();
	}
}
