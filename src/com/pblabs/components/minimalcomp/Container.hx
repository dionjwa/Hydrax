package com.pblabs.components.minimalcomp;

import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;

import de.polygonal.core.math.Limits;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;

class Container extends Component
{
	public var alignment :Alignment;
	
	public function new ()
	{
		super();
		alignment = Alignment.NONE;
	}
	
	override public function show () :Void
	{
		super.show();
		for (c in children) {
			c.show();
		}
	}
	
	override public function hide () :Void
	{
	    super.hide();
		for (c in children) {
			c.hide();
		}
	}
	
	override function onReset () :Void
	{
		super.onReset();
		com.pblabs.util.Assert.isNotNull(_spatial);
		//Listen for location changes so we can redraw
		com.pblabs.util.Assert.isTrue(owner.getComponents(SpatialComponent).length == 1);
		bindSignal(_spatial.signalerLocation, onLocationChanged);
		invalidate();
	}
	
	override function childAdded (c :Component) :Void
	{
		invalidate();
	}
	
	override function childRemoved (c :Component) :Void
	{
		invalidate();
	}
	
	override public function redraw () :Void
	{
		if (_children == null || children.length == 0) {
			return;
		}
		for (c in children) {
			if (c.owner == owner) {
				com.pblabs.util.Log.warn("Child and parent owned by the same entity, could get strange with updates");
				continue;
			}
			
			switch(alignment) {
				case LEFT: c.x = x + c.width / 2;  c.y = y; 
				case RIGHT: c.x = x - c.width / 2; c.y = y;
				case TOP: c.y = y - c.height / 2;  c.x = x;
				case BOTTOM: c.y = y + c.height / 2;  c.x = x;
				default: c.y = y; c.x = x;
			}
		}
	}
	
	override function get_width () :Float
	{
		if (children == null || children.length == 0) {
			return 0;
		}
		var left :Float = Limits.INT32_MAX;
		var right :Float = Limits.INT32_MIN;
		for (c in children) {
			left = Math.min(left, c.x - c.width / 2);
			right = Math.max(right, c.x + c.width / 2);
		}
		return right - left;
	}
	
	override function get_height () :Float
	{
		var top :Float = Limits.INT32_MAX;
		var bottom :Float = Limits.INT32_MIN;
		for (c in children) {
			var spatial = c.owner.getComponent(SpatialComponent);
			if (spatial != null) {
				top = Math.min(top, spatial.worldExtents.ymin);
				bottom = Math.max(bottom, spatial.worldExtents.ymax);
			}
		}
		if (top == Limits.INT32_MAX) {
			return 0;
		}
		return bottom - top;
	}
	
	function onLocationChanged (ignored :Dynamic) :Void
	{
		redraw();
	}
}
