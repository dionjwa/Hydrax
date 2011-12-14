/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;

import flash.display.Bitmap;
import flash.display.BitmapData;

import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * Handles loading and retrieving data about a sprite sheet to use for rendering.
 * 
 * <p>Functionality exists to allow several directions to be specified per frame.
 * This enables you to, for instance, visually rotate a sprite without rotating
 * the actual object it belongs to.</p>
 * 
 * <p>Because we may group them in different ways, we distinguish between
 * "raw frames" and a "frame" which might be made up of multiple directions.</p>
 * 
 * <p>On the subject of sprite sheet order :the divider may alter this, but in
 * general, frames are numbered left to right, top to bottom. If you have a 4
 * direction sprite sheet, then 0,1,2,3 will be frame 1, 4,5,6,7 will be 2,
 * and so on.</p>
 * 
 * <p>Be aware that Flash implements an upper limit on image size - going over
 * 2048 pixels in any dimension will lead to problems.</p>
 */ 
class SpriteSheetComponent extends SpriteContainerComponent 
{
	public function new() 
	{
		super();
		_imageResource = null;
		_divider = null;
		_forcedBitmaps = null;
	}
	
	public var divider(getDivider, setDivider) :ISpriteSheetDivider;
	public var imageResource(get_imageResource, set_imageResource) :ResourceToken<BitmapData>;
	public var imageData(get_imageData, null) :BitmapData;
	// public var imageFilename(getImageFilename, setImageFilename) :String;
	// public var isLoaded(getIsLoaded, null) :Bool;
	// [Inject]
	@inject
	public var resourceManager :IResourceManager;
					
	/**
	 * True if the image data associated with this sprite sheet has been loaded.
	 */
	override function get_isLoaded() :Bool
	{
		return imageData != null || _forcedBitmaps != null;
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		set_imageResource(imageResource);
	}
	
	// [EditorData(ignore="true")]
	/**
	 * The filename of the image to use for this sprite sheet.
	 */
	// public function getImageFilename() :String{
	// 	return _image == null ? null :_image.filename;
	// }
	
	/**
	 * @private
	 */
	// public function setImageFilename(value :String) :String{
	// 	if (_image)
	// 	{
	// 		resourceManager.unload(_image.filename, ImageResource);
	// 		image = null;
	// 	}
		
	// 	resourceManager.load(value, ImageResource, onImageLoaded, onImageFailed);
	// 	return value;
	//    }
	
	/**
	 * The image resource to use for this sprite sheet.
	 */
	function get_imageResource() :ResourceToken<BitmapData>
	{
		return _imageResource;
	}
	
	function set_imageResource(value :ResourceToken<BitmapData>) :ResourceToken<BitmapData>
	{
		_imageResource = value;
		deleteFrames();
		if (_imageResource != null) {
			_image = resourceManager.get(_imageResource);
		}
		return value;
	}
	
	/**
	 * The bitmap data of the loaded image.
	 */
	public function get_imageData() :BitmapData
	{
		return _image;
		// if (_image == null)
		// 	return null;
		
		// return _imageResource.getbitmapData;
	}
	
	/**
	 * The divider to use to chop up the sprite sheet into frames. If the divider
	 * isn't set, the image will be treated as one whole frame.
	 */
	// [TypeHint(type="dynamic")]
	public function getDivider() :ISpriteSheetDivider{
		return _divider;
	}
	
	/**
	 * @private
	 */
	public function setDivider(value :ISpriteSheetDivider) :ISpriteSheetDivider{
		_divider = value;
		_divider.owningSheet = this;
		deleteFrames();
		return value;
	   }
	
	override function get_sourceFrames() :Array<BitmapData>
	{
		// If user provided their own bitmapdatas, return those.
		if (_forcedBitmaps != null)
			return _forcedBitmaps;
		
		var frames :Array<BitmapData>;
		
		// image isn't loaded, can't do anything yet
		if (imageData == null)
			return null;
		
		// no divider means treat the image as a single frame
		if (_divider == null)
		{
			frames = new Array();
			frames[0] = imageData;
		}
		else
		{
			frames = new Array();
							
			for (i in 0..._divider.frameCount)
			{
				var area :Rectangle = _divider.getFrameArea(i);										
				frames[i] = new BitmapData(Std.int(area.width), Std.int(area.height), true);
				frames[i].copyPixels(imageData, area, new Point(0, 0));									
			}				
		}		
		
		return frames;
	}
	
	/**
	 * From an array of BitmapDatas, initialize the sprite sheet, ignoring
	 * divider + filename.
	 */
	public function initializeFromBitmapDataArray(bitmaps :Array<BitmapData>) :Void
	{
		_forcedBitmaps = bitmaps;
	}
	
	// function onImageLoaded(resource :ImageResource) :Void
	// {
	// 	image = resource;
	// }
	
	// function onImageFailed(resource :ImageResource) :Void
	// {
	// 	// org.transition9.util.Log.error([this, "onImageFailed", "Failed to load '" + (resource != null ? resource.filename :"(unknown)") + "'"]);
	// }
	
	var _image :BitmapData;
	var _imageResource :ResourceToken<BitmapData>;
	var _divider :ISpriteSheetDivider;
	var _forcedBitmaps :Array<BitmapData>;
}
