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
import org.transition9.util.Preconditions;
import org.transition9.rtti.ReflectUtil;

using Lambda;

using org.transition9.util.ArrayUtil;
using org.transition9.util.XmlTools;

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
class NodeComponentTest extends EntityComponent
{
	var _parentProperty :PropertyReference<NodeComponentTest>;
	public var parentProperty (get_parentProperty, set_parentProperty) :PropertyReference<NodeComponentTest>;
	function get_parentProperty () :PropertyReference<NodeComponentTest>
	{
		return _parentProperty;
	}
	
	function set_parentProperty (val :PropertyReference<NodeComponentTest>) :PropertyReference<NodeComponentTest>
	{
		_parentProperty = val;
		return val;
	}
	
	public var children (get_children, null) :Array<NodeComponentTest>;
	var _children :Array<NodeComponentTest>;
	function get_children () :Array<NodeComponentTest>
	{
		if (_children == null) {
			_children = [];
		}
		return _children;
	}
	
	/** Don't set this yourself, use addToParent(p); instead */
	public var parent :NodeComponentTest;
	
	public function new ()
	{
		super();
		// children = [];
		parent = null;
	}
	
	public function iterator () :Iterator<NodeComponentTest>
	{
		return children.iterator();
	}
	
	public function serialize (xml :Xml) :Void
	{
		xml.createChild("parent", parent != null ? PBUtil.entityProp(cast(parent)) :parentProperty, Serializer.serializeSimple);
	}
	
	public function deserialize (xml :Xml) :Dynamic
	{
		if (xml.child("parent") != null) {
			parentProperty = cast Serializer.parsePropertyReference(xml, "parent");
		}
		if (parentProperty != null) {
			addToParent();
		}
		return this;
	}
	
	public function addChild (c :NodeComponentTest) :Void
	{
		org.transition9.util.Assert.isTrue(untyped this != c);
		Preconditions.checkArgument(isRegistered, "Component must first be registered");
		Preconditions.checkArgument(Std.is(c, NodeComponentTest), "Children must be of type NodeComponent");
		Preconditions.checkArgument(cast(c, IEntityComponent).isRegistered, "Child not registered: " + c);
		
		// var child :INodeChild<Dynamic> = cast c;
		var child = c;
		Preconditions.checkArgument(child.parent == null, c + " already has a parent, not adding");
		
		child.parent = this;
		children.push(c);
		childAdded(c);
		if (Std.is(child, NodeComponentTest)) {
			cast(c, NodeComponentTest).addedToParent();
		}
	}
	
	public function removeChild (c :NodeComponentTest) :Void
	{
		// var cNode :NodeComponent<Dynamic, Dynamic> = cast c;
		var cNode = c;
		Preconditions.checkNotNull(cNode, "Attempting to remove null child");
		if (!cNode.hasParent()) {
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
		org.transition9.util.Assert.isFalse(children.length == before, "children.length the same after removal");
		
		if (children.has(null)) {
			throw "After child removal, we have null in children=" + children;
		}
		cNode.removingFromParent();
		cNode.parent = null;
		org.transition9.util.Assert.isNull(cNode.parent);
		childRemoved(c);
	}
	
	function childAdded (c :NodeComponentTest) :Void
	{
		//Override
	}
	
	function childRemoved (c :NodeComponentTest) :Void
	{
		//Override
	}
	
	public function addedToParent () :Void
	{
		//Override
	}
	
	public function removingFromParent () :Void
	{
		//Override
	}
	
	public function addToParent (?newParent :NodeComponentTest) :Void
	{
		#if profiler com.pblabs.engine.debug.Profiler.enter("addToParent"); #end
		if (hasParent() && newParent != parent) {
			com.pblabs.engine.debug.Profiler.enter("removeFromParent");
			removeFromParent();
			com.pblabs.engine.debug.Profiler.exit("removeFromParent");
		}
		
		if (!hasParent() && (newParent != null || parentProperty != null)) {
			Preconditions.checkArgument(isRegistered, "Component must first be registered ::" + org.transition9.rtti.ReflectUtil.getClassName(this));
			Preconditions.checkArgument(newParent != null || parentProperty != null, "No parent or parent property provided ::" + org.transition9.rtti.ReflectUtil.getClassName(this));
			com.pblabs.engine.debug.Profiler.enter("getParentFromProp");
			newParent = newParent == null ? owner.getProperty(parentProperty) : newParent;
			com.pblabs.engine.debug.Profiler.exit("getParentFromProp");
			Preconditions.checkNotNull(newParent, "Parent cannot be null, parentProperty=" + parentProperty);
			Preconditions.checkArgument(Std.is(newParent, NodeComponentTest), "Parent must be of type NodeComponent, parent is type=" + ReflectUtil.getClassName(newParent));
			Preconditions.checkArgument(newParent.isRegistered, "Parent not registered: " + org.transition9.rtti.ReflectUtil.getClassName(newParent));
			// if (hasParent()) {
			// 	// org.transition9.util.Log.warn(" but " + name + ".hasParent " + ReflectUtil.getClassName(parent));
			// 	return;
			// }
			com.pblabs.engine.debug.Profiler.enter("addChild");
			newParent.addChild(this);
			com.pblabs.engine.debug.Profiler.exit("addChild");
		}
		#if profiler com.pblabs.engine.debug.Profiler.exit("addToParent"); #end
	}
	
	public function removeFromParent () :Void
	{
		if (!hasParent()) {
			return;
		}
		parent.removeChild(this);
		parent = null;
	}
	
	inline public function hasParent () :Bool
	{
		return parent != null;
	}
	
	override function onReset () :Void
	{
		super.onReset();
		//Don't change parents unnecessarily, it can be expensive or complicated .
		if ((parent == null && parentProperty != null) || 
			(parent != null && parentProperty != null && owner.getProperty(parentProperty) != parent)) {
			removeFromParent();
			if (parentProperty != null) {
				addToParent();
			}
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		if (hasParent()) {
			removeFromParent();
		}
		//Make a copy of the array modified within the loop
		if (_children != null && _children.length > 0) {
			for (child in children.copy()) {
				child.removeFromParent();
			}
		}
		parentProperty = null;
		_children = null;
	}
}
