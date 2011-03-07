/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.tasks;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.util.Preconditions;

import haxe.FastList;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ReflectUtil;

import com.pblabs.components.tasks.IEntityTask;
import com.pblabs.components.tasks.ParallelTask;

class TaskComponent extends EntityComponent 
{
	public static var NAME :String = ReflectUtil.tinyClassName(TaskComponent);

	var _anonymousTasks:ParallelTask;

	// stores a mapping from String to ParallelTask
	var _namedTasks :FastList<ParallelTask>;
	var _taskNames :FastList<String>;
	var _updatingTasks :Bool;
	
	public static function getFrom (e :IEntity) :TaskComponent
	{
		return cast(e.getComponentByName(NAME), TaskComponent);
	}
	
	public function new() 
	{ 
		super();
		_anonymousTasks = new ParallelTask();
		_namedTasks = new FastList<ParallelTask>();
		_taskNames = new FastList<String>();
		_updatingTasks = false;
	}
	
	/** Adds a named task to this IEntity. */
	public function addNamedTask (name :String, task :IEntityTask, ?removeExistingTasks :Bool =
		false) :Void
	{
		if (null == task) {
			throw "task must be non-null";
		}

		if (null == name || name.length == 0) {
			throw "name must be at least 1 character long";
		}

		
		var namedTaskContainer = getNamedTask(name);
		
		if (null == namedTaskContainer) {
			namedTaskContainer = new ParallelTask();
			_namedTasks.add(namedTaskContainer);
			_taskNames.add(name);
		} else if (removeExistingTasks) {
			namedTaskContainer.removeAllTasks();
		}

		namedTaskContainer.addTask(task);
	}
	
	function getNamedTask (name :String) :ParallelTask
	{
		var nameIter = _taskNames.iterator();
		var taskIter = _namedTasks.iterator();
		while (nameIter.hasNext()) {
			if (nameIter.next() == name) {
				return taskIter.next();
			}
			taskIter.next();
		}
		return null;
	}
	
	public function onTick (dt :Float) :Void
	{
		_updatingTasks = true;
		for (namedTask in _namedTasks) {
			namedTask.update(dt, owner);
		}
		_updatingTasks = false;
	}
	
	/** Adds an unnamed task to this IEntity. */
	public function addTask (task :IEntityTask) :Void
	{
		Preconditions.checkNotNull(task, "task must be non-null");
		_anonymousTasks.addTask(task);
	}

	/** Returns true if the IEntity has any tasks. */
	public function hasTasks () :Bool
	{
		if (_anonymousTasks.hasTasks()) {
			return true;
		} else {
			for (namedTaskContainer in _namedTasks) {
				if (namedTaskContainer.hasTasks()) {
					return true;
				}
			}
		}
		return false;
	}

	/** Returns true if the IEntity has any tasks with the given name. */
	public function hasTasksNamed (name :String) :Bool
	{
		var namedTaskContainer:ParallelTask = getNamedTask(name);
		return (null == namedTaskContainer ? false : namedTaskContainer.hasTasks());
	}

	/** Removes all tasks from the IEntity. */
	public function removeAllTasks () :Void
	{
		if (_updatingTasks) {
			// if we're updating tasks, invalidate all named task containers so that
			// they stop iterating their children
			for (taskContainer in _namedTasks) {
				taskContainer.removeAllTasks();
			}
		}

		_anonymousTasks.removeAllTasks();
		
		for (namedTask in _namedTasks) {
			_namedTasks.remove(namedTask);
		}
		for (name in _taskNames) {
			_taskNames.remove(name);
		}
	}

	/** Removes all tasks with the given name from the IEntity. */
	public function removeNamedTasks (name :String) :Void
	{
		if (null == name || name.length == 0) {
			throw "name must be at least 1 character long";
		}

		var taskContainer = getNamedTask(name);
		
		_namedTasks.remove(taskContainer);
		_taskNames.remove(name);
		
		// if we're updating tasks, invalidate this task container so that
		// it stops iterating its children
		if (null != taskContainer && _updatingTasks) {
			taskContainer.removeAllTasks();
		}
	}

	override function onRemove () :Void
	{
		removeAllTasks();
		super.onRemove();
	}
}


