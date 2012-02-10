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
import org.transition9.util.Preconditions;

using Lambda;

class JSSceneManager extends BaseSceneManager<JSLayer>,
	implements IAnimatedObject
{
	public var priority :Int;
	public var container (get_container, null) :js.Dom.HtmlDom;
	
	public function new ()
	{
		super();
		priority = 0;
		_rootContainer = cast js.Lib.document.createElement("div");
		_rootContainer.style.width = "100%";
		_rootContainer.style.height = "100%";
		
		//Enable hardware acceleration
		#if modernizr
		if (Modernizr.csstransforms3d) {
			untyped _rootContainer.style.webkitTransform = "translate3d(0, 0, 0)";
			untyped _rootContainer.style.MozTransform = "translate3d(0, 0, 0)";
		}
		#else
		org.transition9.util.Log.warn("No Modernizr, so we cannot detect browser features.  Consider adding Modernizr. Not enabling hardware accelaration");
		#end
	}
	
	override public function addLayer (?layerName :String = null, ?cls :Class<Dynamic> = null, ?registerAsManager :Bool = false,
		?startDetached :Bool = false) :BaseSceneLayer
	{
		cls = cls == null || cls == JSLayer ? defaultLayerClass : cls; 
		return super.addLayer(layerName, cls, registerAsManager, startDetached);
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
	
	override public function attach () :Void
	{
		org.transition9.util.Assert.isNotNull(sceneView);
		org.transition9.util.Assert.isNotNull(sceneView.layer);
		if (_rootContainer.parentNode != sceneView.layer) { 
			sceneView.layer.appendChild(_rootContainer);
		}
	}
	
	override public function detach () :Void
	{
		if (_rootContainer.parentNode != null) {
			_rootContainer.parentNode.removeChild(_rootContainer);
		}
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
		}
		_transformDirty = false;
	}
	
	override function onAdd () :Void
	{
		#if debug
		org.transition9.util.Assert.isNotNull(sceneView);
		org.transition9.util.Assert.isNotNull(sceneView.layer);
		#end
		_rootContainer.id = owner.name + "_" + name;
		_rootContainer.style.cssText = "position:absolute";
		#if debug
		org.transition9.util.Assert.isNotNull(_rootContainer);
		#end
		super.onAdd();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_rootContainer = null;
	}
	
	override function get_defaultLayerClass () :Class<JSLayer>
	{
		//Figure out the most efficient kind of rendering layer
		//Default to CSS transforms.  In general, this is the most efficient and has the most features.
		#if modernizr
		org.transition9.util.Assert.isTrue(Modernizr.csstransforms || Modernizr.canvas, "No csstransforms or canvas.  Old browser?"); 
		return untyped Modernizr.csstransforms ? com.pblabs.components.scene2D.js.css.SceneLayer :
			com.pblabs.components.scene2D.js.canvas.SceneLayer;
		#else
		org.transition9.util.Log.warn("No Modernizr, so we cannot detect browser features.  Consider adding Modernizr. Defaulting to Canvas");
		return com.pblabs.components.scene2D.js.css.SceneLayer;
		#end
	}
	
	override function set_visible (val :Bool) :Bool
	{
		if (val) {
			attach();
		} else {
			detach();
		}
		return super.set_visible(val);
	}
	
	function get_container () :js.Dom.HtmlDom
	{
		return _rootContainer;
	}
	
	var _rootContainer :js.Dom.HtmlDom;
}
