/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom.bounds;

import com.pblabs.geom.bounds.BoundsLine;
import com.pblabs.geom.bounds.BoundsPoint;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.BoundsRectangle;
import com.pblabs.geom.bounds.IBounds;
import com.pblabs.util.ReflectUtil;
using com.pblabs.geom.CircleUtil;
using com.pblabs.geom.PolygonTools;
using com.pblabs.geom.VectorTools;
using com.pblabs.geom.CircleUtil;

class BoundsUtil
{
	public static function distancePointPoint(b1 :BoundsPoint, b2 :BoundsPoint) :Float
	{
		return b2.center.distance(b2.center);
	}
	
	public static function distancePointPolygon(b1 :BoundsPoint, b2 :BoundsPolygon) :Float
	{
		return b2.polygon.distToPolygonEdge(b1.center);
	}
	
	public static function distancePointCircle(b1 :BoundsPoint, b2 :BoundsCircle) :Float
	{
		return b2.boundingCircle.distancePoint(b1.center);
	}
	
	public static function distancePointLine(b1 :BoundsPoint, b2 :BoundsLine) :Float
	{
		return b2.lineSegment.dist(b1.center);
	}
	
	public static function distancePolygonPolygon(b1 :BoundsPolygon, b2 :BoundsPolygon) :Float
	{
		return b1.polygon.distance(b2.polygon);
	}
	
	public static function distanceCirclePolygon(b1 :BoundsCircle, b2 :BoundsPolygon) :Float
	{
		return b2.polygon.distToPolygonEdge(b1.center) - b1.boundingCircle.radius;
	}
	
	public static function distanceCircleCircle(b1 :BoundsCircle, b2 :BoundsCircle) :Float
	{
		return b2.boundingCircle.distance(b2.boundingCircle);
	}
	
	public static function isWithinDistancePointPoint(b1 :BoundsPoint, b2 :BoundsPoint, d :Float) :Bool
	{
		return distancePointPoint(b1, b2) <= d;
	}
	
	public static function isWithinDistancePointCircle(b1 :BoundsPoint, b2 :BoundsCircle, d :Float) :Bool
	{
		return b2.boundingCircle.isPointWithinDistance(b1.center, d);
	}
	
	public static function isWithinDistancePointPolygon(b1 :BoundsPoint, b2 :BoundsPolygon, d :Float) :Bool
	{
		if (!b2.boundingCircle.isPointWithinDistance(b1.center, d)) {
			return false;
		}
		return b2.polygon.distToPolygonEdge(b1.center) <= d;
	}
	
	public static function isWithinDistanceCirclePolygon(b1 :BoundsCircle, b2 :BoundsPolygon, d :Float) :Bool
	{
		//Check circles first
		if (!b1.boundingCircle.isWithinDistance(b2.boundingCircle, d)) {
			return false;
		}
		return distanceCirclePolygon(b1, b2) <= d;
	}
	
	public static function isWithinDistanceCircleCircle (b1 :BoundsCircle, b2 :BoundsCircle, d :Float) :Bool
	{
		return b1.boundingCircle.isWithinDistance(b2.boundingCircle, d);
	}
	
	public static function isWithinDistancePolygonPolygon(b1 :BoundsPolygon, b2 :BoundsPolygon, d :Float) :Bool
	{
		if (!b2.boundingCircle.isWithinDistance(b1.boundingCircle, d)) {
			return false;
		}
		return distancePolygonPolygon(b1, b2) <= d;
	}
	
	#if flash
	public static function drawBounds (b :IBounds<Dynamic>, g :flash.display.Graphics, ?color :Int = 0x000000, ?alpha :Float = 1, ?lineWidth :Float = 1) :Void
	{
		if (Std.is(b, BoundsPolygon)) {
			cast(b, BoundsPolygon).polygon.draw(g, color, alpha, lineWidth);
		} else if (Std.is(b, BoundsCircle)) {
			cast(b, BoundsCircle).boundingCircle.draw(g, color, alpha, lineWidth);
		} else if (Std.is(b, BoundsHighLowRes)) {
			drawBounds(cast(b, BoundsHighLowRes).getBounds2(), g, color, alpha, lineWidth);
		}else {
			throw "Not implemented";
			// g.lineStyle(lineWidth, color, alpha);
			// g.drawRect(b.boundingRect.x, b.boundingRect.y, b.boundingRect.width, b.boundingRect.height);
		}
	}
	#end
}


