/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.resource.IResources;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.RectangleTools;
import com.pblabs.util.Preconditions;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.resource.ResourceManager;

/**
  * BitmapRenderer with automatically loading resource.
  */
class ImageComponent extends BitmapRenderer
{
	/** The IResource name and item id.  Id can be null */
	public var resource :ResourceToken;
	
	public function new () :Void
	{
		super();
	}
	
	override function onAdd () :Void
	{
		com.pblabs.util.Assert.isNotNull(resource, "resource is null for #" + owner.name + "." + name);
		#if js
		super.onAdd();
		loadJSImage();
		#elseif (flash || cpp)
		loadFlashImage();
		super.onAdd();
		#end
	}
	
	#if js
	function loadJSImage () :Void
	{
		com.pblabs.util.Assert.isNotNull(resource, ' resource is null');
		var image :Image = context.getTokenResource(resource);
		com.pblabs.util.Assert.isNotNull(image, ' image is null');
		setImage(image);
		// width = image.width;
		// height = image.height;
		// // trace('image.width=' + image.width);
		// // trace('image.height=' + image.height);
		// Preconditions.checkNotNull(image, "image from resource is null " +resource);
		// _bitmap.width = image.width;
		// _bitmap.height = image.height;
		// _bitmap.getContext("2d").drawImage(image , 0, 0);
		// var canvas :easel.display.Canvas = cast js.Lib.document.createElement("canvas");
		// canvas.width = image.width;
		// canvas.height = image.height;
		// var ctx = canvas.getContext("2d");
		// ctx.drawImage(image, 0, 0);
		// bitmapData = canvas;
		//Assume you want the image centered.
		// registrationPoint = new com.pblabs.geom.Vector2(image.width / 2, image.height / 2);
	}
	#end
	
	#if (flash || cpp)
	function loadFlashImage () :Void
	{
		var image :Dynamic = context.getTokenResource(resource);
		// trace(resource + "=" + image); 
		com.pblabs.util.Assert.isNotNull(image, "Image loaded from " + resource + " is null");
		com.pblabs.util.Assert.isNotNull(image, "null image for " + resource);
		if (Std.is(image, flash.display.BitmapData)) {
			this.bitmapData = cast image;
		} else if (Std.is(image, flash.display.Bitmap)) {
			this.bitmapData = cast(image, flash.display.Bitmap).bitmapData;
		} else if (Std.is(image, flash.display.DisplayObject)) {
			displayObject = cast image;
		} else {
			com.pblabs.util.Log.error("Unrecognized image type=" + com.pblabs.util.ReflectUtil.getClassName(image)); 
		}
		recomputeBounds();
		// trace("after loading flash image, _unscaledBounds=" + _unscaledBounds + ", _bounds=" + _bounds);
		//Assume you want the image centered.
		// registrationPoint = new com.pblabs.geom.Vector2(image.width / 2, image.height / 2);
	}
	#end
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
}
