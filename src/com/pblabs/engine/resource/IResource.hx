/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import haxe.io.BytesData;

/**
  * Minimal resource interface.
  */
interface IResource<T>
{
	var name (get_name, never) :String;
	/**
	  * Create/get the resource mapped to the name.
	  * The returned object may be generated or it may 
	  * an unchanging object, such as Xml.
	  */
	function get (?resourceName :String) :T;
	/**
	  * Loads resources managed by this instance.
	  */
	function load (onLoad :Void->Void, onError :Dynamic->Void) :Void;
	function unload () :Void;
	function isLoaded () :Bool;
	
	// #if (editor || debug)
	// function reload (onLoad :Void->Void, onError :Dynamic->Void) :Void;  
	// #end
}

