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
import com.pblabs.engine.core.PropertyReference;

import feffects.easing.Cubic;
import feffects.easing.Linear;

class AnimatePropertyTask extends InterpolatingTask 
{
	public static function CreateLinear (ref :PropertyReference<Float>, targetValue :Float, time :Float)
		:AnimatePropertyTask
	{
		return new AnimatePropertyTask(
			ref,
			targetValue,
			time,
			Linear.easeNone);
	}

	public static function CreateSmooth (ref :PropertyReference<Float>, targetValue :Float, time :Float)
		:AnimatePropertyTask
	{
		return new AnimatePropertyTask(
			ref,
			targetValue,
			time,
			Cubic.easeInOut);
	}

	public static function CreateEaseIn (ref :PropertyReference<Float>, targetValue :Float, time :Float)
		:AnimatePropertyTask
	{
		return new AnimatePropertyTask(
			ref,
			targetValue,
			time,
			Cubic.easeIn);
	}

	public static function CreateEaseOut (ref :PropertyReference<Float>, targetValue :Float, time :Float)
		:AnimatePropertyTask
	{
		return new AnimatePropertyTask(
			ref,
			targetValue,
			time,
			Cubic.easeOut);
	}

	public function new (
		ref :PropertyReference<Float>,
		targetValue :Float,
		?time :Float = 0,
		?easingFn :Float->Float->Float->Float->Float = null)
	{
		super(time, easingFn);

		if (null == ref) {
			throw "ref must be non null, and must contain a 'value' property";
		}

		_to = targetValue;
		_valueRef = ref;
	}

	public override function update (dt :Float, obj :IEntity) :Bool
	{
		if (0 == _elapsedTime) {
			_from = obj.getProperty(_valueRef);
			if (Math.isNaN(_from)) {
				throw "_valueRef must be non null, and must be a numerical property.";
			}
		}
		super.update(dt, obj);
		obj.setProperty(_valueRef, interpolate(_from, _to));
		return (_elapsedTime >= _totalTime);
	}

	public override function clone () :IEntityTask
	{
		return new AnimatePropertyTask(_valueRef, _to, _totalTime, _easingFn);
	}

	var _to :Float;
	var _from :Float;
	var _valueRef :PropertyReference<Float>;
}

