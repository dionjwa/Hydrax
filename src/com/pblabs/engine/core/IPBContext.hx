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

import hsl.haxe.Signaler;

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
	implements de.polygonal.ds.Hashable
{
	/** Key for hashing. Don't modify. */
	var key :Int;
	
	var name (default, null):String;
	var rootGroup(default, null):IPBGroup;
	var currentGroup (get_currentGroup, set_currentGroup) :IPBGroup;
	var isSetup (default, null) :Bool;
	
	/** Is this context the top context (thus updating)? */
	var isTopContext (get_isTopContext, never) :Bool;
	/** Is this context not destroyed? */
	var isLive (get_isLive, never) :Bool;
	
	
	/** Dispatched when an object is added to the context */
	var signalObjectAdded (default, null) :Signaler<IPBObject>;
	/** Dispatched when an object is removed (destroyed). */
	var signalObjectRemoved (default, null) :Signaler<IPBObject>;
	/** Dispatched when this becomes stops being the active IPBContext */
	var signalEnter (default, null) :Signaler<Void>;
	/** Dispatched when this becomes stops being the active IPBContext */
	var signalExit (default, null) :Signaler<Void>;
	/** Dispatched by the PBGameBase once when initialized  */
	var signalSetup (default, null) :Signaler<IPBContext>;
	/** Dispatched by the PBGameBase once just before destruction */
	var signalDestroyed (default, null) :Signaler<IPBContext>;
	
	
	/** Called by the PBGameBase once to initialize  */
	function setup () :Void;
	// /** Called when destroyed */
	function shutdown():Void;
	// /** Called when this becomes the active IPBContext */
	function enter () :Void;
	// /** Called when this becomes stops being the active IPBContext */
	function exit () :Void;
	
	function registerManager <T>(clazz:Class<T>, ?instance:T = null, ?optionalName:String = null, ?suppressInject:Bool = false):T;
	function getManager <T>(clazz:Class<T>, ?optionalName:String = null, ?createIfMissing :Bool = false):T;

	function allocate <T>(type:Class<T>):T;
	function injectInto (instance:Dynamic):Void;
	
	// Name lookups.
	function lookup (name :String):IPBObject;
	function lookupEntity (name :String):IEntity;
}
