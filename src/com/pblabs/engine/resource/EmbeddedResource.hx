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
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;

/**
  * Generic embedded resources.
  * 
  * Represents assets embedded in some way.
  * First, haxe.Resource is checked.  If no resource is found there, then:
  *
  * On the JS platform, this means data in the page itself.  This waits for the page to load before allowing the elements to be accessed.
  * Used for e.g. loading SVG elements by id.  Returns a deep copy of the element, so you only need to 
  * embed each element once.
  *
  * On the flash platform, instantiates embedded classes.  Supply the class name after the "SWFResource_" prefix.
  */
class EmbeddedResource extends ResourceBase<Dynamic>
{
	public static var NAME :String = "embedded";

	public static function token <T>(key :String) :ResourceToken<T>
	{
	    return new ResourceToken(NAME, key);
	}
	
	var _haxeResources :Set<String>;
	
	public function new (?name :String = null)
	{
		super(name == null ? NAME : name);
		_haxeResources = Sets.fromArray(Sets.newSetOf(String), haxe.Resource.listNames());
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		super.load(onLoad, onError);
		#if js
		//Wait until the page has completed loading		
		var self = this;
		var pageLoaded = function (e :Dynamic) :Void {
			//Unload?  Is this necessary>?
			js.Lib.window.onload = null;
			self.loaded();
		}
		
		js.Lib.window.onload = pageLoaded;
		
		#elseif flash
		loaded();
		#end
	}
	
	override public function get (?elementName :String) :Dynamic
	{
		Preconditions.checkNotNull(elementName, "element name cannot be null");
		
		//Check haxe embedded resources first
		if (_haxeResources.exists(elementName)) {
			return haxe.Resource.getBytes(elementName);
		}
		
		//If no haxe embedded resources, check platforms specific embedding
		#if js
		var element = js.Lib.document.getElementById(elementName);
		Preconditions.checkNotNull(element, "No element with id=\"" + elementName + "\"");
		return element.cloneNode(true);
		#elseif flash
		var cls :Class<Dynamic> = Type.resolveClass(elementName.toUpperCase());
		
		if (cls == null) {
			cls = Type.resolveClass("SWFResources_" + elementName);
		}
		if (cls == null) {
			cls = Type.resolveClass(elementName);
		}
		if (cls == null) {
			cls = Type.resolveClass("SWFResources_" + elementName.toUpperCase());
		}
		
		Preconditions.checkNotNull(cls, "No embedded resource class SWFResources_" + elementName + " or " + elementName);
		return Type.createInstance(cls, com.pblabs.util.Constants.EMPTY_ARRAY);
		#end
	}
}
