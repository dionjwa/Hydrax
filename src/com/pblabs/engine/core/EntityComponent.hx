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
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Preconditions;

import com.pblabs.util.ReflectUtil;

/**
* An implementation of the IEntityComponent interface, providing all the basic
* functionality required of all components. Custom components should always
* derive from this class rather than implementing IEntityComponent directly.
* 
* @see IEntity
*/
class EntityComponent 
    implements IEntityComponent, implements haxe.rtti.Infos 
{
   public function new() 
   { 
       _context =null;
       _sanityCheck = false;
       _isRegistered = false;
       _owner = null;
       _name = null;
   }
   
   @inject
   public var context (get_context, set_context) :IPBContext;
   public var owner (get_owner, set_owner) :IEntity;
   public var isRegistered (get_isRegistered, never) :Bool;
   public var name (get_name, set_name) :String;
   
   function get_context():IPBContext
   {
       Preconditions.checkNotNull(_context, ReflectUtil.getClassName(this) + " does not have context set! Did you use context.allocate() to create it?");
       return _context;
   }
   
   function set_context(value:IPBContext):IPBContext
   {
       Preconditions.checkArgument(_context == null || _context == value, ReflectUtil.getClassName(this) + " already registered in another context.");
       _context = value;
       return value;
      }

   /**
   * @inheritDoc
   */
  // [EditorData(ignore="true")]
  function get_owner():IEntity
  {
     return _owner;
  }
  
  function set_owner(value:IEntity):IEntity
  {
      Preconditions.checkNotNull(value, "Cannot set an Entity owner to null.  This can only happen on unRegister");
      Preconditions.checkArgument(_owner == null, "Cannot change the owner");
      _owner = value;
      return value;
   }
  
  /**
   * @inheritDoc
   */
  // [EditorData(ignore="true")]
  function get_name():String
  {
     return _name;
  }
  
  function set_name (name :String) :String
  {
      Preconditions.checkArgument(_name == null, ReflectUtil.getClassName(this) + " already has a name");
      _name = name;
      return name;
  }
  
  /**
   * @inheritDoc
   */
  // [EditorData(ignore="true")]
  function get_isRegistered():Bool
  {
     return _isRegistered;
  }
  
  /**
   * @inheritDoc
   */
  public function register(owner :IEntity, ?name:String):Void
  {
      Preconditions.checkArgument(!isRegistered, "Trying to register an already-registered component!");
     _context = owner.context;
     _name = name;
     _owner = owner;
     _sanityCheck = false;
     _isRegistered = true;
     onAdd();
     Preconditions.checkArgument(_sanityCheck, "Forgot to call super.onAdd(); in " + this + "!");
  }
  
  /**
   * @inheritDoc
   */
  public function unregister():Void
  {
      Preconditions.checkArgument(isRegistered, "Trying to unregister an unregistered component!");
     _isRegistered = false;
     _sanityCheck = false;
     onRemove();
     Preconditions.checkArgument(_sanityCheck, "Forgot to call super.onRemove(); in " + this + "!");
     _owner = null;
     _name = null;
     _context = null;
  }
  
  /**
   * @inheritDoc
   */
  public function reset():Void
  {
      _sanityCheck = false;
     onReset();
     Preconditions.checkArgument(_sanityCheck, "Forgot to call super.onReset(); in " + this + "!");
  }
  
  /**
   * This is called when the component is added to an entity. Any initialization,
   * event registration, or object lookups should happen here. Component lookups
   * on the owner entity should NOT happen here. Use onReset instead.
   * 
   * @see #onReset()
   */
  function onAdd():Void
  {
      _sanityCheck = true;
  }
  
  /**
   * This is called when the component is removed from an entity. It should reverse
   * anything that happened in onAdd or onReset (like removing event listeners or
   * nulling object references).
   */
  function onRemove():Void
  {
      _sanityCheck = true;
  }
  
  /**
   * This is called anytime a component is added or removed from the owner entity.
   * Lookups of other components on the owner entity should happen here.
   * 
   * <p>This can potentially be called multiple times, so make sure previous lookups
   * are properly cleaned up each time.</p>
   */
  function onReset():Void
  {
      _sanityCheck = true;
  }
  
  var _isRegistered :Bool;
  var _owner :IEntity;
  var _name :String;
  var _context :IPBContext;
   var _sanityCheck:Bool;
}


