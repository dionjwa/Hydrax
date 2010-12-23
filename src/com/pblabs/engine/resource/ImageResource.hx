/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import com.pblabs.engine.debug.Log;
import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Preconditions;
import com.pblabs.util.StringUtil;
#if (flash || cpp)
using com.pblabs.util.EventDispatcherUtil;

class ImageResource extends ResourceBase<flash.display.Bitmap>
#elseif js
class ImageResource extends ResourceBase<js.Dom.Image>
#end
{
	public function new (name :String, source :Source)
	{
		super(name);
		_source = source;
		
		#if flash
		_loader = new flash.display.Loader();
		var loader = _loader;
		var self = this;
		var onComplete = function (e :flash.events.Event) :Void {
			Log.debug("onComplete");
			loader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
			loader.contentLoaderInfo.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			self._image = cast loader.content;
			self.loaded();			
		}
		
		loader.contentLoaderInfo.addOnceListener(flash.events.Event.COMPLETE, onComplete);
		loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
		loader.contentLoaderInfo.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
		#end
		
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		Log.debug("load " + _source);
		super.load(onLoad, onError);
		var self = this;
		switch (_source) {
			case url (u): loadFromUrl(u);
			case embedded (n): loadFromEmbedded(n);
			default:
				Log.error("Resource source type not handled: " + _source);
		}
	}
	
#if (flash || cpp)
	override public function create (?name :String) :flash.display.Bitmap
#elseif js
	override public function create (?name :String) :js.Dom.Image
#end
	{
		if (name != null) {
			Log.error("create(name): name argument is ignored");
		}
		
		#if (flash || cpp)
       return new flash.display.Bitmap(_image.bitmapData);
		#elseif js
		var newImage :js.Dom.Image = untyped __js__ ("new Image()");
		newImage.src = _image.src;
		return newImage;
		#end
	}
	
	override public function unload () :Void
	{
		super.unload();
		
		#if flash
		try {
			_loader.close();
		} catch (e :Dynamic) {
			// swallow the exception
		}
		_loader.unload();
		#end
		
		_source = null;
		_image = null;
	}
	
	#if debug
	override public function toString () :String
	{
		return StringUtil.objectToString(this, ["_name", "_image", "_source"]);
	}
	#end
	
	#if (flash || cpp)
	public var bitmapData (get_bitmapData, null) :flash.display.BitmapData;
	inline function get_bitmapData () :flash.display.BitmapData
    {
        return _image.bitmapData;
    }
    #end
	
	function loadFromUrl (url :String) :Void
	{
		Preconditions.checkNotNull(url, "url is null");
		#if flash
		_loader.load(new flash.net.URLRequest(url));
		#elseif js
		var self = this;
		_image = untyped __js__ ("new Image()");
		_image.onload = function (_) {
				self.loaded();
		}
		_image.onerror = function (_) {
			trace("Error");
			self.onLoadError("Error loading " + url);
		}
		_image.src = url;
		#else
		throw "Platform cannot load xml from source=" + _source;
		#end
		
	}
	
	function loadFromEmbedded (embeddedName :String) :Void
	{
		Log.debug("loadFromEmbedded");
		#if js
		onLoadError("Don't use Source.embedded for JS, use Source.url instead");
		#elseif flash
		var cls :Class<Dynamic> = Type.resolveClass("SWFResources_" + embeddedName);
		Preconditions.checkNotNull(cls, "No embedded resource class SWFResources_" + embeddedName);
		com.pblabs.util.Assert.isTrue(Std.is(Type.createInstance(cls, []), flash.utils.ByteArray)); 
		var bytes :flash.utils.ByteArray = cast Type.createInstance(cls, []);
		_loader.loadBytes(bytes);
		#end
	}
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
	
	#if (flash || cpp)
	var _image :flash.display.Bitmap;
	var _loader :flash.display.Loader;
	#elseif js
	var _image :js.Dom.Image;
	#end
	var _source :Source;
}
