/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBGroup;

/**
  * Base class of games.
  *
  * A "context" is a loose word that encapsulates several overlapping
  * functions of this class.
  *
  * It is a root manager for a set of game objects.  It will start, manage,
  * and destroy a group of game objects and managers together.
  *
  * It provides a root display container that contained game objects 
  * are drawn upon.  Two IPBContexts do not mix layers, one is always
  * above the other.  This way, you can implement screen overlays and menus.
  * Only the top IPBContext process manager runs, all other IPBContexts
  * are effectively paused.
  */
interface IPBContext
{
	var name (default, null):String;
	var rootGroup(default, null):IPBGroup;
	var currentGroup (get_currentGroup, set_currentGroup) :IPBGroup;
	var started (default, null):Bool;
	
	/** Is this context the top context (thus updating)? */
	var isActive (get_isActive, never) :Bool;
	/** Is this context not destroyed? */
	var isLive (get_isLive, never) :Bool;
	
	/** Called by the PBGameBase once to initialize  */
	function setup () :Void;
	/** Called when destroyed */
	function shutdown():Void;
	/** Called when this becomes the active IPBContext */
	function enter () :Void;
	/** Called when this becomes stops being the active IPBContext */
	function exit () :Void;
	
	function registerManager <T>(clazz:Class<T>, ?instance:T = null, ?optionalName:String = null, ?suppressInject:Bool = false):T;
	function getManager <T>(clazz:Class<T>, ?optionalName:String = null):T;

	function allocate <T>(type:Class<T>):T;
	function injectInto (instance:Dynamic):Void;
	
	// Name lookups.
	function lookup (name :String):IPBObject;
	function lookupEntity (name :String):IEntity;
}


