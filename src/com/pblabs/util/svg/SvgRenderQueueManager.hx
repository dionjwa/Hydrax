package com.pblabs.util.svg;

import com.pblabs.components.base.Dispatcher;
import com.pblabs.components.scene2D.ImageData;
import com.pblabs.components.scene2D.SvgRenderTools;
import com.pblabs.components.system.IntensiveTaskQueue;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.resource.SvgResources;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;
import com.pblabs.util.svg.SvgReplace;
using com.pblabs.engine.util.PBUtil;

/**
  * Goto for requesting asynchronous Svg render calls.
  * Works best with BitmapRenderers.
  */
class SvgRenderQueueManager
{
	public static function getBitmapData (context :IPBContext, token :ResourceToken, replacements :Array<SvgReplace>, cb :ImageData->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(context, ' context is null');
		var queue = context.ensureGameManager(SvgRenderQueueManager);
		queue.getBitmapDataInternal(context, token, replacements, cb);
	}
	
	var _callbacks :MultiMap<ResourceToken, ImageData->Void>;
	
	public function new ()
	{
		_callbacks = ArrayMultiMap.create(Type.ValueType.TClass(ResourceToken));
	}

	/**
	  * Given an Svg ResourceToken, retrieves the cached image, if present, otherwise queues
	  * the rendering (asynchronously) and calls the callback when ready.
	  */
	public function getBitmapDataInternal (context :IPBContext, token :ResourceToken, replacements :Array<SvgReplace>, cb :ImageData->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(token, ' token is null');
		com.pblabs.util.Assert.isNotNull(cb, ' cb is null');
		com.pblabs.util.Assert.isNotNull(context, ' context is null');
		// com.pblabs.util.Assert.isNotNull(context, ' context is null');
		switch (token.type) {
			default: throw "Must be of ResourceType.SVG";
			case SVG://Ok
		}
		
		var rsrc = context.getManager(IResourceManager);
		
		
		com.pblabs.util.Assert.isTrue(rsrc.getResource(Type.enumConstructor(ResourceType.IMAGE_DATA)) != null && 
			Std.is(rsrc.getResource(Type.enumConstructor(ResourceType.IMAGE_DATA)), com.pblabs.engine.resource.BitmapCacheResource),
			"Missing BitmapCacheResource, needed by the SvgRenderQueueManager.  Add to the IResourceManager");
		
		// trace("getBitmapDataInternal");
		// trace('token=' + token);
		// trace('replacements=' + replacements);
		// trace('token.data=' + cast(rsrc.get(token), SvgData).data);
		
		// trace("getBitmapDataInternal");
		var svgToken = SvgResources.getSvgResourceToken(context, token, replacements);
		var bitmapToken = new ResourceToken(svgToken.id, Source.none, ResourceType.IMAGE_DATA);
		// trace('   token=' +    token);
		// trace('   rsrc.get(token)=' +    rsrc.get(token));
		// trace('   svgToken=' +    svgToken);
		// trace('   bitmapToken=' +    bitmapToken);
		// trace('   rsrc.get(svgToken)=' +    rsrc.get(svgToken));
		
		// var id = SvgReplace.createDerivedResourceToken(token, new SvgReplacements(replacements));
		// var cacheToken = new ResourceToken(id, Source.none, ResourceType.IMAGE_DATA);
		// var cacheToken = SvgReplace.createDerivedResourceToken(token, replacements);
		var imageData = rsrc.get(bitmapToken);
		if (imageData != null) {
			// trace("       found imageData");
			cb(imageData);
		} else {
			if (!_callbacks.exists(svgToken)) {
				//Add to queue
				_callbacks.set(svgToken, cb);
				//Notify progressbar
				// com.pblabs.util.Assert.isNotNull(context.getManager(Dispatcher), ' context.getManager(Dispatcher) is null');
				var dispatcher = context.ensureManager(Dispatcher);
				dispatcher.dispatch(com.pblabs.components.ui.ProgressEvent.TASK_STARTED("Svg rendering", svgToken.id));
				//Create render call.
				// com.pblabs.util.Assert.isNotNull(context.getManager(IntensiveTaskQueue), ' context.getManager(IntensiveTaskQueue) is null');
				var intensiveTasks = context.ensureManager(IntensiveTaskQueue);
				// var intensiveTasks = context.getManager(IntensiveTaskQueue);
				// com.pblabs.util.Assert.isNotNull(context.getManager(SvgDataCache), ' context.getManager(SvgDataCache) is null');
				// var svgDataCache = context.getManager(SvgDataCache);
				
				var svgData = rsrc.get(svgToken);
				com.pblabs.util.Assert.isNotNull(svgData, ' svgData is null for ' + svgToken);
				// var svgData = svgDataCache.get(token.id, replacements);
				intensiveTasks.queueIntensiveTask(createRenderCall(svgData, function (imageData :ImageData) :Void {
					var bitmapCache :BitmapCacheResource = cast context.getManager(IResourceManager).getResource(Type.enumConstructor(ResourceType.IMAGE_DATA));
					bitmapToken = new ResourceToken(svgToken.id, Source.linked(imageData), ResourceType.IMAGE_DATA);
					bitmapCache.add(bitmapToken);
					for (cachedCallback in _callbacks.get(svgToken)) {
						com.pblabs.util.Assert.isNotNull(cachedCallback, ' cachedCallback is null');
						cachedCallback(imageData);
					}
					 _callbacks.remove(svgToken);
					 context.getManager(Dispatcher).dispatch(com.pblabs.components.ui.ProgressEvent.TASK_COMPLETE("Svg rendering", svgToken.id));
				}), null, 10);//High priority since these are UI images.
			} else {
				//Add to queue
				_callbacks.set(svgToken, cb);
			}
		}
	}
	
	public function createRenderCall (svg :SvgData, onFinish :ImageData->Void) :Float->Bool
	{
		var finished = false;
		var started = false;
		return function (dt :Float) :Bool {
			#if flash
			if (finished) return true;
			if (started) return false;
			started = true;
			com.pblabs.util.Log.info("Rendering " + svg);
			SvgRenderTools.renderSvg(svg, function (renderedSvg :flash.display.DisplayObject) :Void {
				var bm = com.pblabs.util.DisplayUtils.convertToBitmap(renderedSvg); 
				var bd = bm.bitmapData;
				onFinish(bm.bitmapData);
				finished = true;
				bm.bitmapData = null;
			});
			return false;
			#elseif js
			var canvas :Canvas = cast js.Lib.document.createElement("canvas");
			SvgRenderTools.renderSvg(svg, canvas);
			onFinish(canvas);
			return true;
			#end
		}
	}
}
