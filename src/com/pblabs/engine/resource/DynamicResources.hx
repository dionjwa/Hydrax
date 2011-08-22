package com.pblabs.engine.resource;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import Type;

using Lambda;
/**
  * Loads and stores String resources
  */
class DynamicResources<T> extends ResourceBase<T>
{
	var _pending :Array<ResourceToken>;
	var _loading :Array<ResourceToken>;
	var _data :Map<ResourceToken, T>;
	
	#if flash
	var _loaders :Map<ResourceToken, flash.net.URLLoader>;
	#end
	
	public function new (source :Source)
	{
		super(Type.enumConstructor(source));
		_data = Maps.newHashMap(ValueType.TClass(ResourceToken));
		_pending = [];
		_loading = [];
		
		#if flash
		_loaders = Maps.newHashMap(ValueType.TClass(ResourceToken));
		#end
	}
	
	override public function add (token :ResourceToken) :Void
	{
		_pending.push(token);
	}
	
	override public function get (token :ResourceToken) :T
	{
		return _data.get(token);
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		// com.pblabs.util.Log.debug("load " + _source);
		super.load(onLoad, onError);
		
		for (token in _pending.copy()) {
			_pending.remove(token);
			_loading.push(token);
			
			switch (token.source) {
				case url (u): loadFromUrl(token, url);
				case bytes (b): loadFromBytes(token, b); 
				case text (t): loadFromString(token, t)
				case embedded (name): loadFromEmbedded(token);
				#if flash
				case swf (swfId): loadFromSwf(token, swfId);
				#end
			}
		}
	}
	
	override public function unload () :Void
	{
		super.unload();
		_data.clear();
		_data = null;
		_pending = [];
		_loading = [];
		
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
	
	function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		Preconditions.checkNotNull(token.url, "token.url is null");
		#if flash
		var loader = createLoader();
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
		//Check haxe embedded resources first
		if (haxe.Resource.listNames().has(token.id)) {
			_data.set(token, haxe.Resource.getString(token.id));
		} else {
			com.pblabs.util.Log.error("No embedded resource found: " + token.id);
		}
		_loading.remove(token);
		maybeFinish();
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
	
	function createLoader (token :ResourceToken) :flash.net.URLLoader
	{
		var loader = new flash.net.URLLoader();
		loader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
		_loaders.set(token, loader);
		var self = this;
		var onComplete = function (e :flash.events.Event) :Void {
			com.pblabs.util.Log.debug("onComplete");
			_loading.remove(token);
			loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
			loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			_data.set(token, loader.data);
			_loaders.remove(token);
			maybeFinish();
		}
		
		com.pblabs.util.EventDispatcherUtil.addOnceListener(loader, flash.events.Event.COMPLETE, onComplete);
		loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
		loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
		return loader; 
	}
	#end
}
