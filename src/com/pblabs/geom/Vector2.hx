/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.util.Cloneable;
import com.pblabs.util.Equalable;

import de.polygonal.motor2.geom.math.XY;

/**
 * Basic 2D vector implementation.
 */
class Vector2 extends XY,
	implements Cloneable<Vector2>, implements Equalable<Vector2>
 {
	
	public var angle(get_angle, null) : Float;
	public var length(get_length, set_length) : Float;
	public var lengthSquared(getLengthSquared, null) : Float;

	/**
	 * Infinite vector - often the result of normalizing a zero vector.
	 */
	public static var INFINITE:Vector2 = new Vector2(Math.POSITIVE_INFINITY, Math.POSITIVE_INFINITY);

	/**
	 * Creates a new Vector2 pointing from s to t.
	 */
	public static function toVector2s (s :Vector2, t :Vector2) :Vector2
	{
		return new Vector2(t.x - s.x, t.y - s.y);
	}
	
	/**
	 * Constructs a Vector2 from the given values.
	 */
	public function new (?x :Float = 0, ?y :Float = 0)
	{
		this.x = x;
		this.y = y;
		com.pblabs.util.Assert.isFalse(Math.isNaN(this.x));
		com.pblabs.util.Assert.isFalse(Math.isNaN(this.y));
	}

	/**
	 * Sets the vector's components to the given values.
	 */
	public function set (x :Float, y :Float) :Void
	{
		this.x = x;
		this.y = y;
	}

	/**
	 * Returns a copy of this Vector2.
	 */
	public function clone () :Vector2
	{
		return new Vector2(x, y);
	}

	/**
	 * Returns the angle represented by this Vector2, in radians.
	 */
	inline function get_angle ():Float
	{
		// var angle:Float = 
		return Math.atan2(y, x);
		// return (angle >= 0 ? angle : angle + (2 * Math.PI));
	}

	/**
	 * Returns this vector's length.
	 */
	function get_length ():Float
	{
		return Math.sqrt(x * x + y * y);
	}

	/**
	 * Sets this vector's length.
	 */
	function set_length (newLen :Float):Float
	{
		var scale:Float = newLen / this.length;

		x *= scale;
		y *= scale;
		return newLen;
	   }

	/**
	 * Returns the square of this vector's length.
	 */
	public function getLengthSquared ():Float
	{
		return (x * x + y * y);
	}

	/**
	 * Normalizes the vector in place and returns its original length.
	 */
	public function normalizeLocalAndGetLength () :Float
	{
		var length:Float = this.length;

		x /= length;
		y /= length;

		return length;
	}

	/**
	 * Normalizes this vector in place.
	 * Returns a reference to 'this', for chaining.
	 */
	public function normalizeLocal () :Vector2
	{
		var lengthInverse:Float = 1 / this.length;

		x *= lengthInverse;
		y *= lengthInverse;

		return this;
	}

	/**
	 * Returns a normalized copy of the vector.
	 */
	public function normalize () :Vector2
	{
		return clone().normalizeLocal();
	}

	/**
	 * Returns a vector that is perpendicular to this one.
	 * If ccw = true, the perpendicular vector is rotated 90 degrees counter-clockwise from this
	 * vector, otherwise it's rotated 90 degrees clockwise.
	 */
	public function getPerp (?ccw :Bool = true) :Vector2
	{
		if (ccw) {
			return new Vector2(-y, x);
		} else {
			return new Vector2(y, -x);
		}
	}

	/**
	 * Inverts the vector.
	 */
	public function invertLocal () :Vector2
	{
		x = -x;
		y = -y;

		return this;
	}

	/**
	 * Returns a copy of the vector, inverted.
	 */
	public function invert () :Vector2
	{
	   return clone().invertLocal();
	}

	/**
	 * Returns true if this vector is equal to v.
	 */
	public function equals (v :Vector2) :Bool
	{
		return if (v != null) x == v.x && y == v.y else false;
	}
	
	/**
	 * Returns true if the components of v are equal to the components of this Vector2,
	 * within the given epsilon.
	 */
	public function similar (v :Vector2, epsilon :Float) :Bool
	{
		return ((Math.abs(x - v.x) <= epsilon) && (Math.abs(y - v.y) <= epsilon));
	}

	#if debug
	/** Returns a string representation of the Vector2. */
	public function toString () :String
	{
		// return "[" + com.pblabs.util.NumberUtil.toFixed(x, 3) + ", " + com.pblabs.util.NumberUtil.toFixed(y, 3) + "]";
		return "[" + x + ", " + y + "]";
	}
	#end
}
