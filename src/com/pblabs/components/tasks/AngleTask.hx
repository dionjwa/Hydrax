/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.tasks;

import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.AnimatePropertyTask;
import com.pblabs.components.tasks.IEntityTask;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.components.Constants;

import feffects.easing.Cubic;
import feffects.easing.Linear;

class AngleTask extends AnimatePropertyTask 
{
	
	public static function CreateLinear (angle :Float, time :Float)
		:AngleTask
	{
		return new AngleTask(angle, time, Linear.easeNone);
	}

	public static function CreateSmooth (angle :Float, time :Float)
		:AngleTask
	{
		return new AngleTask(angle, time, Cubic.easeInOut);
	}

	public static function CreateEaseIn (angle :Float, time :Float)
		:AngleTask
	{
		return new AngleTask(angle, time, Cubic.easeIn);
	}

	public static function CreateEaseOut (angle :Float, time :Float)
		:AngleTask
	{
		return new AngleTask(angle, time, Cubic.easeOut);
	}

	public function new (angle :Float, ?time :Float = 0,
							   ?easingFn :Float->Float->Float->Float->Float = null, ?ref :PropertyReference<Float>)
	{
		super(ref == null ? Constants.DEFAULT_ANGLE_PROP : ref, angle, time, easingFn);
	}

	public override function clone () :IEntityTask
	{
		return new AngleTask(_to, _totalTime, _easingFn);
	}

}
