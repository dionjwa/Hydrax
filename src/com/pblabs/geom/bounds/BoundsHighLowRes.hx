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
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.AbstractBounds;
import com.pblabs.geom.bounds.IBounds;

/**
 * For using computationally lighter bounds first
 */ 
class BoundsHighLowRes extends BoundsForwarding<Dynamic>
{
	public function new (bounds1 :Void->IBounds<Dynamic>, bounds2 :Void->IBounds<Dynamic>)
	{
		super(cast(bounds2));
		_lowResBounds = bounds1;
		_highResBounds = bounds2;
	}
	
	override public function isWithinDistance (b :IBounds<Dynamic>, d :Float) :Bool
	{
		if (!_lowResBounds().isWithinDistance(b, d)) {
			return false;
		} else {
			return _highResBounds().isWithinDistance(b, d);
		}
	}
	
	override public function containsPoint (v :Vector2) :Bool
	{
		if (!_lowResBounds().containsPoint(v)) {
			return false;
		} else {
			return _highResBounds().containsPoint(v);
		}
	}
	
	public function getBounds1 () :IBounds<Dynamic>
	{
		return _lowResBounds();
	}
	
	public function getBounds2 () :IBounds<Dynamic>
	{
		return _highResBounds();
	}
	
	public function toString () :String
	{
		return "[Low res bounds=" + _lowResBounds() + ", _highResBounds=" + _highResBounds() + "]";
	}
	
	override function get_boundingCircle () :Circle
	{
		return _lowResBounds().boundingCircle;
	}

	var _lowResBounds :Void->IBounds<Dynamic>;
	var _highResBounds :Void->IBounds<Dynamic>;
}


