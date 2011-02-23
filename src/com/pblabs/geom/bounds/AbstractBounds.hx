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
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.IBounds;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.geom.CircleUtil;
using com.pblabs.geom.VectorTools;

class AbstractBounds<T>
	implements IBounds<T> 
{
	public var topLeft(get_topLeft, set_topLeft) :XY;
	public var center(get_center, set_center) :XY;
	public var boundingRect (get_boundingRect, null) :Rectangle;
	public var boundingCircle (get_boundingCircle, null) :Circle;

	public function new ()
	{
		_center = new Vector2();
	}

	function get_center ():XY
	{
		return _center;
	}
	
	function set_center (v :XY) :XY
	{
		throw "Abstract";
		return null;
	}
	
	function get_topLeft () :XY
	{
		return cast center.subtract(new Vector2(boundingRect.width / 2, boundingRect.height / 2));
	}
	
	function set_topLeft (val :XY) :XY
	{
		center = cast val.add(new Vector2(boundingRect.width / 2, boundingRect.height / 2));
		return val;
	}
	
	function get_boundingRect () :Rectangle
	{
		if (_boundsRect == null) {
			_boundsRect = computeBoundingRect();
		}
		return _boundsRect;
	}
	
	function get_boundingCircle () :Circle
	{
		if (_boundsCircle == null) {
			_boundsCircle = get_boundingRect().toCircle();
		}
		return _boundsCircle;
	}
	
	function computeBoundingRect () :Rectangle
	{
		throw "Abstract";
		return null;
	}

	public function clone () :T
	{
		throw "Abstract";
		return null;
	}

	public function containsPoint (v :XY) :Bool
	{
		throw "Abstract";
		return false;
	}
	
	public function containsBounds (b :IBounds<Dynamic>) :Bool
	{
		throw "Abstract";
		return false;
	}

	public function distance (b :IBounds<Dynamic>) :Float
	{
		throw "Abstract";
		return 0;
	}
	
	public function isWithinDistance(b :IBounds<Dynamic>, d :Float) :Bool
	{
		throw "Abstract";
		return false;
	}

	public function distanceToPoint (p :XY) :Float
	{
		throw "Abstract";
		return 0;
	}

	public function getBoundedPoint (v :XY, ?bounded :XY) :XY
	{
		throw "Abstract";
		return null;
	}

	public function getBoundedPointFromMove (originX :Float, originY :Float, targetX :Float, targetY :Float, ?bounded :XY) :XY
	{
		throw "Abstract";
		return null;
	}
	
	function clearCache () :Void
	{
		_center = null;
		_boundsRect = null;
		_boundsCircle = null;
	}
	
	var _center :XY;
	var _boundsRect :Rectangle;
	var _boundsCircle :Circle;

}
