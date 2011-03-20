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
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
using com.pblabs.util.StringUtil;

/**
 * The name manager stores references to IPBObject that have been given
 * names. These IPBObjects can be looked up by name.
 */
class NameManager
#if cpp
	implements haxe.rtti.Infos
#end
{
	public function new() 
	{ 
		_objects = Maps.newHashMap(String);
	}
	
	public function iterator (): Iterator<IPBObject>
	{
		return _objects.iterator();
	}
	
	/**
	 * Registers an entity under a specific name. If the name is in use, gets will
	 * return the last entity added under the name.
	 * 
	 * @param object The object to add.
	 */
	public function add (object :IPBObject) :Void
	{
		Preconditions.checkNotNull(object);
		
		if (!object.name.isBlank()) {
			com.pblabs.util.Log.debug("Adding named object: " + object.name);
			if (_objects.get(object.name) != null) {
				com.pblabs.util.Log.warn("An object with the name already exists: " + object.name);
			}
			_objects.set(object.name, object);
		}
	}
	
	/**
	 * Removes an object from the manager.
	 * 
	 * @param entity The IPBObject to remove.
	 */
	public function remove (object :IPBObject):Void
	{
		_objects.remove(object.name);
	}
	
	/**
	 * Looks up a IPBObject with the specified name.
	 * 
	 * @param name The name of the object to look up.
	 * 
	 * @return The object with the specified name, or null if it wasn't found.
	 */
	public function get <T>(name:String) :T
	{
		return cast(_objects.get(name));
	}
	
	/**
	 * Turns a potentially used name and returns a related unused name. The
	 * given name will have a number appended, with the number continually
	 * incremented until an unused name is found.
	 * 
	 * @param name The name to validate.
	 * 
	 * @return The validated name. This is guaranteed to not be in use.
	 */
	public function validateName (name :String) :String
	{
		if (get(name) == null) {
			return name;
		}
		
		var index:Int = 1;
		var testName = name + index;
		while (get(testName) != null) {
			testName = name + index++;
		}
		
		return testName;
	}
	
	/**
	 * Looks up a component on an entity that has been registered. The same
	 * conditions apply as with the getComponentByType method on IEntity.
	 * 
	 * @param The name of the entity on which the component exists.
	 * @param componentType The type of the component to get.
	 * 
	 * @see com.pblabs.engine.core.IEntity#getComponentByType()
	 */
	public function getComponentByType <T> (name :String, componentType :Class<T>) :T
	{
		var entity :IEntity = cast(get(name));
		if (entity == null) {
			return null;
		}
		
		return cast(entity.getComponentByType(componentType));
	}
	
	/**
	 * Looks up components on an entity that has been registered. The same
	 * conditions apply as with the getComponentsByType method on IEntity.
	 * 
	 * @param The name of the entity on which the component exists.
	 * @param componentType The type of the components to get.
	 * 
	 * @see com.pblabs.engine.core.IEntity#getComponentByType()
	 */
	public function getComponentsByType <T>(name :String, componentType :Class<T>) :Iterable<T>
	{
		var entity:IEntity = cast(get(name));
		if (entity == null) {
			return null;
		}
		
		return entity.getComponentsByType(componentType);
	}	  
	
	/**
	 * Looks up a component on an entity that has been registered. The same
	 * conditions apply as with the getComponentByName method on IEntity.
	 * 
	 * @param The name of the entity on which the component exists.
	 * @param componentName The name of the component to get.
	 * 
	 * @see com.pblabs.engine.core.IEntity#getComponentByName()
	 */
	public function getComponentByName <T>(name :String, componentName :String) :T
	{
		var entity:IEntity = cast(get(name));
		if (entity == null) {
			return null;
		}
		
		return cast(entity.getComponentByName(componentName));
	}
	
	var _objects :Map<String, IPBObject>;
}
