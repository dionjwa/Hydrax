/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource.flash;
import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Preconditions;

import flash.display.DisplayObject;
import flash.display.Loader;

import flash.errors.Error;

import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

using com.pblabs.util.EventDispatcherUtil;

class SwfResource extends ResourceBase<Dynamic> 
{
	public var applicationDomain(getApplicationDomain, null) :ApplicationDomain;
	public var displayRoot(getDisplayRoot, null) :DisplayObject;
	var _source :Source;
	var _loader :Loader;
	var _xorKey :Int;

	public function new (name :String, source :Source, ?xorkey :Int = -1)
	{
		super(name);
		_source = source;
		_xorKey = xorkey;
		
		_loader = new flash.display.Loader();
		var loader = _loader;
		var self = this;
		var onComplete = function (e :flash.events.Event) :Void {
			com.pblabs.util.Log.debug("onComplete");
			loader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
			loader.contentLoaderInfo.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			self.loaded();
			//Don't keep the source bytes hanging around.
			self._source = null;
		}
		
		loader.contentLoaderInfo.addOnceListener(flash.events.Event.COMPLETE, onComplete);
		loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
		loader.contentLoaderInfo.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Log.debug("load " + _source);
		super.load(onLoad, onError);
		var self = this;
		switch (_source) {
			case url (u): loadFromUrl(u);
			case bytes (b): loadFromBytes(b);
			default:
				com.pblabs.util.Log.error("Resource source type not handled: " + _source);
		}
	}
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
	
	function loadFromUrl (url :String) :Void
	{
		Preconditions.checkNotNull(url, "url is null");
		_loader.load(new flash.net.URLRequest(url));
	}
	
	function loadFromBytes (bytes :haxe.io.Bytes) :Void
	{
		Preconditions.checkNotNull(bytes, "bytes is null");
		
		if (_xorKey > 0) {
			bytes = com.pblabs.util.BytesUtil.xorBytes(bytes, _xorKey);
		}
		
		var context = new LoaderContext();

		// allowLoadBytesCodeExecution is an AIR-only LoaderContext property that must be true
		// to avoid 'SecurityError :Error #3015' when loading swfs with executable code
		try {
			Reflect.setField(context, "allowLoadBytesCodeExecution", true);
		} catch (e :Dynamic) {}

		context.applicationDomain = ApplicationDomain.currentDomain;
		_loader.loadBytes(bytes.getData(), context);
	}
	
	override public function unload () :Void
	{
		super.unload();
		
		try {
			if (!isLoaded()) {
				_loader.close();
			}
		} catch (e :Dynamic) {
		}

		try {
			_loader.unload();
		} catch (e :Dynamic) {
		}

		_loader = null;
		_source = null;
	}
	
	public function getSymbol (name :String) :Dynamic
	{
		try {
			return _loader.contentLoaderInfo.applicationDomain.getDefinition(name);
		} catch (e :Error) {
			// swallow the exception and return null
		}
		return null;
	}

	public function hasSymbol (name :String) :Bool
	{
		return _loader.contentLoaderInfo.applicationDomain.hasDefinition(name);
	}

	public function getClass (name :String) :Class<Dynamic>
	{
		return cast(getSymbol(name), Class<Dynamic>);
	}

	public function getApplicationDomain () :ApplicationDomain
	{
		return _loader.contentLoaderInfo.applicationDomain;
	}

	public function getDisplayRoot () :DisplayObject
	{
		return _loader.content;
	}
}
