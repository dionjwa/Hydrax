/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.time.IAnimatedObject;
import org.transition9.util.Preconditions;

import flash.geom.Matrix;

/**
  * A 2D layer holding 2DSceneComponents.
  */
class BaseSceneLayer extends NodeComponent,
	implements IAnimatedObject, implements haxe.rtti.Infos
{
	public var priority :Int;
	
	/** For ignoring all objects in a layer */
	public var objectMask :ObjectType;
	@editor({ui:"UpdatingLabel"})
	public var scene (get_scene, never) :BaseSceneManager;
	function get_scene () :BaseSceneManager
	{
		return cast parent;
	}
	@editor({ui:"NumericStepper", min:0})
	public var index (get_index, set_index) :Int;
	@editor({ui:"HUISlider", min:0.0, max:3.0})
	public var parallaxFactor (get_parallaxFactor, set_parallaxFactor) :Float;
	public var zOrderDirty :Bool;
	
	public var scaleX (get_scaleX, set_scaleX) :Float;
	var _scaleX :Float;
	public var scaleY (get_scaleY, set_scaleY) :Float;
	var _scaleY :Float;
	
	public var alpha (get_alpha, set_alpha) :Float;
	var _alpha :Float;
	
	/** Optionally sort the display children when children are added */
	public var sorter :Array<BaseSceneComponent>->Void;
	
	#if editor
	@editor({ui:"UpdatingLabel"})
	public var childCount (get_childCount, never) :Int;
	function get_childCount () :Int
	{
		return children.length;
	}
	#end
	
	/** If true, scene objects in this layer ignore mouse/input events */
	// public var ignoreInput :Bool;
	
	var _transformMatrix :Matrix;
	
	public function new ()
	{
		super();
		setDefaults();
	}
	
	public function onFrame (dt :Float) :Void
	{
		com.pblabs.engine.debug.Profiler.enter("onFrame");
		if (!zOrderDirty) {
			com.pblabs.engine.debug.Profiler.exit("onFrame");
			return;
		}
		if (sorter != null) {
			sorter(cast children);
		}
		checkZOrder();
		zOrderDirty = false;
		com.pblabs.engine.debug.Profiler.exit("onFrame");
	}
	
	override function childAdded (c :NodeComponent) :Void
	{
		super.childAdded(c);
		zOrderDirty = true;
	}
	
	/** Sets the sceneComponent zOrder with the actual z order.  Extended by platform specific subclasses */
	function checkZOrder () :Void
	{
		org.transition9.util.Log.error("Subclasses override, class=" + org.transition9.rtti.ReflectUtil.getClassName(this)); 
	}
	
	function setDefaults () :Void
	{
		priority = 0;
		_scaleX = 1;
		_scaleY = 1;
		//By default, searches all children
		objectMask = ObjectType.ALL;
		// ignoreInput = false;
		zOrderDirty = true;
		_parallaxFactor = 1.0;
		_transformMatrix = new Matrix();
	}
	
	
	
	function get_index () :Int
	{
		Preconditions.checkNotNull(parent, "You must property add the Layer component before changing the index");
		return cast(parent, BaseSceneManager).getLayerIndex(this);
	}
	
	function set_index (val :Int) :Int
	{
		Preconditions.checkNotNull(parent, "You must property add the Layer component before changing the index");
		cast(parent, BaseSceneManager).setLayerIndex(this, val);
		return cast(parent, BaseSceneManager).getLayerIndex(this);
	}
	
	function get_parallaxFactor () :Float
	{
		return _parallaxFactor;
	}
	
	function set_parallaxFactor (val :Float) :Float
	{
		_parallaxFactor = val;
		return val;
	}
	
	function get_scaleX () :Float
	{
		return _scaleX;
	}
	
	function set_scaleX (val :Float) :Float
	{
		_scaleX = val;
		return val;
	}
	
	function get_scaleY () :Float
	{
		return _scaleY;
	}
	
	function set_scaleY (val :Float) :Float
	{
		_scaleY = val;
		return val;
	}
	
	function get_alpha () :Float
	{
		return _alpha;
	}
	
	function set_alpha (val :Float) :Float
	{
		_alpha = val;
		return val;
	}
	
	var _parallaxFactor :Float;
}
