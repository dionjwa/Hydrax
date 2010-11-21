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

import flash.display.MovieClip;

class GoToFrameTask
	implements IEntityTask {
	
	public function new (movie :MovieClip, frame :Dynamic, ?scene :String = null,
		?gotoAndPlay :Bool = true)
	{
		_frame = frame;
		_scene = scene;
		_gotoAndPlay = gotoAndPlay;
		_movie = movie;
	}

	public function update (dt :Float, obj :IEntity) :Bool
	{
		if (_gotoAndPlay) {
			_movie.gotoAndPlay(_frame, _scene);
		} else {
			_movie.gotoAndStop(_frame, _scene);
		}

		return true;
	}

	public function clone () :IEntityTask
	{
		return new GoToFrameTask(_movie, _frame, _scene, _gotoAndPlay);
	}

	var _frame:Dynamic;
	var _scene:String;
	var _gotoAndPlay:Bool;
	var _movie:MovieClip;
}

