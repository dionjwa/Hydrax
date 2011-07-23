package com.pblabs.components.minimalcomp;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.engine.time.IAnimatedObject;

enum VerticalDirection {
	UP;
	DOWN;
}

class VBox extends Container
{
	public var vGap (default, set_vGap) :Float;
	public var flowDirection (default, set_flowDirection) :VerticalDirection;
	
	public function new ()
	{
		super();
		this.vGap = 2;
		this.flowDirection = DOWN;
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
				case UP: curY -= c.height / 2 + vGap;
				case DOWN: curY += c.height / 2 + vGap;
			}
		}
	}
	
	function set_vGap (val :Float) :Float
	{
		this.vGap = val;
		invalidate();
		return val;
	}
	
	function set_flowDirection (val :VerticalDirection) :VerticalDirection
	{
		this.flowDirection = val;
		invalidate();
		return val;
	}
}
