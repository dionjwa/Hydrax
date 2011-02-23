/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom.bounds;

import com.pblabs.geom.Circle;
import com.pblabs.geom.Polygon;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.BoundsCircle;
import com.pblabs.geom.bounds.BoundsForwarding;
import com.pblabs.geom.bounds.BoundsPoint;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.BoundsUtil;
import com.pblabs.geom.bounds.IBounds;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.geom.PolygonTools;
using com.pblabs.geom.RectangleTools;

class BoundsRectangle extends BoundsForwarding<BoundsRectangle>
{
	public function new (r :Rectangle)
	{
		_polygonBounds = new BoundsPolygon(r.toPolygon());
		super(get_polygonBounds);
		_boundsRect = r;
		_boundsCircle = new Circle();
		set_center(new Vector2(r.left + r.width / 2, r.top + r.height / 2));
	}

	override function get_center ():XY
	{
		return _center;
	}

	override function set_center (v :XY) :XY
	{
		super.set_center(center);
		_center = _boundsCircle.center = v;
		_boundsCircle.radius = Math.max(_boundsRect.width, _boundsRect.height);
		_boundsRect.x = _center.x - _boundsCircle.radius;
		_boundsRect.y = _center.y - _boundsCircle.radius;
		return v;
	}

	override public function clone () :BoundsRectangle
	{
		return new BoundsRectangle(_boundsRect.clone());
	}

	override public function containsPoint (v :XY) :Bool
	{
		return _boundsRect.contains(v.x, v.y);
	}

	override public function distanceToPoint (v :XY) :Float
	{
		if (containsPoint(v)) {
			return 0;
		}
		return super.distanceToPoint(v);
	}
	
	override function get_boundingRect () :Rectangle
	{
		return _boundsRect;
	}
	
	override function get_boundingCircle () :Circle
	{
		return _boundsCircle;
	}
	
	override function computeBoundingRect () :Rectangle
	{
		return _boundsRect;
	}
	
	inline function get_polygonBounds () :BoundsPolygon
	{
		return _polygonBounds;
	}
	
	var _polygonBounds :BoundsPolygon;
	
	#if debug
	public function toString () :String
	{
		return com.pblabs.util.ReflectUtil.getClassName(this) + "[" + _boundsRect + "]";
	}
	#end
}
