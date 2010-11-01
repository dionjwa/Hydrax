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
import com.pblabs.engine.core.PBObject;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.core.SignalBondManager;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.injection.ComponentInjector;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.ITickedObject;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import hsl.haxe.Bond;

/**
 * Default implementation of IEntity.
 * 
 * <p>Please use allocateEntity() to get at instances of Entity; this allows
 * us to pool Entities at a later date if needed and do other tricks. Please
 * program against IEntity, not Entity, to avoid dependencies.</p>
 */
class Entity extends PBObject, 
    implements IEntity
{
    public function new() 
    {
        super();
        _deferring = true;
        _components = Maps.newHashMap(String);
        _deferredComponents = new Array();
    }
    
    /** Iterate over components */
    public function iterator () :Iterator<IEntityComponent>
    {
        return _components.iterator();
    }
    
    public var deferring(get_deferring, set_deferring) : Bool;
    
    public function get_deferring():Bool
    {
        return _deferring;
    }
    
    public function set_deferring(value:Bool):Bool
    {
        if(_deferring == true && value == false)
        {
            // Resolve everything, and everything that that resolution triggers.
            var needReset:Bool = _deferredComponents.length > 0;
            var component :IEntityComponent;
            while(_deferredComponents.length > 0)
            {
                var pc:PendingComponent = cast( _deferredComponents.shift(), PendingComponent);
                pc.item.register(this, pc.name);
                component = pc.item;
                
                //Add the timed components here rather than forcing
                //each implementing class to add itself.
                if (Std.is(component, ITickedObject)) {
                    _context.processManager.addTickedObject(cast(component));
                }
                if (Std.is(component, IAnimatedObject)) {
                    _context.processManager.addAnimatedObject(cast(component));
                }
            }
            
            // Mark deferring as done.
            _deferring = false;
            
            // Fire off the reset.
            if(needReset) {
                doResetComponents();
            }                
        }
        
        _deferring = value;
        return value;
       }
    
    public override function initialize (?name :String = null) :Void
    {            
        // Pass control up.
        super.initialize(name);

        // Resolve any pending components.
        deferring = false;
    }
    
    public override function destroy():Void
    {
        // Give listeners a chance to act before we start destroying stuff.
        //TODO: implement with signals?
        
        // Unregister our components.
        for (c in _components)
        {
            if(c.isRegistered) {
                c.unregister();
            }
            if (Std.is(c, ITickedObject)) {
                _context.processManager.removeTickedObject(cast(c));
            }
            if (Std.is(c, IAnimatedObject)) {
                _context.processManager.removeAnimatedObject(cast(c));
            }
            
        }
        
        // And remove their references from the dictionary.
        for (c in _components) {
            _components.remove(c.name);
        }

        // Get out of the NameManager and other general cleanup stuff.
        super.destroy();
    }
    
    /**
     * Serializes an entity. Pass in the current XML stream, and it automatically
     * adds itself to it.
     * @param    xml the <things> XML stream.
     */
    public function serialize(xml :XML):Void
    {
        throw "Not implemented";
        // var entityXML:XML = Xml.parse("<entity name={name} />");
        // if(alias!=null)
        //     entityXML = Xml.parse("<entity name={name} alias={alias} />");   
        
        // for (component in _components)
        // {            
        //     throw "Not implemented";
        //     // var componentXML:XML = <component type={getQualifiedClassName(component).replace(~/::/,".")} name={component.name} />;
        //     // context.getManager(Serializer).serialize(component, componentXML);
        //     // entityXML.appendChild(componentXML);
        // }

        // xml.appendChild(entityXML);            
    }
    
    public function deserialize(xml :XML, ?registerComponents:Bool = true):Void
    {
        throw "Not implemented";
        // // Note what entity we're deserializing to the Serializer.
        // context.getManager(Serializer).setCurrentEntity(this);

        // // Push the deferred state.
        // var oldDefer:Bool = deferring;
        // deferring = true;
        
        // // Process each component tag in the xml.
        // for each (var componentXML:XML in xml.*)
        // {
        //     // Error if it's an unexpected tag.
        //     if(componentXML.name().toString().toLowerCase() != "component")
        //     {
        //         Log.error(this, "deserialize", "Found unexpected tag '" + componentXML.name().toString() + "', only <component/> is valid, ignoring tag. Error in entity '" + name + "'.");
        //         continue;
        //     }
            
        //     var componentName:String = componentXML.attribute("name");
        //     var componentClassName:String = componentXML.attribute("type");
        //     var component:IEntityComponent = null;
            
        //     if (componentClassName.length > 0)
        //     {
        //         // If it specifies a type, instantiate a component and add it.
        //         var type:Class<Dynamic> = TypeUtility.getClassFromName(componentClassName);
        //         if(!type)
        //         {
        //             Log.error(this, "deserialize", "Unable to find type '" + componentClassName + "' for component '" + componentName +"' on entity '" + name + "'.");
        //             continue;
        //         }
                
        //         component = cast( context.allocate(type), IEntityComponent);
        //         if (!component)
        //         {
        //             Log.error(this, "deserialize", "Unable to instantiate component " + componentName + " of type " + componentClassName + " on entity '" + name + "'.");
        //             continue;
        //         }
                
        //         if (!addComponent(component, componentName))
        //             continue;
        //     }
        //     else
        //     {
        //         // Otherwise just get the existing one of that name.
        //         component = lookupComponentByName(componentName);
        //         if (!component)
        //         {
        //             Log.error(this, "deserialize", "No type specified for the component " + componentName + " and the component doesn't exist on a parent template for entity '" + name + "'.");
        //             continue;
        //         }
        //     }
            
        //     // Deserialize the XML into the component.
        //     (cast( context.getManager(Serializer), Serializer)).deserialize(context, component, componentXML);
        // }
        
        // // Deal with set membership.
        // var setsAttr:String = xml.attribute("sets");
        // if (setsAttr)
        // {
        //     // The entity wants to be in some sets.
        //     var setNames:Array<Dynamic> = setsAttr.split(",");
        //     if (setNames)
        //     {
        //         // There's a valid-ish set string, let's loop through the entries
        //         var thisName:String;
        //         while (thisName = setNames.pop())
        //         {
        //             var pbset:PBSet = cast( context.lookup(thisName), PBSet);
        //             if (!pbset) 
        //             {
        //                 // Set doesn't exist, create a new one.
        //                 pbset = context.allocate(PBSet);
        //                 pbset.initialize(thisName);
                        
        //                 Log.warn(this, "deserialize", "Auto-creating set '" + thisName + "'.");
        //             }
        //             pbset.add(cast( this, PBObject));
        //         }
        //     }
        // }            
        
        // // Restore deferred state.
        // deferring = oldDefer;
    }
    
    public function addComponent(component:IEntityComponent, ?componentName:String):Bool
    {
        Preconditions.checkNotNull(component, "Cannot add a null component");
        
        componentName = componentName == null ? ReflectUtil.tinyClassName(component) : componentName; 
        // Check the context.
        Preconditions.checkArgument(component.context == context, "Component and entity are not from same context!");
        
        // Add it to the dictionary.
        if (!doAddComponent(component, componentName)) {
            return false;
        }

        // If we are deferring registration, put it on the list.
        if(deferring)
        {
            var p = new PendingComponent();
            p.item = component;
            p.name = componentName;
            _deferredComponents.push(p);
            return true;
        }

        // We have to be careful w.r.t. adding components from another component.
        component.register(this, componentName);
        if (Std.is(component, ITickedObject)) {
            _context.processManager.addTickedObject(cast(component));
        }
        if (Std.is(component, IAnimatedObject)) {
            _context.processManager.addAnimatedObject(cast(component));
        }
        
        // Fire off the reset.
        doResetComponents();
        
        return true;
    }
    
    public function removeComponent(component:IEntityComponent):Void
    {
        // Update the dictionary.
        if (!doRemoveComponent(component))
            return;

        // Deal with pending.
        if(component.isRegistered == false)
        {
            // Remove it from the deferred list.
            for(i in 0..._deferredComponents.length)
            {
                if((cast( _deferredComponents[i], PendingComponent)).item != component)
                    continue;
                
                // TODO: Forcibly call register/unregister to ensure onAdd/onRemove semantics?
                
                _deferredComponents.splice(i, 1);
                break;
            }

            return;
        }
        
        component.unregister();
        
        doResetComponents();
    }
    
    public function lookupComponentByType <T>(componentType:Class<T>):T
    {
        for (component in _components)
        {
            if (Std.is( component, componentType))
                return cast(component);
        }
        
        return null;
    }
    
    public function lookupComponent <T>(componentType:Class<T>):T
    {
        return lookupComponentByType(componentType);
    }
    
    public function lookupComponentsByType <T>(componentType:Class<T>):Array<T>
    {
        var list = new Array();
        
        for (component in _components)
        {
            if (Std.is( component, componentType))
                list.push(component);
        }
        
        return cast(list);
    }
    
    public function lookupComponentByName <T>(componentName:String):T
    {
        return cast(_components.get(componentName));
    }
    
    public function doesPropertyExist (property :PropertyReference<Dynamic>):Bool
    {
        return getProperty(property) != null;
    }
    
    public function getProperty <T> (property :PropertyReference<T>, ?defaultVal :T = null) :T
    {
        return _context.getProperty(property, defaultVal, this);
    }
    
    public function setProperty (property :PropertyReference<Dynamic>, value :Dynamic) :Void
    {
        _context.setProperty(property, value, this);
    }
    
    function doAddComponent(component:IEntityComponent, componentName:String):Bool
    {
        if (componentName == "")
        {
            Log.warn(["AddComponent", "A component name was not specified. This might cause problems later."]);
        }
        
        if (component.owner != null)
        {
            Log.error(["AddComponent", "The component " + componentName + " already has an owner. (" + name + ")"]);
            return false;
        }
        
        if (_components.get(componentName) != null)
        {
            Log.error(["AddComponent", "A component with name " + componentName + " already exists on this entity (" + name + ")."]);
            return false;
        }
        
        component.owner = this;
        _components.set(componentName, component);
        return true;
    }
    
    function doRemoveComponent(component:IEntityComponent):Bool
    {
        if (component.owner != this)
        {
            Log.error(["AddComponent", "The component " + component.name + " is not owned by this entity. (" + name + ")"]);
            return false;
        }
        
        if (_components.get(component.name) == null)
        {
            Log.error(["AddComponent", "The component " + component.name + " was not found on this entity. (" + name + ")"]);
            return false;
        }
        
        _components.remove(component.name);
        if (Std.is(component, ITickedObject)) {
            _context.processManager.removeTickedObject(cast(component));
        }
        if (Std.is(component, IAnimatedObject)) {
            _context.processManager.removeAnimatedObject(cast(component));
        }
        return true;
    }
    
    /**
     * Call reset on all the registered components in this entity.
     */
    function doResetComponents():Void
    {
        var oldDefer:Bool = _deferring;
        deferring = true;
        
        var sm = context.getManager(SignalBondManager);
        sm.destroyBonds(this);
        
        var sets = context.getManager(SetManager);
        
        var bonds :Array<Bond> = null;
        for (component in _components)
        {
            // Skip unregistered entities. 
            if(!component.isRegistered) {
                continue;
            }
            
            //Inject the component fields
             _context.injectInto(component);
             
             //Inject the sets (components annotated with @sets("set1", "set2") at the constructor
             sets.injectSets(component);
             
             //Inject the signal listeners
             bonds = cast(_context.injector, ComponentInjector).injectComponentListeners(component , bonds);
              
            //Reset it!
            component.reset();                
        }
        if (bonds != null) {
            sm.setAll(this, bonds);
        }
        
        deferring = false;
    }
    
    var _deferring :Bool;
    var _components :Map<String, IEntityComponent>;
    var _deferredComponents :Array<PendingComponent>;
}

class PendingComponent
{
    public function new () {}
    
    public var item :IEntityComponent;
    public var name :String;
}


