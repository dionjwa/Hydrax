/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
#if !nodejs
package com.pblabs.components.scene2D;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.PBObject;
import com.pblabs.util.Preconditions;

#if js
import js.Dom;
#end

using StringTools;

/**
 * This class represents a root rendering and input surface.
 * Most games will only ever have one SceneView, but it's 
 * possible to have more than one.
 * 
 * In Flash, you can currently only have one root 
 * rendering and input view (the stage).  Everything else descends
 * from that.
 *
 * In javascript, you theoretically
 * could have multiple HTML elements be different rendering
 * and input surfaces.
 */
class SceneView 
	implements IPBManager, implements haxe.rtti.Infos
{
	public var height(get_height, set_height) : Float;
	public var width(get_width, set_width) : Float;

	#if (flash || cpp)	
	public var layer (get_layer, null) :flash.display.Sprite;
	var _layer :flash.display.Sprite;
	#elseif (js && !nodejs)
	public var layer (get_layer, set_layer) :HtmlDom;
	var _layer :HtmlDom;
	public var layerId (get_layerId, set_layerId) :String;
	var _layerId :String;
	public var mouseOffsetX (get_mouseOffsetX, never) :Float;
	public var mouseOffsetY (get_mouseOffsetY, never) :Float;
	#end
	
	// #if (flash || cpp)
	// @inject("flash.display.Sprite")
	// public var displayContainer :flash.display.DisplayObjectContainer;
	// #end
	
	var _height:Float;
	var _width:Float;
	
	#if js
	public function new (?layerId :String, ?width :Int = 0, ?height :Int = 0)
	#else
	public function new (?width :Int = 0, ?height :Int = 0)
	#end
	{
		_width = width;
		_height = height;
	   
		#if js
		_layerId = layerId;
		if (_layerId == null) {
			//Default div id
			_layerId = "screen";
		}
		#elseif (flash || cpp)
		_layer = new flash.display.Sprite();
		_layer.mouseChildren = false;
		_layer.name = "SceneView";
		if (width <= 0 || height <= 0) {
			_layer.addEventListener(flash.events.Event.ADDED_TO_STAGE, handleAddedToStage);
		} else {
			// _layer.width = width;
			// _layer.height = height;
		}
		#end		
		
	}
	
	public function startup():Void
	{
		
		#if (flash || cpp)
		
		if (_layer.parent == null) {
			flash.Lib.current.addChild(_layer);
		}
		
		// if (parentContainer != null) {
		//	 Preconditions.checkNotNull(_displayContainer, "displayContainer is null");
		//	 parentContainer.addChild(_displayContainer);
		// } else {
		//	 // _displayContainer =
		//	 //If no parent passed in, assume we want to attach to the stage
		//	 flash.Lib.current.addChild(_displayContainer);
		// }
		#end
		
		
		// #if (flash || cpp)
		// displayContainer.addChild(_layer);
		// #end
	}
	
	public function shutdown():Void
	{
		#if (flash || cpp)
		if (_layer.parent != null) {
			_layer.parent.removeChild(_layer);
		}
		// context.displayContainer.removeChild(_layer);
		#end
	}
	
	function get_height ():Float{
		return _height;
	}

	function set_height (value :Float):Float
	{
		_height = value;
		return value;
	}

	function get_width ():Float
	{
		return _width;
	}

	function set_width (value :Float):Float
	{
		_width = value;
		return value;
	}

	#if (flash || cpp)
	function get_layer() :flash.display.Sprite
	{
		return _layer;
	}
	
	public function addDisplayObject (dobj :flash.display.DisplayObject) :Void
	{
		_layer.addChild(dobj);
	}

	public function clearDisplayObjects () :Void
	{
		while (_layer.numChildren > 0) {
			_layer.removeChildAt(0);
		}
	}

	public function removeDisplayObject (dObj :flash.display.DisplayObject) :Void
	{
		_layer.removeChild(dObj);
	}

	public function setDisplayObjectIndex (dObj :flash.display.DisplayObject, index :Int) :Void
	{
		_layer.setChildIndex(dObj, index);
	}

	function handleAddedToStage (ignored :Dynamic) :Void
	{
		_layer.removeEventListener(flash.events.Event.ADDED_TO_STAGE, handleAddedToStage);
		//Fill the layer to catch all mouse events.
		_layer.graphics.beginFill(0, 0);
		_layer.graphics.drawRect(0, 0, flash.Lib.current.stage.stageWidth, flash.Lib.current.stage.stageHeight);
		_layer.graphics.endFill();
		#if debug
		_layer.graphics.lineStyle(2, 0x0000ff, 1);
		_layer.graphics.drawRect(0, 0, flash.Lib.current.stage.stageWidth-2, flash.Lib.current.stage.stageHeight-2);
		#end
		// Intelligent default size.
		_width = flash.Lib.current.stage.stageWidth;
		_height = flash.Lib.current.stage.stageHeight;
		
		com.pblabs.util.Log.debug("added to stage " + _layer.width + " " + _layer.height);
	}
	#end
	
	#if (js && !nodejs)
	function get_layer () :js.HtmlDom
	{
		Preconditions.checkArgument(_layer != null || _layerId != null, "Attempting to access the root layer, but no layerId was provided. _layerId=" + _layerId);
		if (_layer == null) {
			Preconditions.checkNotNull(_layerId, "no layer, and layerId is null");
			_layer = cast js.Lib.document.getElementById(_layerId);
			_width = Std.parseFloat(_layer.style.width.replace("px",""));
			_height = Std.parseFloat(_layer.style.height.replace("px",""));
			#if debug
			_layer.style.borderColor = "#0000ff";
			_layer.style.borderWidth = "1px";
			#end
		}
		com.pblabs.util.Assert.isNotNull(_layer, "Could not find HTML element with id=" + _layerId);
		
		return _layer;
	}
	
	function set_layer (val :js.HtmlDom) :js.HtmlDom
	{
		_layer = val;
		return val;
	}
	
	function get_layerId () :String
	{
		return _layerId;
	}
	
	function set_layerId (val :String) :String
	{
		_layerId = val;
		return val;
	}
	
	function get_mouseOffsetX () :Float
	{
		return layer.offsetLeft + Std.parseFloat(_layer.style.borderWidth) * 2;
	}
	
	function get_mouseOffsetY () :Float
	{
		return layer.offsetTop + Std.parseFloat(_layer.style.borderWidth) * 2;
	}
	#end
}

#end
