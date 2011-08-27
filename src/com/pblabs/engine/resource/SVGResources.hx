package com.pblabs.engine.resource;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.util.svg.SvgData;
import com.pblabs.util.svg.SvgReplace;

/**
  * Loads and stores String(Svg) resources
  */
class SvgResources extends LoadingResources<SvgData>
{
	/**
	  * Given an svg reference and replacements, returns a token linking to perhaps modified Svg
	  */
	public static function getSvgResourceToken (context :IPBContext, base :ResourceToken, 
		?replacements :Array<SvgReplace>) :ResourceToken
	{
		var rsrc = context.getManager(IResourceManager);
		if (replacements == null || replacements.length == 0) {
			com.pblabs.util.Assert.isNotNull(rsrc.get(base), ' null rsrc.get(' + base + ')');
			com.pblabs.util.Assert.isNotNull(cast(rsrc.get(base), SvgData).data, ' rsrc.get(base).data is null');
			return base;
		}
		
		//A key for checking if the derived svg exists
		var derivedToken = createDerivedResourceToken(base, replacements);
		// trace('derivedToken=' + derivedToken);
		if (rsrc.get(derivedToken) == null) {
			// trace("rsrc.get(derivedToken) null, adding");
			//We need the base svg for modifiying, so check if it exists
			com.pblabs.util.Assert.isNotNull(rsrc.get(base), ' rsrc.get(base) is null, base=' + base);
			com.pblabs.util.Assert.isNotNull(cast(rsrc.get(base), SvgData).data, ' rsrc.get(base).data is null, base=' + rsrc.get(base));
			//Create the SvgData object with the replacements.
			var newSvg = new SvgData(derivedToken.id, cast(rsrc.get(base), SvgData).data, replacements);
			// var svgResources :SvgResources = cast rsrc.getResource(Type.enumConstructor(ResourceType.SVG));
			// com.pblabs.util.Assert.isNotNull(svgResources, ' svgResources is null');
			//The derived token contains the SvgData.  The SvgResources will add it to the map when retrieved
			derivedToken = new ResourceToken(derivedToken.id, Source.linked(newSvg), ResourceType.SVG);
			// svgResources.add(derivedToken);
		}
		return derivedToken;
	}
	
	static function createDerivedId (originalId :String, replacements :SvgReplacements) :String
	{
		return originalId + "+" + replacements.toString();
	}
	
	static function createDerivedResourceToken (baseToken :ResourceToken, ?replacements :Array<SvgReplace>) :ResourceToken
	{
		if (replacements == null || replacements.length == 0) {
			return baseToken;
		} else {
			return new ResourceToken(createDerivedId(baseToken.id, new SvgReplacements(replacements)), Source.none, ResourceType.SVG);
		}
	}
	
	public function new ()
	{
		super(Type.enumConstructor(ResourceType.SVG));
	}
	
	override public function add (token :ResourceToken) :Void
	{
		switch (token.type) {
			case SVG://ok
			default: throw "Must be of type SVG";
		}
		super.add(token);
		// if (_data.exists(token)) {
		// 	return;
		// } else {
		// 	if (value == null) {
		// 		switch (token.source) {
		// 			case text (t):
		// 				_data.set(token, new SvgData(token.id, null, t));
		// 			default: throw "If you don't supply a token value, then you must embed the svg as a Source.text(....)";
		// 		}
		// 	} else {
		// 		_data.set(token, value);
		// 	}
		// 	return _data.get(token);
		// }
	}
	
	override public function get (token :ResourceToken) :SvgData
	{
		// trace("get " + token);
		switch (token.source) {
			default: //Nothing
			case linked (resource):
				if (_data.get(token) == null) {
					_data.set(token, resource);
				}
				return resource;
		}
		// com.pblabs.util.Assert.isNotNull(_data.get(token), ' _data.get(token) is null');
		return _data.get(token);
	}
	
	override function loadFromString (token :ResourceToken, s :String) :Void
	{
		_data.set(token, new SvgData(token.id, s));
		_loading.remove(token);
		maybeFinish();
	}
	
	override function loadFromEmbedded (token :ResourceToken) :Void
	{
		com.pblabs.util.Assert.isNotNull(haxe.Resource.getString(token.id), ' haxe.Resource.getString(' + token.id + ') is null');
		_data.set(token, new SvgData(token.id, haxe.Resource.getString(token.id)));
		_loading.remove(token);
		maybeFinish();
	}
	
	#if flash
	override function loadFromUrl (token :ResourceToken, url :String) :Void
	{
		loadDataFromUrl(token, url);
	}
	override function createResourceFromFlashLoaderData (token :ResourceToken, loaderData :Dynamic) :SvgData
	{
		return new SvgData(token.id, Std.string(loaderData));
	}
	#end
	
	#if js
	override function createResourceFromJsUrlData (token :ResourceToken, data :Dynamic) :SvgData
	{
		// trace("");
		// trace("createResourceFromJsUrlData token=" + token + "\n  data:\n" + data);
		return new SvgData(token.id, Std.string(data));
	}
	#end
	
	#if flash
	override function loadFromSwf (token :ResourceToken, swfId :String) :Void
	{
		// trace("loadFromSwf " + token);
		// if (!_data.exists(token)) {
			var data :flash.utils.ByteArray = ResourceTools.instantiateEmbeddedClass(token.id);
			com.pblabs.util.Assert.isNotNull(data, ' data is null');
			_data.set(token, new SvgData(token.id, data.toString()));
			com.pblabs.util.Assert.isNotNull(_data.get(token).data, ' _data.get(token).data is null');
			_loading.remove(token);
			maybeFinish();
		// }
		// return _data.get(token); 
	}
	
	// override function createLoader (token :ResourceToken) :flash.net.URLLoader
	// {
	// 	var loader = new flash.net.URLLoader();
	// 	loader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
	// 	_loaders.set(token, loader);
	// 	var self = this;
	// 	var onComplete = function (e :flash.events.Event) :Void {
	// 		com.pblabs.util.Log.debug("onComplete");
	// 		self._loading.remove(token);
	// 		loader.removeEventListener(flash.events.IOErrorEvent.IO_ERROR, self.onLoadError);
	// 		loader.removeEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, self.onLoadError);
	// 		self._data.set(token, new SvgData(token.id, loader.data));
	// 		self._loaders.remove(token);
	// 		self.maybeFinish();
	// 	}
		
	// 	com.pblabs.util.EventDispatcherUtil.addOnceListener(loader, flash.events.Event.COMPLETE, onComplete);
	// 	loader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, onLoadError);
	// 	loader.addEventListener(flash.events.SecurityErrorEvent.SECURITY_ERROR, onLoadError);
	// 	return loader; 
	// }
	#end
}
