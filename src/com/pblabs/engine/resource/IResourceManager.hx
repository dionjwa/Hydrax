/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import com.pblabs.engine.core.IPBManager;

/**
  * Minimal interface for accessing resources.
  */
interface IResourceManager implements IPBManager
{
	// function getFromName <T>(resourceName :String, ?itemName :String) :T;
	function add (token :ResourceToken) :Void;
	function get <T>(token :ResourceToken) :T;
	function addResource (rsrc :IResources<Dynamic>) :Void;
	function load (onLoad :Void->Void, ?onError :Dynamic->Void) :Void;
	function unload (resourceName :String) :Void;
	/**
	  * Returns true if the resource is available or pending.
	  */
	function isResource (resourceName :String) :Bool;
	function getResource (resourceName :String) :IResources<Dynamic>;
	function iterator () :Iterator<IResources<Dynamic>>;
	
	#if (editor || debug)
	function reload (onLoad :Void->Void, ?onError :Dynamic->Void) :Void;
	#end
}

