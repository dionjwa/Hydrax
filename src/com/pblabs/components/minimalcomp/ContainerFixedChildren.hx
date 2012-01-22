package com.pblabs.components.minimalcomp;

import de.polygonal.core.math.Vec2;

using com.pblabs.components.scene2D.SceneUtil;

/** Assigns children to relative fixed positions */
class ContainerFixedChildren extends Container
{
	public var fixedPositions :Array<Vec2>;
	
	public function new ()
	{
		super();
	}
	
	override public function redraw () :Void
	{
		if (_children == null || children.length == 0) {
			redrawSignal.dispatch(this);
			return;
		}
		
		if (fixedPositions == null) {
			org.transition9.util.Log.warn("No fixedPositions");
			return;
		}
		
		var absScale = MCompTools.getAbsoluteScale(owner);
		
		for (ii in 0...children.length) {
			var c = children[ii];
			var loc = fixedPositions[ii];
			if (c == null || loc == null) {
				org.transition9.util.Log.warn("children.length > fixedPositions.length");
				return;
			}
		
			var absX = x + loc.x * absScale.x;
			var absY = y + loc.y * absScale.y;
			
			switch(alignment) {
				case LEFT: c.x = absX + c.width / 2;  c.y = absY; 
				case RIGHT: c.x = absX - c.width / 2; c.y = absY;
				case TOP: c.x = absX; c.y = absY - c.height / 2;
				case BOTTOM: c.x = absX; c.y = absY + c.height / 2;
				default: c.x = absX; c.y = absY;
			}
			c.redraw();
		}
		redrawSignal.dispatch(this);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		fixedPositions = null;
	}
}
