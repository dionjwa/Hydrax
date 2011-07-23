/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/

package com.pblabs.components.tasks;

import com.pblabs.engine.core.IEntity;

interface IEntityTask
{
	/**
	  * Returns true if the task is finished.
	  */
	function update (dt :Float, obj :IEntity) :Bool;

	function clone () :IEntityTask;

}

