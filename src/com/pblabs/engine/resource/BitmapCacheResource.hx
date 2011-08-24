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
import com.pblabs.util.F;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import haxe.io.Bytes;

using Lambda;
using com.pblabs.util.IterUtil;

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
class BitmapCacheResource extends ImageDataResources,
	implements haxe.rtti.Infos
{
	public static function createCachedToken (token :ResourceToken) :ResourceToken
	{
		//Make sure the token is derived from another. 
		switch (token.source) {
			case derived(other): return token;
			default: return new ResourceToken(token.id, Source.derived(token), ResourceType.IMAGE_DATA);
		}
	}

	@inject
	public var game :com.pblabs.engine.core.PBGameBase;
	
	public function new ()
	{
		super();
		// super(Type.enumConstructor(ResourceType.IMAGE));
	}
	
	override public function add (token :ResourceToken) :Void
	{
		switch (token.source) {
			case imageData (imageData): _data.set(token, imageData);
			default: super.add(token);
		}
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(onLoad, ' onLoad is null');
		com.pblabs.util.Assert.isNotNull(game, ' game is null');
		super.load(onLoad, onError);
		
		//If the current context is destroyed, cancel all pending and current render calls
		if (game.currentContext != null && (_pending.length > 0 || _loading.length > 0)) {
			game.currentContext.signalDestroyed.bind(function (c :com.pblabs.engine.core.IPBContext) :Void {
				_pending = [];
				_loading = [];
			}).destroyOnUse();
		}
	}
	
	/** Assumes this resource is immediately available */
	// override public function add (token :ResourceToken) :Void
	// {
	// 	// switch (token.type) {
	// 	// 	case IMAGE_DATA://Nothing
	// 	// 	default: throw "Token must be of type IMAGE";//token = createCachedToken(token);
	// 	// }
	// 	//Wrap tokens in BITMAP_CACHE tokens
	// 	// switch (token.type) {
	// 	// 	case BITMAP_CACHE(other)://Nothing
	// 	// 	default: throw "Token must be of type BITMAP_CACHE";//token = createCachedToken(token);
	// 	// }
	// 	if (!_data.exists(token)) {
	// 		super.add(token);
	// 	}
	// }
	
	override public function get (token :ResourceToken) :ImageData
	{
		// switch(token.type) {
		// 	case BITMAP_CACHE(source)://Ok
		// 	default: throw "You must provide a token with type BITMAP_CACHE.  Your token is " + token;  
		// }
		
		// if (!_data.exists(token)) {
		// 	//This may not complete immediately, if in flash
		// 	loadTokenData(token); 
		// }
		return _data.get(token); 
	}
	
	// override public function unload () :Void
	// {
	// 	#if (flash || cpp)
	// 	for (bd in _data) {
	// 		bd.dispose();
	// 	}
	// 	#end
	// 	super.unload();
	// }
	
	public function prerenderResources (tokens :Array<ResourceToken>, onFinish :Void->Void) :Void
	{
		for (token in tokens) {
			add(createCachedToken(token));
		}
		load(onFinish, function (e :Dynamic) :Void { com.pblabs.util.Log.error(Std.string(e));});
	}
	
	// override function loadFromUrl (token :ResourceToken, url :String) :Void
	// {
	// 	loadTokenData(token);
	// }
	
	// override function loadFromBytes (token :ResourceToken, bytes :Bytes) :Void
	// {
	// 	loadTokenData(token);
	// }
	
	// override function loadFromString (token :ResourceToken, s :String) :Void
	// {
	// 	loadTokenData(token);
	// }
	
	// override function loadFromEmbedded (token :ResourceToken) :Void
	// {
	// 	loadTokenData(token);
	// }
	
	override function processDerivedToken (token :ResourceToken, derivedFrom :ResourceToken) :Void
	{
		loadTokenData(token);
	}
	
	// #if flash
	// override function loadFromSwf (token :ResourceToken, swfId :String) :ImageData
	// {
	// 	loadTokenData(token);
	// 	return null;
	// }
	// #end
	
	function loadTokenData (token :ResourceToken) :Void
	{
		// trace('loadTokenData=' + token);
		//Is there an intensive task manager?
		com.pblabs.util.Assert.isNotNull(game, ' game is null');
		var taskQueue = game.currentContext != null ? game.currentContext.getManager(com.pblabs.components.system.IntensiveTaskQueue) : null;
		// trace('taskQueue=' + taskQueue);
		if (taskQueue != null) {
			var added = false;
			taskQueue.queueIntensiveTask(function (dt :Float) :Bool {
				if (!added) {
					loadTokenDataInternal(token);
					added = true;
				}
				return isTokenRenderFinished(token);
			});
		} else {
			//Render all at once
			loadTokenDataInternal(token);
		}
	}
	
	inline function isTokenRenderFinished (token :ResourceToken) :Bool
	{
		return !_loading.has(token);
	}
	/** Returns task for queueing */
	function loadTokenDataInternal (token :ResourceToken) :Void
	{
		// trace('token=' + token);
		// switch(token.type) {
		// 	case BITMAP_CACHE(source)://Ok
		// 	default: throw "You must provide a token with type BITMAP_CACHE.  Your token is " + token;  
		// }
		
		var sourceToken = switch(token.source) {
			case derived(source): source;
			default: token; 
		}
		
		com.pblabs.util.Log.debug("Rendering cached image for key=" + name + "...");
		switch (sourceToken.type) {
			case SVG:
				var svgData = manager.get(sourceToken);
				com.pblabs.util.Assert.isNotNull(svgData, ' svgData is null sourceToken=' + sourceToken);
				#if flash
				var self = this;
				trace("Rendering svg from " + token);
				SvgRenderTools.renderSvg(svgData, function (renderedSvg :flash.display.DisplayObject) :Void {
					var bm = com.pblabs.util.DisplayUtils.convertToBitmap(renderedSvg); 
					var bd = bm.bitmapData;
					bm.bitmapData = null;
					self._data.set(token, bd);
					self._loading.remove(token);
					self.maybeFinish();
				});
				#elseif js
				var canvas :Canvas = cast js.Lib.document.createElement("canvas");
				SvgRenderTools.renderSvg(svgData, canvas);
				_data.set(token, canvas.getContext("2d").getImageData(0, 0, canvas.width, canvas.height));
				_loading.remove(token);
				maybeFinish();
				#end
			#if flash
			case CLASS: 
				var someDisplayObject = manager.get(token);
				var bm = com.pblabs.util.DisplayUtils.convertToBitmap(someDisplayObject); 
				var bd = bm.bitmapData;
				bm.bitmapData = null;
				_data.set(token, bd);
				_loading.remove(token);
				maybeFinish();
				
			#end
			default: throw "Invalid type for caching as Bitmap?";
		}
	}
	
	
	#if debug
	override public function toString () :String
	{
		return "[" + name + ", rendered images:" + _data.keys().toArray().join(", ") + "]";
	}
	#end
}
