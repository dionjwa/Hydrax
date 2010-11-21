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

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;

/**
* A component in PBE is used to define specific pieces of functionality for
* game entities. Several components can be added to a single entity to give
* the entity complex behavior while keeping the different functionalities separate
* from each other.
* 
* <p>A full featured implementation of this interface is included (EntityComponent).
* It should be adequate for almost every situation, and therefore, custom components
* should derive from it rather than implementing this interface directly.</p>
* 
* <p>There are several reasons why PBE is set up this way:
* <bl>
*	<li>Entities have only the data they need and nothing more.</li>
*	<li>Components can be reused on several different types of entities.</li>
*	<li>Programmers can focus on specific pieces of functionality when writing code.</li>
* </bl>
* </p>
* 
* @see IEntity
* @see EntityComponent
* @see http://pushbuttonengine.com/docs/04-Components.html Components chapter in manual.
*/
interface IEntityComponent
{
   var context (get_context, set_context) :IPBContext;
   
  /**
   * A reference to the entity that this component currently belongs to. If
   * the component has not been added to an entity, this will be null.
   * 
   * <p>This value should be equivalent to the first parameter passed to the register
   * method.</p>
   * 
   * @see #register() 
   */
   var owner (get_owner, set_owner) :IEntity;
  
  /**
   * Set the owner. This should only be set by the owning IEntity.
   */
  
  /**
   * The name given to the component when it is added to an entity.
   * 
   * This value should be equivelent to the second parameter passed to the register
   * method.
   * 
   * @see #register() 
   */
  var name (get_name, set_name):String;
  
  /**
   * Whether or not the component is currently registered with an entity.
   */
  var isRegistered (get_isRegistered, never):Bool;

  /**
   * Registers the component with an entity. This should only ever be called by
   * an IEntity from the addComponent method.
   * 
   * @param owner The entity to register the component with.
   * @param name The name to assign to the component.
   */
  function register(owner:IEntity, ?name:String):Void;
  
  /**
   * Unregisters the component from an entity. This should only ever be called by
   * an entity class from the removeComponent method.
   */
  function unregister():Void;
  
  /**
   * This is called by an entity on all of its components any time a component
   * is added or removed. In this method, any references to properties on the
   * owner entity should be purged and re-looked up.
   */
  function reset():Void;
}

