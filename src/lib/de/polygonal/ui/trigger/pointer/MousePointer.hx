/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.ui.trigger.pointer;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.Root;
import de.polygonal.ui.UI;

/**
 * The system mouse pointer in world coordinates.
 */
class MousePointer implements Pointer
{
	static var _instance:MousePointer;
	public static function instance():MousePointer
	{
		if (_instance == null)
			_instance = new MousePointer();
		return _instance;
	}
	
	public var snap:Float;
	
	var _tmp:Vec2;
	var _velocity:Vec2;
	
	function new()
	{
		//snap = 10;
		snap = 0;
		
		_tmp = new Vec2(UI.instance().mouse.x, UI.instance().mouse.y);
		_velocity = new Vec2();
	}
	
	public function isActive():Bool
	{
		return UI.instance().isMouseDown;
	}
	
	public function position():Vec2
	{
		return _tmp;
	}
	
	public function velocity():Vec2 
	{
		return _velocity;
	}
	
	public function update():Void
	{
		var x = UI.instance().mouse.x;
		var y = UI.instance().mouse.y;
		
		if (snap != 0)
		{
			x = Mathematics.snap(x, snap) * snap;
			y = Mathematics.snap(y, snap) * snap;
		}
		
		_velocity.x = x - _tmp.x;
		_velocity.y = y - _tmp.y;
		_tmp.x = x;
		_tmp.y = y;
	}
}