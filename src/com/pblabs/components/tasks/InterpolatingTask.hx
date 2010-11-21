/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/

package com.pblabs.components.tasks;

import com.pblabs.util.MathUtil;

import feffects.easing.Linear;

import com.pblabs.engine.core.IEntity;
import com.pblabs.components.tasks.IEntityTask;

class InterpolatingTask implements IEntityTask 
{
	
	public function new (?time :Float = 0, ?easingFn :Float->Float->Float->Float->Float = null)
	{
		_totalTime = Math.max(time, 0);
		// default to linear interpolation
		_easingFn = (easingFn != null ? easingFn : feffects.easing.Linear.easeNone);
		_elapsedTime = 0;
	}

	public function update (dt :Float, obj :IEntity) :Bool
	{
		_elapsedTime += dt;
		return (_elapsedTime >= _totalTime);
	}

	public function clone () :IEntityTask
	{
		return new InterpolatingTask(_totalTime, _easingFn);
	}

	function interpolate (a :Float, b :Float) :Float
	{
		return interp(a, b, _elapsedTime, _totalTime, _easingFn);
	}

	static function interp (a :Float, b :Float, t :Float, duration :Float,
		easingFn :Float->Float->Float->Float->Float) :Float
	{
		if (duration <= 0) {
			return b;
		}
		t = MathUtil.fclamp(t, 0, duration);
		return easingFn(t, a, (b - a), duration);
	}

	var _totalTime :Float;
	var _elapsedTime :Float;
	var _easingFn :Float->Float->Float->Float->Float;
}


