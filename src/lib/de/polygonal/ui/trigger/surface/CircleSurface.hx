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
import de.polygonal.motor.geom.inside.PointInsideSphere;
import de.polygonal.motor.geom.intersect.IntersectSegmentSphere;
import de.polygonal.motor.geom.primitive.Sphere2;
import de.polygonal.ui.trigger.pointer.Pointer;

using de.polygonal.core.math.Mathematics;

class CircleSurface extends AbstractSurface
{
	public var circle(default, null):Sphere2;
	
	public function new(x:Float, y:Float, r:Float)
	{
		super();
		
		circle = new Sphere2(x, y, r);
	}
	
	override public function free():Void 
	{
		circle = null;
		
		super.free();
	}
	
	override public function isTouching(pointer:Pointer, sweep:Bool):Bool 
	{
		/*var p0 = pointer.p0;
		var p1 = pointer.p1;
		if (sweep)
		{
			if ((p1.x - p0.x).fabs() < Mathematics.EPS && (p1.y - p0.y).fabs() < Mathematics.EPS)
				return PointInsideSphere.test2(p1, circle);
			else
				return IntersectSegmentSphere.test7(p0.x, p0.y, p1.x, p1.y, getX(), getY(), circle.r);
		}
		else*/
			return PointInsideSphere.test2(pointer.position(), circle);
	}
	
	override function _hookSyncCenter()
	{
		setX(circle.c.x);
		setY(circle.c.y);
	}
	
	override function _hookSyncSurface()
	{
		circle.c.x = getX();
		circle.c.y = getY();
	}
	
	override function _hookSyncBound()
	{
		var r = circle.r;
		var x = getX();
		var y = getY();
		getBound().set4(x - r, y - r, x + r, y + r);
	}
}