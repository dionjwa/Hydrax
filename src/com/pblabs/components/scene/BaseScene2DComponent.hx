/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
using com.pblabs.components.scene.SceneUtil;
using com.pblabs.util.StringUtil;

class BaseScene2DComponent<Layer :BaseScene2DLayer<Dynamic, Dynamic>> extends NodeComponent<Layer, Dynamic>,
		implements IInteractiveComponent
{
	public var layer (get_layer, null) :Layer;
	public var x (get_x, set_x) :Float;
	public var y (get_y, set_y) :Float;
	public var width (get_width, set_width) :Float;
	public var height (get_height, set_height) :Float;
	public var angle (get_angle, set_angle) :Float;
	public var scale (get_scale, set_scale) :Float;
	public var isTransformDirty (get_isTransformDirty, set_isTransformDirty) :Bool;
	
	public function new ()
	{
		super();
		_x = 0;
		_y = 0;
		_angle = 0;
		_scale = 1;
		isTransformDirty = true;
		_width = 0;
		_height = 0;
	}
	
	public function containsScreenPoint (pos :Vector2) :Bool
	{
		var scene :BaseScene2DManager<Dynamic> = cast parent.scene;
		#if (flash || cpp)
		//The flash pos argument is already transformed to the 
		//SceneManager coords.
		// trace("is " + pos + " is in " + this.stringify(["x", "y", "width", "height"])); 
		return RectangleTools.contains(x - width / 2, y - height / 2, width, height, scene.translateScreenToWorld(pos), angle);
		#elseif js
		// trace(pos + "==>" + parent.scene.translateScreenToWorld(pos));
		// trace(this + ".....hit? " + RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, parent.scene.translateScreenToWorld(pos)));
		return RectangleTools.contains(x - _width / 2, y - _height / 2, _width, _height, scene.translateScreenToWorld(pos), angle);
		//Translate coords
		#else
		return false;
		#end
	}
	
	@inject("@LocationComponent.signaller")
	public function setLocation (loc :Vector2) :Void
	{
		set_x(loc.x);
		set_y(loc.y);
	}
	
	override function onReset () :Void
	{
		super.onReset();
		Preconditions.checkNotNull(parentProperty, "parentProperty is null");
		com.pblabs.util.Assert.isNotNull(parent, com.pblabs.util.ReflectUtil.tinyClassName(this) + ".parent is null, prop=" + parentProperty);
		
		owner.lookupComponent(LocationComponent).signaller.unbind(setLocation);
		owner.lookupComponent(LocationComponent).signaller.bind(setLocation);
		
		owner.lookupComponent(AngleComponent).signaller.unbind(set_angle);
		owner.lookupComponent(AngleComponent).signaller.bind(set_angle);
		
		//TODO: Bind scale component, not yet implemented
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		owner.lookupComponent(LocationComponent).signaller.unbind(setLocation);
		owner.lookupComponent(AngleComponent).signaller.unbind(set_angle);
		//TODO: unbind scale component
	}
	
	function get_layer () :Layer
	{
		return cast parent;
	}
	
	function get_x () :Float
	{
		return _x;
	}
	
	function set_x (val :Float) :Float
	{
		_x = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_y () :Float
	{
		return _y;
	}
	
	function set_y (val :Float) :Float
	{
		_y = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_angle () :Float
	{
		return _angle;
	}
	
	@inject("@AngleComponent.signaller")
	function set_angle (val :Float) :Float
	{
		_angle = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_scale () :Float
	{
		return _scale;
	}
	
	function set_scale (val :Float) :Float
	{
		_scale = val;
		return val;
	}
	
	function get_isTransformDirty () :Bool
	{
		return _isTransformDirty;
	}
	
	function set_isTransformDirty (val :Bool) :Bool
	{
		_isTransformDirty = val;
		return val;
	}
	
	function get_width () :Float
	{
		return _width;
	}
	
	function set_width (val :Float) :Float
	{
		_width = val;
		isTransformDirty = true;
		return val;
	}
	
	function get_height () :Float
	{
		return _height;
	}
	
	function set_height (val :Float) :Float
	{
		_height = val;
		isTransformDirty = true;
		return val;
	}
	
	var _x :Float;
	var _y :Float;
	var _width :Float;
	var _height :Float;
	var _angle :Float;
	var _scale :Float;
	var _isTransformDirty :Bool;
}
