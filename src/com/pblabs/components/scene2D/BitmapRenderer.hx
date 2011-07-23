/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.geom.RectangleTools;

import de.polygonal.motor2.geom.math.XY;

import flash.geom.Matrix;
import flash.geom.Point;

using com.pblabs.components.scene2D.SceneUtil;

/**
  * Cross platform bitmap renderer.  The parent class for other more complex renderers.
  */
class BitmapRenderer 
#if js
extends com.pblabs.components.scene2D.js.SceneComponent
#elseif (flash || cpp)
extends com.pblabs.components.scene2D.flash.SceneComponent  
#end
		,implements com.pblabs.components.scene2D.flash.ICopyPixelsRenderer
{
	#if flash
	public var bitmap (get_bitmap, never) :Image;
	var _bitmap :Image;
	inline function get_bitmap () :Image { return _bitmap; }
	#elseif js
	var _bitmap :ImageData;
	#end
	
	public var bitmapData (get_bitmapData, set_bitmapData) :ImageData;
	inline function get_bitmapData () :ImageData
	{
		#if flash
		com.pblabs.util.Assert.isNotNull(_bitmap);
		return _bitmap.bitmapData;
		#elseif js
		return _bitmap;
		#end
	}
	
	function set_bitmapData (val :ImageData) :ImageData
	{
		#if flash
		com.pblabs.util.Assert.isNotNull(_bitmap);
		_bitmap.bitmapData = val;
		// updateTransform();
		#elseif js
		if (_bitmap != null) {
			div.removeChild(_bitmap);
		}
		_bitmap = val;
		div.appendChild(_bitmap);
		#end
		// bitmapDirty = true;
		// recomputeBounds();
		return val;
	}
	
	
	#if flash
	public function drawPixels (objectToScreen :Matrix, renderTarget :flash.display.BitmapData) :Void
	{
		// Draw to the target.
		if (bitmap.bitmapData != null) {
			renderTarget.copyPixels(bitmap.bitmapData, bitmap.bitmapData.rect, objectToScreen.transformPoint(zeroPoint), null, null, true);
		}
	}
	#elseif js 
	override public function drawPixels (ctx :easel.display.Context2d) :Void 
	{
		if (_bitmap == null) {
			_isContentsDirty = true;
			return;
		}
		ctx.drawImage(_bitmap, 0, 0);
	}
	#end
	
	
	#if flash
	public var smoothing (get_smoothing, set_smoothing) :Bool;
	var _smoothing :Bool;
	function get_smoothing () :Bool
	{
		return _smoothing;
	}
	
	function set_smoothing (val :Bool) :Bool
	{
		_smoothing = val;
		_bitmap.smoothing = val;
		return val;
	}
	#end
	
	/** Used by the BitmapSceneRenderer */
	// public var bitmapDirty :Bool;
	
	public function new (?width :Int = 100, ?height :Int = 100) :Void
	{
		super();
		#if flash
		var sprite = com.pblabs.util.SpriteUtil.create();
		_bitmap = new flash.display.Bitmap(new flash.display.BitmapData(width, height, true, 0xff0000), flash.display.PixelSnapping.NEVER);
		sprite.addChild(_bitmap);
		_displayObject = sprite;
		// _bitmap.bitmapData.floodFill(10, 10, 0xff0000);
		#elseif js
		// var canvas :easel.display.Canvas = cast js.Lib.document.createElement("canvas");
		// canvas.width = width;
		// canvas.height = height;
		// _bitmap = canvas; 
		#end
		 
	}
	
	public function isPixelPathActive(objectToScreen :Matrix) :Bool
	{
		// No rotation/scaling/translucency/blend modes
		// return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1 && blendMode == flash.display.BlendMode.NORMAL && (displayObject.filters.length == 0));
		return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1
		#if flash
		&& (displayObject.filters.length == 0)
		#end
		);
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		// updateTransform();
	}
	
	override function onRemove () :Void
	{
		var keepDisp = _displayObject;
		super.onRemove();//Superclass nulls _displayObject
		_displayObject = keepDisp;
		#if flash
		//Where is bitmapData.dispose to be called? Subclasses will be caching the BitmapData. 
		_bitmap.bitmapData = null;
		#end
	}
	
	#if flash override #end 
	function recomputeBounds () :Void
	{
		if (_bitmap == null) {
			return;
		}
		var halfWidth = _bitmap.width / 2;
		var halfHeight = _bitmap.height / 2;
		_unscaledBounds.xmin = -halfWidth;
		_unscaledBounds.xmax = halfWidth;
		_unscaledBounds.ymin = -halfHeight;
		_unscaledBounds.ymax = halfHeight;
		
		_bounds.xmin = _x - halfWidth * _scaleX;
		_bounds.xmax = _x * halfWidth * _scaleX;
		_bounds.ymin = _y - halfHeight * _scaleY;
		_bounds.ymin = _y + halfHeight * _scaleY;
		
		_registrationPoint.x = halfWidth;
		_registrationPoint.y = halfHeight;
		
		isTransformDirty = true;
	}
	
	#if flash
	static var zeroPoint = new Point();
	#end
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
}
