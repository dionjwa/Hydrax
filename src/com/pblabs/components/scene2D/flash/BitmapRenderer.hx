/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.RectangleTools;
import com.pblabs.util.Preconditions;

import de.polygonal.motor2.geom.math.XY;

import flash.display.BitmapData;
import flash.display.BlendMode;

import flash.geom.Matrix;
import flash.geom.Point;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.resource.ResourceToken;

/**
  * Cross platform bitmap renderer
  * TODO: make this cross platform.
  */
class BitmapRenderer extends com.pblabs.components.scene2D.flash.SceneComponent,
		implements com.pblabs.components.scene2D.flash.ICopyPixelsRenderer
{
	public var bitmap (get_bitmap, null) :flash.display.Bitmap;
	var _bitmap :flash.display.Bitmap;
	
	public var bitmapData (get_bitmapData, set_bitmapData) :flash.display.BitmapData;
	function get_bitmapData () :flash.display.BitmapData
	{
		com.pblabs.util.Assert.isNotNull(_bitmap);
		return _bitmap.bitmapData;
	}
	
	function set_bitmapData (val :flash.display.BitmapData) :flash.display.BitmapData
	{
		com.pblabs.util.Assert.isNotNull(_bitmap);
		_bitmap.bitmapData = val;
		// bitmapDirty = true;
		return val;
	}
	
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
	
	/** Used by the BitmapSceneRenderer */
	// public var bitmapDirty :Bool;
	
	public function new (?width :Int = 100, ?height :Int = 100) :Void
	{
		super();
		var sprite = new flash.display.Sprite();
		sprite.mouseEnabled = sprite.mouseChildren = false;
		_bitmap = new flash.display.Bitmap(new flash.display.BitmapData(width, height, true, 0xff0000), flash.display.PixelSnapping.NEVER);
		sprite.addChild(_bitmap);
		//smoothing = true;
		// _bitmap.scaleX = 0.99;
		// _bitmap.scaleY = 0.99;
		_displayObject = sprite;
		// _bitmap.bitmapData.floodFill(10, 10, 0xff0000);
		 
	}
	
	public function isPixelPathActive(objectToScreen :Matrix) :Bool
	{
		// No rotation/scaling/translucency/blend modes
		// return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1 && blendMode == BlendMode.NORMAL && (displayObject.filters.length == 0));
		return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1 && (displayObject.filters.length == 0));
	}
	
	public function drawPixels(objectToScreen :Matrix, renderTarget :BitmapData) :Void
	{
		// Draw to the target.
		if (bitmap.bitmapData != null) {
			renderTarget.copyPixels(bitmap.bitmapData, bitmap.bitmapData.rect, objectToScreen.transformPoint(zeroPoint), null, null, true);
		}
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		// updateTransform();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		//Where is bitmapData.dispose to be called? Subclasses will be caching the BitmapData. 
		_bitmap.bitmapData = null;
	}
	
	function get_bitmap () :flash.display.Bitmap
	{
		return _bitmap;
	}
	
	static var zeroPoint = new Point();
	
	#if debug
	public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
}
