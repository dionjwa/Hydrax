package com.pblabs.components.minimalcomp;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.Direction;
import com.pblabs.engine.time.IAnimatedObject;

import de.polygonal.core.math.Vec2;

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
			redrawSignal.dispatch(this);
			return;
		}
		// trace("redraw");
		var curX :Float = x;
		var curY :Float = y;
		// trace('x=' + x);
		// trace('y=' + y);
		for (c in children) {
			
			curY += flowDirection == Direction.DOWN ? c.registrationPoint.y : -c.registrationPoint.y;
			
			// if (Std.is(c, Container)) {
			// 	switch (flowDirection) {
			// 		case UP: curY -= c.height;
			// 		case DOWN: curY += c.height;
			// 		default: throw "Should never be here";
			// 	}
			// } else {
			// // trace(org.transition9.rtti.ReflectUtil.getClassName(c) + " height=" + c.height);
			// 	switch (flowDirection) {
			// 		case UP: curY -= c.height / 2;
			// 		case DOWN: curY += c.height / 2;
			// 		default: throw "Should never be here";
			// 	}
			// }
			
			
			if (!c.ignoreParentLocation) {
					
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
			}
			
			// if (false && Std.is(c, Container)) {
			// 	switch (flowDirection) {
			// 		case UP: curY -= c.height;
			// 		case DOWN: curY += c.height;
			// 		default: throw "Should never be here";
			// 	}
			// } else {
				switch (flowDirection) {
					case UP: curY -= (c.height - c.registrationPoint.y) + gap;
					case DOWN: curY += (c.height - c.registrationPoint.y) + gap;
					default: throw "Should never be here";
				}
			// }
			
			c.redraw();
		}
		redrawSignal.dispatch(this);
	}
	
	override public function getChildLocation (index :Int = -1) :Vec2
	{
		if (index == -1) {
			var b = get_bounds();
			if (flowDirection == Direction.DOWN) {
				return new Vec2(x, y + b.intervalY);
			} else {
				return new Vec2(x, y - b.intervalY);
			}
		} else {
			throw "Implement me";
		}
	}
	
	override function get_registrationPoint () :Vec2
	{
		var v = new Vec2();
		v.y = switch (flowDirection) {
		 	case UP: height;
		 	default: 0;
		}
		v.x = switch (alignment) {
			case LEFT: 0;
			case RIGHT: width;
			case MIDDLE: width / 2; 
			default: 0;
		}
		return v;
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
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
