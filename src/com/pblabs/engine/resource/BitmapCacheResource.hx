/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import Type;

import com.pblabs.components.scene2D.SvgRenderTools;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

typedef ImageData = 
#if (flash || cpp)
flash.display.BitmapData;
#else
js.Dom.Image;
#end
	
/**
  * Caches bitmap representations of other display types, e.g. Bitmaps of 
  * complex MovieClips in Flash, Svg images.
  */
class BitmapCacheResource extends ResourceBase<ImageData>
{
	inline public static var NAME :String = "BitmapCacheResource";
	
	public static function createCachedToken (other :ResourceToken) :ResourceToken
	{
		var token = new ResourceToken(other.id, other.source, ResourceType.BITMAP_CACHE(other));
		return token;
	}
	
	var _cache :Map<ResourceToken, ImageData>;
	
	public function new (manager :IResourceManager)
	{
		super(Type.enumConstructor(ResourceType.BITMAP_CACHE(null)));
		_cache = Maps.newHashMap(ValueType.TClass(ResourceToken));
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		super.load(onLoad, onError);
		loaded();
	}
	
	override public function get (token :ResourceToken) :ImageData
	{
		if (name == null) {
			com.pblabs.util.Log.error("get(name) :name cannot be null");
			return null;
		}
		
		var sourceToken = switch(token.type) {
			case BITMAP_CACHE(source): source;
			default: token; 
		}
		
		if (_cache.exists(sourceToken)) {
			trace("Returning cached image from=" + token);
			return _cache.get(sourceToken);
		} 
		
		com.pblabs.util.Log.debug("No cached image for key=" + name + ", creating...");
		switch (sourceToken.type) {
			case SVG:
				var svgData = manager.get(sourceToken);
				//Set null so we don't try rendering again, if the rendering is asynchronous
				_cache.set(sourceToken, null);
				#if flash
				var self = this;
				SvgRenderTools.renderSvg(svgData, function (renderedSvg :flash.display.DisplayObject) :Void {
					var bm = com.pblabs.util.DisplayUtils.convertToBitmap(renderedSvg); 
					var bd = bm.bitmapData;
					bm.bitmapData = null;
					self._cache.set(sourceToken, bd);
				});
				#elseif js
				var canvas :Canvas = cast js.Lib.document.createElement("canvas");
				SvgRenderTools.renderSvg(svgData, canvas);
				_cache.set(sourceToken, canvas.getContext("2d").getImageData(0, 0, canvas.width, canvas.height));
				#end
			#if flash
			case CLASS: 
				var someDisplayObject = manager.get(token);
				var bm = com.pblabs.util.DisplayUtils.convertToBitmap(someDisplayObject); 
				var bd = bm.bitmapData;
				bm.bitmapData = null;
				_cache.set(sourceToken, bd);
			#end
			default: throw "Invalid type for caching as Bitmap?";
		}
		
		return _cache.get(sourceToken);
		
		// var imageData = manager.get(token);
		// if (Std.is(imageData, flash.display.Bitmap)) {
		// 	_cache.set(name, cast(imageData, flash.display.Bitmap).bitmapData);
		// 	cast(imageData, flash.display.Bitmap).bitmapData = null;
		// } else if (Std.is(imageData, flash.utils.ByteArray)) {
		// 	com.pblabs.util.Log.error("ByteArray, etf?");
		// } else {
		// 	com.pblabs.util.Assert.isNotNull(imageData);
		// 	var bm = com.pblabs.util.DisplayUtils.convertToBitmap(imageData); 
		// 	var bd = bm.bitmapData;
		// 	bm.bitmapData = null;
		// 	_cache.set(name, bd);
		// }
		// } catch (e :Dynamic) {//Fail gracefully, ie return a default DisplayObject
		// 	com.pblabs.util.Log.info("No resource from " + name + ", subsituting red blob");
		// 	var bd = new flash.display.BitmapData(120, 30, true);
		// 	bd.floodFill(0, 0, com.pblabs.util.GraphicsUtil.toARGB(0xff0000, 0));
		// 	//Draw dot
		// 	var dot = new flash.display.Shape();
		// 	dot.graphics.beginFill(0xff0000);
		// 	dot.graphics.drawCircle(10, 10, 20);
		// 	dot.graphics.endFill();
		// 	bd.draw(dot);
			
		// 	//Draw text of missing resource
		// 	var tf = new flash.text.TextField();
		// 	tf.text = "missing " + StringTools.replace(name, '.', '\n');
		// 	bd.draw(tf);
			
		// 	_cache.set(name, bd);
		// 	return bd;
		// }
		// #elseif js
		// throw "Not implemented";
		// return null;
		// var newImage :js.Dom.Image = _cache.getFromName(tokens[0], tokens[1]);
		// newImage.src = _image.src;
		// return newImage;
		// #end
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
