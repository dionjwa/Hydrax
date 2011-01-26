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

import com.pblabs.components.base.Coordinates;
import com.pblabs.components.tasks.AnimatePropertyTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.engine.core.PropertyReference;

import haxe.Public;

class LocationTask extends ParallelTask {
	
	public static function CreateLinear (x :Float, y :Float, time :Float, ?xRef :PropertyReference<Float> = null, ?yRef :PropertyReference<Float> = null) :LocationTask
	{
		return new LocationTask(xRef, yRef, x, y, time, feffects.easing.Linear.easeNone);
	}

	public static function CreateSmooth (x :Float, y :Float, time :Float, ?xRef :PropertyReference<Float> = null, ?yRef :PropertyReference<Float> = null) :LocationTask
	{
		return new LocationTask(xRef, yRef, x, y, time, feffects.easing.Cubic.easeInOut);
	}

	public static function CreateEaseIn (x :Float, y :Float, time :Float, ?xRef :PropertyReference<Float> = null, ?yRef :PropertyReference<Float> = null) :LocationTask
	{
		return new LocationTask(xRef, yRef, x, y, time, feffects.easing.Cubic.easeIn);
	}

	public static function CreateEaseOut (x :Float, y :Float, time :Float, ?xRef :PropertyReference<Float> = null, ?yRef :PropertyReference<Float> = null) :LocationTask
	{
		return new LocationTask(xRef, yRef, x, y, time, feffects.easing.Cubic.easeOut);
	}

	public function new (?xRef :PropertyReference<Float> = null, ?yRef :PropertyReference<Float> = null, 
		x :Float, y :Float, ?time :Float = 0, ?easingFn :Float->Float->Float->Float->Float = null)
	{
		super();
		xRef = if (xRef == null) Coordinates.P_X else xRef;
		yRef = if (yRef == null) Coordinates.P_Y else yRef;
		addTask(new AnimatePropertyTask(xRef, x, time, easingFn));
		addTask(new AnimatePropertyTask(yRef, y, time, easingFn));
	}

}
