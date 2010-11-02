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
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Assert;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;

using com.pblabs.util.XMLUtil;

using Lambda;

using com.pblabs.util.ArrayUtil;

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
*/
class NodeComponent<P, C> extends EntityComponent,
    implements ISerializable
{
    public var parentProperty :PropertyReference<P>;
    public var children (default, null) :Array<C>;
    public var parent (default, null) :P;
    
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
        for (c in e.lookupComponentsByType(nodeTypeClass)) {
            var n :NodeComponent<IEntityComponent, Dynamic> = cast(c);
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
        for (c in e.lookupComponentsByType(nodeTypeClass)) {
            var n :NodeComponent<IEntityComponent, Dynamic> = cast(c);
            if (!n.children.isEmpty()) {
                for (child in n.children) {
                    getEntityAndAllChildren(cast(child, IEntityComponent).owner, nodeTypeClass, list);
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
        parent = null;
    }
    
    public function serialize (xml :XML) :Void
    {
        xml.createChild("parent", parent != null ? PBUtil.entityProp(cast(parent)) :parentProperty);
    }
    
    public function deserialize (xml :XML, context :IPBContext) :Dynamic
    {
        parentProperty = cast(xml.parsePropertyReference("parent"));
    }
    
    public function addChild (c :C) :Void
    {
        Preconditions.checkArgument(isRegistered, "Component must first be registered");
        Preconditions.checkArgument(Std.is(c, NodeComponent), "Children must be of type NodeComponent");
        Preconditions.checkArgument(cast(c, IEntityComponent).isRegistered, "Child not registered: " + c);
        
        if (children == null) {
            children = new Array<C>();
        }
        
        var cNode :NodeComponent<Dynamic, Dynamic> = cast(c);
        
        Preconditions.checkArgument(!cNode.hasParent(), cNode + " already has a parent, not adding");
        
        cNode.parent = this;
        children.push(c);
        childAdded(c);
        cNode.addedToParent();
    }
    
    public function removeChild (c :C) :Void
    {
        Preconditions.checkNotNull(c, "Attempting to remove null child");
        var cNode :NodeComponent<Dynamic, Dynamic> = cast(c);
        if (!cNode.hasParent()) {
            throw "child has no parent";
            return;
        }
        var before = children.length;
        if (!children.remove(c)) {
            throw "Removing child with a different manager";
        }
        Assert.isFalse(children.length == before, "children.length the same after removal");
        
        if (children.has(null)) {
            throw "After child removal, we have null in children=" + children;
        }
        cNode.removingFromParent();
        cNode.parent = null;
        Assert.isNull(cNode.parent);
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
        Preconditions.checkArgument(isRegistered, "Component must first be registered");
        Preconditions.checkArgument(newParent != null || parentProperty != null, "No parent or parent property provided");
        
        newParent = newParent == null ? owner.getProperty(parentProperty) : newParent;
        
        Preconditions.checkNotNull(newParent, "Parent cannot be null, parentProperty=" + parentProperty);
        Preconditions.checkArgument(Std.is(newParent, NodeComponent), "Parent must be of type NodeComponent, parent is type=" + ReflectUtil.getClassName(newParent));
        Preconditions.checkArgument(cast(newParent, IEntityComponent).isRegistered, "Parent not registered: " + newParent);
        
        if (hasParent()) {
            Log.warn("but hasParent");
            return;
        }
        
        cast(newParent, NodeComponent<Dynamic, Dynamic>).addChild(this);
    }
    
    public function removeFromParent () :Void
    {
        if (!hasParent()) {
            return;
        }
        cast(parent, NodeComponent<Dynamic, Dynamic>).removeChild(this);
    }
    
    inline public function hasParent () :Bool
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
        if (children != null) {
            for (child in children) {
                cast(child, NodeComponent<Dynamic, Dynamic>).removeFromParent();
            }
        }
        children = null;
    }
}


