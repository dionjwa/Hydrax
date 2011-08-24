/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.util.Equalable;

class ResourceToken
	implements Equalable<ResourceToken>, implements com.pblabs.util.ds.Hashable, implements de.polygonal.ds.Hashable
{
	public var key :Int;
	// public var resourceId (default, null) :String;
	public var source :Source;
	/** Set by the ResourceManager */
	// public var resourceId :String;
	
	/** The class name for swf embedded resources.  For stand alone resources, it's null */
	public var id (default, null) :String;
	public var type (default, null) :ResourceType;
	public var url (get_url, null) :String;

	var _hashCode :Int;
	
	public function new (id :String, source :Source, type :ResourceType)
	{
		// this.resourceId = resourceId;
		this.source = source;
		this.id = id;
		this.type = type;
		// this.url = url;
		//Only hash the id and the type.  The source should not matter for hashing.
		_hashCode = com.pblabs.util.StringUtil.hashCode("Resource[id=" + id + ", type=" + Type.enumConstructor(type) +"]");
		
		
		// ", source=" + Type.enumConstructor(source) + ", type=" + Type.enumConstructor(type) +"]";//+ ", resourceId=" + resourceId
		// + ", source=" + sourceStr
		
		
		// id + "::" + 
		// 	switch (source) {
		// 		case url (u): u;
		// 		case bytes (b): "bytes";
		// 		case text (t): haxe.Md5.encode(t);
		// 		case embedded (name): name;
		// 		case swf(swfName): swfName;
		// 	} + 
		// 	switch (type) {
		// 		case IMAGE: 
		// 		case SVG: 
		// 		case STRING: 
		// 		case CLASS: 
		// 		case SWF: 
		// 		case BITMAP_CACHE(other :ResourceToken): 
		// 	});
			
			
			
		// resourceId = null;
		
		// #if flash
		// switch (source) {
		// 	case swf(swfName): resourceId = swfName;
		// 	default:
		// }
		// #end
		
	}
	
	public function equals (other :ResourceToken) :Bool
	{
	    return type == other.type && id == other.id;
	}
	
	inline public function hashCode () :Int
	{
	    return _hashCode;
	}
	
	public function toString () :String
	{
		var sourceStr :String = switch (source) {
			//The compiler doesn't like the 'u'.  Why???
			// case url (u): "url:";// + u;
			case bytes (b): "bytes";
			case text (t): "texthash:" + haxe.Md5.encode(t);
			case embedded (name): "embedded:" + name;
			case swf(swfName): "swf:" + swfName;
			default: Std.string(source);
		} 
		
		
		return "Resource[id=" + id
		// ", source=" + Type.enumConstructor(source) + ", type=" + Type.enumConstructor(type) +"]";//+ ", resourceId=" + resourceId
		// + ", source=" + sourceStr
		+ ", type=" + 	Type.enumConstructor(type) +"]";
	}
	
	function get_url () :String
	{
		switch (source) {
			case Source.url (u): return u; 
			default: com.pblabs.util.Log.error("ResourceType does not have an URL: " + this);
		}
		return null;
	}
}
