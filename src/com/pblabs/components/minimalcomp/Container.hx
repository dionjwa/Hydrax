package com.pblabs.components.minimalcomp;

import Type;

import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import de.polygonal.core.math.Limits;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;

class Container extends Component
{
	public var sceneLayer :BaseSceneLayer<Dynamic, Dynamic>;
	public var alignment :Alignment;
	// public var childDisplayOrder (get_childDisplayOrder, null) :Map<Component, Int>;
	// var _childDisplayOrder :Map<Component, Int>;
	// function get_childDisplayOrder () :Map<Component, Int>
	// {
	// 	if (parent != null) {
	// 		return parent.childDisplayOrder;
	// 	} else {
	// 		if (_childDisplayOrder == null) {
	// 			_childDisplayOrder = Maps.newHashMap(ValueType.TClass(Component));
	// 		}
	// 		return _childDisplayOrder;
	// 	}
	// }
	
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
	
	override function onRemove () :Void
	{
		super.onRemove();
		// if (_childDisplayOrder != null) {
		// 	_childDisplayOrder.clear();
		// }
		alignment = Alignment.NONE;
	}
	
	
	override function childAdded (c :Component) :Void
	{
		invalidate();
		// computeChildDisplayOrder();
		// com.pblabs.util.Assert.isNotNull(sceneLayer, ' sceneLayer is null');
		if (sceneLayer != null) {
			sceneLayer.zOrderDirty = true;
		}
		// validateLayerIndices();
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
			c.redraw();
		}
		
		// com.pblabs.util.Assert.isNotNull(sceneLayer, ' sceneLayer is null');
		//Trigger the sceneLayer to resort the display children on it's next update
		//This assumes we've set sceneLayer.sorter to MCompTools.compareComponentRenderOrder
		// sceneLayer.zOrderDirty = true;
		
	}
	
	override public function invalidate () :Void
	{
		if (parent != null) {
			parent.invalidate();
		} else {
			redraw();
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
	
	/** Makes sure that the children BaseSceneComponent layer indices are above the parent.  Assumes only one SceneComponent */
	// function computeChildDisplayOrder () :Void
	// {
	// 	//We're the top parent
	// 	var index = 0;
	// 	var self = this;
	// 	var addToDisplayOrder = function (c :Component) :Void {
	// 		if (c == null) return;
	// 		self.childDisplayOrder.set(c, index++);
	// 	}
		
	// 	var recurseIntoStructure = null;
	// 	recurseIntoStructure = function (c :Component) :Void {
	// 		addToDisplayOrder(c);
	// 		if (Std.is(c, Container)) {
	// 			for (child in cast(c, Container).children) {
	// 				recurseIntoStructure(child);
	// 			}
	// 		}
	// 	}
	// 	recurseIntoStructure(this);
	// }
}
