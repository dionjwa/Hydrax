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
  * Flash: there is an issue with ObjectPooling and bitmap caching.  Don't pool this class yet.
  */
class BitmapRenderer 
	#if js
	extends com.pblabs.components.scene2D.js.SceneComponent,
	#elseif (flash || cpp)
	extends com.pblabs.components.scene2D.flash.SceneComponent,  
	#end
	implements com.pblabs.components.scene2D.flash.ICopyPixelsRenderer
{
	public var bitmap (get_bitmap, never) :BitmapType;
	var _bitmap :BitmapType;
	inline function get_bitmap () :BitmapType { return _bitmap; }
	
	public var bitmapData (get_bitmapData, set_bitmapData) :ImageData;
	inline function get_bitmapData () :ImageData
	{
		com.pblabs.util.Assert.isNotNull(_bitmap);
		#if flash
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
		#elseif js
		if (val != null) {
			_bitmap.width = val.width;
			_bitmap.height = val.height;
			#if haxedev
			_bitmap.getContext("2d").drawImage(val , 0, 0);
			#else
			_bitmap.getContext("2d").drawImage(cast val , 0, 0);
			#end
		}
		#end
		
		if (val != null) {
			recomputeBounds();
		} else {
			_unscaledBounds.x = 1;
			_unscaledBounds.y = 1;
			
			_bounds.xmin = _x;
			_bounds.xmax = _x + _unscaledBounds.x * _scaleX;
			_bounds.ymin = _y;
			_bounds.ymax = _y + _unscaledBounds.y * _scaleY;
			
			_registrationPoint.x = 0;
			_registrationPoint.y = 0;
			#if js
			_bitmap.width = _bitmap.height = 1;
			#end
			
			isTransformDirty = true;
		}
		return val;
	}
	
	#if js
	/** Can also render a js.Image */
	override function set_cacheAsBitmap (val :Bool) :Bool
	{
		cacheAsBitmap = false;
		return false;
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
	
	public function new (?width :Int = 1, ?height :Int = 1) :Void
	{
		#if flash
		var sprite = com.pblabs.util.SpriteUtil.create();
		_bitmap = new flash.display.Bitmap(new flash.display.BitmapData(width, height, true, 0xff0000), flash.display.PixelSnapping.NEVER);
		sprite.addChild(_bitmap);
		_displayObject = sprite;
		super();
		#elseif js
		super();
		cacheAsBitmap = false;
		var canvas :Canvas = cast js.Lib.document.createElement("canvas");
		canvas.width = width;
		canvas.height = height;
		_bitmap = canvas;
		div.appendChild(_bitmap);
		#end
	}
	
	public function setImage (image :ImageType) :Void
	{
		#if flash
		bitmapData = image.bitmapData;
		#elseif js
		bitmapData = com.pblabs.util.BitmapUtil.toCanvas(image);
		#end
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
	override public function drawPixels (ctx :CanvasRenderingContext2D) :Void 
	{
		if (_bitmap == null) {
			_isContentsDirty = true;
			return;
		}
		#if haxedev
		ctx.drawImage(_bitmap, 0, 0);
		#else
		ctx.drawImage(cast _bitmap, 0, 0);
		#end
	}
	public function drawImage (image :Image) :Void
	{
		_bitmap.width = image.width;
		_bitmap.height = image.height;
		_bitmap.getContext("2d").drawImage(image , 0, 0);
		recomputeBounds();
	}
	#end
	
	public function isPixelPathActive(objectToScreen :Matrix) :Bool
	{
		// No rotation/scaling/translucency/blend modes
		return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1
		#if flash
		&& (displayObject.filters.length == 0)
		#end
		);
	}
	
	override function onRemove () :Void
	{
		//Where is bitmapData.dispose to be called? Subclasses will be caching the BitmapData. 
		bitmapData = null;
		var keepDisp = _displayObject;
		super.onRemove();//Superclass nulls _displayObject
		_displayObject = keepDisp;
		#if flash
		_smoothing = false;
		#end
	}
	
	#if js
	override function set_width (val :Float) :Float
	{
		if (_bitmap.width != val) {
			_bitmap.width = Std.int(val);
			recomputeBounds();
		}
		return super.set_width(val);
	}
	
	override function set_height (val :Float) :Float
	{
		if (_bitmap.height != val) {
			_bitmap.height = Std.int(val);
			recomputeBounds();
		}
		return super.set_height(val);
	}
	#end
	
	#if flash override #end 
	function recomputeBounds () :Void
	{
		if (_bitmap == null) {
			return;
		}
		
		var halfWidth = _bitmap.width / 2;
		var halfHeight = _bitmap.height / 2;
		_unscaledBounds.x = _bitmap.width;
		_unscaledBounds.y = _bitmap.height;
		
		_scaleX = _scaleY = 1.0;
		
		_bounds.xmin = _x - halfWidth * _scaleX;
		_bounds.xmax = _x + halfWidth * _scaleX;
		_bounds.ymin = _y - halfHeight * _scaleY;
		_bounds.ymax = _y + halfHeight * _scaleY;
		
		_registrationPoint.x = halfWidth;
		_registrationPoint.y = halfHeight;
		
		isTransformDirty = true;
	}
	
	#if flash
	override function setDefaultVars () :Void
	{
		super.setDefaultVars();
		if (_bitmap != null) {
			smoothing = false;
		}
	}
	
	static var zeroPoint = new Point();
	#end
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
}
