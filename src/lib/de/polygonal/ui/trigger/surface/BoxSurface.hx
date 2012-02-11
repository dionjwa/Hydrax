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
package de.polygonal.ui.trigger.surface;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.geom.inside.PointInsideAABB;
import de.polygonal.motor.geom.intersect.IntersectSegmentAABB;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.ui.trigger.pointer.Pointer;

using de.polygonal.core.math.Mathematics;

class BoxSurface extends AbstractSurface
{
	/**
	 * Creates a BoxSurface that matches <code>x</code>.
	 */
	public static function ofAABB(x:AABB2):BoxSurface
	{
		return new BoxSurface(x.minX, x.minY, x.intervalX, x.intervalY);
	}
	
	public function new(x:Float, y:Float, width:Float, height:Float)
	{
		super();
		
		_bound.minX = x;
		_bound.minY = y;
		_bound.maxX = x + width;
		_bound.maxY = y + height;
	}
	
	override public function isTouching(pointer:Pointer, sweep:Bool):Bool
	{
		/*var p0 = pointer.p0;
		var p1 = pointer.p1;
		
		if (sweep)
		{
			if ((p1.x - p0.x).fabs() < Mathematics.EPS && (p1.y - p0.y).fabs() < Mathematics.EPS)
				return PointInsideAABB.test2(p1, _bound);
			else
				return IntersectSegmentAABB.test8(p0.x, p0.y, p1.x, p1.y, _bound.minX, _bound.minY, _bound.maxX, _bound.maxY);
		}
		else*/
			return PointInsideAABB.test2(pointer.position(), _bound);
	}
	
	override function _hookSyncCenter()
	{
		setX(_bound.centerX);
		setY(_bound.centerY);
	}
	
	override function _hookSyncSurface()
	{
		_bound.centerX = getX();
		_bound.centerY = getY();
	}
	
	override function _hookSyncBound()
	{
		//move bounding box center to surface center
		var x  = getX();
		var y  = getY();
		var ex = _bound.intervalX * .5;
		var ey = _bound.intervalY * .5;
		_bound.set4(x - ex, y - ey, x + ex, y + ey);
	}
}