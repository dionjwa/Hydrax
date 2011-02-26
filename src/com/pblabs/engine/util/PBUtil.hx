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
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.Assert;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;

/**
 * Useful functions relating to Entity and EntityComponent objects.
 *
 * For the most part, it assumes IEntityComponent names are e.g.
 * "SomeComponent" if the full class is foo.bar.SomeComponent.
 */
class PBUtil
{
	public static var KEY_COUNT :Int = 1;
	
	public static function getManagerName (cls :Class<Dynamic>, ?name :String = null) :String
	{
		return StringUtil.isBlank(name) ? StringUtil.getStringKey(cls) :  StringUtil.getStringKey(cls) + "|" + name;
	}
	
	public static function addSingletonComponent <T> (context :IPBContext, compClass :Class<T>, ?compName :String = null) :T
	{
		Preconditions.checkNotNull(context, "Null context");
		Preconditions.checkNotNull(compClass, "Null compClass");
		if (compName == null) {
			compName = ReflectUtil.tinyClassName(compClass);
		}
		
		var component = context.allocate(compClass);
		com.pblabs.util.Assert.isNotNull(component, "allocate returned null for compClass=" + compClass);
		
		Preconditions.checkArgument(Std.is(component, IEntityComponent), "Singleton " + compClass + " is not an IEntityComponent");
		var e = context.allocate(IEntity);
		Assert.isNotNull(e.context, "How can the entity context be null? e.name=" +e.name + ", compClass=" + Type.getClassName(compClass));
		e.initialize(compName);
		e.addComponent(cast(component, IEntityComponent), compName);
		e.deferring = false;
		Assert.isTrue(cast(component, IEntityComponent).isRegistered, "addsingle, not registered");
		return component;
	}
	
	public static function addSingleComponent (context :IPBContext, component :IEntityComponent, ?compName :String = null) :Void
	{
		Preconditions.checkNotNull(context, "Null context");
		Preconditions.checkNotNull(component, "Null comp");
		if (compName == null) {
			compName = ReflectUtil.tinyClassName(Type.getClass(component));
		}
		
		var e = context.allocate(IEntity);
		Assert.isNotNull(e.context, "How can the entity context be null? e.name=" +e.name + ", compClass=" + ReflectUtil.getClassName(component));
		e.initialize(compName);
		e.addComponent(component, compName);
		e.deferring = false;
		Assert.isTrue(cast(component, IEntityComponent).isRegistered, "addsingle, not registered");
	}
	
	public static function getSingletonComponent <T> (context :IPBContext, compClass :Class<T>, ?compName :String = null) :T
	{
		Preconditions.checkNotNull(context, "Null context");
		Preconditions.checkNotNull(compClass, "Null compClass");
		if (compName == null) {
			compName = ReflectUtil.tinyClassName(compClass);
		}
		
		var nm = context.getManager(NameManager);
		if (nm.get(compName) != null) {
			return cast(nm.get(compName), IEntity).lookupComponentByName(compName);
		}
		return null;
	}
	
	public static function createEntityAndAddComponent <T> (context :IPBContext, compClass :Class<T>, entityName :String, ?compName :String = null) :T
	{
		Preconditions.checkNotNull(context, "Null context");
		Preconditions.checkNotNull(compClass, "Null compClass");
		if (compName == null) {
			compName = getDefaultComponentName(compClass);
		}
		
		var component = context.allocate(compClass);
		com.pblabs.util.Assert.isNotNull(component, "allocate returned null for compClass=" + compClass);
		
		Preconditions.checkArgument(Std.is(component, IEntityComponent), "Singleton " + compClass + " is not an IEntityComponent");
		var e = context.allocate(IEntity);
		Assert.isNotNull(e.context, "How can the entity context be null? e.name=" +e.name + ", compClass=" + Type.getClassName(compClass));
		e.initialize(entityName);
		e.deferring = true;
		e.addComponent(cast(component, IEntityComponent), compName);
		return component;
	}
	
	/**
	 * Converts IPBObject and IEntityComponent objects 
	 * to the IGameObject/IEntity name.
	 */
	public static function objectNameMapping (obj :Dynamic) :String
	{
		if (Std.is(obj, IPBObject)) {
			return cast(obj, IPBObject).name;
		} else if (Std.is(obj, IEntityComponent)) {
			return cast(obj, IEntityComponent).owner.name;
		} else {
			throw "Unrecogized object";
			return "Unrecogized object";
		}
	}
	
	/**
	 * As it says.
	 */
	public static function componentNameMapping (c :IEntityComponent) :String
	{
		return c.name;
	}
	
	/**
	 * Creates a PropertyReference for a field from a component.
	 * Assumes component name is the short class name.
	 * @param c
	 * @param fieldName
	 * @return
	 */
	public static function componentProp<T> (c :IEntityComponent, ?fieldName :String) :PropertyReference<T>
	{
		return new PropertyReference(componentPropString(c, fieldName));
	}
	
	inline public static function componentPropString (c :IEntityComponent, ?fieldName :String) :String
	{
		com.pblabs.util.Assert.isTrue(c.isRegistered, Type.getClass(c) + " is not yet registered");
		return "@" + c.name + fieldToken(fieldName);
	}
	
	inline public static function classToComponentProp <T>(cls :Class<Dynamic>, ?fieldName :String = null) :PropertyReference<T>
	{
		return new PropertyReference("@" + ReflectUtil.tinyClassName(cls) + fieldToken(fieldName));
	}
	
	inline public static function getDefaultComponentName <T>(componentClass :Class<Dynamic>) :String
	{
		return ReflectUtil.tinyClassName(componentClass);
	}

	public static function entityProp <T> (c :IEntityComponent, ?fieldName :String) :PropertyReference<T>
	{
		return new PropertyReference(entityPropString(c, fieldName));
	}
	
	public static function singletonProp <T> (componentClass :Class<Dynamic>, ?fieldName :String) :PropertyReference<T>
	{
		var compName = ReflectUtil.tinyClassName(componentClass);
		return new PropertyReference("#" + compName + "." + compName + fieldToken(fieldName));
	}
	
	public static function entityPropString (c :IEntityComponent, ?fieldName :String) :String
	{
		com.pblabs.util.Assert.isNotNull(c, "IEntityComponent is null");
		com.pblabs.util.Assert.isTrue(c.isRegistered, "Cannot get the PropertyReference of an unregistered IEntityComponent (type=" + ReflectUtil.getClassName(c) + ") " + com.pblabs.util.Log.getStackTrace());
		return "#" + c.owner.name + "." + componentName(c) + fieldToken(fieldName);
	}

	inline public static function componentClassToSingletonProp <T> (entityComponentClass :Class<Dynamic>, ?field :String = null) :PropertyReference<T>
	{
		var compName = ReflectUtil.tinyClassName(entityComponentClass);
		return new PropertyReference("#" + compName + "." + compName + fieldToken(field));
	}
	
	public static function createPropertyCallback<T> (e :IEntity, p :PropertyReference<T>) :Void->T
	{
		return function () :T {
			if (!e.isLiveObject) return null;
			return e.getProperty(p);
		}
	}
	
	public static function entityToString (e :IEntity) :String
	{
		if (e == null) {
			return "null";
		}
		var s = new StringBuf();
		s.add("[" + e.name + ":");
		for (c in e) {
			s.add("\n  " + c);
		}
		return s.toString();
	}
	
	/**
	  * Used in Lambda.map
	  */
	public static function getEntity (c :IEntityComponent) :IEntity
	{
	    return c == null ? null : c.owner;
	}
	
	inline public static function classToEntityName (cls :Class<IEntityComponent>) :String
	{
	    return ReflectUtil.tinyClassName(cls);
	}
	
	inline static function fieldToken (fieldName :String) :String
	{
		return if (fieldName != null) "." + fieldName else "";
	}
	
	inline static function componentName (c :IEntityComponent) :String
	{
		if (c.isRegistered) {
			return c.name;
		} else {
			return ReflectUtil.tinyClassName(Type.getClass(c));
		}
	}
}
