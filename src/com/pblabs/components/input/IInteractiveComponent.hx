/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor.geom.math.Vec2;

/**
  * Minimal functionality needed to begin mouse/input device interactions.
  */
interface IInteractiveComponent implements IEntityComponent
{
	var objectMask (get_objectMask, set_objectMask) :ObjectType;
	function containsScreenPoint (pos :Vec2, mask :ObjectType) :Bool;
}
