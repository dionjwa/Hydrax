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
import com.pblabs.engine.resource.IResources;
import com.pblabs.engine.resource.IResourceManager;
import org.transition9.util.Assert;
import org.transition9.util.Preconditions;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using Lambda;

using org.transition9.util.IterUtil;

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
	var _pendingResources :Map<String, IResources<Dynamic>>;
	var _loadingResources :Map<String, IResources<Dynamic>>;
	var _loadedResources :Map<String, IResources<Dynamic>>;
	var _onLoadCallbacks :Array<Void->Void>;
	var _onErrorCallbacks :Array<Dynamic->Void>;
	
	public function new ()
	{
		_loadedResources = Maps.newHashMap(ValueType.TClass(String));
		_pendingResources = Maps.newHashMap(ValueType.TClass(String));
		_loadingResources = Maps.newHashMap(ValueType.TClass(String));
		
		_onLoadCallbacks = new Array();
		_onErrorCallbacks = new Array();
		
		signalerFractionComplete = new DirectSignaler(this);
	}
	
	public function iterator () :Iterator<IResources<Dynamic>>
	{
	    return _loadedResources.array().concat(_pendingResources.array()).concat(_loadingResources.array()).iterator();
	}
	
	public function add (token :ResourceToken) :Void
	{
		org.transition9.util.Assert.isNotNull(getResourceForToken(token), ' resource is null from ' + token + ', resource ids=' + this.map(
		function (r :IResources<Dynamic>) :String {
			return r.name;
		}).array());
		getResourceForToken(token).add(token);
	}
	
	inline function getResourceForToken (token :ResourceToken) :IResources<Dynamic>
	{
		return getResource(Type.enumConstructor(token.type));
	}
	
	public function get <T>(token :ResourceToken) :T
	{
		org.transition9.util.Assert.isNotNull(token, ' token is null');
		org.transition9.util.Assert.isNotNull(getResourceForToken(token), ' getResource(' + token + ') is null');
		return getResourceForToken(token).get(token);
	}

	public function load (onLoad :Void->Void, ?onError :Dynamic->Void) :Void
	{
		org.transition9.util.Log.info("Loading resources.");
		Preconditions.checkNotNull(onLoad);
		
		if (_pendingResources.size() == 0 && _loadingResources.size() == 0) {
			org.transition9.util.Log.info("No resources to load, calling onLoad");
			org.transition9.util.Assert.isTrue(_onLoadCallbacks.length == 0);
			_numResources = 0;
			onLoad();
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
				org.transition9.util.Log.debug("Loaded callback for resource=" + key);
				self.resourceLoaded(rsrc);
			}
			org.transition9.util.Log.debug("Loading resource=" + rsrc);
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
			org.transition9.util.Log.warn("unload('" +resourceName + "') but does not exist.");
		}
	}
	
	public function isResource (resourceName :String) :Bool
	{
		return getResource(resourceName) != null;
	}
	
	public function getResource (resourceName :String) :IResources<Dynamic>
	{
		org.transition9.util.Assert.isNotNull(resourceName, ' resourceName is null');
		if (_loadedResources.exists(resourceName)) {
			return cast _loadedResources.get(resourceName);
		} else if (_pendingResources.exists(resourceName)) {
			return cast _pendingResources.get(resourceName);
		} else {
			return cast _loadingResources.get(resourceName);
		}  
	}
	
	public function getResourceByType <T> (type :ResourceType) :T
	{
		org.transition9.util.Assert.isNotNull(type, ' type is null');
		return cast getResource(Type.enumConstructor(type));
	}
	
	public function addResource (rsrc :IResources<Dynamic>) :Void
	{
		org.transition9.util.Log.info("addResource " + org.transition9.rtti.ReflectUtil.getClassName(rsrc));
		Preconditions.checkNotNull(rsrc, "Resource is null");
		Preconditions.checkNotNull(rsrc.name, "Resource must have a name");
		Preconditions.checkArgument(!isResource(rsrc.name), "Resource with name=" + rsrc.name  + " alrady exists");
		
		rsrc.manager = this;
		
		if (rsrc.isLoaded()) {
			org.transition9.util.Log.info("adding to loadedResources: " + rsrc);
			_loadedResources.set(rsrc.name, rsrc);
		} else {
			org.transition9.util.Log.info("adding to _pendingResources: " + rsrc);
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
	
	function resourceLoaded (rsrc :IResources<Dynamic>) :Void
	{
		org.transition9.util.Log.info(rsrc);
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
		org.transition9.util.Log.info("");
		
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
}
