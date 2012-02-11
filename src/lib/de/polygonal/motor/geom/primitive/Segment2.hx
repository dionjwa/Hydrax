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
package de.polygonal.motor.geom.primitive;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;
import de.polygonal.ds.Cloneable;
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * A two-dimensional line segment, which is a part of a line that is bounded by two end points.
 */
class Segment2 implements Cloneable<Segment2>
{
	/** Segment start coordinates. */
	public var a:Vec2;
	
	/** Segment end coordinates. */
	public var b:Vec2;
	
	/** Creates a line segment from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>). */
	public function new(?ax = .0, ?ay = .0, ?bx = .0, ?by = .0)
	{
		a = new Vec2(ax, ay);
		b = new Vec2(bx, by);
	}
	
	/** Sets the segment endpoints to <i>a</i> and <i>b</i>. */
	inline public function set2(a:Vec2, b:Vec2):Void
	{
		set4(a.x, a.y, b.x, b.y);
	}
	
	/** Sets the segment endpoints to (<i>ax</i>,<i>ay</i>) and (<i>bx</i>,<i>by</i>). */
	inline public function set4(ax:Float, ay:Float, bx:Float, by:Float):Void
	{
		a.x = ax; b.x = bx;
		a.y = ay; b.y = by;
	}
	
	/** The squared length of the line segment. */
	public var lengthSq(_lengthSqGetter, never):Float;
	inline function _lengthSqGetter():Float
	{
		var dx = a.x - b.x;
		var dy = a.y - b.y;
		return dx * dx + dy * dy;
	}
	
	/** Sets <i>out</i> to the midpoint of the segment. */
	inline public function getCenter(out:Vec2):Vec2
	{
		out.x = a.x + (b.x - a.x) * .5;
		out.y = a.y + (b.y - a.y) * .5;
		return out;
	}
	
	/** Sets the midpoint of this segmet to <i>out</i>. */
	inline public function setCenter(out:Vec2):Void
	{
		var x0 = a.x + (b.x - a.x) * .5;
		var y0 = a.y + (b.y - a.y) * .5;
		var dx = out.x - x0;
		var dy = out.y - y0;
		a.x += dx;
		a.y += dy;
		b.x += dx;
		b.y += dy;
	}
	
	/** Sets <i>out</i> to the CCW unit normal. */
	inline public function getNormal(out:Vec2):Vec2
	{
		var dx = b.x - a.x;
		var dy = b.y - a.y;
		var l = 1 / Math.sqrt(dx * dx + dy * dy);
		out.x = dy * l;
		out.y =-dx * l;
		return out;
	}
	
	/** Sets <i>out</i> to the normalized direction. */
	inline public function getDirection(out:Vec2):Void
	{
		var dx = b.x - a.x;
		var dy = b.y - a.y;
		var l = Math.sqrt(dx * dx + dy * dy);
		out.x = dx / l;
		out.y = dy / l;
	}
	
	/** Sets <i>out</i> to the axis-aligned bounding box for this segment. */
	inline public function getBound(out:AABB2):AABB2
	{
		if (a.x < b.x)
		{
			if (a.y < b.y)
			{
				out.minX = a.x;
				out.maxX = b.x;
				
				out.minY = a.y;
				out.maxY = b.y;
			}
			else
			{
				out.minX = a.x;
				out.maxX = b.x;
				
				out.minY = b.y;
				out.maxY = a.y;
			}
		}
		else
		{
			if (a.y < b.y)
			{
				out.minX = b.x;
				out.maxX = a.x;
				
				out.minY = a.y;
				out.maxY = b.y;
			}
			else
			{
				out.minX = b.x;
				out.maxX = a.x;
				
				out.minY = b.y;
				out.maxY = a.y;
			}
		}
		
		return out;
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format('Segment2 a(%.3f|%.3f) b(%.3f|%.3f)', [a.x, a.y, b.x, b.y]);
	}
	
	/** Creates and returns a copy of this object. */
	public function clone():Segment2
	{
		return new Segment2(a.x, a.y, b.x, b.y);
	}
}