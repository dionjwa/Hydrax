/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript aspirin library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * aspirin library - Taking some of the pain out of Actionscript development.
 * Copyright (C) 2007-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/ooo-aspirin/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pblabs.util;

import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;

import Type;

#if nodejs
import js.Node;
#end
/**
 * Contains useful static function for performing operations on Strings.
 */
class StringUtil
{
	public static function add (s1 :Void->String, s2 :Void->String) :String
	{
		 return s1() + s2();
	}
	
	inline public static function isBlank (s :String) :Bool
	{
		return s == null || s == "";
	}
	
	public static function getFileExtension (file :String):String
	{
		var extensionIndex = file.lastIndexOf(".");
		if (extensionIndex == -1) {
			//No extension
			return "";
		} else {
			return file.substr(extensionIndex + 1,file.length);
		}
	}
	 
	public static function objectToString (obj :Dynamic, ?fields :Array<String>) :String
	{
		if (obj == null ) {
			return "null";
		}
		
		switch (Type.typeof(obj)) {
			case TNull: return "null";
			case TInt: return Std.string(obj);
			case TFloat: return Std.string(obj);
			case TBool: return Std.string(obj);
			case TObject: Type.getClassName(obj);//Assume it's a class
			case TClass(c):
				if (c == String) {
					return Std.string(obj);
				}
			case TEnum(e): return Type.enumConstructor(e).substr(Type.enumConstructor(e).lastIndexOf(".") + 1);
			case TUnknown: Std.string(obj);
			default://Keep going
		}
		
		
		var s :StringBuf = new StringBuf();
		var clsName = "";
		
		var isDynamic = Reflect.fields(obj) != null && Reflect.fields(obj).length > 0;
		
		fields = fields == null && isDynamic ? Reflect.fields(obj) : fields;
		try {
			if (!isDynamic) {
				clsName = Type.getClass(obj) != null ? ReflectUtil.tinyClassName(obj) : "Dynamic";
				fields = fields == null && Type.getClass(obj) != null ? Type.getInstanceFields(Type.getClass(obj)) : fields;
			}
		} catch (e :Dynamic) {
			clsName = "Dynamic";
		}
		s.add("[" + clsName);
		
		fields = fields == null ? [] : fields;
		for (f in fields) {
			s.add(", " + f + "=" + (isDynamic ? Reflect.field(obj, f) : ReflectUtil.field(obj, f)));
		}
		s.add("]");
		return s.toString();
	}
	
	public static function stringify (obj :Dynamic, ?fields :Array<String>) :String
	{
		#if js
		try {
			return untyped JSON.stringify(obj);
		} catch (e :Dynamic) {
			return objectToString(obj, fields);
		}
		#else
		return objectToString(obj, fields);
		#end
	}
	
	 
	 /**
	  * By default, Std.string(someClass) produces something like:
	  * [class Sprite].  The Std.string(someclass) string doesn't include the entire 
	  * package name, leading to collisions if classes are used as
	  * keys in maps.
	  */
	 public static function getStringKey (obj :Dynamic) :String
	 {
	 	 if (obj == null) {
	 	 	 return "";
		 } else if (Std.is(obj, String)) {
			 return cast(obj, String);
		 } else {
		 	 var typ = Type.typeof(obj);
		 	 if (typ != null) {
				 return switch (typ) {
					case TObject://We assume it's a class or interface
						Type.getClassName(obj);
					case TEnum (e)://We assume it's a class or interface
						// Type.getEnumName(e) + "." + 
						Type.enumConstructor(obj);
					default :
						Std.string(obj);
				 }
			 } else {
			 	 return Std.string(obj);
			 }
		 }
	 }

	/**
	 * Get a hashCode for the specified String. null returns 0.
	 * This hashes identically to Java's String.hashCode(). This behavior has been useful
	 * in various situations.
	 */
	public static function hashCode (str :String) :Int
	{
		var code:Int = 0;
		if (str != null) {
			for (ii in 0...str.length) {
				code = 31 * code + str.charCodeAt(ii);
			}
		}
		return code;
	}

	/**
	 * Does the specified string start with the specified substring.
	 */
	public static function startsWith (str :String, substr :String) :Bool
	{
		// just check once if it's at the beginning
		return (str.lastIndexOf(substr, 0) == 0);
	}

	/**
	 * Format the specified uint as a String color value, for example "0x000000".
	 *
	 * @param c the uint value to format.
	 * @param prefix the prefix to place in front of it. @default "0x", other possibilities are
	 * "#" or "".
	 */
	public static function toColorString (c :Int, ?prefix :String = "0x") :String
	{
		return prefix + prepad(StringTools.hex(c), 6, "0");
	}

	/**
	 * Append 0 or more copies of the padChar String to the input String
	 * until it is at least the specified length.
	 */
	public static function pad (str :String, length :Int, ?padChar :String = " ") :String
	{
		while (str.length < length) {
			str += padChar;
		}
		return str;
	}

	/**
	 * Prepend 0 or more copies of the padChar String to the input String
	 * until it is at least the specified length.
	 */
	public static function prepad (str :String, length :Int, ?padChar :String = " ") :String
	{
		while (str.length < length) {
			str = padChar + str;
		}
		return str;
	}

	/**
	 * Utility function that strips whitespace from the beginning and end of a String.
	 */
	public static function trim (str :String) :String
	{
		return trimEnd(trimBeginning(str));
	}

	/**
	 * Utility function that strips whitespace from the beginning of a String.
	 */
	public static function trimBeginning (str :String) :String
	{
		if (str == null) {
			return null;
		}

		var startIdx:Int = 0;
		// this works because charAt() with an invalid index returns "", which is not whitespace
		while (isWhitespace(str.charAt(startIdx))) {
			startIdx++;
		}

		// TODO: is this optimization necessary? It's possible that str.slice() does the same
		// check and just returns 'str' if it's the full length
		return if (startIdx > 0) str.substr(startIdx) else str;
	}

	/**
	 * Utility function that strips whitespace from the end of a String.
	 */
	public static function trimEnd (str :String) :String
	{
		if (str == null) {
			return null;
		}

		var endIdx:Int = str.length;
		// this works because charAt() with an invalid index returns "", which is not whitespace
		while (isWhitespace(str.charAt(endIdx - 1))) {
			endIdx--;
		}

		// TODO: is this optimization necessary? It's possible that str.slice() does the same
		// check and just returns 'str' if it's the full length
		return if (endIdx < str.length) str.substr(0, endIdx) else str;
	}

	/**
	 * @return true if the specified String is == to a single whitespace character.
	 */
	public static function isWhitespace (character :String) :Bool
	{
		switch (character) {
		case " ":
			return true;
		case "\t":
			return true;
		case "\r":
			return true;
		case "\n":
			return true;
		default:
			return false;
		}
	}
	
	public static function join (arr :Array<Dynamic>) :String
	{
		var sb = new StringBuf();
		var ii = 0;
		while (ii + 1 < arr.length) {
			sb.add(arr[ii] + "=");
			sb.add(arr[ii + 1]);
			ii += 2;
			if (ii + 1 < arr.length) {
				sb.add(", ");
			}
		}
		return sb.toString();
	}
}
