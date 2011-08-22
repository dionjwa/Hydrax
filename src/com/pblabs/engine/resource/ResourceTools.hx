package com.pblabs.engine.resource;

class ResourceTools
{
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
