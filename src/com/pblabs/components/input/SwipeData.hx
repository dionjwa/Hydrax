package com.pblabs.components.input;

import com.pblabs.components.scene2D.Direction;

import de.polygonal.motor2.geom.math.XY;

class SwipeData
{
	public var start (default, null):XY;
	public var direction (default, null):Direction;
	
	public function new (swipeStart :XY, direction :Direction)
	{
		this.start = swipeStart;
		this.direction = direction;
	}

}
