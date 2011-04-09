/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import flash.geom.Matrix;

class SceneLayer extends BaseSceneLayer<SceneManager, SceneComponent>
{
	public var dirty :Bool;
	public var displayContainer (get_displayContainer, never) :DisplayObjectContainer;

	public function new ()
	{
		super();
		_displayContainer = new Sprite();
		_displayContainer.mouseEnabled = false;
		_displayContainer.mouseChildren = false;
		_rootTransform = new Matrix();
		_tempPoint = new Vector2();
	}
	
	public function getChildIndex (c :SceneComponent) :Int
	{
		return _displayContainer.getChildIndex(c.displayObject);
	}
	
	public function updateTransform () :Void
	{
		// Update our transform, if required.
		//Currently only parallax scrolling is supported.
		_rootTransform.identity();
		_rootTransform.translate(parent.x * parallaxFactor, parent.y * parallaxFactor);
		// Apply the transform.
		displayContainer.transform.matrix = _rootTransform;
	}
	
	public function updateZOrder () :Void
	{
		var ok = false;
		while (!ok) {
			ok = true;
			for (i in 0...children.length) {
				if (_displayContainer.getChildIndex(children[i].displayObject) != i) {
					_displayContainer.setChildIndex(children[i].displayObject, i);
					ok = false;
					break;
				}
			}
		}
	}
	
	override function childAdded (c :SceneComponent) :Void
	{
		super.childAdded(c);
		_displayContainer.addChild(c.displayObject);
	}
	
	override function childRemoved (c :SceneComponent) :Void
	{
		super.childRemoved(c);
		_displayContainer.removeChild(c.displayObject);
	}
	
	override function onAdd () :Void
	{
		super.onAdd();	  
		_displayContainer.name = name;
	}

	function get_displayContainer () :DisplayObjectContainer
	{
		return _displayContainer;
	}

	var _displayContainer :DisplayObjectContainer;	
	var _rootTransform :Matrix;
	var _tempPoint :Vector2;
	
	#if (debug && sceneDebug) 
	override function addedToParent () :Void
	{
		super.addedToParent();
		cast(_displayContainer, Sprite).graphics.clear();
		com.pblabs.util.GraphicsUtil.drawRect(cast(_displayContainer, Sprite).graphics, parent.sceneView.width - 1, parent.sceneView.height - 1, 0x000000, 1, 0);
	}
	#end
}
