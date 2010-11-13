package com.pblabs.components.scene;

import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;

@sets("sddf")
interface ISpatialObject2D
{
    /**
     * Axis aligned object bounds in world space.
     */ 
    // public var boundingRect (get_boundingRect, null) :Rectangle;
    
    // /**
    //  * This object's collision flags.
    //  */ 
    // function get objectMask() :ObjectType;
    
    // /**
    //  * Perform a ray cast against this object.
    //  */ 
    // function castRay(start :Point, end :Point, flags :ObjectType, result :RayHitInfo) :Boolean;
    
    /**
     * Return true if the specified point is occupied by this object, used for
     * ObjectsUnderPoint.
     *
     * @param pos Location in worldspace to check.
     * @param scene If we want to have the results line up with the view, we
     *              need access to the scene we're doing the check from.
     */
    function containsPoint (pos :Vector2) :Bool;
}


