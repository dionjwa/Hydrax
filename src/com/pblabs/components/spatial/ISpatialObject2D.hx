/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.spatial;

import com.pblabs.components.manager.INodeChild;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

/**
 * Object with extents and ability to be ray-casted.
 * 
 * This is the basic interface for objects that support 2D spatial queries.
 * It is enough to do broad phase collision checks and ray casts.
 */ 
interface ISpatialObject2D
	implements IEntityComponent, implements INodeChild<ISpatialManager2D> 
{
	
	// var x (get_x, set_x) :Float;
	// var y (get_y, set_y) :Float;
	// var angle (get_angle, set_angle) :Float;
	
	/**
	 * Axis aligned object bounds in world space.
	 */ 
	var worldExtents (get_worldExtents, set_worldExtents) :AABB2;
	
	/**
	 * This object's collision flags.
	 */ 
	var objectMask (get_objectMask, set_objectMask) :ObjectType;
	
	/**
	 * Perform a ray cast against this object.
	 */ 
	// function castRay (start :XY, end :XY, result :RayHitInfo, ?flags :ObjectType = null):Bool;
	
	/**
	 * Return true if the specified point is occupied by this object, used for
	 * ObjectsUnderPoint.
	 *
	 * @param pos Location in worldspace to check.
	 */
	function containsWorldPoint (pos :XY, mask :ObjectType):Bool;
}
