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

/**
 * Base implementation of a named object that can exist in PBSets or PBGroups.
 * 
 * @see IPBObject
 */
class PBObject 
	implements IPBObject//, implements haxe.rtti.Infos 
{
	/** Key for hashing. */
	public var key :Int;
	
	public function new () 
	{
		key = com.pblabs.engine.util.PBUtil.KEY_COUNT++;
	}
	
	@editorData({ignore :"true"})
	@inject("com.pblabs.engine.core.IPBContext")
	public var context(get_context, set_context) :IPBContext;
	
	public var name(get_name, set_name) :String;
	
	@editorData({ignore :"true"})
	public var owningGroup (get_owningGroup, set_owningGroup) :IPBGroup;
	
	@editorData({ignore :"true"})
	public var isLiveObject (get_isLiveObject, never) :Bool;
	
	@editorData({ignore :"true"})
	var _name :String;
	
	@editorData({ignore :"true"})
	var _owningGroup :IPBGroup;
	
	@editorData({ignore :"true"})
	var _context :PBContext;

	
	function get_context() :IPBContext
	{
		return _context;
	}
	
	function set_context (c :IPBContext) :IPBContext
	{
		Preconditions.checkArgument(_context == null, "Trying to set context on a PBObject that already has one!");
		_context = cast(c);
		return c;
	}
	
	function get_owningGroup() :IPBGroup
	{
		return _owningGroup;
	}
	
	function set_owningGroup (value :IPBGroup) :IPBGroup
	{
		Preconditions.checkNotNull(value, "Must always be in a group - cannot set owningGroup to null!");
		Preconditions.checkArgument(_owningGroup == null || value.rootGroup == _owningGroup, "Attempting to set an illegal group");
		if(value == _owningGroup) {
			return value;
		}
		
		if(_owningGroup != null) {
			_owningGroup.removeFromGroup(this);
		}
		
		_owningGroup = value;
		_owningGroup.addToGroup(this);
		return value;
	}
	
	function get_name() :String
	{
		return _name;
	}
	
	function set_name(name :String) :String
	{
		Preconditions.checkArgument(_name == null, this + " already has a name");
		_name = name;
		return name;
	}
	
	public function initialize(name :String = null) :Void
	{		   
		// Note the names.
		com.pblabs.util.Assert.isNull(_name);
		_name = name;
		Preconditions.checkNotNull(_context, "Context null on init :" + this);
		_context.register(this);
	}
	
	public function destroy() :Void
	{
		_context.unregister(this);
		
		// Remove from our owning group.
		if(_owningGroup != null)
		{
			_owningGroup.removeFromGroup(this);
			_owningGroup = null;				
		}
		_context = null;
		_name = null;
	}
	
	#if debug
	public function toString () :String
	{
		return name;//StringUtil.objectToString(this, ["name"]);
	}
	#end
	
	function get_isLiveObject () :Bool
	{
		return _context != null;
	}
	
}
