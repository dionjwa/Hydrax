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

class ResourceToken<T>
	implements Equalable<ResourceToken<Dynamic>>, implements com.pblabs.util.ds.Hashable
{
	public static function create <T>(context :IPBContext, token :ResourceToken<T>) :T
	{
	    return context.getManager(IResourceManager).create(token);
	}
	
	
	public var resourceId (default, null) :String;
	public var key (default, null) :String;

	var _hashCode :Int;
	
	public function new (resourceId :String, ?key :String = null)
	{
		this.resourceId = resourceId;
		this.key = key;
		_hashCode = com.pblabs.util.StringUtil.hashCode(toString());
	}
	
	public function equals (other :ResourceToken<Dynamic>) :Bool
	{
	    return resourceId == other.resourceId && key == other.key;
	}
	
	inline public function hashCode () :Int
	{
	    return _hashCode;
	}
	
	// public function create (context :IPBContext) :T
	// {
	//     var rm = context.getManager(IResourceManager);
	//     com.pblabs.util.Assert.isNotNull(rm);
	//     return rm.create(this);
	// }
	
	public function toString () :String
	{
	    return resourceId + "." + key;
	}
}
