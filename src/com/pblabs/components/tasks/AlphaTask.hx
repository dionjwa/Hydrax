/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/

package com.pblabs.components.tasks;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.util.Preconditions;
import haxe.rtti.ReflectUtil;

class AlphaTask extends InterpolatingTask
{
	public static function CreateLinear (alpha :Float, time :Float) :AlphaTask
	{
		return new AlphaTask(alpha, time, feffects.easing.Linear.easeNone);
	}

	public static function CreateSmooth (alpha :Float, time :Float) :AlphaTask
	{
		return new AlphaTask(alpha, time, feffects.easing.Cubic.easeInOut);
	}

	public static function CreateEaseIn (alpha :Float, time :Float) :AlphaTask
	{
		return new AlphaTask(alpha, time, feffects.easing.Cubic.easeIn);
	}

	public static function CreateEaseOut (alpha :Float, time :Float) :AlphaTask
	{
		return new AlphaTask(alpha, time, feffects.easing.Cubic.easeOut);
	}

	public function new (alpha :Float, ?time :Float = 0, ?easingFn :Float->Float->Float->Float->Float = null)
	{
		super(time, easingFn);
		_to = alpha;
		_from = 0;
	}
	
	public override function update (dt :Float, obj :IEntity) :Bool
	{
		if (0 == _elapsedTime) {
			com.pblabs.util.Assert.isNotNull(obj.getComponent(BaseSceneComponent), ' obj.getComponent(BaseSceneComponent) is null');
			_from = obj.getComponent(BaseSceneComponent).alpha;
			if (Math.isNaN(_from)) {
				throw "_from must be non null, and must be a numerical property.";
			}
		}
		super.update(dt, obj);
		for (sc in obj.getComponents(BaseSceneComponent)) {
			sc.alpha = interpolate(_from, _to);
		}
		return (_elapsedTime >= _totalTime);
	}

	public override function clone () :IEntityTask
	{
		return new AlphaTask(_to, _totalTime, _easingFn);
	}

	var _to :Float;
	var _from :Float;

}
