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
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.RectangleTools;
import com.pblabs.util.Preconditions;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.resource.ResourceToken;

typedef ImageData = 
#if (flash || cpp)
flash.display.BitmapData;
#else
js.Dom.Image;
#end

/**
  * Cross platform Image using Scene2D component.
  */
class ImageComponent 
#if js
extends com.pblabs.components.scene2D.js.SceneComponent
#elseif (flash || cpp)
extends com.pblabs.components.scene2D.flash.SceneComponent  
#end
{
	/** The IResource name and item id.  Id can be null */
	public var resource :ResourceToken<Dynamic>;
	
	#if js
	public var image (default, set_image) :js.Dom.Image;
	function set_image (val :js.Dom.Image) :js.Dom.Image
	{
		this.image = val;
		return val;
	}
	override public function draw (ctx :easel.display.Context2d) :Void
	{
		if (image == null) {
			_isContentsDirty = true;
			return;
		}
		ctx.drawImage(image, 0, 0);//, -image.width / 2, -image.height / 2);
	}
	#end
	
	public function new () :Void
	{
		super();
	}
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["x", "y", "width", "height"]);
	}
	#end
	
	override function onAdd () :Void
	{
		com.pblabs.util.Assert.isNotNull(resource, "resource is null for #" + owner.name + "." + name);
		#if js
		super.onAdd();
		loadFromResource();
		#elseif (flash || cpp)
		var image :Dynamic = context.get(resource);
		com.pblabs.util.Assert.isNotNull(image, "Image loaded from " + resource + " is null");
		com.pblabs.util.Assert.isNotNull(image, "null image for " + resource);
		if (Std.is(image, flash.display.BitmapData)) {
			displayObject = new flash.display.Bitmap(cast(image, flash.display.BitmapData));
			_registrationPoint.x = _displayObject.width / 2;
			_registrationPoint.y = _displayObject.height / 2;
		} else if (Std.is(image, flash.display.Bitmap)) {
			displayObject = cast image;
			_registrationPoint.x = _displayObject.width / 2;
			_registrationPoint.y = _displayObject.height / 2;
		} else if (Std.is(image, flash.display.DisplayObject)) {
			displayObject = cast image;
		} else {
			com.pblabs.util.Log.error("Unrecognized image type=" + com.pblabs.util.ReflectUtil.getClassName(image)); 
		}
		super.onAdd();
		#end
		
		// #if css
		// _width = image.width;
		// _height = image.height;
		// div.appendChild(displayObject);
		// #elseif (flash || cpp)
		
		// updateTransform();
		// #end
	}
	
	// override function onReset () :Void
	// {
	// 	trace("resetting ImageComponent");
	// 	super.onReset();
	// }
	
	#if (flash || cpp)
	override function onRemove () :Void
	{
		super.onRemove();
		_displayObject = null;
	}
	#end
	
	#if js
	function loadFromResource () :Void
	{
		//Get the DomResource, this makes sure the inline image is loaded
		image = context.get(resource);
		// trace("image=" + image);
		com.pblabs.util.Assert.isNotNull(image, "Image loaded from " + resource + " is null");
		Preconditions.checkNotNull(image, "image from resource is null " +resource);
		// trace("adding image to div");
		_unscaledBounds.xmin = -image.width / 2;
		_unscaledBounds.xmax = image.width / 2;
		_unscaledBounds.ymin = image.height / 2;
		_unscaledBounds.ymax = image.height / 2;
		// _width = image.width;
		// _height = image.height;
		_registrationPoint.x = width / 2;
		_registrationPoint.y = height / 2;
		div.appendChild(image);
		// displayObject = image;
	}
#end	

	// #if css
	// override public function onFrame (dt :Float) :Void
	// {
	// 	if (isTransformDirty) {
	// 		isTransformDirty = false;
	// 		var xOffset = parent.xOffset - width / 2;
	// 		var yOffset = parent.yOffset - height / 2;
	// 		untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
	// 	}
	// }
	
	// override function set_width (val :Float) :Float
	// {
	// 	if (displayObject != null) { 
	// 		displayObject.setAttribute("width", val + "px");
	// 	}
	// 	return super.set_width(val);
	// }
	
	// override function set_height (val :Float) :Float
	// {
	// 	if (displayObject != null) {
	// 		displayObject.setAttribute("height", val + "px");
	// 	}
	// 	return super.set_height(val);
	// }
	// #end
}
