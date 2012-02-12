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
package de.polygonal.motor.dynamics.contact.generator;

import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.Contact;
import de.polygonal.motor.dynamics.contact.ManifoldPoint;
import de.polygonal.motor.Settings;

class ConvexCircleContact extends Contact
{
	var _cp:ManifoldPoint;
	
	var _id0:Int;
	var _Pn0:Float;
	var _Pt0:Float;

	function new(settings:Settings)
	{
		super(settings);
		
		_cp = manifold.mp1;
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		super.init(shape1, shape2);
		_cp.matched = false;
	}
	
	override public function free():Void
	{
		_cp = null;
		
		super.free();
	}
	
	override public function evaluate():Void
	{
		if (!_settings.doWarmStart)
		{
			//update contact manifold
			super.evaluate();
			return;
		}
		
		//{<-- store last normal/tangent impulse
		_cp.matched = false;
		
		var k0 = manifold.pointCount;
		if (k0 > 0)
		{
			_id0 = _cp.id;
			_Pn0 = _cp.Pn;
			_Pt0 = _cp.Pt;
		}
		//}-->
		
		//update contact manifold
		super.evaluate();
		
		//{<-- match contact ids and re-apply normal/tangent impulse
		var k1 = manifold.pointCount;
		if (k1 > 0)
		{
			if (k0 == 1 && k1 == 1)
			{
				//match one new contact against one old contact
				if (_cp.id == _id0)
				{
					_cp.Pn = _Pn0;
					_cp.Pt = _Pt0;
					_cp.matched = true;
				}
				else
				{
					_cp.Pn = 0;
					_cp.Pt = 0;
				}
			}
			else
			{
				_cp.Pn = 0;
				_cp.Pt = 0;
			}
		}
		//}-->
	}
}