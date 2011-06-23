package com.pblabs.util;

using StringTools;

class ObjectUtil
{
	/**
	  * Converts an object to a dynamic object, copying all fields
	  */
	public static function toDynamicObject (obj :Dynamic) :Dynamic
	{
		var result = {}
		for (f in Reflect.fields(obj)) {
			if (f.startsWith("__")) {
				continue;
			}
			var isVar = switch (Type.typeof(Reflect.field(obj, f))) {
				case TNull: true; 
				case TInt: true;
				case TFloat: true;
				case TBool: true;
				case TObject: true; 
				case TFunction: false;
				case TClass( c ): true; 
				case TEnum( e ): true;
				case TUnknown: false;
			}
			if (isVar) {
				Reflect.setField(result, f, Reflect.field(obj, f));
			}
		}
		return result;
	}
	
	public static function copy (obj :Dynamic, ?into :Dynamic) :Dynamic
	{
		var result = into == null ? {} : into;
		for (f in Reflect.fields(obj)) {
			if (f.startsWith("__")) {
				continue;
			}
			var isVar = switch (Type.typeof(Reflect.field(obj, f))) {
				case TNull: true; 
				case TInt: true;
				case TFloat: true;
				case TBool: true;
				case TObject: true; 
				case TFunction: false;
				case TClass( c ): true; 
				case TEnum( e ): true;
				case TUnknown: false;
			}
			if (isVar) {
				Reflect.setField(result, f, Reflect.field(obj, f));
			}
		}
		return result;
	}
	
}
