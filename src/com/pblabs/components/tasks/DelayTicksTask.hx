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
import org.transition9.util.Preconditions;

class DelayTicksTask
	implements IEntityTask {
	
	public function new (?ticks :Int = 1)
	{
		Preconditions.checkArgument(ticks >= 1 && ticks != Math.NaN, "Invalid number of ticks=" + ticks);
		_ticks = ticks;
		_elapsedTicks = 0;
	}

	public function update (dt :Float, obj :IEntity) :Bool
	{
		_elapsedTicks++;

		return (_elapsedTicks >= _ticks);
	}

	public function clone () :IEntityTask
	{
		return new DelayTicksTask(_ticks);
	}

	var _ticks :Int;
	var _elapsedTicks :Int;
}
