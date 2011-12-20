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
import org.transition9.util.F;
import org.transition9.util.Preconditions;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;

import haxe.io.Bytes;

using Lambda;
using org.transition9.util.IterUtil;

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
	public var game :com.pblabs.engine.core.PBGame;
	
	public function new ()
	{
		super();
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		org.transition9.util.Assert.isNotNull(onLoad, ' onLoad is null');
		org.transition9.util.Assert.isNotNull(game, ' game is null');
		super.load(onLoad, onError);
		
		//If the current context is destroyed, cancel all pending and current render calls
		if (game.currentContext != null && (_pending.length > 0 || _loading.length > 0)) {
			var self = this;
			game.currentContext.signalDestroyed.bind(function (c :com.pblabs.engine.core.IPBContext) :Void {
				self._pending = [];
				self._loading = [];
			}).destroyOnUse();
		}
	}
	
	override public function get (token :ResourceToken) :com.pblabs.components.scene2D.ImageData
	{
		return _data.get(token); 
	}
	
	public function prerenderResources (tokens :Array<ResourceToken>, onFinish :Void->Void) :Void
	{
		for (token in tokens) {
			add(createCachedToken(token));
		}
		load(onFinish, function (e :Dynamic) :Void { org.transition9.util.Log.error(Std.string(e));});
	}
	
	override function processDerivedToken (token :ResourceToken, derivedFrom :ResourceToken) :Void
	{
		loadTokenData(token);
	}
	
	function loadTokenData (token :ResourceToken) :Void
	{
		//Is there an intensive task manager?
		org.transition9.util.Assert.isNotNull(game, ' game is null');
		var taskQueue = game.currentContext != null ? game.currentContext.getManager(com.pblabs.components.system.IntensiveTaskQueue) : null;
		if (taskQueue != null) {
			var added = false;
			var self = this;
			taskQueue.queueIntensiveTask(function (dt :Float) :Bool {
				if (!added) {
					self.loadTokenDataInternal(token);
					added = true;
				}
				return self.isTokenRenderFinished(token);
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
		var sourceToken = switch(token.source) {
			case derived(source): source;
			default: token; 
		}
		
		org.transition9.util.Log.debug("Rendering cached image for key=" + name + "...");
		switch (sourceToken.type) {
			case SVG:
				var svgData = manager.get(sourceToken);
				org.transition9.util.Assert.isNotNull(svgData, ' svgData is null sourceToken=' + sourceToken);
				#if flash
				var self = this;
				SvgRenderTools.renderSvg(svgData, function (renderedSvg :flash.display.DisplayObject) :Void {
					var bm = org.transition9.util.DisplayUtils.convertToBitmap(renderedSvg); 
					var bd = bm.bitmapData;
					bm.bitmapData = null;
					self._data.set(token, bd);
					self._loading.remove(token);
					self.maybeFinish();
				});
				#elseif js
				var canvas :Canvas = cast js.Lib.document.createElement("canvas");
				SvgRenderTools.renderSvg(svgData, canvas);
				_data.set(token, canvas);
				_loading.remove(token);
				maybeFinish();
				#end
			#if flash
			case CLASS: 
				var someDisplayObject = manager.get(token);
				var bm = org.transition9.util.DisplayUtils.convertToBitmap(someDisplayObject); 
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
