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

import Type;

/**
  * Generic embedded resources.
  * 
  * Represents assets embedded in some way.
  * First, haxe.Resource is checked.  On the flash
  * platform, ff no resource is found there, then a swf
  * embedded class is instantiated.  You can supply the 
  * class name after the "SWFResource_" prefix.
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
		_haxeResources = Sets.fromArray(Sets.newSetOf(ValueType.TClass(String)), haxe.Resource.listNames());
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		super.load(onLoad, onError);
		loaded();
	}
	
	override public function get (?elementName :String) :Dynamic
	{
		Preconditions.checkNotNull(elementName, "element name cannot be null" + com.pblabs.util.Log.getStackTrace());
		
		//Check haxe embedded resources first
		if (_haxeResources.exists(elementName)) {
			return haxe.Resource.getBytes(elementName);
		}
		
		//If no haxe embedded resources, check platform specific embedding
		#if flash
		var cls :Class<Dynamic> = resolveEmbeddedClassName(elementName);
		Preconditions.checkNotNull(cls, "No embedded resource class SWFResources_" + elementName + " or " + elementName);
		return Type.createInstance(cls, com.pblabs.util.Constants.EMPTY_ARRAY);
		#end
		com.pblabs.util.Log.error("No embedded resource found: " + elementName);
		return null;
	}
	
	#if flash
	public static function resolveEmbeddedClassName (id :String) :Class<Dynamic>
	{
		var cls :Class<Dynamic> = Type.resolveClass(id.toUpperCase());
		if (cls != null)
			return cls;

		cls = Type.resolveClass("SWFResources_" + id);
		if (cls != null)
			return cls;
			
		cls = Type.resolveClass(id);
		if (cls != null)
			return cls;
			
		cls = Type.resolveClass("SWFResources_" + id.toUpperCase());
		if (cls == null) {
			com.pblabs.util.Log.error("Failed to resolve embedded class: " + id);
		}
		return cls;
	}
	#end
	
}
