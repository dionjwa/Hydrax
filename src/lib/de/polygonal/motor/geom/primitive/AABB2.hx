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

/**
 * <p>A two-dimensional axis-aligned bounding box (AABB).</p>
 * <p>This is a rectangular four-sided box.</p>
 * <p>The face normals are parallel with the axes of the given coordinate system.</p>
 * <p>The AABB stores the minimum and maximum coordinate values along each axis (min-max representation).</p>
 */
class AABB2 implements de.polygonal.ds.Cloneable<AABB2>
{
	#if flash
	/**
	 * Constructs an AABB that matches the <code>source</code> Rectangle object.
	 * @param target stores the result.
	 * @return a reference to <code>target</code>.
	 */
	inline public static function ofRectangle(source:flash.geom.Rectangle, target:AABB2):AABB2
	{
		target.minX = source.x;
		target.minY = source.y;
		target.maxX = source.right;
		target.maxY = source.bottom;
		return target;
	}
	/**
	 * Constructs a Rectangle object that matches the <code>source</code> AABB.
	 * @param target stores the result.
	 * @return a reference to <code>target</code>.
	 */
	inline public static function toRectangle(source:AABB2, target:flash.geom.Rectangle):flash.geom.Rectangle
	{
		target.x      = source.minX;
		target.y      = source.minY;
		target.width  = source.intervalX;
		target.height = source.intervalY;
		return target;
	}
	#end
	
	/**
	 * Merges AABB <code>a</code> and AABB <code>b</code>, stores the result in <code>c</code> and returns <code>c</code>.
	 */
	inline public static function merge(a:AABB2, b:AABB2, c:AABB2):AABB2
	{
		c.minX = (a.minX < b.minX) ? a.minX : b.minX;
		c.maxX = (a.maxX > b.maxX) ? a.maxX : b.maxX;
		c.minY = (a.minY < b.minY) ? a.minY : b.minY;
		c.maxY = (a.maxY > b.maxY) ? a.maxY : b.maxY;
		return c;
	}
	
	/**
	 * Minimum x coordinate.
	 */
	public var minX:Float;
	
	/**
	 * Minimum y coordinate.
	 */
	public var minY:Float;
	
	/**
	 * Maximum x coordinate.
	 */
	public var maxX:Float;
	
	/**
	 * Maximum y coordinate.
	 */
	public var maxY:Float;
	
	/**
	 * Creates an axis-aligned bounding box from the given values.<br/>
	 * The default values construct an empty AABB.
	 * @param minX minimum x coordinate.
	 * @param minY minimum y coordinate.
	 * @param maxX maximum x coordinate.
	 * @param maxY maximum y coordinate.
	 */
	public function new(?minX = 1., ?minY = 1., ?maxX = -1., ?maxY = -1.)
	{
		if (minX <= maxX && minY <= maxY)
		{
			this.minX = minX;
			this.minY = minY;
			this.maxX = maxX;
			this.maxY = maxY;
		}
		else
			empty();
	}
	
	/**
	 * Center position, x-axis.<br/>
	 * Assigning a new value moves the AABB relative to its center position.<br/>
	 * The size remains unchanged.
	 */
	public var centerX(_centerXGetter, _centerXSetter):Float;
	inline function _centerXGetter():Float { return minX + (maxX - minX) * .5; }
	inline function _centerXSetter(x:Float):Float
	{
		var ex = (maxX - minX) * .5;
		minX = x - ex;
		maxX = x + ex;
		return x;
	}
	
	/**
	 * Center position, y-axis.<br/>
	 * Assigning a new value moves the AABB relative to its center position.<br/>
	 * The size remains unchanged.
	 */
	public var centerY(_centerYGetter, _centerYSetter):Float;
	inline function _centerYGetter():Float { return minY + (maxY - minY) * .5; }
	inline function _centerYSetter(x:Float):Float
	{
		var ey = (maxY - minY) * .5;
		minY = x - ey;
		maxY = x + ey;
		return x;
	}
	
	/**
	 * X-axis interval (width).
	 */
	public var intervalX(_intervalXGetter, null):Float;
	inline function _intervalXGetter():Float { return maxX - minX; }
	
	/**
	 * Y-axis interval (height).
	 */
	public var intervalY(_intervalYGetter, null):Float;
	inline function _intervalYGetter():Float { return maxY - minY; }
	
	/**
	 * Shifts the AABB from <em>minX</em> to <code>x</code>.<br/>
	 * The size remains unchanged.
	 */
	inline public function setMinX(x:Float):Void
	{
		var d = x - minX;
		minX += d;
		maxX += d;
	}
	
	/**
	 * Shifts the AABB from <em>minY</em> to <code>x</code>.<br/>
	 * The size remains unchanged.
	 */
	inline public function setMinY(x:Float):Void
	{
		var d = x - minY;
		minY += d;
		maxY += d;
	}
	
	/**
	 * Shifts the AABB from <em>maxX</em> to <code>x</code>.<br/>
	 * The size remains unchanged.
	 */
	inline public function setMaxX(x:Float):Void
	{
		var d = x - maxX;
		minX += d;
		maxX += d;
	}
	
	/**
	 * Shifts the AABB from <em>maxY</em> to <code>x</code>.<br/>
	 * The size remains unchanged.
	 */
	inline public function setMaxY(x:Float):Void
	{
		var d = x - maxY;
		minY += d;
		maxY += d;
	}
	
	/**
	 * Copy-pastes the values of <code>x</code> into this AABB.
	 */
	inline public function set(x:AABB2):AABB2
	{
		set4(x.minX, x.minY, x.maxX, x.maxY);
		return this;
	}
	
	/**
	 * Sets the <code>min</code>-<code>max</code> coordinates using 2 vectors.
	 */
	inline public function set2(min:Vec2, max:Vec2):Void
	{
		this.minX = min.x; this.maxX = max.x;
		this.minY = min.y; this.maxY = max.y;
	}
	
	/**
	 * Sets the (<code>minX</code>, <code>minY</code>)-(<code>maxX</code>, <code>maxY</code>) coordinates using 4 scalar values.
	 */
	inline public function set4(minX:Float, minY:Float, maxX:Float, maxY:Float):Void
	{
		this.minX = minX; this.maxX = maxX;
		this.minY = minY; this.maxY = maxY;
	}
	
	/**
	 * Adds the point (<code>x</code>, <code>y</code>) to this AABB by expanding this AABB if necessary and returns this AABB.
	 */
	inline public function addPoint(x:Float, y:Float):AABB2
	{
		if (x < minX) minX = x;
		if (x > maxX) maxX = x;
		if (y < minY) minY = y;
		if (y > maxY) maxY = y;
		return this;
	}
	
	/**
	 * Adds the AABB <code>x</code> to this AABB by expanding this AABB if necessary and returns this AABB.
	 */
	inline public function addAABB(x:AABB2):AABB2
	{
		if (x.minX < minX) minX = x.minX;
		if (x.minY < minY) minY = x.minY;
		if (x.maxX > maxX) maxX = x.maxX;
		if (x.maxY > maxY) maxY = x.maxY;
		return this;
	}
	
	/**
	 * Increases the size of this AABB by the specified vector <code>x</code>.
	 */
	inline public function inflate(x:Vec2):Void
	{
		inflate2(x.x, x.y);
	}
	
	/**
	 * Increases the size of this AABB by the specified <code>x</code> and <code>y</code> amounts.
	 */
	inline public function inflate2(x:Float, y:Float):Void
	{
		minX -= x;
		minY -= y;
		maxX += x;
		maxY += y;
	}
	
	/**
	 * Returns true if the AABB <code>x</code> is inside this AABB.<br/>
	 * This includes a touching contact.
	 */
	inline public function contains(x:AABB2):Bool
	{
		if (x.minX < minX) return false;
		else
		if (x.maxX > maxX) return false;
		else
		if (x.minY < minY) return false;
		else
		if (x.maxY > maxY) return false;
		else
			return true;
	}
	
	inline public function scale(x:Float, y:Float):Void
	{
		minX *= x;
		maxX *= x;
		minY *= y;
		maxY *= y;
	}
	
	/**
	 * Empties this AABB.
	 */
	inline public function empty():Void
	{
		minX = minY = Math.POSITIVE_INFINITY;
		maxX = maxY = Math.NEGATIVE_INFINITY;
	}

	/**
	 * Returns true if this AABB is empty.
	 */
	inline public function isEmpty():Bool
	{
		return (minX > maxX) || (minY > maxY);
	}
	
	/**
	 * Computes the corner vertices of this AABB and stores them in <code>out</code>.
	 * @param out stores the result. <code>out</code> must include 4 preallocated Vec2 objects.
	 * @return a reference to out.
	 */
	inline public function getVertexListVector(out:Array<Vec2>):Array<Vec2>
	{
		var v = out[0];
		v.x = maxX;
		v.y = maxY;
		
		v = out[1];
		v.x = minX;
		v.y = maxY;
		
		v = out[2];
		v.x = minX;
		v.y = minY;
		
		v = out[3];
		v.x = maxX;
		v.y = minY;
		
		return out;
	}
	
	/**
	 * Computes the corner vertices of this AABB and stores them in <code>out</code>.<br/>
	 * The vertices are stored in this format: [x0, y0, x1, y1, ..., xn, yn].
	 * @param out stores the result.
	 * @return a reference to out.
	 */
	inline public function getVertexListScalar(out:Array<Float>):Array<Float>
	{
		out[0] = maxX;
		out[1] = maxY;
		out[2] = minX;
		out[3] = maxY;
		out[4] = minX;
		out[5] = minY;
		out[6] = maxX;
		out[7] = minY;
		return out;
	}
	
	/**
	 * Returns the string form of the value that the object represents.
	 */
	public function toString():String
	{
		if (isEmpty())
			return "empty AABB";
		return Sprintf.format("AABB\nmin(%.3f|%.3f)\nmax(%.3f|%.3f)", [minX, minY, maxX, maxY]);
	}
	
	/**
	 * Creates and returns a copy of this object.
	 */
	public function clone():AABB2
	{
		return new AABB2(minX, minY, maxX, maxY);
	}
}