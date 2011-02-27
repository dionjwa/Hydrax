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
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.util.Preconditions;
import com.pblabs.util.StringUtil;

import haxe.io.BytesData;

#if flash
using com.pblabs.util.EventDispatcherUtil;
#end

/**
  * Represents an XML blob loaded from somewhere.
  * Most, but not all, targets/Source types are implemented.  
  */
class XMLResource extends ResourceBase<Xml>
{
	public function new (name :String, source :Source)
	{
		super(name);
		_source = source;
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		super.load(onLoad, onError);
		try{
			switch (_source) {
				case url (u): loadFromUrl(u);
				case bytes (b): loadFromBytes(b);
				case text (t): loadFromText(t);
				case embedded (n): loadFromEmbedded(n);
				default:
					com.pblabs.util.Log.error("Resouce source type not handled: " + _source);
			}
		} catch (e :Dynamic) {
			onError(e);
		}
		
		//Unlink the source ref, we don't need it now
		_source = null;
	}
	
	override public function create (?name :String) :Xml
	{
		if (name != null) {
			com.pblabs.util.Log.error("create(name): name argument is ignored");
		}
		return _xml.firstElement();
	}
	
	override public function unload () :Void
	{
		super.unload();
		_source = null;
		_xml = null;
		_data = null;
	}
	
	#if debug
	override public function toString () :String
	{
		return StringUtil.objectToString(this, ["_name", "_xml"]);
	}
	#end
	
	function loadFromUrl (url :String) :Void
	{
		Preconditions.checkNotNull(url, "url is null");
		#if flash
		var self = this;
		var urlLoader = new flash.net.URLLoader();
		urlLoader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
		var onComplete = function (e :flash.events.Event) :Void {
			urlLoader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
			urlLoader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			self.createXMLFromData(urlLoader.data);
		}
		
		urlLoader.addOnceListener(flash.events.Event.COMPLETE, onComplete);
		urlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
		urlLoader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
		urlLoader.load(new flash.net.URLRequest(url));
		#else
		throw "Platform cannot load xml from source=" + _source;
		#end
		
	}
	
	function loadFromBytes (bytes :BytesData) :Void
	{
		Preconditions.checkNotNull(bytes, "bytes is null");
		#if flash
		createXMLFromData(bytes.readUTFBytes(bytes.length));
		#else
		throw "Not implemented";
		#end
	}
	
	function loadFromText (txt :String) :Void
	{
		Preconditions.checkNotNull(txt, "txt is null");
		createXMLFromData(txt);
	}
	
	function loadFromEmbedded (embeddedName :String) :Void
	{
		com.pblabs.util.Log.debug("loadFromEmbedded");
		#if flash
		var cls :Class<Dynamic> = Type.resolveClass("SWFResources_" + embeddedName);
		Preconditions.checkNotNull(cls, "No embedded resource class SWFResources_" + embeddedName);
		var bytes :flash.utils.ByteArray = cast Type.createInstance(cls, []);
		try {
			loadFromBytes(bytes);
		} catch (e :Dynamic) {
			if (cls != null && Reflect.field(cls, "data") != null) {
				createXMLFromData(Reflect.field(cls, "data"));
			} else {
				onLoadError("missing XML data! (From embedded class " +cls);
			}
		}
		#else
		throw "Not implemented: embedded XML in this target";
		#end
	}
	
	function createXMLFromData (data :Dynamic) :Void
	{
		_data = data;
		// Catch possible XML parsing errors
		try {
			_xml = Xml.parse(data);
		} catch (e :Dynamic) {
			_onError(e);
		}
		loaded();
		//Release the ref to the source data;
		_data = null;
	}
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
	
	var _xml :Xml;
	var _data :Dynamic;
	var _source :Source;
}
