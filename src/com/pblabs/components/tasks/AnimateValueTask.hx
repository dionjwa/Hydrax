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
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;

class AnimateValueTask extends InterpolatingTask {
	
	public static function CreateLinear (obj :Dynamic, fieldName :String, targetValue :Float, time :Float)
		:AnimateValueTask
	{
		return new AnimateValueTask(
			obj,
			fieldName,
			targetValue,
			time,
			feffects.easing.Linear.easeNone);
	}

	public static function CreateSmooth (obj :Dynamic, fieldName :String, targetValue :Float, time :Float)
		:AnimateValueTask
	{
		return new AnimateValueTask(
			obj,
			fieldName,
			targetValue,
			time,
			feffects.easing.Cubic.easeInOut);
	}

	public static function CreateEaseIn (obj :Dynamic, fieldName :String, targetValue :Float, time :Float)
		:AnimateValueTask
	{
		return new AnimateValueTask(
			obj,
			fieldName,
			targetValue,
			time,
			feffects.easing.Cubic.easeIn);
	}

	public static function CreateEaseOut (obj :Dynamic, fieldName :String, targetValue :Float, time :Float)
		:AnimateValueTask
	{
		return new AnimateValueTask(
			obj,
			fieldName,
			targetValue,
			time,
			feffects.easing.Cubic.easeOut);
	}

	public function new (obj :Dynamic, fieldName :String, targetValue :Float, ?time :Float = 0, ?easingFn :Dynamic = null)
	{
		super(time, easingFn);
		_obj = obj;
		_fieldName = fieldName;
		
		Preconditions.checkNotNull(fieldName,  "fieldName null");
		Preconditions.checkArgument(obj != null && ReflectUtil.fieldGS(obj, fieldName) != null,  "obj must be non null, and must contain a 'value' property");
		Preconditions.checkArgument(!Math.isNaN(ReflectUtil.fieldGS(obj, fieldName)),  "targetValue is NaN");

		_to = targetValue;
	}

	public override function update (dt :Float, obj :IEntity) :Bool
	{
		if (0 == _elapsedTime) {
			// _from = ReflectUtil.field(_obj, _fieldName);
			_from = ReflectUtil.fieldGS(_obj, _fieldName);
			if (Math.isNaN(_from)) {
				throw _obj + "." + _fieldName + " must be non null, and must be a numerical property.";
			}
		}
		
		if (Math.isNaN(_to)) {
			throw "_to must be non null, and must be a numerical property.";
		}

		super.update(dt, obj);
		// ReflectUtil.setField(_obj, _fieldName, interpolate(_from, _to));
		ReflectUtil.setFieldGS(_obj, _fieldName, interpolate(_from, _to));

		return _elapsedTime >= _totalTime;
	}

	public override function clone () :IEntityTask
	{
		return new AnimateValueTask(_obj, _fieldName, _to, _totalTime, _easingFn);
	}

	var _to :Float;
	var _from :Float;
	var _fieldName :String;
	var _obj :Dynamic;
}


