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

import com.pblabs.util.Preconditions;
using com.pblabs.util.IterUtil;

/**
 * A group which owns the objects contained it. When the PBGroup is
 * deleted, it deletes its owned objects. Assign a PBObject to a PBGroup
 * by setting object.owningGroup.
 */
class PBGroup extends PBObject, 
	implements IPBGroup
{
	public var length(get_length, null) : Int;
	public var rootGroup (get_rootGroup, null) :IPBGroup;
	
	var items:Array<IPBObject>;
	
	public function new() 
	{
		super();
		items = [];
	}
  
	public function iterator () :Iterator<IPBObject>
	{
		return items.iterator();
	}
	
	public function addToGroup(item:IPBObject):Bool
	{
		Preconditions.checkNotNull(item, "Cannot add null item to group");
		Preconditions.checkArgument(item.owningGroup == this || item.owningGroup == null , "Adding IPBObject to two groups at the same time!");
		items.push(item);
		return true;
	}
	
	public function removeFromGroup(item:IPBObject):Bool
	{
		var idx:Int = items.indexOf(item);
		if(idx == -1)
			return false;
		
		items.splice(idx, 1);
		return true;
	}

	/**
	 * Return the IPBObject at the specified index.
	 */
	public function getItem(index:Int):IPBObject
	{
		if(index < 0 || index >= items.length)
			return null;
		return items[index];
	}
	
	/**
	 * How many PBObjects are in this group?
	 */
	function get_length() :Int
	{
		return items.length;
	}
	
	/**
	 * Destroy all the objects in this group, but do not delete the group.
	 */
	public function clear():Void
	{
		// Delete the items we own.
		while(items.length > 0)
			items.pop().destroy();
	}
	
	public override function destroy() : Void
	{
		// Delete everything.
		clear();
		
		// Pass control up.
		super.destroy();			
	}
	
	function get_rootGroup () :IPBGroup
	{
		var cur :IPBGroup = this;
		while (cur.owningGroup != null) {
			cur = cur.owningGroup;
		}
		return cur;
	}
	
	#if debug
	override public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["name", "length", "owningGroup"]);
	}
	#end
}
