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

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.util.Assert;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using com.pblabs.util.IterUtil;

/**
  * Basic resource manager.  This class should suffice for most
  * purposes: most of the platform/resource specific logic 
  * comes from different implementations of IResource.
  */
class ResourceManager 
	implements IResourceManager, implements IPBManager
{
	public static function getTokenResource <T>(context :IPBContext, token :ResourceToken) :T
	{
	    return context.getManager(IResourceManager).get(token);
	}
	
	public var signalerFractionComplete :Signaler<Float>;
	/** The number of resources in this load batch */
	var _numResources :Int;
	
	public function new ()
	{
		_loadedResources = Maps.newHashMap(ValueType.TClass(String));
		_pendingResources = Maps.newHashMap(ValueType.TClass(String));
		_loadingResources = Maps.newHashMap(ValueType.TClass(String));
		
		_onLoadCallbacks = new Array();
		_onErrorCallbacks = new Array();
		
		signalerFractionComplete = new DirectSignaler(this);
	}
	
	public function iterator () :Iterator<IResource<Dynamic>>
	{
	    return _loadedResources.array().concat(_pendingResources.array()).concat(_loadingResources.array()).iterator();
	}
	
	// public function get <T>(resourceToken :ResourceToken) :T
	// {
	// 	com.pblabs.util.Log.debug(resourceToken);
	// 	com.pblabs.util.Assert.isNotNull(resourceToken);
	// 	return getFromName(resourceToken.resourceId, resourceToken.key);
	// }
	
	
	public function add (token :ResourceToken) :Void
	{
		// trace("adding " + token);
		// trace('token.type=' + token.type);
		// trace('ensureResource(com.pblabs.engine.resource.DynamicResources)=' + ensureResource(com.pblabs.engine.resource.DynamicResources));
		// var resource :IResource<Dynamic> = null;
		// switch (token.type) {
		// 	case IMAGE:
		// 		// trace("image");
		// 		#if flash
		// 		#elseif js
		// 		resource = ensureResource(com.pblabs.engine.resource.js.ImageResources);
		// 		#end
		// 	case SVG,STRING:
		// 		// trace("svg,string");
		// 		#if flash
		// 		#elseif js
		// 		// trace("ensuring com.pblabs.engine.resource.DynamicResources");
		// 		resource = ensureResource(com.pblabs.engine.resource.DynamicResources);
		// 		// ensureResource(com.pblabs.engine.resource.StringResources);
		// 		#end
		// 	case BITMAP_CACHE(other): throw "TODO";
		// 	// trace("bm cache");
		// 	#if flash
		// 	case CLASS:
		// 	case SWF:
		// 	#end
		// 	case NONE:
		// 	// trace("none");
		// }
		// trace('resource=' + Std.string(resource));
		
		// #if flash
		// switch (token.source) {
		// 	case swf(swfName):
		// 		token.resourceId = swfName;
		// 		return;
		// 	default:
		// }
		// #end
		
		
		com.pblabs.util.Assert.isNotNull(getResourceForToken(token), ' resource is null from ' + token);
		getResourceForToken(token).add(token);
		// token.resourceId = getResourceForToken(token).name;
	}
	
	inline function getResourceForToken (token :ResourceToken) :IResource<Dynamic>
	{
		// #if flash
		// switch (token.source) {
		// 	case swf(swfName): return getResource(swfName);
		// 	default:
		// }
		// #end
		return getResource(Type.enumConstructor(token.type));
		
		// var resource :IResource<Dynamic> = null;
		
		// #if flash
		// switch (token.type) {
		// 	case SVG,STRING,IMAGE,CLASS: 
		// 		resource = switch (token.source) {
		// 			case url (u): null;
		// 			case bytes (b): null;
		// 			case text (t): null;
		// 			case embedded (name): null; 
		// 			case swf(swfName): getResource(swfName); 
		// 		}
		// 		com.pblabs.util.Assert.isNotNull(resource, 'resource is null for ' + token + "\n Resources=\n" + this.array().join("\n"));
		// 	case BITMAP_CACHE(other): throw "TODO";
		// 	case SWF: resource = getResource(token.id); 
		// }
		// #elseif js
		// switch (token.type) {
		// 	case IMAGE:
		// 		resource = ensureResource(com.pblabs.engine.resource.js.ImageResources);
		// 	case SVG,STRING:
		// 		resource = ensureResource(com.pblabs.engine.resource.DynamicResources);
		// 	case BITMAP_CACHE(other): throw "TODO";
		// }
		// #end
		// return resource;
	}
	
	// function ensureResource (cls :Class<Dynamic>, ?name :String) :IResource<Dynamic>
	// {
	// 	// trace('cls=' + Type.getClassName(cls));
	// 	// trace('name=' + name);
	// 	var id = name == null ? Type.getClassName(cls) : name;
	// 	// trace('id=' + id);
	// 	if (getResource(id) == null) {
	// 		addResource(Type.createInstance(cls, name == null ? [] : [name]));
	// 	}
	// 	com.pblabs.util.Assert.isNotNull(getResource(id), '  getResource(' + id + ') is null');
	// 	return getResource(id);
	// }
	
	public function get <T>(token :ResourceToken) :T
	{
		// if (token.resourceId == null) {
		// 	token.resourceId = getResourceForToken(token).name;
		// }
		// Preconditions.checkArgument(isResource(token.resourceId), "No IResource with id=" + token.resourceId + ", resourceIds=" + com.pblabs.util.IterUtil.toArray(_loadedResources.keys()).join(", "));
		com.pblabs.util.Assert.isNotNull(getResourceForToken(token), ' getResource(' + token + ') is null');
		return getResourceForToken(token).get(token);
	}

	public function load (onLoad :Void->Void, ?onError :Dynamic->Void) :Void
	{
		com.pblabs.util.Log.info("");
		Preconditions.checkNotNull(onLoad);
		// Preconditions.checkNotNull(onError);
		
		if (_pendingResources.size() == 0 && _loadingResources.size() == 0) {
			com.pblabs.util.Log.info("No resources to load, calling onLoad");
			com.pblabs.util.Assert.isTrue(_onLoadCallbacks.length == 0);
			_numResources = 0;
			onLoad();
			// allResourcesLoaded();
			return;
		}
		
		_onLoadCallbacks.push(onLoad);
		if (onError != null) {
			_onErrorCallbacks.push(onError);
		}
		
		var self = this;
		for (key in _pendingResources.keys().toArray()) {//Keys copied since the map is modified in the loop
			var rsrc = _pendingResources.get(key);
			_pendingResources.remove(key);
			_loadingResources.set(key, rsrc);
			var loaded = function () :Void {
				com.pblabs.util.Log.debug("Loaded callback for resource=" + key);
				self.resourceLoaded(rsrc);
			}
			com.pblabs.util.Log.debug("Loading resource=" + rsrc);
			rsrc.load(loaded, handleLoadingError);
		}
		_numResources = _pendingResources.size() + _loadingResources.size();
	}
	
	public function unload (resourceName :String) :Void
	{
		Preconditions.checkArgument(_pendingResources.get(resourceName) == null && _loadingResources.get(resourceName) == null, "Unhandled: unloaded IResource that is still pending: " + resourceName);
		var rsrc = _loadedResources.get(resourceName);
		if (rsrc != null) {
			_loadedResources.remove(resourceName);
			rsrc.unload();
		} else {
			com.pblabs.util.Log.warn("unload('" +resourceName + "') but does not exist.");
		}
	}
	
	public function isResource (resourceName :String) :Bool
	{
		return getResource(resourceName) != null;
	}
	
	public function getResource (resourceName :String) :IResource<Dynamic>
	{
		com.pblabs.util.Assert.isNotNull(resourceName, ' resourceName is null');
		// com.pblabs.util.Assert.isNotNull(type, ' type is null');
		// var resourceName = Type.enumConstructor(type);
		if (_loadedResources.exists(resourceName)) {
			return cast _loadedResources.get(resourceName);
		} else if (_pendingResources.exists(resourceName)) {
			return cast _pendingResources.get(resourceName);
		} else {
			return cast _loadingResources.get(resourceName);
		}  
	}
	
	public function addResource (rsrc :IResource<Dynamic>) :Void
	{
		Preconditions.checkNotNull(rsrc, "Resource is null");
		Preconditions.checkNotNull(rsrc.name, "Resource must have a name");
		Preconditions.checkArgument(!isResource(rsrc.name), "Resource with name=" + rsrc.name  + " alrady exists");
		
		rsrc.manager = this;
		
		if (rsrc.isLoaded()) {
			com.pblabs.util.Log.info("adding to loadedResources: " + rsrc);
			_loadedResources.set(rsrc.name, rsrc);
		} else {
			com.pblabs.util.Log.info("adding to _pendingResources: " + rsrc);
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
		com.pblabs.util.Log.info(rsrc);
		_loadingResources.remove(rsrc.name);
		_loadedResources.set(rsrc.name, rsrc);
		if (_loadingResources.size() == 0 && _pendingResources.size() == 0) {
			allResourcesLoaded();
			signalerFractionComplete.dispatch(1);
		} else {
			if (_numResources == 0) {
				signalerFractionComplete.dispatch(1);
			} else {
				var resourcesYetToLoadInBatch :Float = _pendingResources.size() + _loadingResources.size();
				signalerFractionComplete.dispatch((_numResources - resourcesYetToLoadInBatch) / _numResources);
			}
		}
	}
	
	function allResourcesLoaded () :Void
	{
		com.pblabs.util.Log.info("");
		
		//Copy and clear the current arrays to avoid change conflicts during callbacks
		var onloadcallbacks = _onLoadCallbacks.copy();
		//Clear the error callbacks too
		_onErrorCallbacks = [];
		_onLoadCallbacks = [];
		
		while (onloadcallbacks.length > 0) {
			onloadcallbacks.shift()();
		}
		_numResources = 0;
	}
	
	function handleLoadingError (e :Dynamic) :Void
	{
		if (_onErrorCallbacks.length == 0) {
			throw "Loading error, but no callbacks e=" + e;
		} else {
			while (_onErrorCallbacks.length > 0) {
				_onErrorCallbacks.shift()(e);
			}
		}
	}
	
	#if (editor || debug)
	public function reload (onLoad :Void->Void, ?onError :Dynamic->Void) :Void
	{
		for (rsrc in _loadedResources) {
			_pendingResources.set(rsrc.name, rsrc);
			rsrc.unload();
		}
		_loadedResources.clear();
		load(onLoad, onError);
	}
	#end
	
	var _pendingResources :Map<String, IResource<Dynamic>>;
	var _loadingResources :Map<String, IResource<Dynamic>>;
	var _loadedResources :Map<String, IResource<Dynamic>>;
	var _onLoadCallbacks :Array<Void->Void>;
	var _onErrorCallbacks :Array<Dynamic->Void>;
}
