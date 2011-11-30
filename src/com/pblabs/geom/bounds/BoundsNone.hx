/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom.bounds;

import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import haxe.rtti.ReflectUtil;

import de.polygonal.motor2.geom.math.XY;

class BoundsNone extends AbstractBounds<BoundsNone> 
{
	public function new()
	{
		super();
	}

	override function get_center ():XY
	{
		throw "Abstract method";
		return null;
	}

	public override function clone () :BoundsNone
	{
		return new BoundsNone();
	}

	public override function distance (b :IBounds<Dynamic>) :Float
	{
		return 0;
	}

	public override function distanceToPoint (p :XY) :Float
	{
		return 0;
	}
}
