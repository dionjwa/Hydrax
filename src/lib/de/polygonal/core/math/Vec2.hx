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
package de.polygonal.core.math;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;

/**
 * <p>A 2D vector a geometric object that has both a magnitude (or length) and direction.</p>
 */
class Vec2
{
	/**
	 * The x-component.
	 */
	public var x:Float;

	/**
	 * The y-component.
	 */
	public var y:Float;
	
	public function new(x = .0, y = .0)
	{
		this.x = x;
		this.y = y;
	}
	
	/** Set to zero vector. */
	inline public function zero():Vec2
	{
		x = y = 0;
		return this;
	}
	
	/** Unary perp operator.<br/>Computes the normal vector pointing to the left (CCW) of this vector and returns this vector. */
	inline public function perp():Vec2
	{
		var t = y; y = x; x = -t;
		return this;
	}
	
	/** Flips and returns this vector. */
	inline public function flip():Vec2
	{
		x = -x;
		y = -y;
		return this;
	}
	
	/** Converts this vector to unit length and returns the original vector length. */
	inline public function unit():Float
	{
		var t = Math.sqrt(x * x + y * y);
		x /= t;
		y /= t;
		return t;
	}
	
	/** Converts this vector to unit length and returns the original vector length.<br/>Uses a fast inverse square root. */
	inline public function fastUnit():Float
	{
		var t = Mathematics.invSqrt(x * x + y * y);
		x *= t;
		y *= t;
		return t;
	}
	
	/** Computes the squared vector length. */
	inline public function lengthSqr():Float
	{
		return x * x + y * y;
	}
	
	/** Computes the vector length. */
	inline public function length():Float
	{
		return Math.sqrt(x * x + y * y);
	}
	
	/** Computes the vector length.<br/>Uses a fast inverse square root. */
	inline public function fastLength():Float
	{
		return 1 / Mathematics.invSqrt(x * x + y * y);
	}
	
	/** Clamps this vector to <code>max</code> length. */
	inline public function clamp(max:Float):Void
	{
		var tx = x;
		var ty = y;
		var len = tx * tx + ty * ty;
		if (len > max * max)
		{
			len = Math.sqrt(len);
			x = (tx / len) * max;
			y = (ty / len) * max;
		}
	}
	
	/** Assigns the values of <code>other</code> to this. */
	inline public function set(other:Vec2):Vec2
	{
		x = other.x;
		y = other.y;
		return this;
	}
	
	/** Creates and returns a copy of this object. */
	public function clone():Vec2
	{
		return new Vec2(x, y);
	}
	
	/** Returns the string form of the value that this object represents. */
	public function toString():String
	{
		return Sprintf.format("{Vec2: x=%.3f, y=%.3f}", [x, y]);
	}
}