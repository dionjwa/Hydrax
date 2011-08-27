package com.pblabs.engine.resource;

import Type;

using Lambda;
/**
  * Loads and stores String resources
  */
class StringResources extends LoadingResources<String>
{
	public function new (?name :String)
	{
		super(name != null ? name : Type.enumConstructor(ResourceType.STRING));
	}
	
	override public function get (token :ResourceToken) :String
	{
		switch (token.source) {
			case text(t): return t;
			default:
		}
		return super.get(token);
	}
	
	override function loadFromString (token :ResourceToken, s :String) :Void
	{
		_data.set(token, s);
		_loading.remove(token);
		maybeFinish();
	}
	
	override function loadFromEmbedded (token :ResourceToken) :Void
	{
		com.pblabs.util.Assert.isNotNull(haxe.Resource.getString(token.id), ' haxe.Resource.getString(' + token.id + ') is null');
		_data.set(token, haxe.Resource.getString(token.id));
		_loading.remove(token);
		maybeFinish();
	}
	
	#if flash
	override function loadFromSwf (token :ResourceToken, swfId :String) :String
	{
		if (!_data.exists(token)) {
			var data :flash.utils.ByteArray = ResourceTools.instantiateEmbeddedClass(token.id);
			// var swfResource :com.pblabs.engine.resource.flash.SwfResource = cast manager.getResource(swfId);
			// com.pblabs.util.Assert.isNotNull(swfResource, ' swfResource is null from swfId: ' + swfId);
			// var data :flash.utils.ByteArray = swfResource.createInstance(token.id);
			com.pblabs.util.Assert.isNotNull(data, ' data is null');
			
			_data.set(token, data.toString());
			
			_loading.remove(token);
			maybeFinish();
		}
		return _data.get(token); 
	}
	#end
}
