package com.pblabs.util.svg;

import com.pblabs.components.input.Dispatcher;
import com.pblabs.components.scene2D.ImageData;
import com.pblabs.components.scene2D.SvgRenderTools;
import com.pblabs.components.system.IntensiveTaskQueue;
import com.pblabs.engine.core.PBManagerBase;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;
import com.pblabs.util.svg.SvgReplace;

/**
  * Goto for requesting asynchronous Svg render calls.
  * Works best with BitmapRenderers.
  */
class SvgRenderQueueManager extends PBManagerBase
{
	var _callbacks :MultiMap<ResourceToken, ImageData->Void>;
	public function new ()
	{
		super();
		_callbacks = ArrayMultiMap.create(Type.ValueType.TClass(ResourceToken));
	}

	/**
	  * Given an Svg ResourceToken, retrieves the cached image, if present, otherwise queues
	  * the rendering (asynchronously) and calls the callback when ready.
	  */
	public function getBitmapData (token :ResourceToken, replacements :Array<SvgReplace>, cb :ImageData->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(token, ' token is null');
		com.pblabs.util.Assert.isNotNull(cb, ' cb is null');
		com.pblabs.util.Assert.isNotNull(game, ' game is null');
		com.pblabs.util.Assert.isNotNull(context, ' context is null');
		switch (token.type) {
			default: throw "Must be of ResourceType.SVG";
			case SVG://Ok
		}
		var id = SvgReplace.createDerivedId(token.id, new SvgReplacements(replacements));
		var cacheToken = new ResourceToken(id, Source.imageData(null), ResourceType.IMAGE_DATA);
		var imageData = game.getManager(IResourceManager).get(cacheToken);
		if (imageData != null) {
			cb(imageData);
		} else {
			if (!_callbacks.exists(cacheToken)) {
				//Add to queue
				_callbacks.set(cacheToken, cb);
				//Notify progressbar
				com.pblabs.util.Assert.isNotNull(context.getManager(Dispatcher), ' context.getManager(Dispatcher) is null');
				context.getManager(Dispatcher).dispatch(net.amago.components.ui.ProgressEvent.TASK_STARTED("Svg rendering", id));
				//Create render call.
				com.pblabs.util.Assert.isNotNull(context.getManager(IntensiveTaskQueue), ' context.getManager(IntensiveTaskQueue) is null');
				var intensiveTasks = context.getManager(IntensiveTaskQueue);
				com.pblabs.util.Assert.isNotNull(game.getManager(SvgDataCache), ' game.getManager(SvgDataCache) is null');
				var svgDataCache = game.getManager(SvgDataCache);
				var svgData = svgDataCache.get(token.id, replacements);
				intensiveTasks.queueIntensiveTask(createRenderCall(svgData, function (imageData :ImageData) :Void {
					var bitmapCache :BitmapCacheResource = cast game.getManager(IResourceManager).getResource(Type.enumConstructor(ResourceType.IMAGE_DATA));
					cacheToken = new ResourceToken(id, Source.imageData(imageData), ResourceType.IMAGE_DATA);
					bitmapCache.add(cacheToken);
					for (cachedCallback in _callbacks.get(cacheToken)) {
						cachedCallback(imageData);
					}
					 _callbacks.remove(cacheToken);
					 context.getManager(Dispatcher).dispatch(net.amago.components.ui.ProgressEvent.TASK_COMPLETE("Svg rendering", id));
				}));
			} else {
				//Add to queue
				_callbacks.set(cacheToken, cb);
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
			trace("Rendering svg from " + svg);
			SvgRenderTools.renderSvg(svg.data, function (renderedSvg :flash.display.DisplayObject) :Void {
				var bm = com.pblabs.util.DisplayUtils.convertToBitmap(renderedSvg); 
				var bd = bm.bitmapData;
				onFinish(bm.bitmapData);
				finished = true;
				bm.bitmapData = null;
			});
			return false;
			#elseif js
			var canvas :Canvas = cast js.Lib.document.createElement("canvas");
			SvgRenderTools.renderSvg(svgData, canvas);
			onFinish(canvas.getContext("2d").getImageData(0, 0, canvas.width, canvas.height));
			return true;
			#end
		}
	}
}
