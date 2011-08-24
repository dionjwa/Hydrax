package com.pblabs.engine.resource;

import Type;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import haxe.io.Bytes;

using Lambda;

/**
  * Loads and stores String resources
  */
class DynamicResources<T> extends LoadingResources<T>
{
	#if flash
	var _loaders :Map<ResourceToken, flash.net.URLLoader>;
	#end
	
	public function new (name :String)
	{
		super(name);
		#if flash
		_loaders = Maps.newHashMap(ValueType.TClass(ResourceToken));
		#end
	}
	
	override public function get (token :ResourceToken) :T
	{
		#if flash
		//Load swf resources directly from the Swf, since by default they are not cached.
		switch (token.source) {
			case swf(swfName): return ResourceTools.instantiateEmbeddedClass(token.id); 
			//loadFromSwf(token, swfName);
			default:
		}
		#end
		
		return super.get(token);
	}
	
	override public function unload () :Void
	{
		super.unload();
		#if flash
		for (loader in _loaders) {
			if (loader != null) {
				try {
					loader.close();
				} catch (e :Dynamic) {
					// swallow the exception
				}
			}
		}
		_loaders.clear();
		#end
	}
	
	override function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		Preconditions.checkNotNull(token.url, "token.url is null");
		#if flash
		var loader = createLoader(token);
		try {
			loader.load(new flash.net.URLRequest(url));
		} catch (e :flash.errors.SecurityError) {
			onLoadError(e);
		}
		#else
		com.pblabs.util.Log.debug("loading url:" + token.url);
		var self = this;
		var conn = new haxe.Http(token.url);
		conn.onData = function (data :String) :Void {
			self._loading.remove(token);
			self._data.set(token, data);
			self.maybeFinish();
			conn.onData = null;
			conn.onError = null;
		}
		conn.onError = function (e :Dynamic) :Void {
			if (self._onError != null) {
				self._onError(e);
			} else {
				com.pblabs.util.Log.error("Resource " + token + " failed to load " + e);
			}
		}
		conn.request(false);
		#end
	}
	
	#if flash
	override function loadFromSwf (token :ResourceToken, swfId :String) :T
	{
		//We don't need to preload swf assets. Load them as needed
		_loading.remove(token);
		maybeFinish();
		return null;
	}
	
	function createLoader (token :ResourceToken) :flash.net.URLLoader
	{
		var loader = new flash.net.URLLoader();
		loader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
		_loaders.set(token, loader);
		var self = this;
		var onComplete = function (e :flash.events.Event) :Void {
			com.pblabs.util.Log.debug("onComplete");
			self._loading.remove(token);
			loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
			loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			self._data.set(token, loader.data);
			self._loaders.remove(token);
			self.maybeFinish();
		}
		
		com.pblabs.util.EventDispatcherUtil.addOnceListener(loader, flash.events.Event.COMPLETE, onComplete);
		loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
		loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
		return loader; 
	}
	#end
}
