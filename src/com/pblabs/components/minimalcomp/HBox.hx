package com.pblabs.components.minimalcomp;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.Direction;
import com.pblabs.engine.time.IAnimatedObject;

class HBox extends Container
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
		if (_children == null || children.length == 0) {
			redrawSignal.dispatch(this);
			return;
		}
		var curX :Float = x;
		var curY :Float = y;
		
		for (c in children) {
			switch (flowDirection) {
				case LEFT: curX -= c.width / 2;
				case RIGHT: curX += c.width / 2;
				default: throw "Should never be here";
			}
			c.x = curX;
			c.y = curY;
			
			var sc = c.owner.getComponent(BaseSceneComponent);
			if (Std.is(sc, IAnimatedObject)) {
				cast(sc, IAnimatedObject).onFrame(0);
			}
			
			switch (alignment) {
				case TOP: c.y = curY + c.height / 2;
				case BOTTOM: c.y = curY - c.height / 2;
				default:
			}
			
			switch (flowDirection) {
				case LEFT: curX -= c.width / 2 + gap;
				case RIGHT: curX += c.width / 2 + gap;
				default:
			}
		}
		redrawSignal.dispatch(this);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		setDefaults();
	}
	
	
	function setDefaults () :Void
	{
		gap = 2;
		flowDirection = Direction.RIGHT;
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
			case LEFT,RIGHT://ok
			default: throw "Invalid flow direction " + val;
		}
		this.flowDirection = val;
		invalidate();
		return val;
	}

}
