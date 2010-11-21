/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom.bounds;

import com.pblabs.engine.debug.Log;

import com.pblabs.geom.Circle;
import com.pblabs.geom.Geometry;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.AbstractBounds;
import com.pblabs.geom.bounds.BoundsLine;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.BoundsUtil;
import com.pblabs.geom.bounds.IBounds;
import com.pblabs.util.ReflectUtil;
using com.pblabs.geom.VectorTools;

class BoundsPoint extends AbstractBounds<BoundsPoint>
{
	public static var FIXED_ZERO_BOUNDS :BoundsPoint = new BoundsPoint(0, 0);

	public function new (x :Float, y :Float)
	{
		super();
		_boundsRect = new Rectangle(x, y, 0, 0);
		_boundsCircle = new Circle(0, x, y);
		set_center(new Vector2(x, y));
	}

	override function get_center ():Vector2
	{
		return _center;
	}

	override function set_center (v :Vector2) :Vector2
	{
		_center = v;
		_boundsRect.x = _center.x;
		_boundsRect.y = _center.y;
		_boundsCircle.x = _center.x;
		_boundsCircle.y = _center.y;
		return v;
	}

	override public function clone () :BoundsPoint
	{
		return new BoundsPoint(_center.x, _center.y);
	}

	override public function containsPoint (v :Vector2) :Bool
	{
		return v.equals(_center);
	}

	// #if flash
	// public function debugDraw (s :flash.display.Sprite) :Void
	// {
	//	 com.pblabs.util.DebugUtil.drawDot(s, 0xff0000, 4, _center.x, _center.y);
	// }
	// #end

	override public function distance (b :IBounds<Dynamic>) :Float
	{
		if (Std.is(b, BoundsPoint)) {
			return BoundsUtil.distancePointPoint(this, cast(b));
		} else if (Std.is(b, BoundsPolygon)) {
			return BoundsUtil.distancePointPolygon(this, cast(b));
		} else if (Std.is(b, BoundsLine)) {
			return BoundsUtil.distancePointLine(this, cast(b));
		}
		throw "Not implemented between " + ReflectUtil.tinyClassName(this) +
			" and " + ReflectUtil.tinyClassName(b);
		return Math.NaN;
	}

	override public function distanceToPoint (v :Vector2) :Float
	{
		return _center.distance(v);
	}
	
	override public function isWithinDistance(b :IBounds<Dynamic>, d :Float) :Bool
	{
		if (Std.is(b, BoundsPoint)) {
			return BoundsUtil.isWithinDistancePointPoint(this, cast(b), d);
		} else if (Std.is(b, BoundsPolygon)) {
			return BoundsUtil.isWithinDistancePointPolygon(this, cast(b), d);
		} 
		// else if (Std.is(b, BoundsLine)) {
			
		//	 return BoundsUtil.distancePointLine(this, cast(b), d);
		// }
		throw "Not implemented between " + ReflectUtil.tinyClassName(this) +
			" and " + ReflectUtil.tinyClassName(b);
		return false;
	}

	override public function getBoundedPoint (v :Vector2, ?v :Vector2) :Vector2
	{
		if (v != null) {
			v.x = _center.x;
			v.y = _center.y;
			return v;
		} else {
			return _center;
		}
	}

	override public function getBoundedPointFromMove (originX :Float, originY :Float,
		targetX :Float, targetY :Float, ?v :Vector2) :Vector2
	{
		return _center;
	}

	public function toString () :String
	{
		return ReflectUtil.tinyClassName(BoundsPoint) + "[" + _center + "]";
	}

}


