/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.spatial;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor.geom.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

interface IBounded implements IEntityComponent
{
	var bounds (get_bounds, set_bounds) :AABB2;
	function containsWorldPoint (pos :Vec2, mask :ObjectType) :Bool;
}
