/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import Type;

import com.pblabs.components.scene2D.ImageType;
import com.pblabs.components.scene2D.ImageData;
import com.pblabs.engine.resource.ResourcesBase;
import com.pblabs.engine.resource.ResourceToken;
import org.transition9.util.Preconditions;
import org.transition9.rtti.ReflectUtil;
import org.transition9.util.StringUtil;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;

/**
  * Image resources.
  */
class ImageDataResources extends LoadingResources<ImageData>
{
	public function new ()
	{
		super(Type.enumConstructor(ResourceType.IMAGE_DATA));
	}
	
	override public function add (token :ResourceToken) :Void
	{
		switch (token.type) {
			case IMAGE_DATA://Nothing
			default: throw "Token must be of type IMAGE_DATA";//token = createCachedToken(token);
		}
		super.add(token);
	}
	
	override public function unload () :Void
	{
		#if (flash || cpp)
		for (bd in _data) {
			bd.dispose();
		}
		#end
		super.unload();
	}
}
