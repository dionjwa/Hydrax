/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.util;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBObject;

class Mapping
{
	/**
	 * As it says.
	 */
	public static function componentToName (c :IEntityComponent) :String
	{
		return c.name;
	}
	
	public static function componentToEntity (c :IEntityComponent) :IEntity
	{
		return c.owner;
	}
	
	/**
	 * As it says.
	 */
	public static function entityToName (e :IEntity) :String
	{
		return e.name;
	}
	
	public static function componentToEntityName (c :IEntityComponent) :String
	{
		return c.owner.name;
	}
	
	public static function createGetComponent <T> (c :Class<T>) :IEntity->T
	{
	    return function (e :IEntity) :T {
	    	return e.getComponent(c);
	    }
	}
}
