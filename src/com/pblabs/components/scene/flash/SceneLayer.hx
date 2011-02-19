/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.flash;

import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.flash.Scene2DComponent;
import com.pblabs.components.scene.flash.Scene2DManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import flash.geom.Matrix;

class SceneLayer extends BaseScene2DLayer<Scene2DManager, Scene2DComponent>
{
	
	public var dirty :Bool;
	public var displayContainer (get_displayContainer, never) :DisplayObjectContainer;

	public function new ()
	{
		super();
		_displayContainer = new Sprite();
		_displayContainer.mouseEnabled = _displayContainer.mouseChildren = false;
		_rootTransform = new Matrix();
		_tempPoint = new Vector2();
	}
	
	public function getChildIndex (c :Scene2DComponent) :Int
	{
	    return _displayContainer.getChildIndex(c.displayObject);
	}
	
	override function childAdded (c :Scene2DComponent) :Void
	{
		super.childAdded(c);
		// trace("c=" + c.owner.name + "." + c.name);
		// trace("    _displayContainer.name=" + _displayContainer.name);
		_displayContainer.addChild(c.displayObject);
	}
	
	override function childRemoved (c :Scene2DComponent) :Void
	{
		super.childRemoved(c);
		_displayContainer.removeChild(c.displayObject);
	}
	
	// #if debug
	// override function addedToParent () :Void
	// {
	// 	super.addedToParent();
	// 	cast(_displayContainer, Sprite).graphics.clear();
	// 	com.pblabs.util.GraphicsUtil.drawRect(cast(_displayContainer, Sprite).graphics, parent.sceneView.width - 1, parent.sceneView.height - 1, 0x000000, 1, 0);
	// }
	// #end
	
	override function onAdd () :Void
	{
		super.onAdd();	  
		_displayContainer.name = name;
	}
	
	public function updateTransform () :Void
	{
		// Update our transform, if required
		_rootTransform.identity();
		_rootTransform.translate(parent.x * parallaxFactor, parent.y * parallaxFactor);
		_rootTransform.scale(parent.zoom, parent.zoom);
		
		// Apply rotation.
		_rootTransform.rotate(parent.rotation);

		// Center it appropriately.
		Preconditions.checkNotNull(_tempPoint);
		Preconditions.checkNotNull(parent.sceneAlignment);
		Preconditions.checkNotNull(parent.sceneView);
		SceneUtil.calculateOutPoint(_tempPoint, parent.sceneAlignment, parent.sceneView.width, parent.sceneView.height);
		_rootTransform.translate(_tempPoint.x, _tempPoint.y);

		// Apply the transform.
		displayContainer.transform.matrix = _rootTransform;
	}

	function get_displayContainer () :DisplayObjectContainer
	{
		return _displayContainer;
	}

	var _displayContainer :DisplayObjectContainer;	
	var _rootTransform :Matrix;
	var _tempPoint :Vector2;
}
