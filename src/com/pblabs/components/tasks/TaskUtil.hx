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

/**
  * By "using" this class, entity objects get TaskComponent methods
  * directly.
  */
class TaskUtil
{
    public static function When (task :IEntityTask, predicate :Void->Bool) :IEntityTask
    {
        return new SerialTask(new FunctionTask(predicate), task);
    }
    
    public static function After (task :IEntityTask, duration :Float) :IEntityTask
    {
        return (if (duration > 0) new SerialTask(new TimedTask(duration), task) else task);
    }
    
     /** Adds a named task to this IEntity. */
    public static function addNamedTask (e :IEntity, name :String, task :IEntityTask, ?removeExistingTasks :Bool =
        false) :Void
    {
        getTaskComponent(e).addNamedTask(name, task, removeExistingTasks);
    }
    
    /** Adds an unnamed task to this IEntity. */
    public static function addTask (e :IEntity, task :IEntityTask) :Void
    {
        getTaskComponent(e).addTask(task);
    }

    /** Returns true if the IEntity has any tasks. */
    public function hasTasks (e :IEntity) :Bool
    {
        return getTaskComponent(e).hasTasks();
    }

    /** Returns true if the IEntity has any tasks with the given name. */
    public function hasTasksNamed (e :IEntity, name :String) :Bool
    {
        return getTaskComponent(e).hasTasksNamed(name);
    }

    /** Removes all tasks from the IEntity. */
    public static function removeAllTasks (e :IEntity) :Void
    {
        getTaskComponent(e).removeAllTasks();
    }

    /** Removes all tasks with the given name from the IEntity. */
    public static function removeNamedTasks (e :IEntity, name :String) :Void
    {
        getTaskComponent(e).removeNamedTasks(name);
    }
    
    static function getTaskComponent (e :IEntity) :TaskComponent
    {
        return e.lookupComponentByName(TaskComponent.NAME);
    }
}


