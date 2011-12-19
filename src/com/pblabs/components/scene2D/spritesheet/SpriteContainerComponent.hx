/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

import com.pblabs.components.scene2D.ImageData;
import com.pblabs.engine.core.EntityComponent;


import de.polygonal.core.math.Limits;
import de.polygonal.motor.geom.math.Vec2;

/**
 * An abstract class to allow access to a set of sprites.
 * This needs to be inherited to be of any use.
 * @see SpriteSheetComponent
 * @see SWFSpriteSheetComponent
 */
class SpriteContainerComponent extends EntityComponent 
{
	/**
	 * Array with ImageData modifiers that will be pre-rendered 
	 */
	public function new() 
	{
		super();
		directionsPerFrame = 1;
		_frames = null;
		// _modifiers = new Array();
		// _center = new Vec2(0, 0);
		_defaultCenter = true;
		frameCountCap = 0;
	}
	
	// public var center(getCenter, setCenter) :Vec2;
	public var centered(getCentered, null) :Bool;
	public var frameCount (get_frameCount, set_frameCount) :Int;
	public var degreesPerDirection(getDegreesPerDirection, null) :Float;
	public var isLoaded(get_isLoaded, never) :Bool;
	// public var modifiers(getModifiers, setModifiers) :Array<Dynamic>;
	public var rawFrameCount(getRawFrameCount, null) :Int;
	public var sourceFrames (get_sourceFrames, set_sourceFrames) :Array<ImageData>;
	
	/**
	 * Array with ImageData modifiers that will be pre-rendered 
	 */
	// public function getModifiers() :Array<Dynamic>{
	// 	return _modifiers;
	// }
	
	// public function setModifiers(value :Array<Dynamic>) :Array<Dynamic>{
	// 	_modifiers = value;
	// 	buildFrames();
	// 	return value;
	// }
   /**
	 * Subclasses must override this method and return an
	 * array of ImageData objects.
	 */
	function get_sourceFrames() :Array<ImageData>
	{
		throw "Not Implemented";
		return null;
	}
	
	function set_sourceFrames (val :Array<ImageData>) :Array<ImageData>
	{
		throw "Not Implemented";
		return val;
	}
	
	/**
	 * Deletes the frames so this class can be re-used with a new set of frames.
	 */
	function deleteFrames() :Void
	{
		#if flash
		if (_frames != null) {
			for (frame in _frames) {
				frame.dispose();
			}
		}
		#end
		_frames = null;
	}
	
	/**
	 * True if the frames associated with this sprite container have been loaded.
	 */
	public function get_isLoaded() :Bool
	{
		return _frames != null;
	}
	
	/**
	 * Specifies an offset so the sprite is centered correctly. If it is not
	 * set, the sprite is centered.
	 */
	public function getCenter(index :Int, ?direction :Float=0.0) :Vec2
	{
		// if (_center != null)
		// 	return _center;
		
		return _center;
	}
	
	public function setCenter(v :Vec2) :Vec2{
		_center = v;
		_defaultCenter = false;
		return v;
	   }

	/**
	 * Indicates that the spriteSheet has a centered alignment.
	 */
	public function getCentered() :Bool
	{
		return _defaultCenter;
	}
	
	/**
	 * The number of directions per frame.
	 */
	// [EditorData(defaultValue="1")]
	public var directionsPerFrame :Int;
	
	/**
	 * The number of degrees separating each direction.
	 */
	public function getDegreesPerDirection() :Float
	{
		return 360 / directionsPerFrame;
	}
	
	/**
	 * The total number of frames the sprite container has. This counts each
	 * direction separately.
	 */
	public function getRawFrameCount() :Int
	{
		if (_frames == null) {
			buildFrames();
		}
		
		return _frames != null ? _frames.length :0;
	}
	
	/**
	 * The number of frames the sprite container has. This counts each set of
	 * directions as one frame.
	 */
	function get_frameCount() :Int{
		return Std.int(rawFrameCount / directionsPerFrame);
	}

	function set_frameCount(value :Int) :Int{
		if (_frames == null)
		{
			// frames where not loaded yet so cap them as soon as 
			// the divider provides the frames
			frameCountCap = value;
		}
		else
		{
			// frame where loaded so splice the array
			if (_frames.length>value)
				_frames.splice(value,_frames.length-value);
		}
		return value;
	}
	
	/**
	 * Gets the bitmap data for a frame at the specified index.
	 * 
	 * @param index The index of the frame to retrieve.
	 * @param direction The direction of the frame to retrieve in degrees. This
	 *				  can be ignored if there is only 1 direction per frame.
	 * 
	 * @return The bitmap data for the specified frame, or null if it doesn't exist.
	 */
	public function getFrame(index :Int, ?direction :Float=0.0) :ImageData
	{
		if(!isLoaded)
			return null;
		
		// Make sure direction is in 0..360.
		while (direction < 0)
			direction += 360;
		
		while (direction > 360)
			direction -= 360;
		
		// Easy case if we only have one direction per frame.
		if (directionsPerFrame == 1)
			return getRawFrame(index);
		
		// Otherwise we have to do a search.
		
		// Make sure we have data to fulfill our requests from.
		if (_frameNotes == null)
			generateFrameNotes();
		
		// Look for best match.
		var bestMatchIndex :Int = -1;
		var bestMatchDirectionDistance = Limits.INT32_MAX;
		
		for (i in 0..._frameNotes.length)
		{
			var note = _frameNotes[i];
			if (note.Frame != index)
				continue;
			
			 var distance :Int = Std.int(Math.min(Math.abs(note.Direction - direction), note.Direction + 360 - direction));
			if (distance < bestMatchDirectionDistance)
			{
				// This one is better on both frame and heading.
				bestMatchDirectionDistance = distance;
				bestMatchIndex = note.RawFrame;
			}
		}
		
		// Return the bitmap.
		if (bestMatchIndex >= 0)
			return getRawFrame(bestMatchIndex);
		
		return null;
	}
	
	function buildFrames() :Void
	{
		_frames = sourceFrames;
		
		// not loaded, can't do anything yet
		if (_frames == null)
			return;
		
		if (_frames.length == 0)
			return;
			// throw "No frames loaded";
							
		// ImageData modification implementation
		// if (frames != null && modifiers.length > 0)
		// {
		// 	// loop all frames
		// 	for (f in 0..._frames.length)
		// 	{
		// 		// get frame
		// 		var frame = _frames[f].clone();						
		// 		// apply ImageData modifiers
		// 		for (var m :Int = 0; m<modifiers.length; m++)
		// 			frame = (cast(modifiers[m], Modifier)).modify(frame,f, _frames.length);	
		// 		// assign modified frame
		// 		_frames[f] = frame;
		// 	}
							
		// }

		if (frameCountCap>0)
		{
			// this frames array has to be capped because the frameCount was set manually to override	
			_frames.splice(frameCountCap,_frames.length-frameCountCap);
		}
		
		if (_defaultCenter)
			_center = new Vec2(_frames[0].width * 0.5, _frames[0].height * 0.5);
	}
	
	/**
	 * Gets the frame at the specified index. This does not take direction into
	 * account.
	 */
	function getRawFrame(index :Int) :ImageData
	{
		if (_frames == null)
			buildFrames();
		
		if (_frames == null)
			return null;
		
		if ((index < 0) || (index >= rawFrameCount))
			return null;
		
		return _frames[index];  
	}
	
	function generateFrameNotes() :Void
	{
		_frameNotes = new Array();
		
		var totalStates = Std.int(frameCount / degreesPerDirection);
		
		for (direction in 0...directionsPerFrame)
		{
			for (frame in 0...frameCount)
			{
				var note = new FrameNote();
				note.Frame = frame;
				note.Direction = direction * degreesPerDirection;
				note.RawFrame = (direction * frameCount) + frame;
				
				_frameNotes.push(note);
			}
		}
	}
	
	var _frameNotes :Array<FrameNote>;
	var _frames :Array<ImageData>;
	var _modifiers :Array<Dynamic>;
	var _center :Vec2;
	var _defaultCenter :Bool;
	var frameCountCap :Int;
}

class FrameNote
{
	public function new () {}
	
	public var Frame :Int;
	public var Direction :Float;
	public var RawFrame :Int;
}
