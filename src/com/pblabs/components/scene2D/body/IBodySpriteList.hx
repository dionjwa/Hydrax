package com.pblabs.components.scene2D.body;

import com.pblabs.components.scene2D.ImageData;

import de.polygonal.core.math.Vec2;

/**
  * Used by the SpriteSheetBody.
  */
interface IBodySpriteList
{
	/** Generated bitmaps maybe scaled to improve local resolution */
	var scale :Float;
	/** Don't change once set */
	var spriteSheetId :String;
	
	var isLoaded (get_isLoaded, never) :Bool;
	var frameCount (get_frameCount, null) :Int;
	function getFrame(index :Int, ?direction :Float = 0.0) :ImageData;
	function getCenter(index :Int, ?direction :Float = 0.0) :Vec2;
}
