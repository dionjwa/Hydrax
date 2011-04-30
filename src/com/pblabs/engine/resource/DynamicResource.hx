package com.pblabs.engine.resource;

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
	}
	
	function loadFromUrl (url) :Void
	{
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
	}
}
