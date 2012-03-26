/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneView;

import de.polygonal.core.math.Vec2;                                                                                                                                                                   

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import flash.geom.Matrix;

import org.transition9.util.Preconditions;

using Lambda;

class SceneLayer extends BaseSceneLayer
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
		_tempPoint = new Vec2();
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
		// _rootTransform.translate(parent.x * parallaxFactor, parent.y * parallaxFactor);
		// Apply the transform.
		displayContainer.transform.matrix.identity();
		// matrix = _rootTransform;
	}
	
	/**
	  * Matches the DisplayObject index with the array index.
	  */
	override function checkZOrder () :Void
	{
		for (i in 0...children.length) {
			var sc :SceneComponent = cast children[i];
			if (_displayContainer.getChildIndex(sc.displayObject) != i) {
				_displayContainer.setChildIndex(sc.displayObject, i);
			}
		}
	}
	
	override function childAdded (c :NodeComponent) :Void
	{
		var sc :SceneComponent = cast c;
		com.pblabs.engine.debug.Profiler.enter("flashSceneLayer.childAdded");
		super.childAdded(sc);
		_displayContainer.addChild(sc.displayObject);
		com.pblabs.engine.debug.Profiler.exit("flashSceneLayer.childAdded");
	}
	
	override function childRemoved (c :NodeComponent) :Void
	{
		var sc :SceneComponent = cast c;
		super.childRemoved(sc);
		_displayContainer.removeChild(sc.displayObject);
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
	var _tempPoint :Vec2;
	
	#if (debug && sceneDebug) 
	override function addedToParent () :Void
	{
		super.addedToParent();
		cast(_displayContainer, Sprite).graphics.clear();
		org.transition9.util.GraphicsUtil.drawRect(cast(_displayContainer, Sprite).graphics, parent.sceneView.width - 1, parent.sceneView.height - 1, 0xff0000, 1, 0);
	}
	#end
}
