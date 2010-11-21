/**
 * Copyright (c) 2009-2010, The HSL Contributors.
 *
 * This file is part of HSL. HSL, pronounced "hustle", stands for haXe Signaling Library.
 *
 * HSL is free software. Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice, this list of conditions and the following
 *	 disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following
 *	 disclaimer in the documentation and/or other materials provided with the distribution.
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
package hsl.avm2.translation.mouse;
import flash.events.MouseEvent;
import hsl.haxe.data.keyboard.ModifierKeysState;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;
import hsl.haxe.translation.NativeEvent;

/**
 * A translator that translates mouse events to modifier keys states. The modifier keys states are the states of the
 * modifier keys (the Control, Alt and Shift keys) at the moment the mouse events were dispatched.
 */
 class ModifierKeysStateTranslator implements Translator<ModifierKeysState> {
	/**
	 * Creates a new modifier keys state translator.
	 */
	public function new():Void {
	}
	#if debug
	private function toString():String {
		return "[Translator]";
	}
	#end
	public function translate(nativeEvent:NativeEvent):Translation<ModifierKeysState> {
		var mouseEvent:MouseEvent;
		try {
			mouseEvent = cast(nativeEvent, MouseEvent);
		} catch (error:Dynamic) {
			// TODO: throw a more exception instead of this lame one.
			throw "The nativeEvent argument must be a MouseEvent.";
		}
		return new Translation<ModifierKeysState>(new ModifierKeysState(mouseEvent.altKey, mouseEvent.ctrlKey, mouseEvent.shiftKey), mouseEvent.target);
	}
}