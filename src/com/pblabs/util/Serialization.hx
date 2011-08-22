package com.pblabs.util;

import haxe.rtti.CType;

using Lambda;

interface SerializableDynamic 
{
	function serializeDynamic () :Dynamic;
	function deserializeDynamic (from :Dynamic) :Void;
}

/*
 * Copied and modified from bdog.Serialize.	
 * A simple serializer that converts a class to a dynamic object, in the process
 * tweaking arrays to be arrays of objects (rather than classes) and enums to be
 * string constructors.
 *
 * Allows field metadata:
 * @ignore		:ignores the field
 */

class Serialization
{
		/** Convert to base64 encoded String */
	public static function encode (bytes :haxe.io.BytesData) :String
	{
		#if flash
		//It's fast.  Polygonal?
	    return jpauclair.Base64.encode(bytes);
	    #else
	    throw "What is the Base64 encoder for this platform?";
	    return null;
	    #end
	}
	
	/** Convert from base64 encoded String */
	public static function decode (base64Encoded :String) :haxe.io.BytesData
	{
		#if flash
		//It's fast.  Polygonal?
	    return jpauclair.Base64.decode(base64Encoded);
	    #else
	    throw "What is the Base64 encoder for this platform?";
	    return null;
	    #end
	}
	
	public static function xyArrayToFloatArray (xys :Array<de.polygonal.motor2.geom.math.XY>) :Array<Float>
	{
		var arr = [];
		for (v in xys) {
			arr.push(v.x);
			arr.push(v.y);
		}
		return arr;
	}
	
	public static function floatArrayToXYArray (floats :Array<Float>) :Array<de.polygonal.motor2.geom.math.XY>
	{
		var arr = new Array<de.polygonal.motor2.geom.math.XY>();
		var ii = 0;
		while (ii < floats.length) {
			arr.push(new com.pblabs.geom.Vector2(floats[ii], floats[ii + 1]));
			ii += 2;
		}
		return arr;
	}
	
	public static function floatArrayToBytes (floats :Array<Float>) :haxe.io.Bytes
	{
		var output = new haxe.io.BytesOutput();
		floats.iter(output.writeFloat);
		output.close();
		return output.getBytes();
	}
	
	public static function bytesToFloatArray (bytes :haxe.io.Bytes) :Array<Float>
	{
		var arr = [];
		var input = new haxe.io.BytesInput(bytes);
		for (ii in 0...Std.int(bytes.length / 4)) {
			arr.push(input.readFloat());
		}
		input.close();
		return arr;
	}
	
	public static function classToDoc(o :Dynamic) :Dynamic 
	{
		if (Std.is(o, SerializableDynamic)) {
			return cast(o, SerializableDynamic).serializeDynamic(); 
		}
		// throw "Not working properly yet";
		var final :Dynamic = null;
		switch(Type.typeof(o)) {
			case TNull :final = null;
			case TClass(kls) :
				var z = {};
				for (f in Type.getInstanceFields(kls)) {
					if (MetaUtil.isFieldMetaData(kls, f, "ignore")) {
						continue;
					}
					var val :Dynamic = Reflect.field(o,f);
					if (val != null && !Reflect.isFunction(val)) {
					Reflect.setField(z,f,switch(Type.typeof(val)) {
						case TInt, TBool, TFloat :val;
						case TClass(c ) :
							var cn = Type.getClassName(c);
							if (cn == "Array") {
								var na = new Array<Dynamic>();
								if (val != null) {
									for (el in cast(val,Array<Dynamic>)) {
										na.push(classToDoc(el));
									}
								}
								na;
							} else {
								if (cn != "String")
									classToDoc(val);
								else
									val;
							}
						case TEnum(_) : Type.enumConstructor(val);		  
						default :
						val;
					});
					}
				}
				final = z;
			case TEnum(e) : final = Type.enumConstructor(o);
			default :
				if (!Reflect.isFunction(o))
					final = o;
		}
		return final;
	}
	
	static function deserClass(o,resolved :Class<Dynamic>) 
	{
		com.pblabs.util.Assert.isNotNull(resolved, " resolved is null");
		
		var newObj = Type.createEmptyInstance(resolved);
		
		var rtti = ReflectUtil.getRttiTypeTree(resolved);
		if (rtti == null) {
			com.pblabs.util.Log.error(Type.getClassName(resolved) + " has no rtti info");
			return newObj;
		}
		switch(rtti) {
			case TClassdecl(typeInfo) :
				Lambda.iter(typeInfo.fields,function(el) {
					var val = Reflect.field(o,el.name);
					classFld(newObj,el.name,val,el.type);
				});
			default :
		}
		return newObj;
	}
	
	static function classFld(newObj :Dynamic,name :String,val :Dynamic,el :CType)
	{
		switch(el) {
			case CClass(kls,subtype) :
				switch(kls) {
					case "String","Float","Int":
		
						if (name != "_id")
							Reflect.setField(newObj,name,val);
						else
							Reflect.setField(newObj,name,Std.string(val));
		
					case "Array":
						var
						na = new Array<Dynamic>(),
						st = subtype.first();
						if (val != null) {
							for (i in cast(val,Array<Dynamic>)) {
								switch(st) {
									case CClass(path,_) :
										na.push(deserClass(i,Type.resolveClass(path)));
									case CEnum(enumPath,_) :
										var e = Type.resolveEnum(enumPath);
										na.push(Type.createEnum(e,i));
									default :
										na.push(i);
								}
							}
						}
		
						Reflect.setField(newObj,name,na);
		
					default :
						Reflect.setField(newObj,name,deserClass(val,Type.resolveClass(kls)));
				}
		
			case CEnum(enumPath,_) :
				var e = Type.resolveEnum(enumPath);
				Reflect.setField(newObj,name,Type.createEnum(e,val));
		
			default :
		//	  trace("other deser type"+el);
		}
	}  
	
	public static function docToClass(o,myclass :Class<Dynamic>) :Dynamic 
	{	
		if (o == null) return null;
		
		var newObj = Type.createEmptyInstance(myclass);
		if (Std.is(newObj, SerializableDynamic)) {
			cast(newObj, SerializableDynamic).deserializeDynamic(o);
			return newObj;
		}
		// throw "Not working properly yet";
		return deserClass(o,myclass);
	}
}
