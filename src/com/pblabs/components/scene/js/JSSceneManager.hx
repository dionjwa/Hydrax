package com.pblabs.components.scene.js;

import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.Preconditions;

import js.Dom;

import js.Lib;

using Lambda;

class JSSceneManager<Layer :JSLayer<Dynamic, Dynamic>> extends BaseScene2DManager<Layer>,
	implements IAnimatedObject
{
	public var container (get_container, null) :HtmlDom;
	
	public function new ()
	{
		super();
	}
	
	override public function setLayerIndex (layer :Layer, index :Int) :Void
	{
		super.setLayerIndex(layer, index);
		index = getLayerIndex(layer);
		if (layer.div.parentNode == _rootContainer) { 
			_rootContainer.removeChild(layer.div);
		}
		_rootContainer.appendChild(layer.div);
		layer.fixPosition();
		
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (_transformDirty) {
			updateTransform();
		}
	}
	
	public function updateTransform() :Void
	{
	    throw "Override ";
	}
	
	override function onAdd () :Void
	{
		super.onAdd();

		#if debug
		com.pblabs.util.Assert.isNotNull(sceneView);
		com.pblabs.util.Assert.isNotNull(sceneView.layer);
		#end

		
		_rootContainer = cast js.Lib.document.createElement("div");
		sceneView.layer.appendChild(_rootContainer);
		// trace("added border to JSSceneManager");
		// _rootContainer.style.borderColor = "#ff0000";
		// _rootContainer.style.borderWidth = "5px";
		// _rootContainer.setAttribute("disabled", "true");
		// div.style.cssText = "position:fixed";
		_rootContainer.style.cssText = "position:absolute";
		
		// if (_rootContainer == null) {
		//	 _rootContainer = sceneView.layer;
		// }
		#if debug
		com.pblabs.util.Assert.isNotNull(_rootContainer);
		com.pblabs.util.Assert.isNotNull(_rootContainer.parentNode);
		#end
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_rootContainer = null;
	}
	
	function get_container () :HtmlDom
	{
		return _rootContainer;
	}
	
	var _rootContainer :HtmlDom;
}
