/**
 * Copyright (c) 2009-2010, The HSL Contributors.
 *
 * This file is part of HSL. HSL, pronounced "hustle", stands for haXe Signaling Library.
 *
 * HSL is free software. Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice, this list of conditions and the following
 *     disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HSL CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE HSL
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * End of conditions.
 * 
 * The license of this software might change in the future, most likely to match the license of the haXe core libraries. In
 * such event, you may use this version of this software under either the terms above or under the terms of the new license of
 * this software.
 */
package haxe;

/**
 * More advanced operations for reflection.
 */
class TypeTools {
	/**
	 * Returns a list of all the complete names of all the classes the passed value is an instance of. If the passed value itself
	 * is a class, this method will return a list containing its complete name and all its super classes. If you pass an instance
	 * of Sprite, for instance, this method will return a list containing "flash.display.Sprite",
	 * "flash.display.DisplayObjectContainer", "flash.display.InteractiveObject", "flash.display.DisplayObject" and
	 * "flash.events.EventDispatcher".
	 */
	public static function getClassNames(value:Dynamic):List<String> {
		var result:List<String> = new List();
		// Retrieve the most derived class of the passed value.
		var valueClass:Class<Dynamic> =
			// If the passed value is a class, use the value itself as class.
			untyped if (Std.is(value, Class)) {
				value;
			// If the passed value is an instance of a class, use the class the value is an instance of.
			} else {
				Type.getClass(value);
			}
		// Store the names of all the classes of the value, including super classes.
		while (null != valueClass) {
			result.add(Type.getClassName(valueClass));
			valueClass = Type.getSuperClass(valueClass);
		}
		return result;
	}
}