/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.spatial;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.ObjectTypeManager;

import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

/**
 * Basic 2d spatial manager that stores everything in a list. There are many
 * smarter implementations, but this one is simple and reliable.
 */ 
class BasicSpatialManager2D extends NodeComponent<Dynamic, ISpatialObject2D>,
	implements ISpatialManager2D
{
	/**
	 * Dispatched when a child is added or removed
	 */
	public var childrenDirtySignaler (default, null) :Signaler<BasicSpatialManager2D>;
	
	@inject
	public var objectTypeManager :ObjectTypeManager;
	
	public function new ()
	{
		super();
		childrenDirtySignaler = new DirectSignaler(this);
	}
	
	/**
	 * @inheritDoc
	 */
	public function queryRectangle(box :AABB2, mask :ObjectType, results :Array<ISpatialObject2D>) :Bool
	{
		com.pblabs.util.Log.warn("Not checked/implemented");
		return false;
		// com.pblabs.engine.debug.Profiler.enter("QueryRectangle");
		
		// var foundAny:Bool = false;
		// for (object in _objectList)
		// {
		// 	if (mask != null)
		// 	{
		// 		if (!objectTypeManager.doTypesOverlap(object.objectMask, mask))
		// 			continue;
		// 	}
			
		// 	if(!boxVsBox(object.worldExtents, box))
		// 		continue;
			
		// 	results.push(object);
		// 	foundAny = true;
		// }
		
		// com.pblabs.engine.debug.Profiler.exit("QueryRectangle");
		// return foundAny;
	}
	
	/**
	 * @inheritDoc
	 */
	public function queryCircle(center :XY, radius:Float, mask:ObjectType, results:Array<ISpatialObject2D>) :Bool
	{
		com.pblabs.util.Log.warn("Not checked/implemented");
		return false;
		// com.pblabs.engine.debug.Profiler.enter("QueryCircle");
		
		// var foundAny:Bool = false;
		
		// var scratchRect:Rectangle = new Rectangle();
		// var tmpRect:Rectangle = new Rectangle();
		
		// for (object in _objectList)
		// {
		// 	if (mask != null)
		// 	{
		// 		if (!objectTypeManager.doTypesOverlap(object.objectMask, mask))
		// 			continue;
		// 	}
			
		// 	// Avoid allocations - so manually copy.
		// 	tmpRect = object.worldExtents;
		// 	scratchRect.x = tmpRect.x;
		// 	scratchRect.y = tmpRect.y;
		// 	scratchRect.width = tmpRect.width;
		// 	scratchRect.height = tmpRect.height;
			
		// 	scratchRect.inflate(radius, radius);
			
		// 	if (!scratchRect.containsPoint(center))
		// 		continue;
			
		// 	results.push(object);
		// 	foundAny = true;
		// }
		
		// com.pblabs.engine.debug.Profiler.exit("QueryCircle");
		
		// return foundAny;
	}
	
	/**
	 * @inheritDoc
	 */
	public function getObjectsUnderPoint(worldPosition :XY, mask :ObjectType, results :Array<ISpatialObject2D>) :Bool
	{
		// var tmpResults :Array<Dynamic> = new Array();
		
		// First use the normal spatial query...
		// if(!queryCircle(worldPosition, 64, mask, tmpResults))
			// return false;
		
		// Ok, now pass control to the objects and see what they think.
		var hitAny = false;
		for (c in children) {
			if (c.containsWorldPoint(worldPosition, mask)) {
				hitAny = true;
				results.push(c);
			}
		}
		
		// for (tmp in tmpResults)
		// {
			// TODO: Bring me back.
			//if (!tmp.pointOccupied(worldPosition, mask, context.scene))
			//   continue;
			
			// results.push(tmp);
			// hitAny = true;
		// }
		
		// TODO: Bring me back.
		// Sort the results.
		//if(context.scene)
		//   context.scene.sortSpatials(results);
		
		return hitAny;
	}
	
	/**
	 * @inheritDoc
	 */
	public function castRay(start:XY, end:XY, mask:ObjectType, result:RayHitInfo):Bool
	{
		throw "Not implemented";
		return false;
		// We want to return the first hit among all our items. We'll be very lazy,
		// // and simply check against every potential match, taking the closest hit.
		// // This will suck for long raycasts, but most of them are quite short.
		// var results:Array<Dynamic> = new Array();
		// var boundingRect:Rectangle = new Rectangle(
		// 					Math.min(start.x, end.x) - 0.5, 
		// 					Math.min(start.y, end.y) - 0.5, 
		// 					Math.abs(end.x - start.x) + 1, 
		// 					Math.abs(end.y - start.y) + 1);

		// if (!queryRectangle(boundingRect, mask, results))
		// 	return false;
		
		// var bestInfo:RayHitInfo = null;
		// var tempInfo:RayHitInfo = new RayHitInfo();
		
		// for (object in results)
		// {
		// 	if (object.castRay(start, end, mask, tempInfo))
		// 	{
		// 		if (!bestInfo)
		// 		{
		// 			bestInfo = new RayHitInfo();
		// 			bestInfo.copyFrom(tempInfo);
		// 		}
		// 		else if (tempInfo.time < bestInfo.time)
		// 		{
		// 			bestInfo.copyFrom(tempInfo);
		// 		}
		// 	}
		// }
		
		// if (bestInfo)
		// {
		// 	if (result)
		// 		result.copyFrom(bestInfo);
			
		// 	return true;
		// }
		
		// return false;
	}
	
	override function childAdded (c :SpatialComponent) :Void
	{
		if (childrenDirtySignaler.isListenedTo) 
			childrenDirtySignaler.dispatch();
	}
	
	override function childRemoved (c :SpatialComponent) :Void
	{
		if (childrenDirtySignaler.isListenedTo)
			childrenDirtySignaler.dispatch();
	}
}
