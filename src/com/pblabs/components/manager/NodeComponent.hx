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
using com.pblabs.util.XMLUtil;

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
class NodeComponent<P :NodeComponent<Dynamic, Dynamic>, C :NodeComponent<Dynamic, Dynamic>> extends EntityComponent,
	implements INode<P, C>
{
	var _parentProperty :PropertyReference<P>;
	public var parentProperty (get_parentProperty, set_parentProperty) :PropertyReference<P>;
	function get_parentProperty () :PropertyReference<P>
	{
		return _parentProperty;
	}
	
	function set_parentProperty (val :PropertyReference<P>) :PropertyReference<P>
	{
		_parentProperty = val;
		return val;
	}
	
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
	
	@editorData({ignore :"true"})
	/** Don't set this yourself, use addToParent(p); instead */
	public var parent :P;
	
	public static function getEntityAndAllParents (e :IEntity, nodeTypeClass :Class<Dynamic>, ?list :List<IEntity>) :Iterable<IEntity>
	{
		Preconditions.checkNotNull(e, "Entity cannot be null");
		nodeTypeClass = nodeTypeClass == null ? NodeComponent : nodeTypeClass;
		
		if (list == null) {
			list = new List();
		}
		if (list.has(e)) {
			return list;
		}
		list.add(e);
		for (c in e.getComponentsByType(nodeTypeClass)) {
			var n :NodeComponent<Dynamic, Dynamic> = cast(c);
			if (n.parent != null) {
				getEntityAndAllParents(cast(n.parent, IEntityComponent).owner, nodeTypeClass, list);
			}
		}
		return list;
	}
	
	public static function getEntityAndAllChildren (e :IEntity, nodeTypeClass :Class<Dynamic>, ?list :List<IEntity>) :Iterable<IEntity>
	{
		Preconditions.checkNotNull(e, "Entity cannot be null");
		nodeTypeClass = nodeTypeClass == null ? NodeComponent : nodeTypeClass;
		
		if (list == null) {
			list = new List();
		}
		if (list.has(e)) {
			return list;
		}
		list.add(e);
		for (c in e.getComponentsByType(nodeTypeClass)) {
			var n :NodeComponent<Dynamic, Dynamic> = cast(c);
			if (n._children != null) {
				if (!n.children.isEmpty()) {
					for (child in n.children) {
						getEntityAndAllChildren(cast(child, IEntityComponent).owner, nodeTypeClass, list);
					}
				}
			}
		}
		return list;
	}
	
	public static function getAll (e :IEntity, nodeTypeClass :Class<Dynamic>) :Iterable<IEntity>
	{
		var list = new List<IEntity>();
		getEntityAndAllParents(e, nodeTypeClass, list);
		list.remove(e);
		getEntityAndAllChildren(e, nodeTypeClass, list);
		return list;
	}
	
	public function new ()
	{
		super();
		// children = [];
		parent = null;
	}
	
	public function iterator () :Iterator<C>
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
			parentProperty = cast xml.parsePropertyReference("parent");
		}
		if (parentProperty != null) {
			addToParent();
		}
	}
	
	public function addChild (c :C) :Void
	{
		Preconditions.checkArgument(isRegistered, "Component must first be registered");
		Preconditions.checkArgument(Std.is(c, NodeComponent), "Children must be of type NodeComponent");
		Preconditions.checkArgument(cast(c, IEntityComponent).isRegistered, "Child not registered: " + c);
		
		var child :INodeChild<Dynamic> = cast c;
		
		Preconditions.checkArgument(child.parent == null, c + " already has a parent, not adding");
		
		child.parent = this;
		children.push(c);
		childAdded(c);
		if (Std.is(child, NodeComponent)) {
			cast(c, NodeComponent<Dynamic, Dynamic>).addedToParent();
		}
	}
	
	public function removeChild (c :C) :Void
	{
		var cNode :NodeComponent<Dynamic, Dynamic> = cast c;
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
		com.pblabs.util.Assert.isFalse(children.length == before, "children.length the same after removal");
		
		if (children.has(null)) {
			throw "After child removal, we have null in children=" + children;
		}
		cNode.removingFromParent();
		cNode.parent = null;
		com.pblabs.util.Assert.isNull(cNode.parent);
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
	
	function addedToParent () :Void
	{
		//Override
	}
	
	function removingFromParent () :Void
	{
		//Override
	}
	
	public function addToParent (?newParent :P) :Void
	{
		if (hasParent()) {
			removeFromParent();
		}
		Preconditions.checkArgument(isRegistered, "Component must first be registered ::" + com.pblabs.util.ReflectUtil.getClassName(this));
		Preconditions.checkArgument(newParent != null || parentProperty != null, "No parent or parent property provided ::" + com.pblabs.util.ReflectUtil.getClassName(this));

		// trace(owner.name + "." + name + " being adding to " + parentProperty);
		newParent = newParent == null ? owner.getProperty(parentProperty) : newParent;
		// trace("      newParent=" + newParent);
		
		Preconditions.checkNotNull(newParent, "Parent cannot be null, parentProperty=" + parentProperty);
		Preconditions.checkArgument(Std.is(newParent, NodeComponent), "Parent must be of type NodeComponent, parent is type=" + ReflectUtil.getClassName(newParent));
		Preconditions.checkArgument(newParent.isRegistered, "Parent not registered: " + newParent + "::" + com.pblabs.util.ReflectUtil.getClassName(newParent));
		
		if (hasParent()) {
			com.pblabs.util.Log.warn(" but " + name + ".hasParent " + parent + " " + ReflectUtil.getClassName(parent) + " " + com.pblabs.util.Log.getStackTrace());
			return;
		}
		newParent.addChild(this);
	}
	
	public function removeFromParent () :Void
	{
		if (!hasParent()) {
			return;
		}
		parent.removeChild(this);
		parent = null;
	}
	
	public function hasParent () :Bool
	{
		return parent != null;
	}
	
	override function onReset () :Void
	{
		super.onReset();
		removeFromParent();
		if (parentProperty != null) {
			addToParent();
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
		_children = null;
	}
}
