/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

/**
  * The source for a resource.  This could be an URL for downloading, or 
  * an id mapping to embedded data, or others. 
  */
enum Source {
	url (u :String);
	bytes (b :haxe.io.Bytes);
	// imageData (imageData :com.pblabs.components.scene2D.ImageData);
	text (t :String);
	embedded (embedId :String);
	/** A resource created from another resource, e.g. a bitmap created from an Svg */
	derived(other :ResourceToken);
	/** The raw resource is referenced by this enum */
	linked (resource :Dynamic);
	#if (flash ||spaceport)
	swf(swfId :String);
	#end
	none;//For resources manually added
}
