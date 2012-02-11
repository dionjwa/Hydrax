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
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;

/**
 * A two-dimensional ray: R(t) = <i>p</i> + t<i>d</i>.
 */
class Ray2 implements de.polygonal.ds.Cloneable<Ray2>
{
	/** The ray's origin. */
	public var p:Vec2;
	
	/** The ray's direction. */
	public var d:Vec2;
	
	public function new(px = .0, py = .0, dx = .0, dy = .0)
	{
		p = new Vec2(px, py);
		d = new Vec2(dx, dy);
	}
	
	/** Changes the direction of the ray so it points at the point <i>x</i>. */
	inline public function pointAt1(x:Vec2):Void
	{
		pointAt2(x.x, x.y);
	}
	
	/** Changes the direction of the ray so it points at the point (<i>x</i>,<i>y</i>). */
	inline public function pointAt2(x:Float, y:Float):Void
	{
		var dx = x - p.x;
		var dy = y - p.y;
		
		var t = dx * dx + dy * dy;
		if (t < Mathematics.EPS)
		{
			d.x = 0;
			d.y = 0;
		}
		else
		{
			t = Math.sqrt(t);
			d.x = dx / t;
			d.y = dy / t;
		}
	}
	
	/** Computes a ray so it points from <i>a</i> to <i>b</i>. */
	inline public function setFromPoints2(a:Vec2, b:Vec2):Void
	{
		setFromPoints4(a.x, a.y, b.x, b.y);
	}
	
	/** Computes a ray so it points from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>). */
	inline public function setFromPoints4(ax:Float, ay:Float, bx:Float, by:Float):Void
	{
		p.x = ax;
		p.y = ay;
		pointAt2(bx, by);
	}
	
	/** Assigns the values of <code>other</code> to this. */
	inline public function set(other:Ray2):Ray2
	{
		p.x = other.p.x;
		p.y = other.p.y;
		d.x = other.d.x;
		d.y = other.d.y;
		return this;
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format('Ray2 p(%.3f|%.3f) d(%.3f|%.3f)', [p.x, p.y, d.x, d.y]);
	}
	
	public function clone():Ray2
	{
		var c = new Ray2();
		c.p.x = p.x;
		c.p.y = p.y;
		c.d.x = d.x;
		c.d.y = d.y;
		return c;
	}
}