package com.pblabs.components.scene2D.body;

import com.pblabs.components.scene2D.spritesheet.SpriteListComponent;

/**
  * Sprite container that consists of a series of images
  */
class BodySpriteListComponent extends SpriteListComponent,
	implements IBodySpriteList
{
	#if flash
	public var disposeOnRemove :Bool;
	#end
	
	public var frameLabels :Hash<Int>;
	
	public var scale :Float;
	// public var scale (get_scale, set_scale) :Float;
	// var _scale :Float;
	// function get_scale () :Float
	// {
	// 	return _scale;
	// }
	
	// function set_scale (val :Float) :Float
	// {
	// 	_scale = val;
	// 	return val;
	// }
	
	// public var isLoaded (get_isLoaded, never) :Bool;
	// function get_isLoaded () :Bool
	// {
	// 	return _isLoaded;
	// }
	
	public function new ()
	{
		super();
		scale = 1;
		// _isLoaded = false;
	}
	
	override function deleteFrames() :Void
	{
		#if flash
		if (disposeOnRemove) {
			super.deleteFrames();
		}
		#end
		_frames = null;
	}
	
	#if debug
	override public function toString () :String
	{
	    return "SpriteList id=" + id + ", frames=" + (sourceFrames != null ? sourceFrames.length : 0);
	}
	#end
}
