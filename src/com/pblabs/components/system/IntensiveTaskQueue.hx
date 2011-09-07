package com.pblabs.components.system;

import com.pblabs.engine.core.PBManager;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.IProcessManager;

import de.polygonal.ds.Prioritizable;
import de.polygonal.ds.PriorityQueue;

/**
  * For queuing tasks or functions that are processer intensive.
  * Each task is executed sequentially, by onFrame calls, since the 
  * task likely spreads the load over multiple frames.
  */
class IntensiveTaskQueue extends PBManager,
	implements IAnimatedObject
{
	public var priority :Int;
	public var timeAllowedPerTick :Float;
	public var maxUpdatesPerTick :Int;
	var _queue :PriorityQueue<IntensiveTask>;
	var _tempTask :IntensiveTask;
	
	public function new ()
	{
		super();
		priority = 0;
		_queue = new PriorityQueue();
		timeAllowedPerTick = 0.020;
		maxUpdatesPerTick = 1;
	}

	override public function startup () :Void
	{
		super.startup();
		context.getManager(IProcessManager).addAnimatedObject(this);
	}
	
	override public function shutdown () :Void
	{
		context.getManager(IProcessManager).removeAnimatedObject(this);
		super.shutdown();
		clear();
		_queue = null;
	}
	
	public function clear () :Void
	{
		for (q in _queue) {
			q.shutdown();
		}
		_queue.free();
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (_queue.size() == 0) {
			return;
		}
		var begin :Float = haxe.Timer.stamp();
		var ticks :Int = 0;
		while (_queue.size() > 0 && ticks < maxUpdatesPerTick && haxe.Timer.stamp() - begin < timeAllowedPerTick) {
			_tempTask = _queue.peek();
			com.pblabs.util.Log.debug("doing task: " + _tempTask); 
			if (_tempTask.onFrame(dt)) {
				_queue.remove(_tempTask);
				com.pblabs.util.Log.info("Finished " + _tempTask + "\nremaining " + _queue.size());
				_tempTask.finish();
			}
			_tempTask = null;
			ticks++;
		}
	}
	
	public function queueIntensiveTask (doALittleBit :Float->Bool, ?onFinish :Bool->Void, ?priority :Int = 0) :IntensiveTask
	{
		var task = new IntensiveTask(priority, doALittleBit, onFinish);
		return queue(task);
	}
	
	public function queue (task :IntensiveTask) :IntensiveTask
	{
		_queue.enqueue(task);
		return task;
	}
	
	public function removeTask (task :IntensiveTask) :Bool
	{
		com.pblabs.util.Assert.isNotNull(task, " task is null");
		task.shutdown();
	    return _queue.remove(task);
	}
}
