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
	implements Equalable<ResourceToken>, implements com.pblabs.util.ds.Hashable
{
	// public var resourceId (default, null) :String;
	public var source :Source;
	/** Set by the ResourceManager */
	// public var resourceId :String;
	
	/** The class name for swf embedded resources.  For stand alone resources, it's null */
	public var id (default, null) :String;
	public var type (default, null) :ResourceType;
	public var url (get_url, null) :String;

	var _hashCode :Int;
	
	// public function new (resourceId :String, ?id :String = null, ?type :ResourceType, ?url :String)
	public function new (id :String, source :Source, type :ResourceType)
	{
		// this.resourceId = resourceId;
		this.source = source;
		this.id = id;
		this.type = type;
		// this.url = url;
		_hashCode = com.pblabs.util.StringUtil.hashCode(id + "::" + source + "::" + type);
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
	    return "Resource[id=" + id + ", source=" + source + ", type=" + type +"]";//+ ", resourceId=" + resourceId
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
