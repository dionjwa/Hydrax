/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.util.Preconditions;

#if js
import js.Dom;
#end

#if (flash || cpp) 
typedef LayerClass = flash.display.DisplayObjectContainer;
#end
// #elseif js
// HtmlDom;
// #else
// Dynamic;//Placeholder

/**
  * Base class for grabbing input events such as mouse and touch
  * events from a layer such as a flash Sprite or a HTML DIV element,
  * and funnelling them into signals.
  */
class BaseInputManager 
	implements IPBManager, implements haxe.rtti.Infos
{
	@inject
	var sceneView :SceneView;
	
	#if (flash || cpp)
	public var layer (get_layer, set_layer) :LayerClass;
	#end
	
	public function new () {}
	
	public function startup () :Void
	{
		#if (flash || cpp)
		// Preconditions.checkNotNull(context, "Context is null");
		
		if (_layer == null) {
			// sceneView = context.getManager(SceneView);
			com.pblabs.util.Assert.isNotNull(sceneView, "Could not find SceneView");
			_layer = sceneView.layer;
			com.pblabs.util.Assert.isNotNull(_layer, "Could not find root container");
		}
		#end
	}
	
	#if (flash || cpp)
	public function shutdown () :Void
	{
		_layer = null;
	}
	
	function get_layer () :LayerClass
	{
		return _layer;
	}
	
	function set_layer (val :LayerClass) :LayerClass
	{
		_layer = val;
		return val;
	}
	
	var _layer :LayerClass;
	#else
	public function shutdown () :Void
	{
	}
	#end
}


