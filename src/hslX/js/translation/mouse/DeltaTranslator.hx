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
package hsl.js.translation.mouse;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;
import hsl.haxe.translation.NativeEvent;
import hsl.js.translation.JSTranslatorBase;
import js.Dom;
import js.Lib;

/**
 * A translator that translates mouse events to deltas. Deltas indicate how many lines should be scrolled for each unit the
 * user rotates the mouse wheel. A positive delta value indicates an upward scroll; a negative value indicates a downward
 * scroll. Typical values are 3, -3, 1 and -1. However, the value depends on the device and operating system that the user is
 * using. Therefore, whether the value is positive or negative is more interesting than the actual value.
 */
 class DeltaTranslator extends JSTranslatorBase, implements Translator<Int> {
	/**
	 * Creates a new delta translator.
	 */
	public function new():Void {
	}
	public function translate(nativeEvent:NativeEvent):Translation<Int> {
		var event:Dynamic = getEvent(nativeEvent);
		var delta:Float= 0;
		/* @TODO: test this improved code - it removes browser checks
		   if (e.type == "mousewheel" || e.type == "DOMMouseScroll") {
		   this.wheelDelta = (e.detail) ? (e.detail * -1) : Math.round(e.wheelDelta / 80) || ((e.wheelDelta < 0) ? -1 : 1);
		   }
		 */
		if (event.wheelDelta) { /* IE/Opera. */
			if (Lib.isOpera) {
				delta = event.wheelDelta / 40;
			} else {
				delta = event.wheelDelta / 120;
			}
		} else if (event.detail) { /** Mozilla case. */
			delta = -event.detail;
		}
		return new Translation<Int>((0 < delta) ? Math.floor(delta) : Math.ceil(delta), targetFromDOMEvent(event));
	}
	#if debug
	private function toString():String {
		return "[Translator]";
	}
	#end
}
