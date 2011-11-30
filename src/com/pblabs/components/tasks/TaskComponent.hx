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
import haxe.rtti.ReflectUtil;
import haxe.rtti.ReflectUtil;

import com.pblabs.components.tasks.IEntityTask;
import com.pblabs.components.tasks.ParallelTask;

class TaskComponent extends EntityComponent 
{
	public static var NAME :String = ReflectUtil.tinyName(TaskComponent);

	var _tasks :Tasks;
	
	public static function getFrom (e :IEntity) :TaskComponent
	{
		return cast(e.getComponentByName(NAME), TaskComponent);
	}
	
	public function new() 
	{ 
		super();
		_tasks = new Tasks();
	}
	
	/** Adds a named task to this IEntity. */
	public function addNamedTask (name :String, task :IEntityTask, ?removeExistingTasks :Bool = true) :Void
	{
		_tasks.addNamedTask(name, task, removeExistingTasks);
	}
	
	function getNamedTask (name :String) :ParallelTask
	{
		return _tasks.getNamedTask(name);
	}
	
	public function onTick (dt :Float) :Void
	{
		_tasks.onTick(dt, owner);
	}
	
	/** Adds an unnamed task to this IEntity. */
	public function addTask (task :IEntityTask) :Void
	{
		_tasks.addTask(task);
	}

	/** Returns true if the IEntity has any tasks. */
	public function hasTasks () :Bool
	{
		return _tasks.hasTasks();
	}

	/** Returns true if the IEntity has any tasks with the given name. */
	public function hasTasksNamed (name :String) :Bool
	{
		return _tasks.hasTasksNamed(name);
	}

	/** Removes all tasks from the IEntity. */
	public function removeAllTasks () :Void
	{
		_tasks.removeAllTasks();
	}

	/** Removes all tasks with the given name from the IEntity. */
	public function removeNamedTasks (name :String) :Void
	{
		_tasks.removeNamedTasks(name);
	}

	override function onRemove () :Void
	{
		_tasks.removeAllTasks();
		super.onRemove();
	}
}


