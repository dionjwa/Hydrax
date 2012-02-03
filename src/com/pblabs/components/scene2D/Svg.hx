/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.engine.resource.ResourceToken;
import org.transition9.ds.Tuple;
import org.transition9.util.svg.SvgData;

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

import flash.geom.Matrix;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.scene2D.SvgRenderTools;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.resource.ResourceToken;
using org.transition9.util.StringUtil;
using org.transition9.util.XmlTools;
#if flash
using org.transition9.util.DisplayUtils;
import de.polygonal.core.math.Mathematics;
#end

/**
  * Cross platform SVG based Scene2D component.
  * Renders a single svg image.
  * Currently supports Flash, JS canvas, and JS CSS.
  */
class Svg
#if js
extends com.pblabs.components.scene2D.js.SceneComponent
#elseif (flash || cpp)
extends com.pblabs.components.scene2D.flash.SceneComponent 
#end
{
	#if (flash || cpp)
	/** Fired when the svgweb renderer completes */
	public var renderCompleteSignal (default, null):Signaler<Void>;
	/** New svg data may be set before the render call from a previous update is finished.  Track the render calls. */
	public static var RENDER_CALLBACK_ID :Int = 1;
	var _renderId :Int;
	#end
	public var svgData (get_svgData, set_svgData) :SvgData;
	var _svgData :SvgData;
	function get_svgData () :SvgData { return _svgData; }
	function set_svgData (val :SvgData) :SvgData
	{
		_svgData = val;
		 
		#if flash
		_renderId = ++RENDER_CALLBACK_ID;
		var localRenderId =_renderId;
		_displayObject.removeAllChildren();
		#elseif js
		if (!isOnCanvas && SvgRenderTools.IS_INLINE_SVG) {
			org.transition9.util.Assert.isNotNull(div);
			//Remove previous children
			while (div.hasChildNodes()) {
				div.removeChild(div.lastChild);
			}
		} else {
			// canvas.getContext("2d").clearRect(0, 0, width, height);
			// org.transition9.util.Log.error("Setting svg null should clear the display component, but this is not yet implemented in canvas js");
		}
		#end
		
		if (val == null) {
			_unscaledBounds.x = _unscaledBounds.y = 0.0001;
			// _unscaledBounds.xmax = _unscaledBounds.ymax = 0.001;
			registrationPoint.x = registrationPoint.y = 0;
			_bounds.xmin = _bounds.ymin = 0;
			_bounds.xmax = _bounds.ymax = _unscaledBounds.x;
			isTransformDirty = true;
			#if js
			//Clears the buffer
			if (_backBuffer != null) {
				_backBuffer.width = _backBuffer.width;
			}
			#end
			return val;
		}
		// #if js
		// //SVG documents added to the dom via innerHTML are *not* allowed to have any preamble.
		// _svgData = _svgData.cleanSvgForInnerHtml();
		// #end
		
		// var svgXml = Xml.parse(_svgData).ensureNotDocument();
		
		var b = _svgData.xml.parseElementBounds();
		_unscaledBounds.x = b.intervalX;
		_unscaledBounds.y = b.intervalY;
		_bounds = b.clone();
		registrationPoint.x = _bounds.intervalX / 2;
		registrationPoint.y = _bounds.intervalY / 2;
		#if js
		if (hasParent() && !isOnCanvas && SvgRenderTools.IS_INLINE_SVG) {
			insertSvgsIntoDiv();
		}
		#end
		
		#if (flash || cpp)
		_displayObject.removeAllChildren();
		var self = this;
		org.transition9.util.Log.info("SvgRenderTools.renderSvg");
		SvgRenderTools.renderSvg(_svgData, function (renderedSvg :flash.display.DisplayObject) :Void {
			if (!self.isRegistered) return;
			if (localRenderId != self._renderId) return;//Another render call supercedes this render
			var sprite = cast(self._displayObject, flash.display.Sprite);
			sprite.addChild(renderedSvg);
			self.recomputeBounds();
			registrationPoint = new Vec2(bounds.intervalX / 2, bounds.intervalY / 2);
			// trace("renderCompleteSignal.dispatch " + key + " " + owner.name + ", bounds=" + bounds);
			self.renderCompleteSignal.dispatch();
			
		});
		#else
		//TODO: Is the js renderer asynchronous???
		#end
		isTransformDirty = true;
		return val;
	}
	
	public function new () :Void
	{
		super();
		#if (flash || cpp)
		renderCompleteSignal = new DirectSignaler(this);
		var s = new flash.display.Sprite();
		s.mouseEnabled = s.mouseChildren = false;
		_displayObject = s;
		#end
	}
	
	#if js
	
	override function set_cacheAsBitmap (val :Bool) :Bool
	{
		//Only disallow caching if inline svgs are supported.
		if (!val && !SvgRenderTools.IS_INLINE_SVG) {
			val = true;
		}
		return super.set_cacheAsBitmap(val);
	}
	
	
	// override public function updateTransform () :Void
	// {
	// 	if (!isTransformDirty) {
	// 		return;
	// 	}
	// 	_transformMatrix.identity();
	// 	// if (cacheAsBitmap) {
	// 	// } else {
	// 	// 	_transformMatrix.scale(_scaleX, _scaleY);
	// 	// }
	// 	_transformMatrix.scale(_scaleX, _scaleY);
	// 	_transformMatrix.translate(-registrationPoint.x * _scaleX, - registrationPoint.y * _scaleY);
	// 	_transformMatrix.rotate(_angle + _angleOffset);
	// 	_transformMatrix.translate(_x + _locationOffset.x, _y + _locationOffset.y);
	// 	isTransformDirty = false;
	// }
	#end
	
	override function onRemove () :Void
	{
		super.onRemove();
		#if (flash && debug)
		if (displayObject != null && displayObject.parent != null) {
			trace("WTF, still attached");
		}
		#end
		svgData = null;
		// _hierarchyManager = null;
	}
	
	#if (flash || cpp)
	override function onReset () :Void
	{
		super.onReset();
		
		//If there's a minimalcomp component, invalidate on render complete.
		//Unfortunately we have to import the minimalcomp class here
		bindSignal(renderCompleteSignal, function (?_) :Void {
			//Notify the display hierarchy that our dimensions may have changed
			if (owner.getComponent(com.pblabs.components.minimalcomp.Component) != null) {
				owner.getComponent(com.pblabs.components.minimalcomp.Component).invalidate();
			}
		});
		// _hierarchyManager = context.getManager(com.pblabs.components.scene2D.HierarchyManager);
		// org.transition9.util.Assert.isNotNull(_hierarchyManager, ' _hierarchyManager is null');
		
	}
	#end
	
	#if js
	override function addedToParent () :Void
	{
		super.addedToParent();
		if (isOnCanvas || !SvgRenderTools.IS_INLINE_SVG) {
			//Render the SVG to the backbuffer to then render to the canvas
			cacheAsBitmap = true;
		} else {
			if (svgData != null) {
				insertSvgsIntoDiv();
			}
		}
	}
	
	function insertSvgsIntoDiv () :Void
	{
		org.transition9.util.Assert.isTrue(SvgRenderTools.IS_INLINE_SVG, "No inline SVG support");
		//Insert the SVGdirectly into the DOM
		org.transition9.util.Assert.isNotNull(svgData);
		org.transition9.util.Assert.isNotNull(div);
		//Remove previous children
		while (div.hasChildNodes()) {
			div.removeChild(div.lastChild);
		}
		
		var uniquedIds = Std.string(org.transition9.util.svg.SvgTools.makeIdsGloballyUnique(_svgData.xml.clone()));
		
		div.innerHTML = uniquedIds;//_svgData.data;
	}
	
	override public function drawPixels (ctx :CanvasRenderingContext2D)
	{
		org.transition9.util.Assert.isNotNull(ctx);
		if (svgData == null) {
			_isContentsDirty = true;
			ctx.fillRect(0, 0, 30, 30);
			return;
		}
		SvgRenderTools.renderSvg(svgData, ctx.canvas);
	}
	
	// override private function redrawBackBuffer ()
	// {
	// 	if (_backBuffer == null) {
	// 		_backBuffer = cast js.Lib.document.createElement("canvas");
	// 		org.transition9.util.Assert.isNotNull(div);
	// 	}
	// 	super.redrawBackBuffer();
	// }
	#end
	
	#if flash
	override function set_displayObject (d :flash.display.DisplayObject) :flash.display.DisplayObject
	{
		org.transition9.util.Preconditions.checkArgument(_displayObject == null && !isRegistered);
		_displayObject = d;
		return d;
	}
	#end
	
	#if debug
	override public function toString () :String
	{
		return "Svg " + key + " " + name + " Entity(" + (owner != null ? owner.name : "null") + ") " + org.transition9.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
	
	#if (debug_hxhsl && flash)
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		var sigs :Array<Signaler<Dynamic>> = cast [renderCompleteSignal]; 
		for (sig in sigs) {
			if (sig.isListenedTo) {
				for (b in sig.getBonds()) {
					trace("Stuck bond on " + debugOwnerName + "=" + b);
				}
				org.transition9.util.Assert.isFalse(sig.isListenedTo, debugOwnerName);
			}
		}
	}
	#end
}
