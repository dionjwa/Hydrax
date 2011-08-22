/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util; 

/*
* Based on Preconditions from Google Collections
*/
class Preconditions
 {
	/**
	 * Checks that the argument is not null, and returns the validated argument.
	 * @return the validated reference.
	 */
	inline public static function checkNotNull <T> (ref :T, ?message :String = null, ?info :haxe.PosInfos) :T
	{
		if (ref == null) {
			fail(if (message != null) message else "Argument is null in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName);
			return null;
		} else {
			return ref;
		}
	}
	
	/**
	 * Checks that an argument is true.
	 */
	public static function checkArgument (expression :Bool, ?message :String = null, ?info :haxe.PosInfos) :Void
	{
		if (!expression) {
			fail(if (message != null) message else "Argument is false in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName);
		}
	}

	/**
	 * Check that the index is between 0 and (size - 1) inclusive.
	 * @return the validated index.
	 */
	public static function checkPositionIndex (index :Int, size :Int, ?message :String = null, ?info :haxe.PosInfos) :Int
	{
		if (index < 0 || index >= size) {
			fail("Index out of bounds " + index + ", [0, " + (size - 1) + "]. in file " + info.fileName + ", line " + info.lineNumber + ", " + info.className + "::" + info.methodName);
		}
		return index;
	}
	
	inline static function fail (message :String) :Void
	{
		//Some javascript targets don't show exceptions, so at least log the error
		#if (js && debug)
		com.pblabs.util.Log.error(message);
		#end
		throw message;
	}
}
