/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.body;

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
class SpriteSheetBody extends BitmapRenderer
{
	public var spriteSheets :Array<IBodySpriteList>;
	
	public var state (get_state, never) :String;
	var _state :String;
	function get_state () :String
	{
		return _state;
	}
	var _currentIndex :Int;
	var _currentSpriteList :IBodySpriteList;
	var _queue :Array<IBodySpriteList>;
	var localScaleFactor (get_localScaleFactor, set_localScaleFactor) :Float;
	/** The IBodySpriteList may be locally zoomed in to provide better resolution*/
	var _localScaleFactor :Float;
	
	public function new() 
	{
		super();
	}
	
	public function clearQueue () :Void
	{
		_queue = [];
	}
	
	public function removeAllSpriteSheets () :Void
	{
		spriteSheets = [];
		_queue = [];
		_currentSpriteList = null;
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		spriteSheets = [];
		_queue = [];
		_currentIndex = 0;
		_localScaleFactor = 1;
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
	
	function clear () :Void
	{
		removeAllSpriteSheets();
		_currentIndex = 0;
	}
	
	public function changeToState (state :String, ?immediate :Bool = false, ?showTransitions :Bool = true) :Void
	{
		if (immediate) {
			_queue = [];
			_currentSpriteList = null;
		} 
		
		if (showTransitions && _state != state && _state != null) {
			queueTransitions(_state, state);
		}
		// update our internal state variable
		_state = state;
		// queue our new standing animation
		queueScene(_state);
	}
	
	public function doAction (action :String, ?immediate :Bool = false, ?showTransitions :Bool = true) :Void
	{
		if (immediate) {
			 _queue = [];
			 _currentSpriteList = null;
		} 
		if (showTransitions) {
			// transition from our current state to the action
			queueTransitions(_state, action);
		}
		// play the action animation
		queueScene(action);
		// then transition back to our current state
		if (showTransitions) {
			queueTransitions(action, _state);
		}
		// and queue our standing animation
		queueScene(_state);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		spriteSheets = [];
		_queue = [];
		_currentIndex = 0;
		_currentSpriteList = null;
		_state = null;
	}
	
	function queueTransitions (from :String, to :String) :Void
	{
		var ss = getScene(from + "_to_" + to);
		if (ss != null) {
			_queue.insert(0, ss);
		}
	}
	
	function queueScene (id :String) :Void
	{
		var ss = getScene(id.string());
		if (ss != null) {
			_queue.insert(0, ss);
		}
	}
	
	public function getScene (id :String) :IBodySpriteList
	{
		for (ss in spriteSheets) {
			if (ss.spriteSheetId == id) {
				return ss;
			}
		}
		return null;
	}
			
	function getCurrentFrame() :ImageData
	{
		if (_currentSpriteList != null && _currentIndex >= _currentSpriteList.frameCount) {
			//The current animation is done, get the next.
			_currentSpriteList = null;
		}
		
		if (_currentSpriteList == null) {
			_currentIndex = 0;
			if (_queue.length > 0) {
				_currentSpriteList = _queue.pop();
			}
		}
		
		if (_currentSpriteList == null || !_currentSpriteList.isLoaded) {
			changeToState(_state);
			return null;
		}
		
		// Our registration point is the center of a frame as specified by the spritesheet
		var c = _currentSpriteList.getCenter(_currentIndex);
		if (c != null && !registrationPoint.equals(c)) {
			setRegistrationPoint(c.x, c.y);
		}
		
		localScaleFactor = 1/_currentSpriteList.scale;
		
		return _currentSpriteList.getFrame(_currentIndex);
	}
					
	public override function onFrame(dt :Float) :Void
	{
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
