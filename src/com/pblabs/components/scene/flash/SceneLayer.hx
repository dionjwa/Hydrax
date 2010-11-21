/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.flash;

import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.components.scene.flash.Scene2DComponent;
import com.pblabs.components.scene.flash.Scene2DManager;
import com.pblabs.engine.debug.Log;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

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
		com.pblabs.util.GraphicsUtil.drawRect(cast(_displayContainer, Sprite).graphics, parent.sceneView.width - 1, parent.sceneView.height - 1, 0x000000, 1);
	}
	#end
	
	override function onAdd () :Void
	{
		super.onAdd();	  
		_displayContainer.name = name;
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
}


