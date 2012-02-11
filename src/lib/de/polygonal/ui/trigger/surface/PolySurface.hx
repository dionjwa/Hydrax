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
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.inside.PointInsidePoly;
import de.polygonal.motor.geom.primitive.Poly2;
import de.polygonal.ui.trigger.pointer.Pointer;

using de.polygonal.core.math.Mathematics;

class PolySurface extends AbstractSurface
{
	public var poly(default, null):Poly2;
	
	var _vertexList:Array<Vec2>;
	
	public function new(x:Float, y:Float, poly:Poly2)
	{
		super();
		
		this.poly = poly;
		setX(x);
		setY(y);
		
		_vertexList = new Array<Vec2>();
		for (i in 0...poly.vertexCount) _vertexList.push(new Vec2());
	}
	
	override public function free():Void 
	{
		poly.free();
		poly = null;
		
		super.free();
	}
	
	override public function isTouching(pointer:Pointer, sweep:Bool):Bool 
	{
		/*
		var p0 = pointer.p0;
		var p1 = pointer.p1;
		if (sweep)
		{
			if ((p1.x - p0.x).fabs() < Mathematics.EPS && (p1.y - p0.y).fabs() < Mathematics.EPS)
				return PointInsidePoly.test(p1, poly);
			else
			{
				throw "TODO";
				return false;
				//TODO return IntersectSegmentPoly
			}
		}
		else*/
			return PointInsidePoly.test(pointer.position(), poly);
	}
	
	override function _hookSyncCenter()
	{
		//TODO why not implemented?
	}
	
	override function _hookSyncSurface()
	{
		poly.transform(_center.x, _center.y, 0);
	}
	
	override function _hookSyncBound()
	{
		poly.getBound(getBound());
	}
}