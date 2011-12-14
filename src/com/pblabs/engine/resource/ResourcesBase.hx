/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import org.transition9.util.StringUtil;

/**
  * Base class for extending to more specific Resource types.
  */
class ResourcesBase<T>
	implements IResources<T>
{
	public var manager :IResourceManager;
	public var name (get_name, never) :String;
	
	var _name :String;
	var _onLoad :Void->Void;
	var _onError :Dynamic->Void;
	var _isLoaded :Bool;
	
	public function new (name :String)
	{
		_name = name;
		_isLoaded = false;
	}
	
	public function add (resourceToken :ResourceToken) :Void
	{
		//Subclasses must override this to be useful.
		throw Type.getClassName(Type.getClass(this)) + " must override";
	}
	
	public function get (resourceToken :ResourceToken) :T
	{
		//Subclasses must override this to be useful.
		throw "Override";
		return null;
	}
	
	public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
	{
		_onLoad = onLoad;
		_onError = onError;
	}
	
	public function unload () :Void
	{
		_onLoad = null;
		_onError = null;
		_isLoaded = false;
		manager = null;
	}
	
	public function isLoaded () :Bool
	{
		return _isLoaded;
	}
	
	function get_name () :String
	{
		return _name;
	}
	
	function loaded () :Void
	{
		_isLoaded = true;
		if (_onLoad != null) {
			_onLoad();
		}
		_onLoad = null;
		_onError = null;
	}

	#if debug
	public function toString () :String
	{
		return "[" + Type.getClassName(Type.getClass(this)) + ", name=" + name + "]";
	}
	#end
	
	// #if (editor || debug)
	// public function reload (onLoad :Void->Void, onError :Dynamic->Void) :Void
	// {
	// 	unload();
	// 	load(onLoad, onError);
	// }
	// #end
}


