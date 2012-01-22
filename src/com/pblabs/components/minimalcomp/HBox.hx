package com.pblabs.components.minimalcomp;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.Direction;
import com.pblabs.engine.time.IAnimatedObject;


import de.polygonal.core.math.Vec2;

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
			
			if (!c.ignoreParentLocation) {
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
			}
			
			switch (flowDirection) {
				case LEFT: curX -= c.width / 2 + gap;
				case RIGHT: curX += c.width / 2 + gap;
				default:
			}
		}
		redrawSignal.dispatch(this);
	}
	
	override public function getChildLocation (index :Int = -1) :Vec2
	{
		if (index == -1) {
			var b = get_bounds();
			if (flowDirection == Direction.RIGHT) {
				return new Vec2(x + b.intervalX + gap, y);
			} else {
				return new Vec2(x - b.intervalX - gap, y);
			}
		} else {
			var xpos = x;
			index = Std.int(Math.min(index, children.length));
			for (ii in 0...index) {
				xpos += children[ii].width + gap;
			}
			return new Vec2(xpos, y);
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		setDefaults();
	}
	
	
	override function setDefaults () :Void
	{
		super.setDefaults();
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
