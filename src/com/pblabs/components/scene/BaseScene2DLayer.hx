/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.util.Preconditions;

/**
  * A 2D layer holding 2DSceneComponents.
  * TODO: migrate the parallax and independent location code.
  */
class BaseScene2DLayer<Scene :BaseScene2DManager<Dynamic>, Component :BaseScene2DComponent<Dynamic>> extends NodeComponent<Scene, Component>,
	implements haxe.rtti.Infos
{
	@editor({ui:"UpdatingLabel"})
	public var scene (get_scene, never) :Scene;
	@editor({ui:"NumericStepper", min:0})
	public var index (get_index, set_index) :Int;
	@editor({ui:"HUISlider", min:0.0, max:3.0})
	public var parallaxFactor (get_parallaxFactor, set_parallaxFactor) :Float;
	// public var parallaxFactor (get_parallaxFactor, set_parallaxFactor) :Float;

	public function new ()
	{
		super();
		// _index = 0;
		_parallaxFactor = 1.0;
	}
	
	dynamic public function sortChildren (c1 :Component, c2 :Component) :Int
	{
		return 0;
	}

	function get_scene () :Scene
	{
		return cast parent;
	}
	
	function get_index () :Int
	{
		Preconditions.checkNotNull(parent, "You must property add the Layer component before changing the index");
		return parent.getLayerIndex(this);
	}
	
	function set_index (val :Int) :Int
	{
		Preconditions.checkNotNull(parent, "You must property add the Layer component before changing the index");
		parent.setLayerIndex(this, val);
		return parent.getLayerIndex(this);
		
		// throw "Check here";
		// if (parent != null) {
		//	 parent.setLayerIndex(this, val);
		//	 _index = parent.getLayerIndex(this);
		// } else {
		//	 _index = val;
		// }
		// return _index;
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
	
	// var _index :Int;
	var _needsSort :Bool;
	var _parallaxFactor :Float;
}


