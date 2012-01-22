package com.pblabs.components.input;

import com.pblabs.components.scene2D.Direction;

import de.polygonal.core.math.Vec2;

class SwipeData
{
	public var start (default, null):Vec2;
	public var direction (default, null):Direction;
	
	public function new (swipeStart :Vec2, direction :Direction)
	{
		this.start = swipeStart;
		this.direction = direction;
	}

}
