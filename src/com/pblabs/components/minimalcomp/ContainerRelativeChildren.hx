package com.pblabs.components.minimalcomp;

import Type;

import de.polygonal.motor.geom.math.Vec2;

import org.transition9.ds.Map;
import org.transition9.ds.Maps;
import org.transition9.ds.maps.MapBuilder;

using com.pblabs.components.scene2D.SceneUtil;

/** Assigns children to a map of fixed positions.  Children must be added manually */
class ContainerRelativeChildren extends Container
{
	public var anchors :Map<Int, Vec2>;
	
	public function new ()
	{
		super();
		anchors = new MapBuilder(ValueType.TInt).setDefaultValue(cast new Vec2()).build();
	}
	
	override public function redraw () :Void
	{
		if (_children == null || children.length == 0) {
			redrawSignal.dispatch(this);
			return;
		}
		
		var absScale = MCompTools.getAbsoluteScale(owner);
		
		for (c in children) {
			if (c == null) {
				continue;
			}
			#if debug
			if (!anchors.exists(c.key)) {
				org.transition9.util.Log.error("Missing anchor=" + c.key);
			}
			#end
			var loc = anchors.get(c.key);
			org.transition9.util.Assert.isNotNull(loc, ' loc is null for key=' + c.key);
			
			var absX = x + loc.x * absScale.x;
			var absY = y + loc.y * absScale.y;
			
			switch(alignment) {
				case LEFT: c.x = absX + (c.width / 2);  c.y = absY; 
				case RIGHT: c.x = absX - c.width / 2; c.y = absY;
				case TOP: c.x = absX; c.y = absY - c.height / 2;
				case BOTTOM: c.x = absX; c.y = absY + c.height / 2;
				default: c.x = absX; c.y = absY;
			}
			c.redraw();
		}
		redrawSignal.dispatch(this);
	}
	
	public function setRelative (child :Component, relativeX :Float, relativeY :Float) :Void
	{
		anchors.set(child.key, new Vec2(relativeX, relativeY));
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		anchors.clear();
	}
}
