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
	function create <T>(resourceName :String, itemName :String) :T;
	
	function addResource (rsrc :IResource<Dynamic>) :Void;
	
	function load (onLoad :Void->Void, onError :Dynamic->Void) :Void;
	
	function unload (resourceName :String) :Void;
	
	/**
	  * Returns true if the resource is available or pending.
	  */
	function isResource (resourceName :String) :Bool;
	
	function getResource (resourceName :String) :IResource<Dynamic>;
}

