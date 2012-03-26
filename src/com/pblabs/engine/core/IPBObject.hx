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
/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http://www.pushbuttonengine.com
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBGroup;

import de.polygonal.ds.Hashable;

/**
 * Interface for a named object that can exist in a group or set.
 * 
 * @see PBSet, PBGroup, IEntity
 */
interface IPBObject
	implements Hashable
{
	/** Key for hashing. Don't modify. */
	var key :Int;
	
	/**
	 * The context that allocated and which owns this object. You can get at
	 * the various managers and services in your game from here.
	 */
	var context (get_context, set_context):IPBContext;
	
	/**
	 * The name of the PBObject. This is set by passing a name to the initialize
	 * method after the PBObject is first created.
	 * 
	 * @see #initialize()
	 */
	 var name (get_name, set_name) :String;
	 
	 var isLiveObject (get_isLiveObject, never) :Bool;
	
	/**
	 * The PBGroup which owns this PBObject. If the owning group is destroy()ed,
	 * the PBObject is destroy()ed as well. This is useful for managing object
	 * lifespans - for instance, all the PBObjects in a level might belong
	 * to one common group for easy cleanup.
	 */
	var owningGroup (get_owningGroup, set_owningGroup) :IPBGroup;
	
	/**
	 * initializes the PBObject, optionally assigning it a name. This should be
	 * called immediately after the PBObject is created.
	 * 
	 * @param name The name to assign to the PBObject. If this is null or an empty
	 * string, the PBObject will not register itself with the name manager.
	 * 
	 * @param alias An alternate name under which this PBObject can be looked up.
	 * Useful when you need to distinguish between multiple things but refer
	 * to the active one by a consistent name.
	 *
	 * @see com.pblabs.engine.core.NameManager
	 */
	function initialize(?name:String = null):Void;
	
	/**
	 * Destroys the PBObject by removing all components and unregistering it from
	 * the name manager.
	 * 
	 * <p>PBObjects are automatically removed from any groups/sets that they
	 * are members of when they are destroy()'ed.</P>
	 * 
	 * <p>Currently this will not invalidate any other references to the PBObject
	 * so the PBObject will only be cleaned up by the garbage collector if those
	 * are set to null manually.</p>
	 */
	function destroy():Void;
	
	#if debug
	function toString () :String;
	#end
}

