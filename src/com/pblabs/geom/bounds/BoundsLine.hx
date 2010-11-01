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
import com.pblabs.geom.LineSegment;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.AbstractBounds;
import com.pblabs.geom.bounds.BoundsPoint;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.IBounds;
import com.pblabs.util.ReflectUtil;

class BoundsLine extends AbstractBounds<BoundsLine>
    // implements IBounds<BoundsLine> 
{
    // public var center(get_center, set_center) : Vector2;
    // public var boundingRect (get_boundingRect, null) :Rectangle;
    // public var boundingCircle (get_boundingCircle, null) :Circle;
    public var lineSegment(getLineSegment, null) : LineSegment;

    public function new (x1 :Float, y1 :Float, x2 :Float, y2 :Float)
    {
        super();
        _p1 = new Vector2(x1, y1);
        _p2 = new Vector2(x2, y2);
        _lineSegment = new LineSegment(_p1, _p2);
    }

    inline function getLineSegment ():LineSegment
    {
        return _lineSegment;
    }

    override function get_center ():Vector2
    {
        return Vector2.interpolate(_p1, _p2, 0.5);
    }
    
    override function computeBoundingRect () :Rectangle
    {
        return new Rectangle(Math.min(_p1.x, _p2.x), Math.min(_p1.y, _p2.y), Math.abs(_p1.x - _p2.x), Math.abs(_p1.y - _p2.y));
    }

    public function toString () :String
    {
        return _lineSegment.toString();
        // return StringUtil.simpleToString(this, [ "lineSegment" ]);
    }

    // public function boundingRect () :Rectangle
    // {
    //     var minX = Math.min(_p1.x, _p2.x);
    //     var maxX = Math.max(_p1.x, _p2.x);
    //     var minY = Math.min(_p1.y, _p2.y);
    //     var maxY = Math.max(_p1.y, _p2.y);
    //     return new Rectangle(minX, minY, maxX - minX, maxY - minY);
    // }

    override public function clone () :BoundsLine
    {
        return new BoundsLine(_p1.x, _p1.y, _p2.x, _p2.y);
    }

    override public function containsPoint (v :Vector2) :Bool
    {
        return LineSegment.distToLineSegment(_p1, _p2, v) == 0;
    }

    // public function convertToGlobal (localDisp :DisplayObject) :Bounds<BoundsLine>
    // {
    //     var p1:Vector2 = Vector2.toVector2(localDisp.localToGlobal(_p1.toPoint()));
    //     var p2:Vector2 = Vector2.toVector2(localDisp.localToGlobal(_p2.toPoint()));
    //     return new BoundsLine(p1.x, p1.y, p2.x, p2.y);
    // }

    //TODO: move this to a util class
    #if flash
    public function debugDraw (s :flash.display.Sprite) :Void
    {
        s.graphics.lineStyle(2, 0xff0000);
        s.graphics.moveTo(_p1.x, _p1.y);
        s.graphics.lineTo(_p2.x, _p2.y);
    }
    #end

    override public function distance (b :IBounds<Dynamic>) :Float
    {
        return 0;
        // if (Std.is( b, BoundsPoint)) {
        //     return distanceToPoint(BoundsPoint(b).point);
        // } else if (Std.is( b, BoundsPolygon)) {
        //     return _lineSegment.dist(BoundsPolygon(b).polygon.center);
        // } else if (Std.is( b, BoundsLine)) {
        //     return BoundsLine(b)._lineSegment.distanceToLine(_lineSegment);
        // }
        // throw "Distance not implemented between " + ReflectUtil.tinyClassName(this) +
        //     " and " + ReflectUtil.tinyClassName(b);

    }

    override public function distanceToPoint (p :Vector2) :Float
    {
        return LineSegment.distToLineSegment(_p1, _p2, p);
    }

    override public function getBoundedPoint (v :Vector2, ?bounded :Vector2) :Vector2
    {
        if (bounded != null) {
            var p = LineSegment.closestPoint(_p1, _p2, v);
            bounded.x = p.x;
            bounded.y = p.y;
            return bounded;
        } else {
            return LineSegment.closestPoint(_p1, _p2, v);
        }
    }

    override public function getBoundedPointFromMove (originX :Float, originY :Float, targetX :Float, targetY :Float, ?bounded :Vector2) :Vector2
    {
        return getBoundedPoint(new Vector2(targetX, targetY));
    }

    var _lineSegment:LineSegment;
    var _p1:Vector2;
    var _p2:Vector2;
}


