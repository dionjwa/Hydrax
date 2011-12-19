/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.PBObject;
import org.transition9.util.Preconditions;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.geom.math.Vec2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using StringTools;

using org.transition9.geom.Vec2Tools;
#if js
import js.Dom;
#end

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
 * and input surfaces, however currently this class assumes you
 * only have one.  This is more important on mobile devices.
 */
class SceneView 
	implements IPBManager, implements haxe.rtti.Infos
{
	#if js
	public static var isWebkitBrowser :Bool = true;
	#end
	
	public var maxWidth (get_maxWidth, set_maxWidth) :Int;
	var _maxWidth :Int;
	public var maxHeight (get_maxHeight, set_maxHeight) :Int;
	var _maxHeight :Int;
	public var height(get_height, set_height) : Int;
	public var width(get_width, set_width) : Int;
	public var fullScreen :Bool;
	
	public var sizeChangeSignaler (default, null) :Signaler<Vec2>;

	#if (flash || cpp)	
	public var layer (get_layer, null) :flash.display.Sprite;
	var _layer :flash.display.Sprite;
	#elseif (js && !nodejs)
	public var layer (get_layer, set_layer) :HtmlDom;
	var _layer :HtmlDom;
	public var layerId (get_layerId, set_layerId) :String;
	var _layerId :String;
	public var mouseOffset (get_mouseOffset, never) :Vec2;
	// public var mouseOffsetY (get_mouseOffsetY, never) :Float;
	#end
	
	var _height :Int;
	var _width :Int;
	
	#if js
	public function new (?layerId :String, ?width :Int = 0, ?height :Int = 0)
	#else
	public function new (?width :Int = 0, ?height :Int = 0)
	#end
	{
		sizeChangeSignaler = new DirectSignaler(this);
		#if js
		_width = width;
		_height = height;
		fullScreen = true;
		_maxWidth =  960;
		_maxHeight = 640;
		//Default div id
		layerId = "haxeSceneView";
		//This is used by the transform operations.
		var webkitRE :EReg = ~/.*AppleWebKit.*/;
		isWebkitBrowser = webkitRE.match(js.Lib.window.navigator.userAgent);
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
		
		#if cpp
		height = Std.int(nme.Lib.stage.height);
		width = Std.int(nme.Lib.stage.width);
		#end
		
	}
	
	public function startup():Void
	{
		#if (flash || cpp)
		if (_layer.parent == null) {
			flash.Lib.current.addChild(_layer);
		}
		#end
	}
	
	public function shutdown():Void
	{
		#if (flash || cpp)
		if (_layer.parent != null) {
			_layer.parent.removeChild(_layer);
		}
		#end
		
		#if debug
		haxe.Timer.delay(function () :Void {
			org.transition9.util.Assert.isFalse(sizeChangeSignaler.isListenedTo, "sizeChangeSignaler.isListenedTo == true");
		}, 100);
		#end
	}
	
	function get_height ():Int{
		return _height;
	}

	function set_height (value :Int):Int
	{
		#if js
		_height = Mathematics.min(value, maxHeight);
		if (_layer != null) {
			_layer.style.height = _height + "px";
		}
		#else
		_height = value;
		#end
		sizeChangeSignaler.dispatch(new Vec2(width, height));
		return value;
	}

	function get_width ():Int
	{
		return _width;
	}

	function set_width (value :Int):Int
	{
		#if js
		_width = Mathematics.min(value, maxWidth);
		if (_layer != null) {
			_layer.style.width = _width + "px";
		}
		#else
		_width = value;
		#end
		sizeChangeSignaler.dispatch(new Vec2(width, height));
		return value;
	}
	
	function get_maxWidth () :Int
	{
		return _maxWidth;
	}
	
	function set_maxWidth (val :Int) :Int
	{
		_maxWidth = val;
		width = Mathematics.min(width, _maxWidth); 
		return val;
	}
	
	function get_maxHeight () :Int
	{
		return _maxHeight;
	}
	
	function set_maxHeight (val :Int) :Int
	{
		_maxHeight = val;
		height = Mathematics.min(height, _maxHeight);
		return val;
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
		// Intelligent default size.
		_width = Std.int(flash.Lib.current.stage.stageWidth);
		_height = Std.int(flash.Lib.current.stage.stageHeight);
		
		org.transition9.util.Log.debug("added to stage " + _layer.width + " " + _layer.height);
	}
	#end
	
	#if js
	function get_layer () :js.HtmlDom
	{
		Preconditions.checkArgument(_layer != null || _layerId != null, "Attempting to access the root layer, but no layerId was provided. _layerId=" + _layerId);
		if (_layer == null) {
			Preconditions.checkNotNull(_layerId, "no layer, and layerId is null");
			_layer = cast js.Lib.document.getElementById(_layerId);
			org.transition9.util.Assert.isNotNull(_layer, "No element with id=" + _layerId);
			onOrientationChange(0);
			
			//Prevent text selection.  This may not be desired, but I'm not sure where to put this otherwise.
			untyped _layer.onselectstart = function () { return false; };//ie
			untyped _layer.onmousedown = function () { return false; };//mozilla
		}
		org.transition9.util.Assert.isNotNull(_layer, "Could not find HTML element with id=" + _layerId);
		
		return _layer;
	}
	
	/**
	  * Adjust our screen dimensions, and notify listeners.
	  * This is currently called by the OrientationManager, and assumes 
	  * you want the screen to be adjusted by the new width/height.
	  * For mobile devices, this assumes the SceneView is the full screen.
	  */
	public function onOrientationChange (degreesRotation :Int) :Void
	{
		if (org.transition9.util.Device.isMobileBrowser) {
			var rawScreenDimensions = org.transition9.util.Device.getScreenDimensions();//.scale(2); 
			
			// if (org.transition9.util.Device.browser == org.transition9.util.Device.Browser.SAFARI_IOS) {
			// 	org.transition9.util.Device.ScreenDimensions.iOs3g;
			// } else {//TODO: others?  Compute from javascript?
			// 	org.transition9.util.Device.ScreenDimensions.iOs3g;
			// }
			
			var topMenuHeight = 20;
			
			var dimensions = switch (degreesRotation) {
				case 0, 180:
					if (org.transition9.util.Device.browser == org.transition9.util.Device.Browser.SAFARI_IOS) {
						new Vec2(rawScreenDimensions.x, rawScreenDimensions.y - topMenuHeight);
					} else {
						new Vec2(rawScreenDimensions.x, rawScreenDimensions.y - topMenuHeight);
					}
				case 90, -90:
					if (org.transition9.util.Device.browser == org.transition9.util.Device.Browser.SAFARI_IOS) {
						new Vec2(rawScreenDimensions.y, rawScreenDimensions.x - topMenuHeight);
					} else {
						new Vec2(rawScreenDimensions.y, rawScreenDimensions.x - topMenuHeight);
					}
			}
			width = Std.int(dimensions.x);
			height = Std.int(dimensions.y);
		} else {
			//Change for desktop browsers?
			//No firing scene change, because it doesn't
			_width = Std.parseInt(_layer.style.width.replace("px", ""));
			_height = Std.parseInt(_layer.style.height.replace("px", ""));
		}
		
		#if debug
		_layer.style.borderColor = "#0000ff";
		var border = 1;
		_layer.style.borderWidth = border + "px";
		width -= border * 2;
		height -= border * 2;
		#end
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
	
	function get_mouseOffset () :Vec2
	{
		// org.transition9.util.Log.warn("Currently disabled");
		// return new Vec2();
		#if debug
			if (!org.transition9.util.JsLibs.isJQuery) {
				throw "JQuery missing, please add to html";
			}
		#end
		var os :{top:Float, left:Float} = new JQuery("#" + layerId).offset();
		var v = new Vec2(os.left, os.top);
		v.x += Std.parseFloat(_layer.style.borderWidth);
		v.y += Std.parseFloat(_layer.style.borderWidth);
		return v;
	}
	#end
}
