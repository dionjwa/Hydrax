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

import com.pblabs.components.scene2D.ImageType;
import com.pblabs.engine.resource.ResourcesBase;
import com.pblabs.engine.resource.ResourceToken;
import org.transition9.util.Preconditions;
import org.transition9.rtti.ReflectUtil;
import org.transition9.util.StringUtil;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;

/**
  * Loads and stores images from URLs, embedded data, swfs etc.
  */
class ImageResources extends LoadingResources<ImageType>
{
	public function new ()
	{
		super(Type.enumConstructor(ResourceType.IMAGE));
	}
	
	override function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		#if (flash || spaceport)
		loadDisplayObjectFromUrl(token, url);
		#elseif js
		var image :Image = untyped __js__ ("new Image()");
		var self = this;
		image.onload = function () {
			self._loading.remove(token);
			self._data.set(token, image);
			org.transition9.util.Assert.isNotNull(self._data.get(token), ' _data.get(token) is null');
			self.maybeFinish();
		}
		image.onerror = function (e :Dynamic) {
			trace("Error loading token " + token  + "\n   " + e);
		}
		image.src = url;
		#end
	}
	
	#if (flash || spaceport)
	override function createResourceFromFlashLoaderData (token :ResourceToken, loaderData :Dynamic) :ImageType
	{
		return cast(loaderData, flash.display.Bitmap);
	}
	
	override function loadFromEmbedded (token :ResourceToken) :Void
	{
		var id = switch(token.source) {
			case embedded(embedId): embedId;
			default: throw "Token is not embedded " + token; null;
		}	
		var cls :Class<Dynamic> = ResourceTools.resolveEmbeddedClassName(id);
		if (cls == null) {
			if (_onError != null) {
				_onError("No embedded class: " + id);
			}
		} else {
			_data.set(token, Type.createInstance(cls, org.transition9.util.Constants.EMPTY_ARRAY));
			_loading.remove(token);
			maybeFinish();
		}
	}
	#end
}
