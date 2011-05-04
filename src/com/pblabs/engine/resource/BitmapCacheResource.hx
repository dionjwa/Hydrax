/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

typedef ImageData = 
#if (flash || cpp)
flash.display.BitmapData;
#else
js.Dom.Image;
#end
	
// #if (flash || cpp)
/**
  * Caches bitmap representations of other display types, e.g. Bitmaps of 
  * complex MovieClips in Flash.
  */
class BitmapCacheResource extends ResourceBase<ImageData>
{
	inline public static var NAME :String = "BitmapCacheResource";
	
	public static function createCachedToken (resourceId :String, key :String) :ResourceToken<ImageData>
	{
		return new ResourceToken(NAME, resourceId + "." + key);
	}
	
	// #if (flash || cpp)
	// var _cache :Map<String, flash.display.BitmapData>;
	// #elseif js
	var _cache :Map<String, ImageData>;
	// #end
	
	var _manager :IResourceManager;
	
	public function new (manager :IResourceManager)
	{
		super(NAME);
		_cache = Maps.newHashMap(String);
		com.pblabs.util.Assert.isNotNull(manager);
		_manager = manager;
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Log.debug("load");
		super.load(onLoad, onError);
		loaded();
	}
	
// #if (flash || cpp)
// 	override public function get (?name :String) :flash.display.BitmapData
// #else
// 	override public function get (?name :String) :js.Dom.Image
// #end
	override public function get (?name :String) :ImageData
	{
		if (name == null) {
			com.pblabs.util.Log.error("get(name) :name cannot be null");
			return null;
		}
		
		if (!_cache.exists(name)) {
			com.pblabs.util.Log.debug("No cached image for key=" + name + ", creating...");
			var tokens = name.split(".");
			com.pblabs.util.Assert.isTrue(tokens.length == 2);
			#if (flash || cpp)
			try {
				var imageData = _manager.getFromName(tokens[0], tokens[1]);
				if (Std.is(imageData, flash.display.Bitmap)) {
					_cache.set(name, cast(imageData, flash.display.Bitmap).bitmapData);
					cast(imageData, flash.display.Bitmap).bitmapData = null;
				} else if (Std.is(imageData, flash.utils.ByteArray)) {
					com.pblabs.util.Log.error("ByteArray, etf?");
				} else {
					com.pblabs.util.Assert.isNotNull(imageData);
					var bm = com.pblabs.util.DisplayUtils.convertToBitmap(imageData); 
					var bd = bm.bitmapData;
					bm.bitmapData = null;
					_cache.set(name, bd);
				}
			} catch (e :Dynamic) {//Fail gracefully, ie return a defualt DisplayObject
				com.pblabs.util.Log.info("No resource from " + name + ", subsituting red blob");
				var bd = new flash.display.BitmapData(120, 30, true);
				bd.floodFill(0, 0, com.pblabs.util.GraphicsUtil.toARGB(0xff0000, 0));
				//Draw dot
				var dot = new flash.display.Shape();
				dot.graphics.beginFill(0xff0000);
				dot.graphics.drawCircle(10, 10, 20);
				dot.graphics.endFill();
				bd.draw(dot);
				
				//Draw text of missing resource
				var tf = new flash.text.TextField();
				tf.text = "missing " + StringTools.replace(name, '.', '\n');
				bd.draw(tf);
				
				_cache.set(name, bd);
				return bd;
			}
			#elseif js
			throw "Not implemented";
			return null;
			// var newImage :js.Dom.Image = _manager.getFromName(tokens[0], tokens[1]);
			// newImage.src = _image.src;
			// return newImage;
			#end
		}
		com.pblabs.util.Log.debug("Getting cached bitmap data for key=" + name);
	   return _cache.get(name);
	}
	
	override public function unload () :Void
	{
		super.unload();
		#if (flash || cpp)
		for (bd in _cache) {
			bd.dispose();
		}
		#end
		_cache.clear();
		_cache = null;
	}
	
	#if debug
	override public function toString () :String
	{
		return "[" + name + ": " +  com.pblabs.util.ds.MapUtil.toString(_cache) + "]";
	}
	#end
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
}
