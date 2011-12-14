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
		#if flash
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
	
	#if flash
	override function createResourceFromFlashLoaderData (token :ResourceToken, loaderData :Dynamic) :ImageType
	{
		return cast(loaderData, flash.display.Bitmap);
	}
	#end
}
