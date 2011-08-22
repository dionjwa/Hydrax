package com.pblabs.components.minimalcomp;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.engine.time.IAnimatedObject;

class VBox extends Container
{
	public var gap (default, set_gap) :Float;
	public var flowDirection (default, set_flowDirection) :Direction;
	
	public function new ()
	{
		super();
		setDefaults();
	}
	
	override public function redraw () :Void
	{
		if (children == null || children.length == 0) {
			return;
		}
		var curX :Float = x;
		var curY :Float = y;
		for (c in children) {
			switch (flowDirection) {
				case UP: curY -= c.height / 2;
				case DOWN: curY += c.height / 2;
				default: throw "Should never be here";
			}
			c.x = curX;
			c.y = curY;
			
			for (sc in c.owner.getComponents(com.pblabs.components.scene2D.BaseSceneComponent)) {
				if (Std.is(sc, IAnimatedObject)) {
					cast(sc, IAnimatedObject).onFrame(0);
				}
			}
			
			switch (alignment) {
				case LEFT: c.x = curX + c.width / 2;
				case RIGHT: c.x = curX - c.width / 2;
				case MIDDLE: c.x = curX;
				default:
			}
			
			switch (flowDirection) {
				case UP: curY -= c.height / 2 + gap;
				case DOWN: curY += c.height / 2 + gap;
				default:
			}
		}
	}
	
	function setDefaults () :Void
	{
		gap = 2;
		flowDirection = Direction.DOWN;
	}
	
	function set_gap (val :Float) :Float
	{
		this.gap = val;
		invalidate();
		return val;
	}
	
	function set_flowDirection (val :Direction) :Direction
	{
		switch (val) {
			case UP,DOWN://ok
			default: throw "Invalid flow direction " + val;
		}
		this.flowDirection = val;
		invalidate();
		return val;
	}
}
