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

class Vec2Util 
{
	/**
	 * Computes the unit length vector <code>q</code> = (<code>b</code>-<code>a</code>)/||<code>b</code>-<code>a</code>||</code>.
	 * @return the length of <code>b</code>-<code>a</code>.
	 */
	inline public static function dir2(a:Vec2, b:Vec2, q:Vec2):Float
	{
		return dir4(a.x, a.y, b.x, b.y, q);
	}
	
	/**
	 * Computes the unit length vector <code>q</code> = ((<code>bx</code>,<code>by</code>)-(<code>ax</code>,<code>ay</code>))/||(<code>bx</code>,<code>by</code>)-(<code>ax</code>,<code>ay</code>)||</code>.
	 * @return the length of (<code>bx</code>,<code>by</code>)-(<code>ax</code>,<code>ay</code>).
	 */
	inline public static function dir4(ax:Float, ay:Float, bx:Float, by:Float, q:Vec2):Float
	{
		var dx = bx - ax;
		var dy = by - ay;
		var len = Math.sqrt(dx * dx + dy * dy);
		q.x = dx / len;
		q.y = dy / len;
		return len;
	}
	
	/**
	 * Vector reflection. Returns <code>q</code> = <code>v</code>-(2*dot(<code>v</code>,<code>n</code>))*<code>n</code>. */
	inline public static function reflect2(v:Vec2, n:Vec2, q:Vec2):Vec2
	{
		return reflect4(v.x, v.y, n.x, n.y, q);
	}
	
	/**
	 * Vector reflection. Returns <code>q = (<code>vx</code>,<code>vy</code>)-(2*dot((<code>vx</code>,<code>vy</code>),(<code>nx</code>,<code>ny</code>)))*(<code>nx</code>,<code>ny</code>)</code>.
	 */
	inline public static function reflect4(vx:Float, vy:Float, nx:Float, ny:Float, q:Vec2):Vec2
	{
		var t = dot4(vx, vy, nx, ny);
		q.x = vx - (2 * t) * nx;
		q.y = vy - (2 * t) * ny;
		return q;
	}
	
	/**
	 * Computes the angle between segments formed by the vector <code>a</code> and <code>b</code>.
	 */
	inline public static function angle2(a:Vec2, b:Vec2):Float
	{
		return Math.atan2(perpDot2(a, b), dot2(a, b));
	}
	
	/**
	 * Computes the angle between segments formed by the vector (<code>ax</code>,<code>ay</code>) and (<code>bx</code>,<code>by</code>).
	 */
	inline public static function angle4(ax:Float, ay:Float, bx:Float, by:Float):Float
	{
		return Math.atan2(perpDot4(ax, ay, bx, by), dot4(ax, ay, bx, by));
	}
	
	/**
	 * Computes the signed triangle area formed by the points <code>a</code>, <code>b</code> and <code>c</code>.
	 */
	inline public static function signedTriArea(a:Vec2, b:Vec2, c:Vec2):Float
	{
		return (a.x - c.x) * (b.y - c.y) - (a.y - c.y) * (b.x - c.x);
	}
	
	/**
	 * Tests if a point is left, on or right of an infinite line.
	 * @return
	 * >0 for <code>c</code> left of the line through <code>a</code> and <code>b</code><br/>
	 * =0 for <code>c</code> on the line<br/>
	 * <0 for <code>c</code> right of the line<br/>
	 */
	inline public static function isLeft3(a:Vec2, b:Vec2, c:Vec2):Float
	{
		return isLeft6(a.x, a.y, b.x, b.y, c.x,  c.y);
	}
	
	/**
	 * Tests if a point is left, on or right of an infinite line.
	 * @return
	 * >0 for (<code>cx</code>, <code>cy</code>) left of the line through (<code>ax</code>, <code>ay</code>) and (<code>bx</code>, <code>by</code>)<br/>
	 * =0 for (<code>cx</code>, <code>cy</code>) on the line<br/>
	 * <0 for (<code>cx</code>, <code>cy</code>) right of the line<br/>
	 */
	inline public static function isLeft6(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float):Float
	{
		return (bx - ax) * (cy - ay) - (cx - ax) * (by - ay);
	}
	
	/**
	 * Computes the perpendicular bisector <code>q</code> of the segment between the point <code>a</code> and <code>b</code>.<br/>
	 * The perpendicular bisector is the line that passes through the midpoint between <code>a</code> and <code>b</code>
	 * (given by (<code>a</code>+<code>b</code>)/2) and is perpendicular to the vector <code>b</code>-<code>a</code>.<br/>
	 * Equation: p(t) = 1/2 (a+b) + perp(b-a)t
	 */
	inline public static function perpBisecor(a:Vec2, b:Vec2, t:Float, q:Vec2):Void
	{
		var ax = a.x;
		var ay = a.y;
		var bx = b.x;
		var by = b.y;
		
		var dx = -(by - ay);
		var dy =  (bx - ax);
		
		q.x = .5 * (ax + bx) + dx * t;
		q.y = .5 * (ay + by) + dy * t;
	}
	
	/** Returns the midpoint <code>q</code> = (<code>a</code>+<code>b</code>)/2. */
	inline public static function mid2(a:Vec2, b:Vec2, q:Vec2):Vec2
	{
		return mid4(a.x, a.y, b.x, b.y, q);
	}
	
	/** Returns the midpoint <code>q</code> = ((<code>ax</code>,<code>ay</code>)+(<code>bx</code>,<code>by</code>))/2. */
	inline public static function mid4(ax:Float, ay:Float, bx:Float, by:Float, q:Vec2):Vec2
	{
		q.x = ax + (bx - ax) * .5;
		q.y = ay + (by - ay) * .5;
		return q;
	}
	
	/** Creates a random vector with x in the range &#091;<code>minX</code>,<code>maxX</code>&#093; and y in the range &#091;<code>minY</code>,<code>maxY</code>&#093;. */
	inline public static function random(minX:Float, maxX:Float, minY:Float, maxY:Float):Vec2
	{
		return new Vec2(de.polygonal.core.math.random.Random.frandRange(minX, maxX), de.polygonal.core.math.random.Random.frandRange(minY, maxY));
	}
	
	/** Returns <code>q</code> = min(<code>a</code>,<code>b</code>). */
	inline public static function min(a:Vec2, b:Vec2, q:Vec2):Void
	{
		q.x = Mathematics.fmin(a.x, b.x);
		q.y = Mathematics.fmin(a.y, b.y);
	}
	
	/** Returns <code>q</code> = max(<code>a</code>,<code>b</code>). */
	inline public static function max(a:Vec2, b:Vec2, q:Vec2):Void
	{
		q.x = Mathematics.fmax(a.x, b.x);
		q.y = Mathematics.fmax(a.y, b.y);
	}
	
	/**
	 * The length of the vector (<code>x</code>,<code>y</code>).
	 */
	inline public static function length(x:Float, y:Float):Float
	{
		return Math.sqrt(x * x + y * y);
	}
	
	/**
	 * Computes 1/length of the vector (<code>x</code>,<code>y</code>) using a fast inverse square root approximation.
	 */
	inline public static function invLength(x:Float, y:Float):Float
	{
		return 1 / Mathematics.invSqrt(x * x + y * y);
	}
	
	/**
	 * Computes the dot product <code>a</code>*<code>b</code>.<br/>
	 * Also known as inner product or scalar product.
	 */
	inline public static function dot2(a:Vec2, b:Vec2):Float
	{
		return dot4(a.x, a.y, b.x, b.y);
	}
	
	/**
	 * Computes the dot product (<code>ax</code>,<code>ay</code>)*(<code>bx</code>,<code>by</code>).
	 */
	inline public static function dot4(ax:Float, ay:Float, bx:Float, by:Float):Float
	{
		return ax * bx + ay * by;
	}
	
	/**
	 * Computes the perp-dot product perp(<code>a</code>)*<code>b</code>, where perp is defined to rotate a vector 90&deg; counterclockwise (ccw).<br/>
	 * Also known as exterior product or outer product.<br/>
	 * This is the determinant of the matrix with first row <code>a</code> and second row <code>b</code>.<br/>
	 */
	inline public static function perpDot2(a:Vec2, b:Vec2):Float
	{
		return perpDot4(a.x, a.y, b.x, b.y);
	}
	
	/**
	 * Computes the perp-dot product perp((<code>ax</code>,<code>ay</code>))*(<code>bx</code>,<code>by</code>), where perp is defined to rotate a vector 90&deg; counterclockwise (ccw).
	 */
	inline public static function perpDot4(ax:Float, ay:Float, bx:Float, by:Float):Float
	{
		return ax * by - ay * bx;
	}
}