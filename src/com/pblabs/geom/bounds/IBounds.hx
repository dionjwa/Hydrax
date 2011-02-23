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
import com.pblabs.util.Cloneable;

import de.polygonal.motor2.geom.math.XY;

interface IBounds<T> 
	implements Cloneable<T>//, implements ISpatialObject2D
{
	public var center(get_center, set_center) : XY;
	public var topLeft(get_topLeft, set_topLeft) : XY;
	// public var boundingRect (get_boundingRect, null) :Rectangle;
	public var boundingCircle (get_boundingCircle, null) :Circle;

	public function distance (b :IBounds<Dynamic>) :Float;
	public function containsBounds (b :IBounds<Dynamic>) :Bool;
	public function isWithinDistance(b :IBounds<Dynamic>, d :Float) :Bool;
	
	public function containsPoint (v :XY) :Bool;
	// public function distanceToPoint (v :XY) :Float;
	// public function getBoundedPoint (v :XY, ?v :XY) :XY;
	// public function getBoundedPointFromMove (originX :Float, originY :Float, targetX :Float, targetY :Float, ?v :XY) :XY;
}
