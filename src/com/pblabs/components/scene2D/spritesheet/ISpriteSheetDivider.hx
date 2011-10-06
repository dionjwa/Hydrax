/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

import flash.geom.Rectangle;

/**
 * Base interface for descriptions about how frames are laid out in a sprite sheet.
 */
interface ISpriteSheetDivider
{
	/**
	 * How many frames are in this sprite sheet?
	 */ 
	var frameCount (get_frameCount, null) :Int;
	
	/**
	 * Many times you want to infer information about frames based on data
	 * from the sprite sheet. When the divider is assigned to a sprite sheet,
	 * the sprite sheet passes itself to OwningSheet so you can store it and
	 * get information from it.
	 */
	var owningSheet (get_owningSheet, set_owningSheet) :SpriteSheetComponent;
	
	/**
	 * Return the size of a frame, given the desired index and the source
	 * image's dimensions.
	 */
	function getFrameArea(index :Int) :Rectangle;
	
	/**
	 * The MultiSpriteSheetHelper has to be able to clone dividers. So we
	 * have a Clone method.
	 */
	function clone() :ISpriteSheetDivider;
}
