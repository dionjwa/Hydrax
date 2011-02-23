/*******************************************************************************
* PushButton Engine
* Copyright (C) 2009 PushButton Labs, LLC
* For more information see http://www.pushbuttonengine.com
* 
* This file is licensed under the terms of the MIT license, which is included
* in the License.html file at the root directory of this SDK.
******************************************************************************/
package com.pblabs.components.spatial;

import com.pblabs.components.manager.INode;
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

/**
* Basic interface for 2D spatial database.
* 
* This provides enough capabilities to do visibility culling, limited picking,
* and ray casts.
* 
* Most implementations (like ones using a physics library) will expose a
* lot more functionality, but this is enough to do rendering and UI tasks.
*/ 
interface ISpatialManager2D
	implements INode<Dynamic, ISpatialObject2D>
{
	/**
	* Return all the spatial objects that overlap with the specified box and match
	* one or more of the types in the mask.
	* 
	* <p>Note that if you pass in a populated array, this method appends to it.
	* This can be useful if you want to combine the results of several
	* queries. If you just want the results from one query, make sure to
	* set results.length=0; before you pass it to queryAABB2.</p>
	* 
	* @return True if one or more objects were found and push()'ed to results.
	*/ 
	function queryAABB2 (box:AABB2, mask :ObjectType, results :Array<ISpatialObject2D>) :Bool;
	
	/**
	* Return all the spatial objects that overlap the specified circle.
	* 
	* @see QueryAABB2
	*/ 
	function queryCircle(center :XY, radius :Float, mask :ObjectType, results :Array<ISpatialObject2D>) :Bool;
	
	/**
	* Cast a ray and (optionally) return information about what it hits in result.
	*/
	// function castRay(start :XY, end :XY, result :RayHitInfo, ?flags :ObjectType = null) :Bool;
	
	/**
	* Return all the spatial objects under a given point. Objects can optionally implement
	* pixel-level collision checking.
	*
	* @param worldPosition XY in worldspace to check.
	* @param results An array into which ISpatialObject2Ds are added based on what is under point.
	* @param mask Only consider objects that match this ObjectType. Null uses all types.
	* @return Found something under point or not.
	*/
	function getObjectsUndergetObjectsUnderPoint(worldPosition :XY, mask :ObjectType, results :Array<ISpatialObject2D>) :Bool;
}
