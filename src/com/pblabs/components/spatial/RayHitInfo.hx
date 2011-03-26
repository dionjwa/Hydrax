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

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.geom.VectorTools;

/**
* Information about the results of a ray cast. Used with 
* ISpatialManager2D.CastRay().
*/ 
class RayHitInfo
{
	/**
	* Ranges from 0..1, 0 being at the start of the ray and 1 at the end.
	* Indicates location of contact along the ray.
	*/ 
	public var time :Float;
	
	/**
	* Position of the contact.
	*/ 
	public var position :XY;
	
	/**
	* Normal of the contact.
	*/ 
	public var normal :XY;
	
	/**
	* The specific object the ray struck.
	*/ 
	public var hitObject :ISpatialObject2D;
	
	public function new() { }
	
	/**
	* Copy state from another RayHitInfo, overwriting the information in this
	* RayHitInfo.
	*/
	public function copyFrom(other :RayHitInfo):Void
	{
		time = other.time;
		
		if(other.position != null)
			position = other.position.clone();
		else
			position = null;
		
		if(other.normal != null)
			normal = other.normal.clone();
		else
			normal = null;
		hitObject = other.hitObject;
	}
}
