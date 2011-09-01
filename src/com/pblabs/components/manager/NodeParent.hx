/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.manager;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.serialization.Serializer;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;

using Lambda;

using com.pblabs.util.ArrayUtil;
using com.pblabs.util.XmlTools;

/**
	Useful for managing components and setting up tree structures.
	If you need a manager type component and a bunch of 
	children type components that need to register with the manager, 
	just extend both from NodeComponent, and set the parentProperty
	on the children.  They will automatically register themselves with 
	the parent, and detach on destruction (or earlier if needed).
	
	NB: destroying a parent without first detaching the children
	will destory the child entities as well.
	
	The parent then overrides childAdded to perform specific handling.
	
	Although this component is typed, P and C must be EntityComponents.
	
	The class has the implementation of ISerializable, although it doesn't 
	formally implement ISerializable, since that may not be desired behaviour.
	Just implement ISerializable on the subclass and make sure you call the
	super methods to get the parent reference serialized.
*/
class NodeParent<C :INodeChild<Dynamic>> extends EntityComponent
{
	@editorData({ignore :"true"})
	public var children (get_children, null) :Array<C>;
	var _children :Array<C>;
	function get_children () :Array<C>
	{
		if (_children == null) {
			_children = [];
		}
		return _children;
	}
	
	public function new ()
	{
		super();
	}
	
	public function iterator () :Iterator<C>
	{
		return children.iterator();
	}
	
	public function addChild (c :C) :Void
	{
		Preconditions.checkArgument(isRegistered, "Component must first be registered");
		// Preconditions.checkArgument(Std.is(c, NodeComponent), "Children must be of type NodeComponent");
		Preconditions.checkArgument(cast(c, IEntityComponent).isRegistered, "Child not registered: " + c);
		
		var child :INodeChild<Dynamic> = cast c;
		
		Preconditions.checkArgument(child.parent == null, c + " already has a parent, not adding");
		
		child.parent = this;
		children.push(c);
		childAdded(c);
		c.addedToParent();
		// if (Std.is(child, NodeComponent)) {
		// 	cast(c, NodeComponent<Dynamic, Dynamic>).addedToParent();
		// }
	}
	
	public function removeChild (c :C) :Void
	{
		// var cNode :NodeComponent<Dynamic, Dynamic> = cast c;
		Preconditions.checkNotNull(c, "Attempting to remove null child");
		if (!c.hasParent()) {
			throw "child has no parent";
			return;
		}
		//Run condition with destruction of interlinked NodeComponents
		if (children.length == 0) {
			return;
		}
		
		var before = children.length;
		if (!children.remove(c)) {
			throw "Removing child with a different manager";
		}
		com.pblabs.util.Assert.isFalse(children.length == before, "children.length the same after removal");
		
		if (children.has(null)) {
			throw "After child removal, we have null in children=" + children;
		}
		c.removingFromParent();
		c.parent = null;
		com.pblabs.util.Assert.isNull(c.parent);
		childRemoved(c);
	}
	
	function childAdded (c :C) :Void
	{
		//Override
	}
	
	function childRemoved (c :C) :Void
	{
		//Override
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		//Make a copy of the array modified within the loop
		if (_children != null && _children.length > 0) {
			for (child in children.copy()) {
				child.removeFromParent();
			}
		}
		_children = null;
	}
}
