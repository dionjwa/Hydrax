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

import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.IPropertyBag;
import com.pblabs.engine.serialization.ISerializable;

import hsl.haxe.Signaler;

/**
* Game objects in PBE are referred to as entities. This interface defines the
* behavior for an entity. A full featured implementation of this interface is
* included, but is hidden so as to force using IEntity when storing references
* to entities. To create a new entity, use allocateEntity.
* 
* <p>An entity by itself is a very light weight object. All it needs to store is
* its name and a list of components. Custom functionality is added by creating
* components and attaching them to entities.</p>
* 
* <p>An event with type "EntityDestroyed" will be fired when the entity is
* destroyed via the Destroy() method. This event is fired before any cleanup
* is done.</p>
*  
* @see IEntityComponent
* @see com.pblabs.engine.entity.allocateEntity()
*/
interface IEntity implements IPropertyBag, implements IPBObject
{
	/**
	  * Called when the entity is destroyed.
	  */
	 var destroyedSignal (get_destroyedSignal, null):Signaler<IEntity>;
	
	/**
	* When true, onAdd/onRemove callbacks are deferred. When set to false, any
	* pending callbacks are processed.
	*/
	var deferring(get_deferring, set_deferring) : Bool;
	
	/**
	* Adds a component to the entity.
	* 
	* <p>When a component is added, it will have its register() method called
	* (or onAdd if it is derived from EntityComponent). Also, reset() will be
	* called on all components currently attached to the entity (or onReset
	* if it is derived from EntityComponent).</p>
	* 
	* @param component The component to add.
	* @param componentName The name to set for the component. This is the value
	*		to use in lookupComponentByName to get a reference to the component.
	*		The name must be unique across all components on this entity.
	*/
	function addComponent(component:IEntityComponent, ?componentName:String):Bool;
	
	/**
	* Removes a component from the entity.
	* 
	* <p>When a component is removed, it will have its Unregister method called
	* (or onRemove if it is derived from EntityComponent). Also, Reset will be
	* called on all components currently attached to the entity (or onReset
	* if it is derived from EntityComponent).</p>
	* 
	* @param component The component to remove.
	*/
	function removeComponent(component:IEntityComponent):Void;
	
	/**
	* Creates an XML description of this entity, including all currently attached
	* components.
	* 
	* <p>This is not implemented yet.</p>
	* 
	* @param xml The xml object describing the entity. The parent tag should be
	* included in this variable when the function is called, so only child tags
	* need to be created.
	*/
	function serialize(xml :Xml):Void;
	
	/**
	* Sets up this entity from an xml description.
	* 
	* @param xml The xml object describing the entity.
	* @param registerComponents Set this to false to add components to the entity
	* without registering them. This is used by the level manager to facilitate
	* creating entities from templates. 
	*/
	function deserialize(xml :Xml, ?registerComponents:Bool = true):Void;
	
	/**
	* <p>Gets a component of a specific type from this entity. If more than one
	* component of a specific type exists, there is no guarantee which one
	* will be returned. To retrieve all components of a specified type, use
	* lookupComponentsByType.</p>
	* 
	* <p>This check uses the is operator, so if you pass a parent type,
	* subclasses will be considered to match, as will things implementing
	* an interface you have passed.</p>
	*
	* @param componentType The type of the component to retrieve.
	* 
	* @return The component, or null if none of the specified type were found.
	* 
	* @see #lookupComponentsByType()
	*/
	function lookupComponentByType <T>(componentType:Class<T>):T;
	
	function lookupComponent <T>(componentType:Class<T>):T;
	
	/**
	* Gets a list of all the components of a specific type that are on this
	* entity.
	*
	* <p>This check uses the is operator, so if you pass a parent type,
	* subclasses will be considered to match, as will things implementing
	* an interface you have passed.</p>
	*
	* @param componentType The type of components to retrieve.
	* 
	* @return An array containing all the components of the specified type on
	* this entity.
	*/
	function lookupComponentsByType <T>(componentType:Class<T>):Array<T>;
	
	/**
	* Gets a component that was registered with a specific name on this entity.
	* 
	* @param componentName The name of the component to retrieve. This corresponds
	* to the second parameter passed to AddComponent.
	* 
	* @return The component with the specified name.
	* 
	* @see #AddComponent()
	*/
	function lookupComponentByName <T>(componentName:String):T;
	
	/** Iterate over components*/
	function iterator () :Iterator<IEntityComponent>;
}
