package com.pblabs.components.minimalcomp;

import Type;

import com.pblabs.geom.Vector2;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.maps.MapBuilder;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.scene2D.SceneUtil;

/** Assigns children to a map of fixed positions.  Children must be added manually */
class ContainerMappedChildren extends Container
{
	public var anchors :Map<String, XY>;
	
	public function new ()
	{
		super();
		anchors = new MapBuilder(ValueType.TClass(String))
			.setDefaultValue(cast new Vector2())
			.set("center", cast new Vector2()).build();
		com.pblabs.util.Assert.isNotNull(anchors, ' anchors is null');
	}
	
	override public function redraw () :Void
	{
		if (_children == null || children.length == 0) {
			return;
		}
		
		if (anchors == null) {
			com.pblabs.util.Log.warn("No anchors");
			return;
		}
		
		for (c in children) {
			if (c == null) {
				continue;
			}
			if (c.id == null) {
				com.pblabs.util.Log.warn(c.owner.name + " has a null component.id, so it cannot be assigned a location. Defaulting to (0,0)");
			}
			#if debug
			if (!anchors.exists(c.id)) {
				com.pblabs.util.Log.error("Missing anchor=" + c.id);
			}
			#end
			var loc = anchors.get(c.id);
			com.pblabs.util.Assert.isNotNull(loc, ' loc is null for id=' + c.id);
			
			var absX = x + loc.x;
			var absY = y + loc.y;
			switch(alignment) {
				case LEFT: c.x = absX + c.width / 2;  c.y = absY; 
				case RIGHT: c.x = absX - c.width / 2; c.y = absY;
				case TOP: c.x = absX; c.y = absY - c.height / 2;
				case BOTTOM: c.x = absX; c.y = absY + c.height / 2;
				default: c.x = absX; c.y = absY;
			}
			c.redraw();
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		anchors.clear();
	}
}
