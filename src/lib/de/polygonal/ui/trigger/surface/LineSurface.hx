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
import de.polygonal.gl.Window;
import de.polygonal.motor.geom.distance.DistancePointSegment;
import de.polygonal.motor.geom.intersect.IntersectSegment;
import de.polygonal.motor.geom.primitive.Segment2;
import de.polygonal.ui.trigger.pointer.Pointer;

using de.polygonal.core.math.Mathematics;

class LineSurface extends AbstractSurface
{
	public var segment(default, null):Segment2;
	
	var _threshold:Float;
	var _infinite:Bool;
	
	public function new(ax:Float, ay:Float, bx:Float, by:Float, ?threshold = 10., ?infinite = false)
	{
		super();
		
		_threshold = threshold;
		_infinite  = infinite;
		segment    = new Segment2(ax, ay, bx, by);
	}
	
	override public function free():Void
	{
		segment = null;
		
		super.free();
	}
	
	override public function isTouching(pointer:Pointer, sweep:Bool):Bool 
	{
		/*var p0 = pointer.p0;
		var p1 = pointer.p1;
		if (sweep)
		{
			if ((p1.x - p0.x).fabs() < Mathematics.EPS && (p1.y - p0.y).fabs() < Mathematics.EPS)
				return DistancePointSegment.find2(p1, segment) < (_threshold * _threshold);
			else
			{
				var a = segment.a;
				var b = segment.b;
				return IntersectSegment.test8(p0.x, p0.y, p1.x, p1.y, a.x, a.y, b.x, b.y);
			}
		}
		else*/
			return DistancePointSegment.find2(pointer.position(), segment) < (_threshold * _threshold);
	}
	
	/**
	 * Modifies the segment.
	 * @param ax endpoint #1, x coordinate
	 * @param ay endpoint #1, y coordinate
	 * @param bx endpoint #2, x coordinate
	 * @param by endpoint #2, y coordinate
	 */
	public function setSegment(ax:Float, ay:Float, bx:Float, by:Float)
	{
		segment.a.x = ax;
		segment.a.y = ay;
		segment.b.x = bx;
		segment.b.y = by;
		invalidate();
		update();
	}
	
	override function _hookSyncCenter()
	{
		segment.getCenter(_center);
	}
	
	override function _hookSyncSurface()
	{
		segment.setCenter(_center);
	}
	
	override function _hookSyncBound()
	{
		var a = segment.a;
		var b = segment.b;
		
		var dx = b.x - a.x;
		var dy = b.y - a.y;
		var l = 1 / Math.sqrt(dx * dx + dy * dy);
		var nx = dy * l;
		var ny =-dx * l;
		
		if (_infinite)
		{
			//clip line through segment against stage bound
			var dx =-ny;
			var dy = nx;
			
			var ax = a.x;
			var ay = a.y;
			
			var bound = Window.bound();
			
			if (Mathematics.cmpZero(dy, Mathematics.EPS))
			{
				a.x = bound.minX;
				a.y = ay;
				b.x = bound.maxX;
				b.y = ay;
			}
			else
			if (Mathematics.cmpZero(dx, Mathematics.EPS))
			{
				a.x = ax;
				a.y = bound.minY;
				b.x = ax;
				b.y = bound.maxY;
			}
			else
			{
				var tx, ty;
				
				if (dy < 0) ty =-( ay - bound.minY) / dy;
				else 		ty = (-ay + bound.maxY) / dy;
				if (dx < 0) tx =-( ax - bound.minX) / dx;
				else		tx = (-ax + bound.maxX) / dx;
				
				var t0 = tx.fmin(ty);
				
				if (dy > 0) ty =-( ay - bound.minY) / -dy;
				else 		ty = (-ay + bound.maxY) / -dy;
				if (dx > 0) tx =-( ax - bound.minX) / -dx;
				else		tx = (-ax + bound.maxX) / -dx;
				
				var t1 = tx.fmin(ty);
				
				var v0x = ax + t0 * dx;
				var v0y = ay + t0 * dy;
				var v1x = ax - t1 * dx;
				var v1y = ay - t1 * dy;
				
				a.x = v1x;
				a.y = v1y;
				
				b.x = v0x;
				b.y = v0y;
			}
		}
		
		//apply threshold
		var t = _threshold;
		
		var v0x = a.x + nx * t + ny * t;
		var v0y = a.y + ny * t - nx * t;
		
		var v1x = a.x - nx * t + ny * t;
		var v1y = a.y - ny * t - nx * t;
		
		var v2x = b.x + nx * t - ny * t;
		var v2y = b.y + ny * t + nx * t;
		
		var v3x = b.x - nx * t - ny * t;
		var v3y = b.y - ny * t + nx * t;
		
		var bound = getBound();
		bound.minX = v0x.fmin(v1x).fmin(v2x.fmin(v3x));
		bound.maxX = v0x.fmax(v1x).fmax(v2x.fmax(v3x));
		bound.minY = v0y.fmin(v1y).fmin(v2y.fmin(v3y));
		bound.maxY = v0y.fmax(v1y).fmax(v2y.fmax(v3y));
	}
}