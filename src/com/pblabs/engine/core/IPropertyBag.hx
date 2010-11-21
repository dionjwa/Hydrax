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

import com.pblabs.engine.core.PropertyReference;

/**
* Minimal interface for accessing properties on some object.
*/
interface IPropertyBag
{
	/**
	* The event dispatcher that controls events for this entity. Components should
	* use this to dispatch and listen for events.
	*/
	// function eventDispatcher():IEventDispatcher;
	
	/**
	* Checks whether a property exists on this entity.
	* 
	* @param property The property reference describing the property to look for on
	* this entity.
	* 
	* @return True if the property exists, false otherwise.
	*/
	function doesPropertyExist(property:PropertyReference<Dynamic>):Bool;
	
	/**
	* Gets the value of a property on this entity.
	* 
	* @param property The property reference describing the property to look for on
	* this entity.
	* @param defaultValue If the property is not found, return this value.
	* 
	* @return The current value of the property, or null if it doesn't exist.
	*/
	function getProperty <T>(property:PropertyReference<T>, ?defaultValue:T = null):T;
	
	/**
	* Sets the value of a property on this entity.
	* 
	* @param property The property reference describing the property to look for on
	* this entity.
	* 
	* @param value The value to set on the specified property.
	*/
	function setProperty(property:PropertyReference<Dynamic>, value:Dynamic):Void;	  
}

