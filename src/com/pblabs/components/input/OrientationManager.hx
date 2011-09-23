/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.scene2D.SceneView;
import com.pblabs.util.Device;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

/**
 * Javascript only ATM.
 */
class OrientationManager extends BaseInputManager
{
	@inject
	var scene :SceneView;
	
	public var orientationChange (default, null) :Signaler<Int>;
	
	public function new ()
	{
		super();
	}
	
	override public function startup () :Void
	{
		super.startup();
		bindSignals();
		com.pblabs.util.Assert.isNotNull(scene, ' scene is null');
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		
		#if js
		untyped __js__("window.onorientationchange = null");
		#if debug
		com.pblabs.util.Assert.isFalse(orientationChange.isListenedTo);
		#end
		orientationChange = null;
		#end
	}
	
	function bindSignals () :Void
	{
		#if js
		var listener = onOrientationChangeInternal;
		untyped __js__("window.onorientationchange = listener");
		orientationChange = new DirectSignaler(this);
		#else
		com.pblabs.util.Log.error("Orientation signals currently JS only.");
		#end
	}
	
	#if js
	function onOrientationChangeInternal () :Void
	{
		var orientation :Int = untyped __js__("window.orientation");
		
		//Change the SceneView first
		scene.onOrientationChange(orientation);
		
		orientationChange.dispatch(orientation);
	}
	#end
}
