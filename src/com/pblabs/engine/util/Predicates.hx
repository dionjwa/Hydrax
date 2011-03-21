package com.pblabs.engine.util;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBObject;

class Predicates
{
	/**
	 * As it says.
	 */
	public static function componentToName (c :IEntityComponent) :String
	{
		return c.name;
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
