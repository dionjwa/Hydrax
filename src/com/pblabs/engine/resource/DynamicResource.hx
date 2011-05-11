package com.pblabs.engine.resource;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

/**
  * An untyped resource, currently loading only from URLs.
  * Mostly a placeholder, allowing loading from URLs until I figure out
  * if a typed version is more appropriate.
  */
class DynamicResource extends ResourceBase<Dynamic>
{
	var _source :Source;
	var _data :Dynamic;
	
	#if flash
	var _loader :flash.net.URLLoader;
	#end
	
	public function new (name :String, source :Source)
	{
		super(name);
		_source = source;
	}
	
	override public function get (?name :String) :Dynamic
	{
		return _data;
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Log.debug("load " + _source);
		super.load(onLoad, onError);
		switch (_source) {
			case url (u): loadFromUrl(u);
			case bytes (b): com.pblabs.util.Log.error("Resource source type not handled: " + _source); 
			case text (t): com.pblabs.util.Log.error("Resource source type not handled: " + _source);
			case embedded (name): com.pblabs.util.Log.error("Resource source type not handled: " + _source);
		}
	}
	
	override public function unload () :Void
	{
		super.unload();
		_source = null;
		_data = null;
		
		#if flash
		if (_loader != null) {
			try {
				_loader.close();
			} catch (e :Dynamic) {
				// swallow the exception
			}
			_loader = null;
		}
		#end
	}
	
	function loadFromUrl (url) :Void
	{
		Preconditions.checkNotNull(url, "url is null");
		#if flash
		createLoader();
		try {
			_loader.load(new flash.net.URLRequest(url));
		} catch (e :flash.errors.SecurityError) {
			onLoadError(e);
		}
		#else
		com.pblabs.util.Log.debug("loading url:" + url);
		var self = this;
		var conn = new haxe.Http(url);
		conn.onData = function (data :String) :Void {
			self._data = data;
			self.loaded();
			conn.onData = null;
			conn.onError = null;
		}
		conn.onError = function (e :Dynamic) :Void {
			if (self._onError != null) {
				self._onError(e);
			} else {
				com.pblabs.util.Log.error("Resource " + self._source + " failed to load " + e);
			}
		}
		conn.request(false);
		#end
	}
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
	
	#if flash
	function createLoader () :Void
	{
		com.pblabs.util.Assert.isNull(_loader);
		_loader = new flash.net.URLLoader();
		_loader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
		var loader = _loader;
		var self = this;
		var onComplete = function (e :flash.events.Event) :Void {
			com.pblabs.util.Log.debug("onComplete");
			loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
			loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			self._data = cast loader.data;
			self.loaded();
		}
		
		
		com.pblabs.util.EventDispatcherUtil.addOnceListener(loader, flash.events.Event.COMPLETE, onComplete);
		loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
		loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
	}
	#end
}
