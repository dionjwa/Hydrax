package ;

import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;

using StringTools;

using com.pblabs.util.XmlTools;

class Resources 
{
	public static var RESOURCESWF = "resources";
	public static var all = new Hash<ResourceToken>();
	public static var list = new AllResources(all.get);

	/** Parse the image data from resources.xml */
	public static function init () :Void
	{
		for (key in all.keys()) {
			all.remove(key);
		}
		
		var resourceXml = Xml.parse(haxe.Resource.getString(com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/resources.xml")));
		for (rc in resourceXml.child("resources")) {
			if (rc.nodeType != Xml.Element) {
				continue;
			}
			#if flash
			var type = Type.createEnum(ResourceType, rc.nodeName.toUpperCase());
			var data = switch (type) {
				case CLASS, IMAGE_DATA,IMAGE, SVG, STRING: new ResourceToken(rc.get("id"), Source.swf("resources"), type);
				case SWF: new ResourceToken(rc.get("id"), Source.url(rc.get("url")), type);
				default: null;
			}
			#elseif js
			var type = Type.createEnum(ResourceType, rc.nodeName.toUpperCase());
			var data = switch (type) {
				case IMAGE: new ResourceToken(rc.get("id"), Source.url(rc.get("url")), type);
				case SVG: new ResourceToken(rc.get("id"), Source.url("http://localhost:8000/" + rc.get("url")), type);
				case STRING: new ResourceToken(rc.get("id"), Source.url(rc.get("url")), type);
				case IMAGE_DATA: throw "Not defined in resources.xml";
				default: null;
			}
			#end
			if (data != null) {
				all.set(data.id, data);
			}
		}
	}
}

class AllResources extends haxe.xml.Proxy<"resources.xml", ResourceToken> {
}
