package com.pblabs.engine.resource;

import org.transition9.util.Constants;

class ResourceTools
{
	#if (flash || spaceport)
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
			org.transition9.util.Log.error("Failed to resolve embedded class: " + id);
		}
		return cls;
	}
	
	public static function instantiateEmbeddedClass (id :String) :Dynamic
	{
		var cls :Class<Dynamic> = resolveEmbeddedClassName(id);
		if (cls == null) {
			return null;
		}
		return Type.createInstance(cls, Constants.EMPTY_ARRAY);
	}
	
	#end
}
