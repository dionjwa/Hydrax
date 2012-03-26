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
import org.transition9.util.Equalable;

/**
  * ResourceTokens both specifiy resources e.g. a SWF and it's url,
  * and also are the keys used to retrieve the resource or it's derivatives.
  * When using a ResourceToken to get a resource, the source is ignored
  * since it's assumed that the resource has been loaded already or is
  * instantly (without a callback) accessible.
  */
class ResourceToken
	implements Equalable<ResourceToken>, implements org.transition9.ds.Hashable, implements de.polygonal.ds.Hashable, implements haxe.rtti.Infos
{
	/** Don't modify */
	public var key :Int;
	public var source (default, null) :Source;
	public var id (default, null) :String;
	public var type (default, null) :ResourceType;
	public var url (get_url, null) :String;

	var _hashCode :Int;
	
	public function new (id :String, type :ResourceType, ?source :Source = null)
	{
		org.transition9.util.Assert.isNotNull(id);
		org.transition9.util.Assert.isNotNull(type);
		this.id = id;
		this.type = type;
		this.source = source == null ? Source.none : source;
		//Only hash the id and the type.  The source should not matter for hashing.
		_hashCode = org.transition9.util.StringUtil.hashCode(id + ":" + Type.enumConstructor(type));
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
			// case url (ul): "url:" +ul;// + u;
			// case bytes (b): "bytes";
			case text (t): "texthash:" + haxe.Md5.encode(t);
			case embedded (name): "embedded:" + name;
			case linked(data): "linked";
			// case url (u): "url";
			// case none (u): "none";
			// case derived (other): "de
			default: Std.string(source);
		} 
		
		
		return "Resource[id=" + id
		+ ", source=" + sourceStr
		+ ", type=" + 	Type.enumConstructor(type) +", hashCode=" + Std.string(Std.int(_hashCode)) + "]";
	}
	
	function get_url () :String
	{
		switch (source) {
			case Source.url (u): return u; 
			default: org.transition9.util.Log.error("ResourceType does not have an URL: " + this);
		}
		return null;
	}
}
