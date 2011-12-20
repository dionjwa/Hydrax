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
import com.pblabs.engine.core.PBManagerBase;
import org.transition9.util.Preconditions;
#if js
import js.Dom;
#end

#if (flash || cpp) 
typedef LayerClass = flash.display.DisplayObjectContainer;
#end

/**
  * Base class for grabbing input events such as mouse and touch
  * events from a layer such as a flash Sprite or a HTML DIV element,
  * and funnelling them into signals.
  */
class BaseInputManager extends PBManagerBase
{
	@inject
	public var sceneView :SceneView;
	
	#if (flash || cpp)
	public var layer (get_layer, set_layer) :LayerClass;
	#end
	
	public function new () 
	{
		super();
	}
	
	override public function startup () :Void
	{
		super.startup();
		#if (flash || cpp)
		
		if (_layer == null) {
			org.transition9.util.Assert.isNotNull(sceneView, "Could not find SceneView");
			_layer = sceneView.layer;
			org.transition9.util.Assert.isNotNull(_layer, "Could not find root container");
		}
		#end
	}
	
	#if (flash || cpp)
	override public function shutdown () :Void
	{
		super.shutdown();
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
	#end
}
