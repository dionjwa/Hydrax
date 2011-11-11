/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.tasks;

import com.pblabs.components.tasks.IEntityTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.components.tasks.TimedTask;
import com.pblabs.engine.core.IEntity;

typedef EasingFunc = Float->Float->Float->Float->Float;

/**
  * By "using" this class, entity objects get TaskComponent methods
  * directly.
  */
class TaskUtil
{
	public static function when (task :IEntityTask, predicate :Void->Bool) :IEntityTask
	{
		return new SerialTask(new FunctionTask(predicate), task);
	}
	
	public static function after (task :IEntityTask, duration :Float) :IEntityTask
	{
		return (if (duration > 0) new SerialTask(new TimedTask(duration), task) else task);
	}
	
	 /** Adds a named task to this IEntity. */
	public static function addNamedTask (e :IEntity, name :String, task :IEntityTask, ?removeExistingTasks :Bool = true) :IEntity
	{
		getTaskComponent(e).addNamedTask(name, task, removeExistingTasks);
		return e;
	}
	
	/** Adds an unnamed task to this IEntity. */
	public static function addTask (e :IEntity, task :IEntityTask) :IEntity
	{
		com.pblabs.util.Assert.isNotNull(e, "null entity");
		getTaskComponent(e).addTask(task);
		return e;
	}

	/** Returns true if the IEntity has any tasks. */
	public static function hasTasks (e :IEntity) :Bool
	{
		return getTaskComponent(e).hasTasks();
	}

	/** Returns true if the IEntity has any tasks with the given name. */
	public static  function hasTasksNamed (e :IEntity, name :String) :Bool
	{
		return getTaskComponent(e).hasTasksNamed(name);
	}

	/** Removes all tasks from the IEntity. */
	public static function removeAllTasks (e :IEntity) :IEntity
	{
		getTaskComponent(e).removeAllTasks();
		return e;
	}

	/** Removes all tasks with the given name from the IEntity. */
	public static function removeNamedTasks (e :IEntity, name :String) :IEntity
	{
		getTaskComponent(e).removeNamedTasks(name);
		return e;
	}
	
	/**
	  * Adds the TaskComponent if none is present.
	  */
	public static function getTaskComponent (e :IEntity) :TaskComponent
	{
		com.pblabs.util.Assert.isNotNull(e, "null entity");
		var tasks = e.getComponentByName(TaskComponent.NAME) != null ? e.getComponentByName(TaskComponent.NAME) : 
			e.getComponent(TaskComponent);
			
		if (tasks == null) {
			tasks = e.context.allocate(TaskComponentTicked);
			e.addComponent(tasks, TaskComponent.NAME);
		}
		return tasks;
	}
}


