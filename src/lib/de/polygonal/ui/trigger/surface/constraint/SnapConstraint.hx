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
package de.polygonal.ui.trigger.surface.constraint;

import de.polygonal.core.math.Vec2;
import de.polygonal.ui.alignment.Axis;
import de.polygonal.ui.trigger.surface.Surface;
import de.polygonal.ui.trigger.surface.SurfaceConstraint;

class SnapConstraint implements SurfaceConstraint
{
	public var interval:Float;
	
	var _axis:Axis;
	
	public function new(interval:Float, axis:Axis)
	{
		this.interval = interval;
		
		_axis = axis;
	}
	
	public function free():Void 
	{
	}
	
	public function evaluate(c:Vec2):Void
	{
		if (interval != .0)
		{
			switch (_axis)
			{
				case Axis.x:
					c.x = snap(c.x);
				
				case Axis.y:
					c.y = snap(c.y);
			}
		}
	}
	
	inline function snap(x:Float)
	{
		var snap = x % interval;
		if (snap <= interval * .5)
			x -= snap;
		else
			x += interval - snap;
		return x;
	}
}