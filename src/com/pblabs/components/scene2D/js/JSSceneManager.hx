/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.util.Preconditions;

using Lambda;

class JSSceneManager extends BaseSceneManager<JSLayer>,
	implements IAnimatedObject
{
	public var container (get_container, null) :js.Dom.HtmlDom;
	
	public function new ()
	{
		super();
	}
	
	override public function addLayer (?layerName :String = null, ?cls :Class<Dynamic> = null, ?registerAsManager :Bool = false) :BaseSceneLayer<Dynamic, Dynamic>
	{
		if (cls == null || cls == JSLayer) {
			#if use_html5_canvas_as_default_scene_layer
			com.pblabs.util.Log.info("No JS class specified, defaulting to canvas rendering");
			cls = com.pblabs.components.scene2D.js.canvas.SceneLayer;
			#else
			com.pblabs.util.Log.info("No JS class specified, defaulting to css rendering");
			cls = com.pblabs.components.scene2D.js.css.SceneLayer;
			#end
		}
		return super.addLayer(layerName, cls, registerAsManager);
	}
	override public function setLayerIndex (layer :JSLayer, index :Int) :Void
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
	    for (layer in children) {
	    	layer.isTransformDirty = true;
		    // layer.updateTransform();
		}
		_transformDirty = false;
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
