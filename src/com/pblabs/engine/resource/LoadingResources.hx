package com.pblabs.engine.resource;

import Type;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import haxe.io.Bytes;

using Lambda;

/**
  * Base class for a Resource that loads it's sub-resources asynchronously 
  */
class LoadingResources<T> extends ResourceBase<T>
{
	var _pending :Array<ResourceToken>;
	var _loading :Array<ResourceToken>;
	var _data :Map<ResourceToken, T>;
	
	public function new (name :String)
	{
		super(name);
		_data = Maps.newHashMap(ValueType.TClass(ResourceToken));
		_pending = [];
		_loading = [];
	}
	
	override public function add (token :ResourceToken) :Void
	{
		if (!_data.exists(token)) {
			_pending.push(token);
		}
	}
	
	override public function get (token :ResourceToken) :T
	{
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
				case imageData (data) :com.pblabs.util.Log.error("imageData ignored " + token);
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
	}
	
	function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		throw "Subclasses override";
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
	}
	
	function processDerivedToken (token :ResourceToken, derivedFrom :ResourceToken) :Void
	{
		throw "Subclasses override";
	}
	
	#if flash
	function loadFromSwf (token :ResourceToken, swfId :String) :T
	{
		throw "Subclasses override";
		return null;
	}
	#end
	
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
}
