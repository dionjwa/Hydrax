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

import com.pblabs.components.scene2D.Image;
import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

/**
  * Image resources.
  */
class ImageResources extends DynamicResources<Image>
{
	public function new ()
	{
		super(Type.enumConstructor(ResourceType.IMAGE));
	}
	
	override function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		#if flash
		throw "Not yet implemented";
		#elseif js
		var image :js.Dom.Image = untyped __js__ ("new Image()");
		image.onload = function (_) {
			// trace("loaded " + imageToken.id);
			//Format the href to something friendly
			// var key = href.split("/")[href.split("/").length - 1];
			// key = key.split(".")[0];
			self._loading.remove(imageToken);
			self._data.set(imageToken, image);
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
		image.src = url;
		#end
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
	
	// #if flash
	// override function loadFromSwf (token :ResourceToken, swfId :String) :Image
	// {
	// 	return ResourceTools.instantiateEmbeddedClass(token.id);
	// }
	// #end
	
	// #if debug
	// override public function toString () :String
	// {
	// 	return "[ImageResources: " + _images + "]";
	// }
	// #end
}
