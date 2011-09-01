package com.pblabs.engine.resource;

import Type;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import haxe.io.Bytes;

using Lambda;

/**
  * Base class for a Resource that loads it's sub-resources asynchronously 
  */
class LoadingResources<T> extends ResourcesBase<T>
{
	var _pending :Array<ResourceToken>;
	var _loading :Array<ResourceToken>;
	var _data :Map<ResourceToken, T>;

	#if flash
	var _loaders :Map<ResourceToken, flash.display.Loader>;
	var _urlloaders :Map<ResourceToken, flash.net.URLLoader>;
	#end
	
	public function new (name :String)
	{
		super(name);
		_data = Maps.newHashMap(ValueType.TClass(ResourceToken));
		_pending = [];
		_loading = [];
		
		#if flash
		_loaders = Maps.newHashMap(ValueType.TClass(ResourceToken));
		_urlloaders = Maps.newHashMap(ValueType.TClass(ResourceToken));
		#end
	}
	
	override public function add (token :ResourceToken) :Void
	{
		if (_data.get(token) != null) {
			return;
		} else {
			switch (token.source) {
				case linked (resource):
					if (resource != null) {
						_data.set(token, resource);
					}
				default: _pending.push(token);
			}
		}
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
		
		return _data.get(token);
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		super.load(onLoad, onError);
		
		if (_pending.length == 0 && _loading.length == 0) {
			onLoad();
			return;
		}
		
		for (token in _pending.copy()) {
			_pending.remove(token);
			_loading.push(token);
			
			switch (token.source) {
				case url (u): loadFromUrl(token, u);
				case bytes (b): loadFromBytes(token, b); 
				case text (t): loadFromString(token, t);
				case embedded (name): loadFromEmbedded(token);
				case derived (other): processDerivedToken(token, other);
				case linked (data):
					if (data != null) {
						_data.set(token, data);
					}
					_loading.remove(token);
				case none: throw "Not handled: none type";
				#if flash
				case swf (swfId): loadFromSwf(token, swfId);
				#end
			}
		}
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
		for (loader in _urlloaders) {
			if (loader != null) {
				try {
					loader.close();
				} catch (e :Dynamic) {
					// swallow the exception
				}
			}
		}
		_loaders.clear();
		_urlloaders.clear();
		#end
		_data.clear();
		_data = null;
		_pending = [];
		_loading = [];
	}
	
	function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		Preconditions.checkNotNull(token.url, "token.url is null");
		#if flash
		throw "Subclasses override";
		#else
		com.pblabs.util.Log.debug("loading url:" + token.url);
		var conn = new haxe.Http(token.url);
		var self = this;
		conn.onData = function (data :String) :Void {
			self._loading.remove(token);
			com.pblabs.util.Assert.isFalse(self._data.exists(token), "WTF? token already exists=" + token);
			self._data.set(token, self.createResourceFromJsUrlData(token, data));
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
	
	#if js
	function createResourceFromJsUrlData (token :ResourceToken, data :Dynamic) :T
	{
		throw "Subclasses overload";
		return null;
	}
	#end
	
	function loadFromBytes (token :ResourceToken, bytes :Bytes) :Void
	{
		throw "Subclasses override";
	}
	
	function loadFromString (token :ResourceToken, s :String) :Void
	{
		throw "Subclasses override";
	}
	
	function loadFromEmbedded (token :ResourceToken) :Void
	{
		throw "Subclasses override";
	}
	
	function processDerivedToken (token :ResourceToken, derivedFrom :ResourceToken) :Void
	{
		throw "Subclasses override";
	}
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
	
	function maybeFinish () :Void
	{
		if (_loading.length == 0 && _pending.length == 0) {
			loaded();
		}
	}
	
	#if flash
	function loadFromSwf (token :ResourceToken, swfId :String) :Void
	{
		throw "Subclasses override";
	}
	
	function createResourceFromFlashLoaderData (token :ResourceToken, loaderData :Dynamic) :T
	{
		throw "Subclasses override";
		return null;
	}
	
	function loadDisplayObjectFromUrl (token :ResourceToken, url :String) :Void
	{
		com.pblabs.util.Log.debug("loadDisplayObjectFromUrl " + token);
		try {
			var loader = new flash.display.Loader();
			_loaders.set(token, loader);
			var onComplete = function (e :flash.events.Event) :Void {
				com.pblabs.util.Log.debug("onComplete " + token);
				loader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
				loader.contentLoaderInfo.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
				_loading.remove(token);
				_data.set(token, createResourceFromFlashLoaderData(token, loader.content));
				_loaders.remove(token);
				maybeFinish();
			}
			
			com.pblabs.util.EventDispatcherUtil.addOnceListener(loader.contentLoaderInfo, flash.events.Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
			loader.contentLoaderInfo.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
			
			loader.load(new flash.net.URLRequest(url));
		} catch (e :flash.errors.SecurityError) {
			onLoadError(e);
		}
	}
	
	function loadDataFromUrl (token :ResourceToken, url :String) :Void
	{
		try {
			var loader = new flash.net.URLLoader();
			loader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
			_urlloaders.set(token, loader);
			var onComplete = function (e :flash.events.Event) :Void {
				com.pblabs.util.Log.debug("onComplete");
				_loading.remove(token);
				loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
				loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
				_data.set(token, createResourceFromFlashLoaderData(token, loader.data));
				_urlloaders.remove(token);
				maybeFinish();
			}
			
			com.pblabs.util.EventDispatcherUtil.addOnceListener(loader, flash.events.Event.COMPLETE, onComplete);
			loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
			loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
		} catch (e :flash.errors.SecurityError) {
			onLoadError(e);
		}
	}
	#end
	
}
