/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

// import com.pblabs.util.ds.Map;
// import com.pblabs.util.ds.Maps;
// import Type;

class MetaUtil
{
	// static var _instanceFields :Map<Class<Dynamic>, Map<String, Dynamic>> = Maps.newHashMap(ValueType.TObject);
	
	public static function isFieldMetaData (cls :Class<Dynamic>, fieldName :String, metaLabel :String) :Bool
	{
		com.pblabs.util.Assert.isNotNull(cls, "cls is null");
		com.pblabs.util.Assert.isNotNull(fieldName, "fieldName is null");
		com.pblabs.util.Assert.isNotNull(metaLabel, "metaLabel is null");
		
		var meta = haxe.rtti.Meta.getFields(cls);
		if (meta == null) {
			return false;
		}
		return Reflect.hasField(meta, fieldName) && Reflect.hasField(Reflect.field(meta, fieldName), metaLabel);
	}
	
	/** Assumes we have checked with isFieldMetaData */
	public static function getFieldMetaData (cls :Class<Dynamic>, fieldName :String, metaLabel :String) :Dynamic
	{
		com.pblabs.util.Assert.isNotNull(cls, "cls is null");
		com.pblabs.util.Assert.isNotNull(fieldName, "fieldName is null");
		com.pblabs.util.Assert.isNotNull(metaLabel, "metaLabel is null");
		
		var meta = haxe.rtti.Meta.getFields(cls);
		if (meta == null) {
			return null;
		}
		if (Reflect.hasField(meta, fieldName) && Reflect.hasField(Reflect.field(meta, fieldName), metaLabel)) {
			return Reflect.field(Reflect.field(meta, fieldName), metaLabel);
		} else {
			return null;
		}
	}
	
	// static function getInstanceFields (cls :Class<Dynamic>) :Map<String>
	// {
	// 	if (_instanceFields.exists(cls)) {
	// 		return _instanceFields.get(cls);
	// 	}
		
	// 	var meta = haxe.rtti.Meta.getFields(cls);
	// 	if (meta == null) {
	// 		_instanceFields.set(cls, null);
	// 		return null;
	// 	}
	// 	var metaMap :Map<String, Dyamic> = Maps.newHashMap(ValueType.TClass(String));
	// 	for (field in Reflect.fields(meta)) {
	// 		var fieldMeta = Reflect.field(meta, field);
	// 		for (metaId in Reflect.fields(fieldMeta)) {
	// 			metaMap.set(
	// 		}
	// 	}
		
	// 	return Reflect.hasField(meta, fieldName) && Reflect.hasField(Reflect.field(meta, fieldName), metaLabel);
		
	// }

}
