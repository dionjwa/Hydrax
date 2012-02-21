package com.pblabs.engine.resource;

import Type;

import org.transition9.util.Preconditions;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;

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

	#if (flash || spaceport)
	var _loaders :Map<ResourceToken, flash.display.Loader>;
	var _urlloaders :Map<ResourceToken, flash.net.URLLoader>;
	#end
	
	public function new (name :String)
	{
		super(name);
		_data = Maps.newHashMap(ValueType.TClass(ResourceToken));
		_pending = [];
		_loading = [];
		
		#if (flash || spaceport)
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
		#if (flash || spaceport)
		if (_data.exists(token)) {
			return _data.get(token);
		} else { 
			//Load swf resources directly from the Swf, since by default they are not cached.
			switch (token.source) {
				case swf(swfName): return ResourceTools.instantiateEmbeddedClass(token.id); 
				//loadFromSwf(token, swfName);
				default:
			}
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
				#if (flash || spaceport)
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
		#if (flash || spaceport)
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
		#else
		org.transition9.util.Log.debug("loading url:" + token.url);
		var conn = new haxe.Http(token.url);
		var self = this;
		conn.onData = function (data :String) :Void {
			self._loading.remove(token);
			org.transition9.util.Assert.isFalse(self._data.exists(token), "WTF? token already exists=" + token);
			self._data.set(token, self.createResourceFromJsUrlData(token, data));
			self.maybeFinish();
			conn.onData = null;
			conn.onError = null;
		}
		conn.onError = function (e :Dynamic) :Void {
			if (self._onError != null) {
				self._onError(e);
			} else {
				org.transition9.util.Log.error("Resource " + token + " failed to load " + e);
			}
		}
		conn.request(false);
		#end
	}
	
	#if (js && !spaceport)
	function createResourceFromJsUrlData (token :ResourceToken, data :Dynamic) :T
	{
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
		return null;
	}
	#end
	
	function loadFromBytes (token :ResourceToken, bytes :Bytes) :Void
	{
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
	}
	
	function loadFromString (token :ResourceToken, s :String) :Void
	{
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
	}
	
	function loadFromEmbedded (token :ResourceToken) :Void
	{
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
	}
	
	function processDerivedToken (token :ResourceToken, derivedFrom :ResourceToken) :Void
	{
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
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
	
	#if (flash || spaceport)
	function loadFromSwf (token :ResourceToken, swfId :String) :Void
	{
		//Do nothing, images are loaded/instantiated from swfs as needed
		_loading.remove(token);
		maybeFinish();
	}
	// function loadFromSwf (token :ResourceToken, swfId :String) :Void
	// {
	// 	throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
	// }
	
	function createResourceFromFlashLoaderData (token :ResourceToken, loaderData :Dynamic) :T
	{
		throw Type.getClassName(Type.getClass(this)) + ":Subclasses override";
		return null;
	}
	
	function loadDisplayObjectFromUrl (token :ResourceToken, url :String) :Void
	{
		org.transition9.util.Log.debug("loadDisplayObjectFromUrl " + token);
		try {
			var loader = new flash.display.Loader();
			_loaders.set(token, loader);
			var self = this;
			var onComplete = function (e :flash.events.Event) :Void {
				org.transition9.util.Log.debug("onComplete " + token);
				loader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
				#if !spaceport
				loader.contentLoaderInfo.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
				#end
				self._loading.remove(token);
				self._data.set(token, self.createResourceFromFlashLoaderData(token, loader.content));
				self._loaders.remove(token);
				self.maybeFinish();
			}
			
			org.transition9.util.EventDispatcherUtil.addOnceListener(loader.contentLoaderInfo, flash.events.Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
			#if !spaceport
			loader.contentLoaderInfo.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
			#end
			
			loader.load(new flash.net.URLRequest(url));
		#if spaceport
		} catch (e :Dynamic) {
		#else
		} catch (e :flash.errors.SecurityError) {
		#end
			onLoadError(e);
		}
	}
	
	function loadDataFromUrl (token :ResourceToken, url :String) :Void
	{
		try {
			var loader = new flash.net.URLLoader();
			#if flash
			loader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
			#end
			_urlloaders.set(token, loader);
			var self = this;
			var onComplete = function (e :flash.events.Event) :Void {
				org.transition9.util.Log.debug("onComplete");
				self._loading.remove(token);
				loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
				#if flash
				loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
				#end
				self._data.set(token, self.createResourceFromFlashLoaderData(token, loader.data));
				self._urlloaders.remove(token);
				self.maybeFinish();
			}
			
			org.transition9.util.EventDispatcherUtil.addOnceListener(loader, flash.events.Event.COMPLETE, onComplete);
			loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
			#if flash
			loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
			#end
		#if flash
		} catch (e :flash.errors.SecurityError) {
		#else
		} catch (e :Dynamic) {
		#end
			onLoadError(e);
		}
	}
	#end
	
}
