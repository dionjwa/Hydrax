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
import de.polygonal.ds.Cloneable;

/**
 * A two-dimensional bounding sphere.
 */
class Sphere2 implements Cloneable<Sphere2>
{
	/**
	 * Merges sphere <code>a</code> and sphere <code>b</code>, stores the result in <code>c</code> and returns <code>c</code>.
	 */
	inline public static function merge(a:Sphere2, b:Sphere2, c:Sphere2):Sphere2
	{
		var dx = b.c.x - a.c.x;
		var dy = b.c.y - a.c.y;
		var dr = b.r - a.r;
		var lSqr = dx * dx + dy * dy;
		if (dr * dr >= lSqr)
		{
			if (dr >= 0)
				return c.set(b);
			else
				return c.set(a);
		}
		else
		{
			var l = 1 / Mathematics.invSqrt(lSqr);
			var t = (l + b.r - a.r) / (2 * l);
			c.c.x = a.c.x + t * dx;
			c.c.y = a.c.y + t * dy;
			c.r = (l + a.r + b.r) / 2;
			return c;
		}
	}
	
	/** The sphere's center position. */
	public var c:Vec2;
	
	/** The sphere's radius. */
	public var r:Float;
	
	/** Creates a bounding sphere with center (<i>x</i>,<i>y</i>) and radius <i>r</i>. */
	public function new(?x = .0, ?y = .0, ?r = .0)
	{
		c = new Vec2(x, y);
		this.r = r;
	}
	
	/**
	 * Adds the point (<code>x</code>, <code>y</code>) to this sphere by expanding this sphere if necessary.
	 * @return this sphere.
	 */
	inline public function addPoint(x:Float, y:Float):Sphere2
	{
		var dx = x - c.x;
		var dy = y - c.y;
		var dSqr = dx * dx + dy * dy;
		if (dSqr > r * r) r = Math.sqrt(dSqr);
		return this;
	}
	
	/**
	 * Adds the sphere <code>other</code> to this sphere by expanding this sphere if necessary.
	 * @return this sphere.
	 */
	inline public function addSphere(other:Sphere2):Sphere2
	{
		var dx = other.c.x - c.x;
		var dy = other.c.y - c.y;
		var dr = other.r - r;
		var lSqr = dx * dx + dy * dy;
		if (dr * dr >= lSqr)
		{
			if (dr >= 0)
				return set(other);
			else
				return this;
		}
		else
		{
			var l = 1 / Mathematics.invSqrt(lSqr);
			var t = (l + other.r - r) / (2 * l);
			c.x += t * dx;
			c.y += t * dy;
			r = (l + r + other.r) / 2;
			return this;
		}
	}
	
	/** Assigns the values of <code>other</code> to this. */
	inline public function set(other:Sphere2):Sphere2
	{
		c.x = other.c.x;
		c.y = other.c.y;
		r   = other.r;
		return this;
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format("Sphere2 c(%.3f|%.3f) r%.3f", [c.x, c.y, r]);
	}
	
	/** Creates and returns a copy of this object. */
	public function clone():Sphere2
	{
		return new Sphere2(c.x, c.y, r);
	}
}