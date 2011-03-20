package com.pblabs.components.spatial;

import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

interface IBounded implements IEntityComponent
{
	var bounds (get_bounds, set_bounds) :AABB2;
	function containsWorldPoint (pos :XY, mask :ObjectType) :Bool;
}
