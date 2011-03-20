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

#if (flash || cpp)
/**
  * Caches bitmap representations of other display types, e.g. Bitmaps of 
  * complex MovieClips in Flash.
  */
class BitmapCacheResource extends ResourceBase<flash.display.Bitmap>
#else
class BitmapCacheResource extends ResourceBase<js.Dom.Image>
#end
{
	inline public static var NAME :String = "BitmapCacheResource";
	
	public static function createCachedToken <T>(resourceId :String, key :String) :ResourceToken<T>
	{
	    return new ResourceToken(NAME, resourceId + "." + key);
	}
	
	
	#if (flash || cpp)
	var _cache :Map<String, flash.display.BitmapData>;
	#elseif js
	var _cache :Map<String, js.Dom.Image>;
	#end
	
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
	
#if (flash || cpp)
	override public function create (?name :String) :flash.display.Bitmap
#else
	override public function create (?name :String) :js.Dom.Image
#end
	{
		if (name == null) {
			com.pblabs.util.Log.error("create(name): name cannot be null");
			return null;
		}
		
		if (!_cache.exists(name)) {
			com.pblabs.util.Log.debug("No cached image for key=" + name + ", creating...");
			var tokens = name.split(".");
			com.pblabs.util.Assert.isTrue(tokens.length == 2);
			#if (flash || cpp)
			var image :flash.display.DisplayObject = _manager.createFromName(tokens[0], tokens[1]);
			com.pblabs.util.Assert.isNotNull(image);
			var bm = com.pblabs.util.DisplayUtils.convertToBitmap(image); 
			var bd = bm.bitmapData;
			bm.bitmapData = null;
			_cache.set(name, bd);
			#elseif js
			var newImage :js.Dom.Image = _manager.createFromName(tokens[0], tokens[1]);
			newImage.src = _image.src;
			return newImage;
			#end
		}
		com.pblabs.util.Log.debug("Getting cached bitmap data for key=" + name);
       return new flash.display.Bitmap(_cache.get(name));
	}
	
	override public function unload () :Void
	{
		super.unload();
		_cache.clear();
		_cache = null;
	}
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.ds.MapUtil.toString(_cache);
	}
	#end
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
}
