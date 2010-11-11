/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom.bounds;

import com.pblabs.components.scene.ISpatialObject2D;
import com.pblabs.geom.Circle;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Cloneable;

interface IBounds<T> 
    implements Cloneable<T>, implements ISpatialObject2D
{
    public var center(get_center, set_center) : Vector2;
    public var topLeft(get_topLeft, set_topLeft) : Vector2;
    // public var boundingRect (get_boundingRect, null) :Rectangle;
    public var boundingCircle (get_boundingCircle, null) :Circle;

    public function distance (b :IBounds<Dynamic>) :Float;
    public function containsBounds (b :IBounds<Dynamic>) :Bool;
    public function isWithinDistance(b :IBounds<Dynamic>, d :Float) :Bool;
    
    public function containsPoint (v :Vector2) :Bool;
    // public function distanceToPoint (v :Vector2) :Float;
    // public function getBoundedPoint (v :Vector2, ?v :Vector2) :Vector2;
    // public function getBoundedPointFromMove (originX :Float, originY :Float, targetX :Float, targetY :Float, ?v :Vector2) :Vector2;
}


