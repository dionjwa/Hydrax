/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.util.ArrayUtil;

import haxe.io.BytesData;

/**
 * Tests objects for equality, using the Equalable interface if present.
 */
class EqualableUtil
 {
	/**
	 * If the objects are Equalable, then that will be tested. Arrays
	 * and ByteArrays are also compared and are equal if they have
	 * elements that are equals (deeply).
	 */
	public static function equals (obj1 :Dynamic, obj2 :Dynamic) :Bool
	{
		// catch various common cases (both primitive or null)
		if (obj1 == obj2 || (obj1 == null && obj2 == null)) {
			return true;
		} else if (Std.is(obj1, Equalable)) {
			// if obj1 is Equalable, then that decides it
			return (cast(obj1, Equalable<Dynamic>)).equals(obj2);
		} else if ((Std.is(obj1, Array)) || (Std.is(obj2, Array))) {
			return isArraysEqual(cast obj1, cast obj2);
		} else if ((Std.is(obj1, BytesData)) || (Std.is(obj2, BytesData))) {
			return isBytesDataEqual(cast obj1, cast obj2);
		} else {
			return false;
		}
	}
	
	public static function isArraysEqual (a1 :Array<Dynamic>, a2 :Array<Dynamic>) :Bool
	{
		if (a1 == null && a2 == null) {
			return true;
		} else if (a1 == null && a2 != null) {
			return false;
		} else if (a1 != null && a2 == null) {
			return false;
		} else if (a1.length != a2.length) {
			return false;
		} else {
			for (ii in 0...a1.length) {
				if (!equals(a1[ii], a2[ii])) {
					return false;
				}
			}
			return true;
		} 
	}
	
	public static function isBytesDataEqual (a1 :BytesData, a2 :BytesData) :Bool
	{
		if (a1 == null && a2 == null) {
			return true;
		} else if (a1 == null && a2 != null) {
			return false;
		} else if (a1 != null && a2 == null) {
			return false;
		} else if (a1.length != a2.length) {
			return false;
		} else {
			#if flash
			a1.position = a2.position = 0;
			for (ii in 0...a1.length) {
				if (a1.readByte() != a2.readByte()) {
					return false;
				}
			}
			return true;
			#else
			for (ii in 0...a1.length) {
				if (a1[0] != a2[0]) {
					return false;
				}
			}
			return true;
			#end
		} 
	}
}
