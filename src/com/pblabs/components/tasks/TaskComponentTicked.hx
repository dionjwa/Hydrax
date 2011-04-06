/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.tasks;

import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ITickedObject;

/**
  * TaskComponent that implements ITickedObject, so 
  * is automatically added to the IProcessManager.
  *
  * If there are no active tasks, this class will remove itself
  * from the IProcessManager, and re-add when there are 
  * tasks, saving onTick calls.
  */
class TaskComponentTicked extends TaskComponent, 
	implements ITickedObject
{
	public function new() 
	{ 
		super();
		_tasksFinished = true;
	}
	
	/** Adds a named task to this IEntity. */
	override public function addNamedTask (name :String, task :IEntityTask, ?removeExistingTasks :Bool = false) :Void
	{
		super.addNamedTask(name, task, removeExistingTasks);
		_tasksFinished = false;
		updatingCheck();
	}
	
	override public function onTick (dt :Float) :Void
	{
		_tasks._updatingTasks = true;
		_tasksFinished = _tasks._anonymousTasks.update(dt, owner);
		for (namedTask in _tasks._namedTasks) {
			_tasksFinished = namedTask.update(dt, owner) && _tasksFinished;
		}
		_tasks._updatingTasks = false;
		if (!_tasksFinished) {//If we're updating, assume we're added to the process manager
			updatingCheck();
		}
	}
	
	/**
	 * When we don't have any tasks, remove ourselves from
	 * the updater.
	 */
	function updatingCheck () :Void
	{
		if (owner == null) {
			return;
		}
		if (!_tasksFinished && !_addedToProcessManager) {
			context.getManager(IProcessManager).addTickedObject(this);
			_addedToProcessManager = true;
		} else if (_tasksFinished && _addedToProcessManager) {
			context.getManager(IProcessManager).removeTickedObject(this);
			_addedToProcessManager = false;
		}
	}

	/** Adds an unnamed task to this IEntity. */
	override public function addTask (task :IEntityTask) :Void
	{
		super.addTask(task);
		_tasksFinished = false;
		updatingCheck();
	}

	override function onAdd () :Void
	{
		super.onAdd();
		context.getManager(IProcessManager).removeTickedObject(this);
		_addedToProcessManager = false;
	}
	
	override function onRemove () :Void
	{
		removeAllTasks();
		super.onRemove();
		_tasksFinished = true;
		_addedToProcessManager = false;
	}
	
	var _tasksFinished :Bool;
	var _addedToProcessManager :Bool;
}
