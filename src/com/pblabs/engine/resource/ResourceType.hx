/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

enum ResourceType {
	/** A Bitmap image in a swf, downloaded, or embedded */
	IMAGE;
	/** Points to an Svg (Xml) String */
	SVG;
	/** String data */
	STRING;
	#if flash
	/** A MovieClip or Bitmap DisplayObject */
	CLASS;
	/** An external Swf */
	SWF;
	#end
	/** A bitmap created from a different resource, such as an Svg */
	BITMAP_CACHE(other :ResourceToken);
}
