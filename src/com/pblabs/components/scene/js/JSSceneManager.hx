package com.pblabs.components.scene.js;

import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;
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
		_tempPoint = new Vector2();
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
		updateTransform();
	}
	
	function updateTransform () :Void
	{
		if (!_transformDirty) {
			return;
		}
		// trace("translating");
		_transformDirty = false;
		
		
		// _rootTransform.translate(x, y);
		// _rootTransform.scale(zoom, zoom);
		
		// Apply rotation.
		// _rootTransform.rotate(rotation);
		// trace(_rootTransform);

		// Center it appropriately.
		Preconditions.checkNotNull(_tempPoint);
		Preconditions.checkNotNull(sceneAlignment);
		Preconditions.checkNotNull(sceneView);
		SceneUtil.calculateOutPoint(_tempPoint, sceneAlignment, sceneView.width, sceneView.height);
		// _rootTransform.translate(_tempPoint.x, _tempPoint.y);

		// Apply the transform.
		// _rootSprite.transform.matrix = _rootTransform;
		
		
		
		// var xOffset = parent.xOffset;
		// var yOffset = parent.yOffset;
		// var _position :Vector2;
	// var _zoom :Float;
	// var _rotation :Float;
	// var _transformDirty :Bool;
	
	// untyped _rootContainer.style.webkitTransform = "translate(" + (_position.x) + "px, " + (_position.y) + "px) scale(" + zoom + ") rotate(" + _rotation + "rad) translate(" + (_tempPoint.x) + "px, " + (_tempPoint.y) + "px)  ";
	//Revsered
	untyped _rootContainer.style.webkitTransform = "translate(" + (_tempPoint.x) + "px, " + (_tempPoint.y) + "px) rotate(" + _rotation + "rad) scale(" + zoom + ") translate(" + (_position.x) + "px, " + (_position.y) + "px)";
		
	
	// untyped _rootContainer.style.webkitTransform = "translate(" + (_position.x) + "px, " + (_position.y) + "px) rotate(" + _rotation + "rad), scale(" + zoom + ")";
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
	var _tempPoint :Vector2;
}
