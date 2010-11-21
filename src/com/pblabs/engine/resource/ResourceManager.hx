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
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.util.Preconditions;

import com.pblabs.util.Assert;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

using com.pblabs.util.IterUtil;

/**
  * Basic resource manager.  This class should suffice for most
  * purposes: most of the platform/resource specific logic 
  * comes from different implementations of IResource.
  */
class ResourceManager 
	implements IResourceManager, implements IPBManager
{
	public function new ()
	{
		_loadedResources = Maps.newHashMap(String);
		_pendingResources = Maps.newHashMap(String);
		_loadingResources = Maps.newHashMap(String);
		
		_onLoadCallbacks = new Array();
		_onErrorCallbacks = new Array();
	}
	
	public function create <T>(resourceName :String, itemName :String) :T
	{
		Preconditions.checkArgument(isResource(resourceName), "No IResource with id=" + resourceName); 
		var rs :IResource<T> = getResource(resourceName);
		return rs.create(itemName);
	}

	public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		Preconditions.checkNotNull(onLoad);
		Preconditions.checkNotNull(onError);
		
		_onLoadCallbacks.push(onLoad);
		_onErrorCallbacks.push(onError);
		
		if (_pendingResources.size() == 0 && _loadingResources.size() == 0) {
			Log.info("No resources to load, calling onLoad");
			allResourcesLoaded();
			return;
		}
		
		var self = this;
		for (key in _pendingResources.keys().toArray()) {//Keys copied to avoid since the map is modified in the loop
			var rsrc = _pendingResources.get(key);
			_pendingResources.remove(key);
			_loadingResources.set(key, rsrc);
			var loaded = function () :Void {
				self.resourceLoaded(rsrc);
			}
			rsrc.load(loaded, handleLoadingError);
		}
	}
	
	public function unload (resourceName :String) :Void
	{
		Preconditions.checkArgument(_pendingResources.get(resourceName) == null && _loadingResources.get(resourceName) == null, "Unhandled: unloaded IResource that is still pending: " + resourceName);
		var rsrc = _loadedResources.get(resourceName);
		if (rsrc != null) {
			_loadedResources.remove(resourceName);
			rsrc.unload();
		}
	}
	
	public function isResource (resourceName :String) :Bool
	{
		return _pendingResources.exists(resourceName) || _loadedResources.exists(resourceName) || _loadingResources.exists(resourceName);
	}
	
	public function getResource <T>(resourceName :String, ?resourceType :Class<Dynamic>) :IResource<T>
	{
		Preconditions.checkArgument(resourceName != null || resourceType != null, "You must give either a resource name or type");
		
		if (resourceType != null) {
			for (rsrc in _loadedResources) {
				if (Std.is(rsrc, resourceType)) {
					return cast rsrc;
				}
			}
		}
		return cast _loadedResources.get(resourceName);
	}
	
	public function addResource (rsrc :IResource<Dynamic>) :Void
	{
		Preconditions.checkNotNull(rsrc, "Resource is null");
		Preconditions.checkNotNull(rsrc.name, "Resource must have a name");
		Preconditions.checkArgument(!isResource(rsrc.name), "Resource with name=" + rsrc.name  + " alrady exists");
		
		if (rsrc.isLoaded()) {
			_loadedResources.set(rsrc.name, rsrc);
		} else {
			_pendingResources.set(rsrc.name, rsrc);
		}
	}
	
	/**
	  * Doesn't do anything, but required by IPBManager.
	  */
	public function startup () :Void
	{
	}
	
	/**
	  * Unload all resources.  This should only be called by the 
	  * root PBGame class, not by any sub-context.
	  */
	public function shutdown () :Void
	{
		Preconditions.checkArgument(_loadedResources.size() == 0, "Resources pending load while shutting down, unhandled situation");
		for (rsrc in _loadedResources) {
			rsrc.unload();
		}
		_pendingResources = null;
		_loadedResources = null;
		_onLoadCallbacks = null;
		_onErrorCallbacks = null;
	}
	
	#if debug
	public function toString () :String
	{
		var s = "[Resources: [pending:";
		for (r in _pendingResources) {
			s += ", " + r;
		}
		s += "], [loading:";
		for (r in _loadingResources) {
			s += ", " + r;
		}
		s += "], [loaded:";
		for (r in _loadedResources) {
			s += ", " + r;
		}
		return s + "]]]";
	}
	#end
	
	function resourceLoaded (rsrc :IResource<Dynamic>) :Void
	{
		_loadingResources.remove(rsrc.name);
		_loadedResources.set(rsrc.name, rsrc);
		if (_loadingResources.size() == 0) {
			allResourcesLoaded();
		}
	}
	
	function allResourcesLoaded () :Void
	{
		while (_onLoadCallbacks.length > 0) {
			_onLoadCallbacks.pop()();
		}
		//Clear the error callbacks too
		_onErrorCallbacks = [];
	}
	
	function handleLoadingError (e :Dynamic) :Void
	{
		while (_onErrorCallbacks.length > 0) {
			_onErrorCallbacks.pop()(e);
		}
	}
	
	var _pendingResources :Map<String, IResource<Dynamic>>;
	var _loadingResources :Map<String, IResource<Dynamic>>;
	var _loadedResources :Map<String, IResource<Dynamic>>;
	var _onLoadCallbacks :Array<Void->Void>;
	var _onErrorCallbacks :Array<Dynamic->Void>;
}


