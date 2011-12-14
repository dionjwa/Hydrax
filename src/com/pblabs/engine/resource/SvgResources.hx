package com.pblabs.engine.resource;

import com.pblabs.engine.core.IPBContext;
import org.transition9.util.svg.SvgData;
import org.transition9.util.svg.SvgReplace;

/**
  * Loads and stores SvgData resources.
  * SvgData objects are used instead of Strings or Xml 
  * to avoid wasteful excess interconverting between the two.
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
			org.transition9.util.Assert.isNotNull(rsrc.get(base), ' null rsrc.get(' + base + ')');
			org.transition9.util.Assert.isNotNull(cast(rsrc.get(base), SvgData).data, ' rsrc.get(base).data is null');
			return base;
		}
		
		//A key for checking if the derived svg exists
		var derivedToken = createDerivedResourceToken(base, replacements);
		if (rsrc.get(derivedToken) == null) {
			//We need the base svg for modifiying, so check if it exists
			org.transition9.util.Assert.isNotNull(rsrc.get(base), ' rsrc.get(base) is null, base=' + base);
			org.transition9.util.Assert.isNotNull(cast(rsrc.get(base), SvgData).data, ' rsrc.get(base).data is null, base=' + rsrc.get(base));
			//Create the SvgData object with the replacements.
			var newSvg = new SvgData(derivedToken.id, cast(rsrc.get(base), SvgData).data, replacements);
			//The derived token contains the SvgData.  The SvgResources will add it to the map when retrieved
			derivedToken = new ResourceToken(derivedToken.id, Source.linked(newSvg), ResourceType.SVG);
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
	}
	
	override public function get (token :ResourceToken) :SvgData
	{
		switch (token.source) {
			default: //Nothing
			case linked (resource):
				if (_data.get(token) == null) {
					_data.set(token, resource);
				}
				return resource;
		}
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
		org.transition9.util.Assert.isNotNull(haxe.Resource.getString(token.id), ' haxe.Resource.getString(' + token.id + ') is null');
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
		return new SvgData(token.id, Std.string(data));
	}
	#end
	
	#if flash
	override function loadFromSwf (token :ResourceToken, swfId :String) :Void
	{
			var data :flash.utils.ByteArray = ResourceTools.instantiateEmbeddedClass(token.id);
			org.transition9.util.Assert.isNotNull(data, ' data is null');
			_data.set(token, new SvgData(token.id, data.toString()));
			org.transition9.util.Assert.isNotNull(_data.get(token).data, ' _data.get(token).data is null');
			_loading.remove(token);
			maybeFinish();
	}
	#end
}
