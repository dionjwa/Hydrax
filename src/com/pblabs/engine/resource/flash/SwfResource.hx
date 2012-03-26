/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource.flash;

import com.pblabs.components.Constants;
import com.pblabs.engine.resource.ResourcesBase;
import com.pblabs.engine.resource.Source;
import org.transition9.util.Preconditions;

import flash.display.DisplayObject;
import flash.display.Loader;

#if !spaceport
import flash.errors.Error;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
#end


using org.transition9.util.EventDispatcherUtil;
using Lambda;

class SwfResource extends ResourcesBase<Dynamic> 
{
	#if !spaceport
	public var applicationDomain (get_applicationDomain, never) :ApplicationDomain; function get_applicationDomain () :ApplicationDomain { return _loader.contentLoaderInfo.applicationDomain; }
	#end
	public var displayRoot (get_displayRoot, never) :DisplayObject; function get_displayRoot () :DisplayObject { return _loader.content; }
	public var loader (get_loader, never) :Loader; function get_loader () :Loader { return _loader; }

	var _source :Source;
	var _loader :Loader;
	var _xorKey :Int;
	
	public function new (name :String, source :Source, ?xorkey :Int = -1)
	{
		super(name);
		org.transition9.util.Log.debug("New SWFResource!!");
		_source = source;
		_xorKey = xorkey;
	}
	
	override public function add (resourceToken :ResourceToken) :Void
	{
		//Ignore adding resource tokens.
	}
	
	function createLoader () :Void
	{
		if (_loader != null) {
			return;
		}
		_loader = new flash.display.Loader();
		org.transition9.util.Log.debug("Creating loader for swf '" + name +"'");
		var loader = _loader;
		var self = this;
		var onComplete = null;
		onComplete = function (e :flash.events.Event) :Void {
			trace("done loading");
			org.transition9.util.Log.info("done loading swf '" + name +"'");
			org.transition9.util.Log.debug("onComplete");
			loader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, onComplete);
			#if !spaceport
				loader.contentLoaderInfo.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
				loader.contentLoaderInfo.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
			#end
			self.loaded();
			//Don't keep the source bytes hanging around.
			switch (self._source) {
				case bytes(b): self._source = null;
				default: //Do nothing
			}
			
		}
		
		loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onComplete);
		#if !spaceport
			loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
			loader.contentLoaderInfo.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
		#end
	}
	
	/** Assume we want to instantiate a class */
	// override public function get (?name :String) :Dynamic
	override public function get (token :ResourceToken) :Dynamic
	{
		org.transition9.util.Assert.isNotNull(token, "Must supply a token for SwfResources.get");
		switch (token.type) {
			// case IMAGE_DATA:
			default: return createInstance(token.id);
		}
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		org.transition9.util.Assert.isNotNull(_source, "Null sourc. Reloading Source.bytes fails.");
		org.transition9.util.Log.debug("load " + _source);
		super.load(onLoad, onError);
		var self = this;
		createLoader();
		switch (_source) {
			case url (u) :loadFromUrl(u);
			#if !spaceport
			case bytes (b) :loadFromBytes(b);
			case embedded (name) :loadFromEmbedded(name);
			#end
			default :
				org.transition9.util.Log.error("Resource source type not handled :" + _source);
		}
	}
	
	function onLoadError (e :Dynamic) :Void
	{
		_onError(e);
	}
	
	function loadFromUrl (url :String) :Void
	{
		#if !spaceport
			var context = new LoaderContext();
			// default to loading symbols into a subdomain
			// context.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
			context.applicationDomain = ApplicationDomain.currentDomain;
			// context.checkPolicyFile = true;
		#end
		Preconditions.checkNotNull(url, "url is null");
		#if spaceport
			flash.Lib.onSpaceportReady(function () :Void {
				_loader.load(new flash.net.URLRequest(url));
			});
		#else
			_loader.load(new flash.net.URLRequest(url), context);
		#end
	}
	
	#if !spaceport
	function loadFromBytes (bytes :haxe.io.Bytes) :Void
	{
		Preconditions.checkNotNull(bytes, "bytes is null");
		
		if (_xorKey > 0) {
			bytes = org.transition9.util.BytesUtil.xorBytes(bytes, _xorKey);
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
	
	/**
	  * Embedded here is either an embedded swf using the compiler --resource command,
	  * where the swf is then embedded as bytes, or when the swf is compiled as a binary lump
	  * in another swf that is then compiled in using the -swflib compiler command 
	  * (creating classes of all the embedded resources).
	  */
	function loadFromEmbedded (id :String) :Void
	{
		//Check haxe embedded resources first
		if (haxe.Resource.listNames().has(id)) {
			loadFromBytes(haxe.Resource.getBytes(id));
			return;
		}
		var cls :Class<Dynamic> = ResourceTools.resolveEmbeddedClassName(id);
		if (cls == null) {
			if (_onError != null) {
				_onError("No embedded class: " + id);
			}
		} else {
			//It's a ByteArray/Asset
			trace("Instantiating class=" + Type.getClassName(cls));
			loadFromBytes(haxe.io.Bytes.ofData(Type.createInstance(cls, org.transition9.util.Constants.EMPTY_ARRAY)));
		}
	}
	#else
	public function getSymbolNames () :String
	{
		return _loader.contentLoaderInfo.applicationDomain.definitions;
	}
	#end
	
	override public function unload () :Void
	{
		super.unload();
		
		#if !spaceport
		try {
			if (!isLoaded()) {
				_loader.close();
			}
		} catch (e :Dynamic) {}

		try {
			_loader.unload();
		} catch (e :Dynamic) {}
		#end
		
		_loader = null;
		#if !(debug || editor)
		_source = null;
		#end
	}
	
	public function getSymbol (name :String) :Class<Dynamic>
	{
		#if spaceport
		return _loader.contentLoaderInfo.applicationDomain.getDefinition(name);
		#else
		try {
			return _loader.contentLoaderInfo.applicationDomain.getDefinition("SWFResources_" + name);
		} catch (e :Error) {
			// swallow the exception and return null
			try {
				return _loader.contentLoaderInfo.applicationDomain.getDefinition(name);
			} catch (e :Dynamic) {
				// swallow the exception and return null
			}
		}
		return null;
		#end
	}

	public function hasSymbol (name :String) :Bool
	{
		return _loader.contentLoaderInfo.applicationDomain.hasDefinition(name) || _loader.contentLoaderInfo.applicationDomain.hasDefinition("SWFResources_" + name);
	}

	public function getClass (name :String) :Class<Dynamic>
	{
		return cast(getSymbol(name), Class<Dynamic>);
	}
	
	public function createInstance (name :String) :Dynamic
	{
		var cls = getClass(name);
		org.transition9.util.Assert.isNotNull(cls, name + " is not defined in " + this);
		return Type.createInstance(cls, Constants.EMPTY_ARRAY);
	}
}
