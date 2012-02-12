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

using de.polygonal.core.math.Mathematics;

/**
 * A two-dimensional plane in constant normal form (normalized),
 * implicit plane eq.: dot(n, x - p) = 0 -> dot(n, x) = d, d = dot(n, p)
 */
class Plane2 implements de.polygonal.ds.Cloneable<Plane2>
{
	/** The unit normal; a point is on the plane if dot(n, x) = d */
	public var n:Vec2;
	
	/**
	 * Distance of the plane from the origin.
	 * For a given point p on the plane the distance is calculated with <i>d = n * p</i>.
	 */
	public var d:Float;
	
	public function new()
	{
		d = 0;
		n = new Vec2();
	}
	
	/** Computes the plane equation given a normal <i>n</i> and a point <i>p</i>. */
	inline public function setFromNormal2(n:Vec2, p:Vec2):Void
	{
		setFromNormal4(n.x, n.y, p.x, p.y);
	}
	
	/** Computes the plane equation given a normal (<i>nx</i>,<i>ny</i>) and a point (<i>px</i>,<i>py</i>). */
	inline public function setFromNormal4(nx:Float, ny:Float, px:Float, py:Float):Void
	{
		n.x = nx;
		n.y = ny;
		d = nx * px + ny * py;
	}

	/** Computes the plane equation from two noncollinear points <i>a</i> and <i>b</i>. */
	inline public function setFromPoints2(a:Vec2, b:Vec2):Void
	{
		setFromPoints4(a.x, a.y, b.x, b.y);
	}
	
	/** Computes the plane equation from two noncollinear points (<i>ax</i>,<i>ay</i>) and (<i>bx</i>,<i>by</i>). */
	inline public function setFromPoints4(ax:Float, ay:Float, bx:Float, by:Float):Void
	{
		var dx = bx - ax;
		var dy = by - ay;
		var l = Math.sqrt(dx * dx + dy * dy);
		dx /= l;
		dy /= l;
		n.x = -dy;
		n.y =  dx;
		d = n.x * ax + n.y * ay;
	}
	
	/** Assigns the values of <code>other</code> to this. */
	inline public function set(other:Plane2):Plane2
	{
		n.x = other.n.x;
		n.y = other.n.y;
		d   = other.d;
		return this;
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format('Plane2 n(%.3f|%.3f) d(%.3f)', [n.x, n.y, d]);
	}
	
	/** Creates and returns a copy of this object. */
	public function clone():Plane2
	{
		var c = new Plane2();
		c.d = d;
		c.n.x = n.x;
		c.n.y = n.y;
		return c;
	}
}