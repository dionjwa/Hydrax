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

class TimedTask
	implements IEntityTask {
	
	public function new (time :Float = 0)
	{
		_time = time;
		_elapsedTime = 0;
	}

	public function update (dt :Float, obj :IEntity) :Bool
	{
		_elapsedTime += dt;
		return (_elapsedTime >= _time);//Finished
	}

	public function clone () :IEntityTask
	{
		return new TimedTask(_time);
	}

	var _time :Float;
	var _elapsedTime :Float;
}

