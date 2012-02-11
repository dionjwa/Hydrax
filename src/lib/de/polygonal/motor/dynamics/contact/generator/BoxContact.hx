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

import de.polygonal.motor.collision.pairwise.CollideAABB;
import de.polygonal.motor.collision.pairwise.CollideAABBOBB;
import de.polygonal.motor.collision.pairwise.CollideOBB;
import de.polygonal.motor.collision.pairwise.Collider;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.Settings;

import de.polygonal.ds.BitFlags;
using de.polygonal.ds.BitFlags;

class BoxContact extends ConvexContact
{
	var _collider1:CollideAABB;
	var _collider2:CollideAABBOBB;
	var _collider3:CollideOBB;
	
	public function new(settings:Settings)
	{
		super(settings);
		
		_collider1 = new CollideAABB(settings);
		_collider2 = new CollideAABBOBB(settings);
		_collider3 = new CollideOBB(settings);
	}
	
	override public function free():Void
	{
		_collider1.free();
		_collider2.free();
		_collider3.free();
		
		_collider1 = null;
		_collider2 = null;
		_collider3 = null;
		
		super.free();
	}
	
	override public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		if (shape2.hasf(AbstractShape.AXIS_ALIGNED) && !shape1.hasf(AbstractShape.AXIS_ALIGNED))
		{
			//first shape is always AABB if one shape has the AXIS_ALIGNED flag 
			super.init(shape2, shape1);
		}
		else
			super.init(shape1, shape2);
	}

	override function _getCollider():Collider
	{
		var a = shape1.getf(AbstractShape.AXIS_ALIGNED);
		var b = shape2.getf(AbstractShape.AXIS_ALIGNED);
		
		if ((a | b) > 0) return _collider2;
		
		if ((a & b) == AbstractShape.AXIS_ALIGNED) return _collider1;
		
		return _collider3;
	}
}