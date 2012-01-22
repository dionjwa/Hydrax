package com.pblabs.components.minimalcomp;

import Type;

import de.polygonal.core.math.Vec2;

import org.transition9.ds.Map;
import org.transition9.ds.Maps;
import org.transition9.ds.maps.MapBuilder;

using com.pblabs.components.scene2D.SceneUtil;

/** Assigns children to a map of fixed positions.  Children must be added manually */
class ContainerMappedChildren extends Container
{
	public var anchors :Map<String, Vec2>;
	
	public function new ()
	{
		super();
		anchors = new MapBuilder(ValueType.TClass(String))
			.setDefaultValue(cast new Vec2())
			.set("center", cast new Vec2()).build();
		org.transition9.util.Assert.isNotNull(anchors, ' anchors is null');
	}
	
	override public function redraw () :Void
	{
		if (_children == null || children.length == 0) {
			redrawSignal.dispatch(this);
			return;
		}
		
		if (anchors == null) {
			org.transition9.util.Log.warn("No anchors");
			return;
		}
		
		var absScale = MCompTools.getAbsoluteScale(owner);
		
		for (c in children) {
			if (c == null) {
				continue;
			}
			if (c.id == null) {
				org.transition9.util.Log.warn(c.owner.name + " has a null component.id, so it cannot be assigned a location. Defaulting to (0,0)");
			}
			#if debug
			if (!anchors.exists(c.id)) {
				org.transition9.util.Log.error("Missing anchor=" + c.id);
			}
			#end
			var loc = anchors.get(c.id);
			org.transition9.util.Assert.isNotNull(loc, ' loc is null for id=' + c.id);
			
			var absX = x + loc.x * absScale.x;
			var absY = y + loc.y * absScale.y;
			
			switch(alignment) {
				case LEFT: c.x = absX + (c.width / 2);  c.y = absY; 
				case RIGHT: c.x = absX - (c.width / 2); c.y = absY;
				case TOP: c.x = absX; c.y = absY - (c.height / 2);
				case BOTTOM: c.x = absX; c.y = absY + (c.height / 2);
				default: c.x = absX; c.y = absY;
			}
			c.redraw();
		}
		redrawSignal.dispatch(this);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		anchors.clear();
	}
}
