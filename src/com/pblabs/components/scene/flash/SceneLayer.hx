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
	
	// public var scene (get_scene, null) :Scene2DManager;
	public var dirty :Bool;
	public var displayContainer (get_displayContainer, never) :DisplayObjectContainer;

	public function new ()
	{
		super();
		// _sceneComponents = Maps.newHashMap(Scene2DComponent);
		_displayContainer = new Sprite();
		_displayContainer.mouseEnabled = _displayContainer.mouseChildren = false;
		_rootTransform = new Matrix();
		_tempPoint = new Vector2();
	}
	
	override function childAdded (c :Scene2DComponent) :Void
	{
		super.childAdded(c);
		_displayContainer.addChild(c.displayObject);
	}
	
	override function childRemoved (c :Scene2DComponent) :Void
	{
		super.childRemoved(c);
		_displayContainer.removeChild(c.displayObject);
	}
	
	#if debug
	override function addedToParent () :Void
	{
		super.addedToParent();
		cast(_displayContainer, Sprite).graphics.clear();
		com.pblabs.util.GraphicsUtil.drawRect(cast(_displayContainer, Sprite).graphics, parent.sceneView.width - 1, parent.sceneView.height - 1, 0x000000, 1, 0);
	}
	#end
	
	override function onAdd () :Void
	{
		super.onAdd();	  
		_displayContainer.name = name;
	}
	
	public function updateTransform () :Void
	{
		// if (!_transformDirty) {
		// 	return;
		// }
	   // trace("scene updateTransform _transformDirty=" +  _transformDirty);
		// _transformDirty = false;
		
		
		// Update our transform, if required
		_rootTransform.identity();
		// trace(_rootTransform);
		// trace("x=" + x);
		// trace("y=" + y);
		// trace("zoom=" + zoom);
		// trace("rotation=" + rotation);
		_rootTransform.translate(parent.x * parallaxFactor, parent.y * parallaxFactor);
		_rootTransform.scale(parent.zoom, parent.zoom);
		
		// Apply rotation.
		_rootTransform.rotate(parent.rotation);
		// trace(_rootTransform);

		// Center it appropriately.
		Preconditions.checkNotNull(_tempPoint);
		Preconditions.checkNotNull(parent.sceneAlignment);
		Preconditions.checkNotNull(parent.sceneView);
		SceneUtil.calculateOutPoint(_tempPoint, parent.sceneAlignment, parent.sceneView.width, parent.sceneView.height);
		// trace("_tempPoint=" + _tempPoint);
		// trace("sceneView=" + sceneView);
		// trace("sceneAlignment=" + sceneAlignment);
		_rootTransform.translate(_tempPoint.x, _tempPoint.y);

		// Apply the transform.
		displayContainer.transform.matrix = _rootTransform;
	}

	// public function get_scene () :Scene2DManager
	// {
	//	 return _parentScene;
	// }

	// public function clear () :Void
	// {
	//	 while (numChildren > 0) {
	//		 removeChildAt(0);
	//	 }
	//	 _sceneComponents.clear();
	// }

	// public function detach () :Void
	// {
	//	 if (null != _parentScene) {
	//		 _parentScene.removeLayer(this);
	//	 } else if (parent != null) {
	//		 parent.removeChild(this);
	//		 detachedInternal();
	//	 }
	// }

	// //Override to do something fancy e.g. parallax, or iso sorting
	// public function render (?ignored :Array<Dynamic>) :Void
	// {

	// }

	// //Subclasses override
	// function attached () :Void
	// {

	// }

	// //Subclasses override
	// function detached () :Void
	// {

	// }

	// //Subclasses override
	// function objectAdded (obj :Scene2DComponent, disp :DisplayObject) :Void
	// {

	// }

	// //Subclasses override
	// function objectRemoved (obj :Scene2DComponent, disp :DisplayObject) :Void
	// {

	// }

	// public function addObjectInternal (obj :Scene2DComponent) :Void
	// {
	//	 if (_sceneComponents.exists(obj)) {
	//		 throw "Already contains obj " + obj;
	//	 }

	//	 _sceneComponents.set(obj, obj.displayObject);
	//	 addChild(obj.displayObject);
	//	 dirty = true;
	//	 objectAdded(obj, obj.displayObject);
	// }

	// public function attachedInternal () :Void
	// {
	//	 attached();
	// }

	// public function detachedInternal () :Void
	// {
	//	 while (numChildren > 0) {
	//		 removeChildAt(0);
	//	 }
	//	 detached();
	// }

	// public function removeObjectInternal (obj :Scene2DComponent) :Void
	// {
	//	 if (!_sceneComponents.exists(obj)) {
	//		 Log.error("Doesn't contain " + obj);
	//		 return;
	//	 }
	//	 var disp :DisplayObject = cast(_sceneComponents.get(obj), DisplayObject);
	//	 _sceneComponents.remove(obj);
	//	 if (disp.parent != null) {
	//		 disp.parent.removeChild(disp);
	//	 }
	//	 dirty = true;
	//	 objectRemoved(obj, disp);
	// }

	// public function renderInternal () :Void
	// {
	//	 render();
	// }

	inline function get_displayContainer () :DisplayObjectContainer
	{
		return _displayContainer;
	}

	var _displayContainer :DisplayObjectContainer;	
	// var _sceneComponents :Map<Scene2DComponent, DisplayObject>;

	// public var _parentScene :Scene2DManager;
	
	var _rootTransform :Matrix;
	var _tempPoint :Vector2;
}
