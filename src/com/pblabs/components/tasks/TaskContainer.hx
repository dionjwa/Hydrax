/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript Flashbang library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * Flashbang - a framework for creating Flash games
 * Copyright (C) 2008-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/flashbang/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
 
package com.pblabs.components.tasks;

import com.pblabs.engine.core.IEntity;
import org.transition9.util.Assert;

class TaskContainer
	implements IEntityTask 
{
	// #if debug
	// var key :Int;
	// #end
	
	public static var TYPE__LIMIT:Int = 3;
	public static var TYPE_PARALLEL:Int = 0;
	public static var TYPE_REPEATING:Int = 2;
	public static var TYPE_SERIAL:Int = 1;

	var _activeTaskCount :Int;
	var _completedTasks :Array<IEntityTask> ;
	var _invalidated :Bool;
	var _tasks :Array<IEntityTask> ;

	var _type :Int;
	
	public function new (type :Int, ?subtasks :Array<IEntityTask> = null)
	{
		// key = com.pblabs.engine.util.PBUtil.KEY_COUNT++;
		if (type >= TYPE__LIMIT) {
			throw "invalid 'type' parameter";
		}

		_type = type;
		_tasks = [];
		_completedTasks = [];

		if (subtasks != null) {
			for (task in subtasks) {
				addTask(task);
			}
		}
	}

	/** Adds a child task to the TaskContainer. */
	public function addTask (task :IEntityTask) :Void
	{
		if (null == task) {
			throw "task must be non-null";
		}

		_tasks.push(task);
		_completedTasks.push(null);
		_activeTaskCount += 1;
	}

	/** Returns a clone of the TaskContainer. */
	public function clone () :IEntityTask
	{
		var clonedSubtasks:Array<IEntityTask> = cloneSubtasks();

		var theClone:TaskContainer = new TaskContainer(_type);
		theClone._tasks = clonedSubtasks;
		// theClone._completedTasks = ArrayUtil.create(clonedSubtasks.length, null);
		theClone._completedTasks = new Array<IEntityTask>();
		for (i in 0...clonedSubtasks.length) {
			theClone._completedTasks[i] = null;
		}
		theClone._activeTaskCount = clonedSubtasks.length;

		return theClone;
	}

	/** Returns true if the TaskContainer has any child tasks. */
	public function hasTasks () :Bool
	{
		return (_activeTaskCount > 0);
	}

	/** Removes all tasks from the TaskContainer. */
	public function removeAllTasks () :Void
	{
		_invalidated = true;
		_tasks = new Array<IEntityTask>();
		_completedTasks = new Array<IEntityTask>();
		_activeTaskCount = 0;
	}

	public function update (dt :Float, obj :IEntity) :Bool
	{
		// trace("update " + key);
		// var key1 = key;
		var result :Bool = applyFunction(
			function (task :IEntityTask) :Bool {
				// trace("updating " + key1 + " task " + task);
				return task.update(dt, obj);
			});

		return result;
	}

	/**
	 * Helper function that applies the function f to each object in the container
	 * (for parallel tasks) or the first object in the container (for serial and repeating tasks)
	 * and returns true if there are no more active tasks in the container.
	 * f must be of the form:
	 * function f (task :IEntityTask) :Boolean
	 * it must return true if the task is complete after f is applied.
	 */
	function applyFunction (f :IEntityTask -> Bool) :Bool
	{
		_invalidated = false;

		var n:Int = _tasks.length;
		for (i in 0...n) {

			// we can have holes in the array
			if (_tasks[i] == null) {
				continue;
			}
			
			var task = _tasks[i];

			if (null == task) {
				continue;
			}

			var complete:Bool = f(task);

			if (_invalidated) {
				// The TaskContainer was destroyed by its containing
				// IEntity during task iteration. Stop processing immediately.
				return false;
			}

			if (!complete && TYPE_PARALLEL != _type) {
				// Serial and Repeating tasks proceed one task at a time
				break;

			} else if (complete) {
				// the task is complete - move it the completed tasks array
				_completedTasks[i] = _tasks[i];
				_tasks[i] = null;
				_activeTaskCount -= 1;
			}
		}

		// if this is a repeating task and all its tasks have been completed, start over again
		if (_type == TYPE_REPEATING && 0 == _activeTaskCount && _completedTasks.length > 0) {
			var completedTasks:Array<IEntityTask> = _completedTasks;

			_tasks = new Array<IEntityTask>();
			_completedTasks = new Array<IEntityTask>();

			for (completedTask in completedTasks) {
				addTask(completedTask.clone());
			}
		}

		// once we have no more active tasks, we're complete
		return (0 == _activeTaskCount);
	}

	function cloneSubtasks () :Array<IEntityTask>
	{
		Assert.isTrue(_tasks.length == _completedTasks.length);

		var out:Array<IEntityTask> = new Array<IEntityTask>();

		// clone each child task and put it in the cloned container
		var n:Int = _tasks.length;
		for (i in 0...n) {
			var task:IEntityTask =
				(null != _tasks[i] ? cast( _tasks[i], IEntityTask) : cast( _completedTasks[i], IEntityTask));
			Assert.isNotNull(task);
			out[i] = task.clone();
		}

		return out;
	}
}

