/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource.flash;

import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Preconditions;
import com.pblabs.util.StringUtil;

/**
  * Embedded Swf resource.  Doesn't do much now, but in the future it will
  * be able to handle externally loaded swfs.
  */
class SwfResource extends ResourceBase<Dynamic>
{
	var _source :Source;
	
	public function new (name :String, source :Source)
	{
		super(name);
		_source = source;
	}
	
	override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Log.debug("load " + _source);
		super.load(onLoad, onError);
		switch (_source) {
			case embedded (n): loadFromEmbedded(n);
			default:
				com.pblabs.util.Log.error("Resource source type not handled: " + _source);
		}
	}
	
	override public function create (?name :String) :Dynamic
	{
		Preconditions.checkNotNull(name);
		var cls = Type.resolveClass(name);
		com.pblabs.util.Assert.isNotNull(cls, "No definition for " + cls);
		return Type.createInstance(cls, EMPTY_ARRAY);
	}
	
	override public function unload () :Void
	{
		super.unload();
		_source = null;
	}
	
	#if debug
	override public function toString () :String
	{
		return StringUtil.objectToString(this, ["_name",  "_source"]);
	}
	#end
	
	function loadFromEmbedded (embeddedName :String) :Void
	{
		com.pblabs.util.Log.debug("loadFromEmbedded");
		loaded();
	}
	
	static var EMPTY_ARRAY :Array<Dynamic> = [];
}
