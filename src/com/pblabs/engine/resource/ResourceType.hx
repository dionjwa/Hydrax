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
  * Defines a type of external resource, so that the ResourceManager knows how to process, and possibly cache it.
  */
enum ResourceType {
	/** A Bitmap image in a swf, or downloaded, or embedded, or cached.  In Flash, resolves to a DisplayObject. */
	IMAGE;
	/** Raw BitmapData, defined as the platform dependent ImageData type */
	IMAGE_DATA;
	/** Points to an Svg (Xml) String (NOT the embedded Svg DisplayObject in Flash) */
	SVG;
	/** String data */
	STRING;
	/** A MovieClip, Sprite, or Bitmap DisplayObject */
	CLASS;
	/** An external Swf */
	SWF;
}
