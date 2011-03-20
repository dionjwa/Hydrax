/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
#if !nodejs
package com.pblabs.components.scene.js;
import com.pblabs.components.scene.BaseSceneManager;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.Preconditions;

using Lambda;

class JSSceneManager<Layer :JSLayer<Dynamic, Dynamic>> extends BaseSceneManager<Layer>,
	implements IAnimatedObject
{
	public var container (get_container, null) :js.Dom.HtmlDom;
	
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
		_rootContainer.style.cssText = "position:absolute";
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
	
	function get_container () :js.Dom.HtmlDom
	{
		return _rootContainer;
	}
	
	var _rootContainer :js.Dom.HtmlDom;
}
#end
