/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource.js;

import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import Type;

/**
  * Javascript image loader.
  */
class ImageResources extends ResourceBase<js.Dom.Image>
{
	// public static var ID = "jsImageResources";
	var _pending :Array<ResourceToken>;
	var _loading :Array<ResourceToken>;
	var _images :Map<ResourceToken, js.Dom.Image>;
	
	public function new ()
	{
		super(Type.getClassName(ImageResources));
		_pending = []; 
		_loading = [];
		_images = Maps.newHashMap(ValueType.TClass(ResourceToken));
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		super.load(onLoad, onError);
		
		var self = this;
		// var total = _pending.length;
		// var complete = 0;

		if (_pending.length == 0 && _loading.length == 0) {
			loaded();
			return;
		}
		
		// trace("load");
		// onLoad();
		// return;
		
		for (imageToken in _pending.copy()) {
			_pending.remove(imageToken);
			_loading.push(imageToken);
			var image :js.Dom.Image = untyped __js__ ("new Image()");
			image.onload = function (_) {
				// trace("loaded " + imageToken.id);
				//Format the href to something friendly
				// var key = href.split("/")[href.split("/").length - 1];
				// key = key.split(".")[0];
				self._loading.remove(imageToken);
				self._images.set(imageToken, image);
				self.maybeFinish();
				// complete += 1;
				// if (complete == total) {
				// 	onLoad();
				// }
			}
			image.onerror = function (_) {
				trace("Error loading image");
				onError("Error loading " + imageToken);
			}
			// trace("setting url=" + imageToken.url);
			// image.src = "http://localhost:8000/" + imageToken.url;
			image.src = imageToken.url;
		}
	}
	
	override public function add (image :ResourceToken) :Void
	{
		//Only url loaded images
		com.pblabs.util.Assert.isTrue(Type.enumConstructor(image.source) == Type.enumConstructor(Source.url(null)));
		_pending.push(image);
	}
	
	override public function get (token :ResourceToken) :js.Dom.Image
	{
		com.pblabs.util.Assert.isNotNull(token, ' token is null');
		com.pblabs.util.Assert.isNotNull(token.id, ' token.id is null');
		com.pblabs.util.Assert.isNotNull(_images.get(token), ' _images.get(' + token + ') is null');
		return _images.get(token);
		// var srcImage = _images.get(token.id);
		// Preconditions.checkNotNull(srcImage, "No image with key=" + imageName);
		// var newImage :js.Dom.Image = untyped __js__ ("new Image()");
		// newImage.src = srcImage.src;
		// return newImage;
	}
	
	function maybeFinish () :Void
	{
		if (_loading.length == 0 && _pending.length == 0) {
			loaded();
		}
	}
	
	#if debug
	override public function toString () :String
	{
		return "[ImageResources: " + _images + "]";
	}
	#end
}
