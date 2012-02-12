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

class ConvexContact extends Contact
{
	var _mp1:ManifoldPoint;
	var _mp2:ManifoldPoint;
	
	var _id0_1:Int;
	var _id0_2:Int;
	
	var _Pn0_1:Float;
	var _Pn0_2:Float;
	
	var _Pt0_1:Float;
	var _Pt0_2:Float;
	
	function new(settings:Settings)
	{
		super(settings);
		
		_mp1 = manifold.mp1;
		_mp2 = manifold.mp2;
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		super.init(shape1, shape2);
		
		_mp1.matched = false;
		_mp2.matched = false;
	}
	
	override public function free():Void
	{
		_mp1 = null;
		_mp2 = null;
		
		super.free();
	}

	override public function evaluate():Void
	{
		shape1.syncFeatures();
		shape2.syncFeatures();
		
		if (!_settings.doWarmStart)
		{
			//update contact manifold
			super.evaluate();
			return;
		}
		
		//match contact id's and re-apply impulses where possible
		//{<-- store last normal/tangent impulse
		_mp1.matched = false;
		_mp2.matched = false;
		
		var k0 = manifold.pointCount;
		if (k0 > 0)
		{
			_id0_1 = _mp1.id;
			_Pn0_1 = _mp1.Pn;
			_Pt0_1 = _mp1.Pt;
			
			if (k0 > 1)
			{
				_id0_2 = _mp2.id;
				_Pn0_2 = _mp2.Pn;
				_Pt0_2 = _mp2.Pt;
			}
		}
		//}-->
		
		//update contact manifold
		super.evaluate();
		
		//{<-- match contact ids and re-apply normal/tangent impulse
		var k1 = manifold.pointCount;
		
		//reset impulses first, then try to re-match
		_mp1.Pn = .0;
		_mp1.Pt = .0;
		_mp2.Pn = .0;
		_mp2.Pt = .0;
		
		if (k1 == 1)
		{
			if (k0 == 1)
			{
				//match one new contact against one old contact
				//compare new1 -> old1
				if (_mp1.id == _id0_1)
				{
					_mp1.Pn = _Pn0_1;
					_mp1.Pt = _Pt0_1;
					_mp1.matched = true;
				}
			}
			else
			if (k0 == 2)
			{
				//match one new contact against two old contacts
				var newKey = _mp1.id;
				
				//compare new1 -> old1
				if (newKey == _id0_1)
				{
					_mp1.Pn = _Pn0_1;
					_mp1.Pt = _Pt0_1;
					_mp1.matched = true;
				}
				else
				//compare new1 -> old2
				if (newKey == _id0_2)
				{
					_mp1.Pn = _Pn0_2;
					_mp1.Pt = _Pn0_2;
					_mp1.matched = true;
				}
			}
		}
		else
		if (k1 == 2)
		{
			if (k0 == 1)
			{
				//match two new contacts against one old contact
				//compare new1 -> old1
				if (_mp1.id == _id0_1)
				{
					_mp1.Pn = _Pn0_1;
					_mp1.Pt = _Pt0_1;
					_mp1.matched = true;
				}
				else
				//compare new2 -> old1
				if (_mp2.id == _id0_1)
				{
					_mp2.Pn = _Pn0_1;
					_mp2.Pt = _Pt0_1;
					_mp2.matched = true;
				}
			}
			else
			if (k0 == 2)
			{
				//match two new contacts against two old contacts
				//compare new1 -> old1
				if (_mp1.id == _id0_1)
				{
					_mp1.Pn = _Pn0_1;
					_mp1.Pt = _Pt0_1;
					_mp1.matched = true;
					
					//compare new2 -> old2
					if (_mp2.id == _id0_2)
					{
						_mp2.Pn = _Pn0_2;
						_mp2.Pt = _Pt0_2;
						_mp2.matched = true;
					}
				}
				else
				//compare new1 -> old2
				if (_mp1.id == _id0_2)
				{
					_mp1.Pn = _Pn0_2;
					_mp1.Pt = _Pt0_2;
					_mp1.matched = true;
					
					//compare new2 -> old1
					if (_mp2.id == _id0_1)
					{
						_mp2.Pn = _Pn0_1;
						_mp2.Pt = _Pt0_1;
						_mp2.matched = true;
					}
				}
				else
				//compare new2 -> old1
				if (_mp2.id == _id0_1)
				{
					_mp2.Pn = _Pn0_1;
					_mp2.Pt = _Pt0_1;
					_mp2.matched = true;
				}
				else
				{
					//compare new2 -> old2
					if (_mp2.id == _id0_2)
					{
						_mp2.Pn = _Pn0_2;
						_mp2.Pt = _Pt0_2;
						_mp2.matched = true;
					}
				}
			}
		}
		//}-->
	}
}