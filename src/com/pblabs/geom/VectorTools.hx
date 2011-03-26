/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.engine.serialization.Serializer;
import com.pblabs.geom.Vector2;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import de.polygonal.motor2.geom.math.XY;

using Lambda;

using com.pblabs.geom.Geometry;
using com.pblabs.geom.VectorTools;
using com.pblabs.util.XMLUtil;

/**
 * Use "using com.pblabs.geom.VectorTools" for code 
 * completion access to these functions.
 *
 */
class VectorTools
 {
	//Multiply by these numbers to get your result.
	//EG: angleInRadians = 30 * DEG_TO_RAD;
	// public function new() { }
	
	//Multiply by these numbers to get your result.
	//EG: angleInRadians = 30 * DEG_TO_RAD;
	public static inline var RAD_TO_DEG :Float = (180 / Math.PI); //57.29577951;
	public static inline var DEG_TO_RAD :Float = (Math.PI / 180); //0.017453293;
	public static inline var ZERO :Vector2 = new Vector2(); //0.017453293;
	public static inline var PI2 :Float = Math.PI * 2;

	inline public static function distance (a :XY, b :XY) :Float
	{
		return Math.sqrt((b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y));
	}
	
	inline public static function distanceSq (a :XY, b :XY) :Float
	{
		return  (b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y);
	}
	
	//Returns the angle between two points
	public static function calcAngle (p1 :XY, p2 :XY) :Float
	{
		var angle = Math.atan((p2.y - p1.y) / (p2.x - p1.x));

		//if it is in the first quadrant
		if (p2.y < p1.y && p2.x > p1.x) {
			return angle;
		}
		//if its in the 2nd or 3rd quadrant
		if ((p2.y < p1.y && p2.x < p1.x) || (p2.y > p1.y && p2.x < p1.x)) {
			return angle + Math.PI;
		}
		//it must be in the 4th quadrant so:
		return angle + Math.PI * 2;
	}

	inline public static function addLocalPolarVector (v :Vector2, rad :Float, length :Float) :Vector2
	{
		var polar = VectorTools.angleToVector2(rad, length);
		v.addLocal(polar);
		return v;
	}
	
	/**
	 * Creates a Vector2 of magnitude 'len' that has been rotated about the origin by 'radians'.
	 */
	public static inline function angleToVector2 (radians :Float, ?len :Float = 1) :Vector2
	{
	   // we use the unit vector (1, 0)

		return new Vector2(
			Math.cos(radians) * len,   // == len * (cos(theta)*x - sin(theta)*y)
			Math.sin(radians) * len);  // == len * (sin(theta)*x + cos(theta)*y)
	}

	/**
	 * Returns the angle (radians) from v1 to v2.
	 */
	inline public static function angleTo (v1 :XY, v2 :XY) :Float
	{
		return getAngle(v1.x, v1.y, v2.x, v2.y);
	}

	inline public static function getAngle (x1 :Float, y1 :Float, x2 :Float, y2 :Float) :Float
	{
		return Math.atan2(y2 - y1, x2 - x1);
	}
	
	inline public static function getMidpoint (v1 :XY, v2 :XY) :Vector2
	{
		return new Vector2(v1.x + (v2.x - v1.x) / 2, v1.y + (v2.y - v1.y) / 2);
	}
	
	inline public static function lengthSq (v1 :XY) :Float
	{
		return v1.x*v1.x + v1.y*v1.y;
	}
	
	inline public static function isEqual (v1 :XY, v2 :XY) :Bool
	{
		return v1.x == v2.x && v1.y == v2.y;    
	}
	

	  //origin means original starting radian, dest destination radian around a circle
	/**
	 * Determines which direction a point should rotate to match rotation the quickest
	 * @param objectRotationRadians The object you would like to rotate
	 * @param radianBetween the angle from the object to the point you want to rotate to
	 * @return -1 if left, 0 if facing, 1 if right
	 *
	 */
	public static function getSmallestRotationDirection(objectRotationRadians:Float,
		radianBetween:Float, ?errorRadians:Float = 0):Float
	{
		objectRotationRadians = objectRotationRadians.normalizeRadians();
		radianBetween = radianBetween.normalizeRadians();

		radianBetween += -objectRotationRadians;
		radianBetween = radianBetween.normalizeRadians();
		objectRotationRadians = 0;
		if(radianBetween < -errorRadians)
		{
			return -1;
		}
		else if(radianBetween > errorRadians)
		{
			return 1;
		}
		return 0;
	}

	/**
	 * Normalizes an angle in radians to occupy the [-pi, pi) range.
	 * @param radian
	 * @return
	 */
	public static function simplifyRadian (radian :Float) :Float
	{
		radian = radian.normalizeRadians();

		if (radian > Math.PI) {
			return radian - PI2;
		} else {
			return radian;
		}
	}
	
	
	// public static function simplifyRadian (radian :Float) :Float
	// {
	// 	radian = radian.normalizeRadians();

	// 	if (radian > Math.PI) {
	// 		return radian - PI2;
	// 	} else {
	// 		return radian;
	// 	}
	// }

	/**
	 * The smallest difference between two angles with the right sign and clamped (-Pi, Pi)
	 */
	inline public static function differenceAngles (angle1 :Float, angle2 :Float) :Float
	{
		var diff = angle1 - angle2;
		if( diff > Math.PI) {
			diff = -PI2 + diff;
		}
		if( diff < -Math.PI) {
			diff = PI2 + diff;
		}
		return simplifyRadian(-diff);
	}
	
	public static function clone (xy :XY) :XY
	{
		return new Vector2(xy.x, xy.y);    
	}

	/**
	 * Returns true if this vector is equal to v.
	 */
	public static function equals (v1 :XY, v2 :XY) :Bool
	{
		return if (v1 != null && v2 != null) v1.x == v2.x && v1.y == v2.y else false;
	}
	
	/**
	 * Returns the dot product of this vector with vector v.
	 */
	inline public static function dot (v1 :XY, v2 :XY) :Float
	{
		return v1.x * v2.x + v1.y * v2.y;
	}
	
	/**
	 * Returns this vector's length.
	 */
	inline public static function getLength (v :XY) :Float
	{
		return Math.sqrt(v.x * v.x + v.y * v.y);
	}
	
	/**
	 * Adds another Vector2 to this, in place.
	 * Returns a reference to 'this', for chaining.
	 */
	inline public static function addLocal (v1 :XY, v2 :XY) :XY
	{
		v1.x += v2.x;
		v1.y += v2.y;

		return v1;
	}

	/**
	 * Returns a copy of this vector added to 'v'.
	 */
	public static function add (v1 :XY, v2 :XY) :XY
	{
		return v1.clone().addLocal(v2);
	}
	
	/**
	 * Subtracts another vector from this one, in place.
	 * Returns a reference to 'this', for chaining.
	 */
	public static function subtractLocal (v1 :XY, v2 :XY) :XY
	{
		v1.x -= v2.x;
		v1.y -= v2.y;

		return v1;
	}

	/**
	 * Returns (this - v).
	 */
	public static function subtract (v1: XY, v2 :XY) :XY
	{
	   return clone(v1).subtractLocal(v2);
	}
	
	/**
	 * Scales this vector by value.
	 */
	public static function scaleLocal (v :XY, value :Float) :XY
	{
		v.x *= value;
		v.y *= value;

		return v;
	}

	/** Returns (this * value). */
	public static function scale (v :XY, value :Float) :XY
	{
		return v.clone().scaleLocal(value);
	}
	
	public static function rotateLocal (xy :XY, radians :Float) :XY
	{
		var cosTheta = Math.cos(radians);
		var sinTheta = Math.sin(radians);

		var oldX = xy.x;
		xy.x = (cosTheta * oldX) - (sinTheta * xy.y);
		xy.y = (sinTheta * oldX) + (cosTheta * xy.y);

		return xy;
	}
	
	/**
	 * Returns a rotated copy of this vector.
	 */
	public static function rotate (v :XY, radians :Float) :XY
	{
		return v.clone().rotateLocal(radians);
	}
	
	inline public static function angle (v :XY) :Float
	{
		return Math.atan2(v.y, v.x);
	}
	
	/**
	 * Returns a new vector that is the linear interpolation of vectors a and b
	 * at proportion p, where p is in [0, 1], p = 0 means the result is equal to a,
	 * and p = 1 means the result is equal to b.
	 */
	public static function interpolate (a :XY, b :XY, p :Float) :XY
	{
		var q:Float = 1 - p;
		return new Vector2(q * a.x + p * b.x, q * a.y + p * b.y);
	}
	
	/**
	 * Returns the smaller of the two angles between v1 and v2, in radians.
	 * Result will be in range [0, pi].
	 */
	public static function smallerAngleBetween (v1 :XY, v2 :XY) :Float
	{
		var dot = dot(v1, v2);
		var len1= getLength(v1);
		var len2 = getLength(v2);

		return Math.acos(dot / (len1 * len2));
	}
	
	
	public static function serializeXY (val :XY, xml :Xml) :Void
	{
		xml.createChild("x", val.x, Serializer.serializeFloat);
		xml.createChild("y", val.y, Serializer.serializeFloat);
	}
	
	public static function deserializeXY (xml :Xml) :XY
	{
		var v = new Vector2();
		v.x = xml.parseFloat("x");
		v.y = xml.parseFloat("y");
		return v;
	}
	
	#if (flash || cpp)
	/**
	 * Converts Point p to a Vector2.
	 */
	public static function toVector2 (p :flash.geom.Point) :Vector2
	{
		return new Vector2(p.x, p.y);
	}
	
	public static function toPoint (v :XY) :flash.geom.Point
	{
		return new flash.geom.Point(v.x, v.y);
	}
	#end
}
