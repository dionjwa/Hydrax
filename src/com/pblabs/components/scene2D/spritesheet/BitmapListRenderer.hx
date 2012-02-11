/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

import com.pblabs.components.scene2D.BitmapRenderer;
import com.pblabs.components.scene2D.ImageData;
import com.pblabs.engine.core.PropertyReference;


import flash.geom.Point;

using Lambda;

using Std;

using org.transition9.geom.Vec2Tools;
using org.transition9.util.StringUtil;

/**
  * A sprite sheet renderer that has multiple states and actions.
  * States are sprite sheets that loop.
  * Actions are sprite sheets that are played once.
  */
class BitmapListRenderer extends BitmapRenderer
{
	public var bitmapList :Array<ImageData>;
	
	var _currentIndex :Int;
	var localScaleFactor (get_localScaleFactor, set_localScaleFactor) :Float;
	/** The IBodySpriteList may be locally zoomed in to provide better resolution*/
	var _localScaleFactor :Float;
	var _isPlaying :Bool;
	
	public function new() 
	{
		super();
	}
	
	public function play () :Void
	{
		_isPlaying = true;
	}
	
	public function stop () :Void
	{
		_isPlaying = false;
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		bitmapList = [];
		_currentIndex = 0;
		_localScaleFactor = 1;
		_isPlaying = true;
	}
	
	/**
	  * Same as parent, but don't update bounds and registration point
	  * since the bitmap frames can be different sizes with different centers
	  * for efficiency.
	  */
	override function set_bitmapData (val :ImageData) :ImageData
	{
		if (val == null) {
			super.set_bitmapData(val);
		} else {
			#if flash
			org.transition9.util.Assert.isNotNull(_bitmap);
			_bitmap.bitmapData = val;
			//This is set to false when a new bitmapData is assigned
			//http://gskinner.com/blog/archives/2007/08/minor_bug_with_.html
			_bitmap.smoothing = _smoothing;
			#elseif js
			_bitmap = val;
			#end
			recomputeBounds();
		}

		#if js	
		if (!isOnCanvas) {
			redrawBackBuffer();
		}
		_isContentsDirty = true;
		#end
		return val;
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		bitmapList = [];
		_currentIndex = 0;
	}
	
	function getCurrentFrame() :ImageData
	{
		if (bitmapList == null) {
			return null;
		}
		
		if (bitmapList.length == 0) {
			return null;
		}
		
		if (_currentIndex >= bitmapList.length) {
			_currentIndex = 0;
		}
		
		return bitmapList[_currentIndex];
	}
					
	public override function onFrame(dt :Float) :Void
	{
		if (!_isPlaying) {
			return;
		}
		// Update the bitmapData.
		var targetBD = getCurrentFrame();
		
		if(targetBD != null && bitmapData != targetBD) {
			bitmapData = targetBD;
		}
		_currentIndex++;
		super.onFrame(dt);
	}
	
	/** Override to include the _localScaleFactor */
	override public function updateTransform () :Void
	{
		_transformMatrix.identity();
		_transformMatrix.scale(_scaleX * _localScaleFactor, _scaleY * _localScaleFactor);
		_transformMatrix.translate(-registrationPoint.x * _scaleX * _localScaleFactor, - registrationPoint.y * _scaleY * _localScaleFactor);
		_transformMatrix.rotate(_angle + _angleOffset);
		_transformMatrix.translate(_x + _locationOffset.x, _y + _locationOffset.y);
		
		#if flash
		if (_displayObject == null) {
			org.transition9.util.Log.error("No _displayObject");
			return;
		}
		_displayObject.transform.matrix = _transformMatrix;
		_displayObject.alpha = _alpha;
		_displayObject.visible = (alpha > 0);
		#end
		
		isTransformDirty = false;
	}
	
	function get_localScaleFactor () :Float
	{
		return _localScaleFactor;
	}
	
	function set_localScaleFactor (val :Float) :Float
	{
		if (_localScaleFactor != val) {
			_isTransformDirty = true;
			_localScaleFactor = val;
		}
		return val;
	}
	
	function setRegistrationPoint (rx :Float, ry :Float) :Void
	{
		_registrationPoint.x = rx;
		_registrationPoint.y = ry;
		isTransformDirty = true;
	}
}
