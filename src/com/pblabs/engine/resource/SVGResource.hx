/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Preconditions;
import com.pblabs.util.StringUtil;
#if (flash || cpp)
using com.pblabs.util.EventDispatcherUtil;

/**
  * Represents a single image resource.
  * JS side of this is totally not working
  */
class SVGResource extends ResourceBase<flash.display.Sprite>
#elseif js
class SVGResource extends ResourceBase<js.Dom.Image>
#end
{
	#if (flash || cpp)
	var _imageClass :Class<flash.display.Sprite>;
	#elseif js
	var _image :js.Dom.Image;
	#end
	var _source :Source;
	
	public function new (name :String, source :Source)
	{
		super(name);
		_source = source;
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Log.debug("load " + _source);
		super.load(onLoad, onError);
		var self = this;
		switch (_source) {
			case embedded (n): loadFromEmbedded(n);
			default:
				com.pblabs.util.Log.error("Resource source type not handled: " + _source);
		}
	}
	
#if (flash || cpp)
	override public function create (?name :String) :flash.display.Sprite
#elseif js
	override public function create (?name :String) :js.Dom.Image
#end
	{
		if (name != null) {
			com.pblabs.util.Log.error("create(name): name argument is ignored");
		}
		
		#if (flash || cpp)
		com.pblabs.util.Assert.isNotNull(_imageClass, "Where is the embedded class?");
       return Type.createInstance(_imageClass, EMPTY_ARRAY);
		#elseif js
		var newImage :js.Dom.Image = untyped __js__ ("new Image()");
		newImage.src = _image.src;
		return newImage;
		#end
	}
	
	override public function unload () :Void
	{
		super.unload();
		_source = null;
		_imageClass = null;
	}
	
	#if debug
	// override public function toString () :String
	// {
	// 	return StringUtil.objectToString(this, ["_name", "_image", "_source"]);
	// }
	#end
	
	function loadFromEmbedded (embeddedName :String) :Void
	{
		com.pblabs.util.Log.debug("loadFromEmbedded");
		#if js
		onLoadError("Don't use Source.embedded for JS, use Source.url instead");
		#elseif flash
		_imageClass = cast Type.resolveClass("SWFResources_" + embeddedName);
		Preconditions.checkNotNull(_imageClass, "No embedded resource class SWFResources_" + embeddedName);
		loaded();
		#end
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}
