package com.pblabs.components.minimalcomp;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.time.IAnimatedObject;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.util.PBUtil;

/**
  * Allows x/y properties to be set in a hierarchical manner.
  * By setting the x/y property references, the parent can easily 
  * set the children locations, e.g. as relative to the parent or 
  * arranged in a row.
  */
class Component extends NodeComponent<Container, Component>
{
	/** Used by containers that map locations to component ids */
	public var id :String;
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var width (get_width, never) :Float;
	public var height (get_height, never) :Float;
	public var root (get_root, never) :Component;
	function get_root () :Component
	{
		// return parent == null || !Std.is(this, Container)? null : parent.root;
		return parent == null ? this : parent.root;
	}
	
	public var spatialProperty :PropertyReference<SpatialComponent>;
	var _spatial :SpatialComponent;
	var _isHidden :Bool;
		
	public function new ()
	{
		super();
		setDefaultVars();
	}
	
	public function show () :Void
	{
		if (!_isHidden) {
			return;
		}
		_isHidden = false;
		for (disp in owner.getComponents(com.pblabs.components.scene2D.BaseSceneComponent)) {
			if (!disp.hasParent()) {
				disp.addToParent();
				if (Std.is(disp, IAnimatedObject)) {
					cast(disp, IAnimatedObject).onFrame(0);
				}
			}
		}
		
		redraw();
	}
	
	public function hide () :Void
	{
		if (_isHidden) {
			return;
		}
		_isHidden = true;
		for (disp in owner.getComponents(com.pblabs.components.scene2D.BaseSceneComponent)) {
			disp.removeFromParent();
		}
	}
	
	public function invalidate () :Void
	{
		if (parent != null) {
			parent.invalidate();
		} else {
			redraw();
		}
		if (owner != null && owner.getComponent(BaseSceneComponent) != null) {
			if (owner.getComponent(BaseSceneComponent).layer != null) {
				owner.getComponent(BaseSceneComponent).layer.zOrderDirty = true;
			}
		}
	}
	
	public function redraw () :Void
	{
		for (disp in owner.getComponents(com.pblabs.components.scene2D.BaseSceneComponent)) {
			disp.isTransformDirty = true;
			disp.updateIfUpdatable();
		}
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		invalidate();
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		_spatial = owner.getComponent(SpatialComponent);
	}
	
	override function onReset () :Void
	{
		_spatial = owner.getComponent(SpatialComponent);
		com.pblabs.util.Assert.isNotNull(_spatial);
		super.onReset();
		invalidate();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		setDefaultVars();
	}
	
	inline function setDefaultVars () :Void
	{
		id = null;
		_spatial = null;
		_isHidden = false;
	}
	
	function get_x () :Float
	{
		if (_spatial == null) {
			return 0;
		}
		return _spatial.x;
	}
	
	function set_x (val :Float) :Float
	{
		_spatial.x = val;
		return val;
	}
	
	function get_y () :Float
	{
		if (_spatial == null) {
			return 0;
		}
		return _spatial.y;
	}
	
	function set_y (val :Float) :Float
	{
		_spatial.y = val;
		return val;
	}
	
	function get_width () :Float
	{
		if (_spatial == null) {
			return 0;
		}
		return _spatial.worldExtents.intervalX;
	}
	
	function get_height () :Float
	{
		if (_spatial == null) {
			return 0;
		}
		com.pblabs.util.Assert.isNotNull(_spatial);
		com.pblabs.util.Assert.isNotNull(_spatial.worldExtents);
		return _spatial.worldExtents.intervalY;
	}
	
	#if debug
	override public function toString () :String
	{
		return owner != null ? owner.name : "";
	}
	#end
}
