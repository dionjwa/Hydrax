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

import com.pblabs.engine.core.Entity;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.injection.Injector;
import com.pblabs.util.Preconditions;
import com.pblabs.util.SignallingVar;

import hsl.haxe.Bond;
import hsl.haxe.Signaler;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;


import com.pblabs.util.ReflectUtil;

using StringTools;

using com.pblabs.util.ReflectUtil;

class ComponentInjector extends Injector
{
	public function new ()
	{
		super();
		_propertyRefCache = Maps.newHashMap(String);
	}
	
	public function injectComponentListeners (obj :IEntityComponent, ?bonds :Array<Bond>, ?cls :Class<Dynamic>) :Array<Bond>
	{
		Preconditions.checkNotNull(obj, "Null object");
		
		cls = cls == null ? obj.getClass() : cls;
		updateRuntimeCache(cls);
		
		for (injectionTuple in Injector.instanceFieldInjections.get(cls)) {
			if (injectionTuple == Injector.NULL_INJECTION) {
				break;
			}
			var field = injectionTuple.v1;
				//If the field type is a function, we are looking for signal property references.
			if (Reflect.field(obj, field) != null && Type.typeof(Reflect.field(obj, field)) == ValueType.TFunction) {
				for (injectionKey in injectionTuple.v2) {
					// #if js
					// Log.error("JS does not maintain proper listener scope, signal injection fail: " + ReflectUtil.tinyClassName(obj) + "." + field);
					// trace("JS does not maintain proper listener scope, signal injection fail: " + ReflectUtil.tinyClassName(obj) + "." + field);
					// #else
					var bond = bindSignaller(obj, field, injectionKey);
					if (bond != null) {
						if (bonds == null) {
							bonds = new Array();
						}
						bonds.push(bond);
					}
					// #end
				}
			}
		}
				
		var superCls = Type.getSuperClass(cls);
		//Recursively inject superclass fields/listeners
		if (superCls != null && superCls != EntityComponent) {
			Log.debug(" injecting listeners on superclass=" + superCls);
			bonds = injectComponentListeners(obj, bonds, superCls);
		}
		return bonds;
	}
	
	public function bindSignaller (obj :IEntityComponent, listenerMethodName :String, signalRef :String) :Bond
	{
		var signalProp :Dynamic = obj.owner.getProperty(getProperty(signalRef));
		var signaller :Signaler<Dynamic> = null;
		if (signalProp == null) {
			Log.error("Cannot bind " + listenerMethodName + " to signal from ref " + signalRef + ", signaler is null");
			return null;
		} else if (Std.is(signalProp, SignallingVar)) {//Check if the signaller is a SignallingVar
			signaller = cast(signalProp, SignallingVar<Dynamic>).signaller;
			// return signaller.bind(Reflect.field(obj, listenerMethodName));
		} else {
			signaller = cast(signalProp, Signaler<Dynamic>);
			Log.debug("Binding " + obj.name + "." + listenerMethodName + " to " + signalRef);
			// return cast(signalProp, Signaler<Dynamic>).bind(Reflect.field(obj, listenerMethodName));
		}
		
		#if js
		return signaller.bind(Reflect.field(obj, listenerMethodName), obj);
		#else
		return signaller.bind(Reflect.field(obj, listenerMethodName));
		#end
	}
	
	function getProperty (s :String) :PropertyReference<Dynamic>
	{
		if (_propertyRefCache.get(s) == null) {
			_propertyRefCache.set(s, new PropertyReference(s));
		}
		return _propertyRefCache.get(s);
	}
	
	var _propertyRefCache :Map<String, PropertyReference<Dynamic>>;
}


