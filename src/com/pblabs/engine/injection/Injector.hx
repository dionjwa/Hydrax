/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.injection;

import Type.ValueType;

import org.transition9.util.Preconditions;

import org.transition9.ds.Map;
import org.transition9.ds.Maps;
import org.transition9.ds.MultiMap;
import org.transition9.ds.Tuple;
import org.transition9.ds.multimaps.SetMultiMap;
import org.transition9.ds.multimaps.ArrayMultiMap;
import org.transition9.rtti.ReflectUtil;

using Lambda;

using Reflect;

using org.transition9.util.IterUtil;
using org.transition9.rtti.ReflectUtil;

/**
  * Injects component PropertyReference variable fields.
  * Use @inject("<id>") to inject fields.
  * E.g. @inject("SpatialComponent.x")
  * If there is no manually assigned field injections (via setFieldInjection),
  * the injection label must correspond to a property reference.
  */
class Injector implements IInjector
{
	public var parentInjector (get_parentInjector, set_parentInjector) :IInjector;
	public var isParentInjector (get_isParentInjector, never) :Bool;
	
	var _injectionValues :Map<String, Dynamic>;
	
	var _parentInjector :IInjector;
	
	/** Maps classes to an array of InjectionFieldData values */
	public static var INJECTION_MAP :InjectionDataMap;
	
	static var SINGLE_VALUE_ARRAY :Array<Dynamic> = [null];
	
	public function new () 
	{
		if (INJECTION_MAP == null) {
			INJECTION_MAP = new InjectionDataMap();
		}
		_injectionValues = new org.transition9.ds.maps.HashMap();
	}
	
	#if debug
	public function getInjectionData (cls :Class<Dynamic>) :String
	{
		return cast(INJECTION_MAP.get(cls), Array<Dynamic>).join(", ");
	}
	#end
	
	public function mapValue (type :Class<Dynamic>, value :Dynamic, ?optionalName :String) :Void
	{
		if (Type.getClassName(type) != null) {
			_injectionValues.set(Type.getClassName(type), value);
		}
		if (optionalName != null) {
			_injectionValues.set(optionalName, value);
		}
	}
	
	public function getMapping (key :Class<Dynamic>, ?name :String) :Dynamic
	{
		Preconditions.checkArgument(key != null || name != null, "Both args are null");
		
		if (name != null && _injectionValues.get(name) != null) {
			return _injectionValues.get(name);
		}
		
		if (key != null && _injectionValues.get(Type.getClassName(key)) != null) {
			return _injectionValues.get(Type.getClassName(key));
		}
		
		if (isParentInjector) {
			return parentInjector.getMapping(key, name);
		}
		return null;
	}
	
	public function hasMapping (key :Class<Dynamic>, ?name :String) :Bool
	{
		Preconditions.checkArgument(key != null || name != null, "Both args are null");
		
		if (name != null && _injectionValues.exists(name)) {
			return true;
		} else if (key != null && _injectionValues.exists(key.getClassName())) {
			return true;
		} else if (isParentInjector) {
			return parentInjector.hasMapping(key, name);
		} else {
			return false; 
		}
	}
	
	public function unmap (cls :Class<Dynamic>, ?name :String) :Void
	{
		_injectionValues.remove(cls.getClassName());
		if (name != null) {
			_injectionValues.remove(name);
		}
		if (cls != null) {
			_injectionValues.remove(cls.getClassName());
		}
	}
	
	public function injectInto (obj :Dynamic) :Void
	{
		Preconditions.checkNotNull(obj, "obj argument is null");
		var cls = org.transition9.rtti.ReflectUtil.getClass(obj);
		Preconditions.checkNotNull(cls, "obj class is null");
		injectFields(obj, cls);
	}
	
	public function shutdown () :Void
	{
		_injectionValues.clear();
		_injectionValues = null;
		_parentInjector = null;
	}
	
	function injectFields (obj :Dynamic, cls :Class<Dynamic>) :Void
	{
		// updateRuntimeCache(cls);
		Preconditions.checkNotNull(cls, "obj class is null");
		for (injectionTuple in INJECTION_MAP.get(cls)) {
			if (injectionTuple == InjectionDataMap.NULL_INJECTION) {
				break;
			}
			
			var field = injectionTuple.fieldName;
			
			if (Type.typeof(Reflect.field(obj, field)) == ValueType.TFunction) {
				continue;
			}
			
			//Don't inject into fields with existing values
			//TODO: check if the field is a function
			if (Reflect.field(obj, field) != null) {
				continue;
			}
			
			// for (injectionKey in injectionTuple.v2) {
				
				var injectedValue :Dynamic = getMapping(Type.resolveClass(injectionTuple.className), injectionTuple.label);
				if (injectedValue == null) {
					continue;
				}
				//Haxe doesn't property handle properties when using reflection
				try {
					if (Lambda.has(Type.getInstanceFields(cls), "set_" + field)) {
						SINGLE_VALUE_ARRAY[0] = injectedValue;
						Reflect.callMethod(obj, Reflect.field(obj, "set_" + field), SINGLE_VALUE_ARRAY);
						SINGLE_VALUE_ARRAY[0] = null;
					} else {
						Reflect.setField(obj, field, injectedValue);
					}
				} catch (e :Dynamic) {
					throw "Could not inject:  " + obj + "." + field + "=" + injectedValue + ", type=" + ReflectUtil.getClassName(injectedValue) + "\n" + e;
				}
			// }
			
		}
	}
	
	function get_isParentInjector () :Bool
	{
		return _parentInjector != null;
	}
	
	function get_parentInjector () :IInjector
	{
		return _parentInjector;
	}
	
	function set_parentInjector (val :IInjector) :IInjector
	{
		Preconditions.checkArgument(!isParentInjector, "There's already a parent injector");
		_parentInjector = val;
		return val;
	}
}

class InjectionFieldData
{
	public var fieldName :String;
	public var className :String;
	public var label :String;
	public function new (fieldName :String, className :String, ?label :String) :Void
	{
		this.fieldName = fieldName;
		this.className = className;
		this.label = label;
	}
	
	#if debug
	public function toString() :String
	{
		return "InjectionFieldData [" +fieldName+ "->" + className + "(" + label + ")]";
	}
	#end
}

class InjectionDataMap
{
	public static var INJECT :String = "inject";
	public static var NULL_INJECTION :InjectionFieldData = new InjectionFieldData(null, null);
	private var _map :MultiMap<Class<Dynamic>, InjectionFieldData>;
	
	public function new () :Void
	{
		_map = ArrayMultiMap.create(Type.ValueType.TObject);
	}
	
	public function get (cls :Class<Dynamic>) :Iterable<InjectionFieldData>
	{
		if (!_map.exists(cls)) {
			computeInjectionData(cls);
		}
		return _map.get(cls);
	}
	
	private function computeInjectionData (cls :Class<Dynamic>) :Void
	{
		#if (nodejs && profiler) untyped __js__("debugger"); #end
		var m = haxe.rtti.Meta.getFields(cls);
		if (m != null) {
			for (field in Reflect.fields(m)) {
				var injectString :String = null;
				//Only cache @inject tags 
				if (!Reflect.hasField(Reflect.field(m, field), INJECT)) {
					continue;
				}
				//Get the field if it has @inject
				var injectMeta :Dynamic = Reflect.field(Reflect.field(m, field), INJECT);
				//TODO: injectMeta will also be null for @editor annotations.
				//Is there extra inject annotation data?
				if (injectMeta == null) {
					if (Type.getClassFields(cls).has("__rtti")) {
						var fieldType = cls.getFieldType(field);
						if (fieldType != null) {
							switch (fieldType) {
								case CClass(name, params):
									var fieldData = new InjectionFieldData(field, name);
									_map.set(cls, fieldData);
								default:
							}
						}
					} else {
						org.transition9.util.Log.error("@inject on " + cls.getClassName() + "." + field + ", but there is no inject annotation, and the class does not implement haxe.rtti.Infos, so we cannot get the class field types at runtime.");
					}
				} else {
					// trace("I'm currently not injecting on multiple @inject labels");
					var injectArr :Array<String> = cast(injectMeta);
					var fieldData = new InjectionFieldData(field, null, injectArr[0]);
					_map.set(cls, fieldData);
				}
			}
		} 
		
		var superCls = Type.getSuperClass(cls);
		//Recursively inject superclass fields/listeners
		if (superCls != null && !_map.exists(superCls)) {
			computeInjectionData(superCls);
			//Copy the inject metadata
			for (tup in _map.get(superCls)) {
				if (tup != NULL_INJECTION) {
					_map.set(cls, tup);
				}
			}
		}
		
		//Mark with a null injection, so we know this class has been checked
		if (!_map.exists(cls)) {
			_map.set(cls, NULL_INJECTION);
		}
	}
}

