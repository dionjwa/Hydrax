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

/**
 * A property reference stores the information necessary to lookup a property
 * on an entity.
 * 
 * <p>These are used to facilitate retrieving information from entities without
 * requiring a specific interface to be implemented. For example, a component that
 * handles display information would need to retrieve spatial information from a
 * spatial component. The spatial component can store its information however it
 * sees fit. The display component would have a PropertyReference member that would
 * be initialized to the path of the desired property on the spatial component.</p>
 * 
 * @see IEntity#DoesPropertyExist()
 * @see IEntity#getProperty()
 * @see IEntity#setProperty()
 */
class PropertyReference<T>
 {
	/**
	 * The path to the property that this references.
	 */
	public var property (default, null) : String;

	public function new (property:String)
	{
		this.property = property;
		getterSetterChecked = false;
	}

	public function toString () :String
	{
		return property;
	}

	public var cachedLookup :Array<String>;
	public var getterName :String;
	public var setterName :String;
	public var getterSetterChecked :Bool;
}


