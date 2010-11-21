/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.geom.Circle;
import com.pblabs.geom.Geometry;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;

class CircleUtil
{
	#if flash
	public static function draw (c1 :Circle, g :flash.display.Graphics, ?color :Int = 0x000000, ?alpha :Float = 1, ?lineWidth :Float = 1) :Void
	{
		g.lineStyle(lineWidth, color, alpha);
		g.drawCircle(c1.x, c1.y, c1.radius);
	}
	#end
	
	
	public static function toCircle (r :Rectangle) :Circle
	{
		var halfWidth = r.width / 2;
		var halfHeight = r.height / 2;
		return new Circle(Math.sqrt(halfWidth*halfWidth + halfHeight*halfHeight), r.left + halfWidth, r.top + halfHeight); 
	}
	
	public static function getBounds (c :Circle) :Rectangle
	{
		return new Rectangle(c.x - c.radius, c.y - c.radius, c.radius * 2, c.radius * 2);
	}
	
	public static function isWithinDistance (c1 :Circle, c2 :Circle, d :Float) :Bool
	{
		if (Math.abs(c1.x - c2.x) - (c1.radius + c2.radius) > d || 
		Math.abs(c1.y - c2.y) - (c1.radius + c2.radius) > d) {
			return false;
		} 
		return Geometry.distance(c1.x,  c1.y, c2.x , c2.y) - (c1.radius + c2.radius) <= d;
	}
	
	public static function isPointWithinDistance (c1 :Circle, v :Vector2, d :Float) :Bool
	{
		if (Math.abs(c1.x - v.x) - c1.radius > d || 
		Math.abs(c1.y - v.y) - c1.radius > d) {
			return false;
		} 
		return Geometry.distance(c1.x,  c1.y, v.x , v.y) - c1.radius <= d;
	}
	
	inline public static function distance (c1 :Circle, c2 :Circle) :Float
	{
		return Geometry.distance(c1.x,  c1.y, c2.x , c2.y) - (c1.radius + c2.radius);
	}
	
	inline public static function distancePoint (c1 :Circle, v :Vector2) :Float
	{
		return Geometry.distance(c1.x,  c1.y, v.x , v.y) - c1.radius;
	}
	
	inline public static function distanceSqPoint (c1 :Circle, v :Vector2) :Float
	{
		return Geometry.distanceSq(c1.x,  c1.y, v.x , v.y) - c1.radius * c1.radius;
	}
	
	inline public static function distanceSq (c1 :Circle, c2 :Circle) :Float
	{
		return  Geometry.distanceSq(c1.x,  c1.y, c2.x , c2.y) - (c1.radius * c1.radius + c2.radius * c2.radius);
	}
	
	inline public static function containsPoint (c1 :Circle, v :Vector2) :Bool
	{
		return distancePoint(c1, v) <= 0;
	}
	
	public static function isWithinCircle (v :Vector2, x :Float, y :Float, r :Float) :Bool
	{
		return Geometry.distance(x,  y, v.x , v.y) - r <= 0;
	}
}


