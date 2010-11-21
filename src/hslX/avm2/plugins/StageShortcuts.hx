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
package hsl.avm2.plugins;
import flash.display.Stage;
import flash.events.Event;
import flash.events.FullScreenEvent;
import hsl.avm2.translation.DatalessTranslator;
import hsl.haxe.Signaler;
import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;

/**
 * Shortcuts for the flash stage.
 */
class StageShortcuts {
	private static var signalerVault:AVM2SignalerVault;
	private static function createDatalessTranslator<Datatype>():DatalessTranslator<Datatype> {
		return new DatalessTranslator<Datatype>();
	}
	private static function createFullScreenTranslator():FullScreenTranslator {
		return new FullScreenTranslator();
	}
	/**
	 * Gets a signaler that dispatches signals when the stage enters or leaves full-screen mode. The dispatched signals contain
	 * true if and only if the stage is becoming full-screen. This method either creates a new signaler, or uses an existing one,
	 * depending on whether this method has been called before. If you call this method twice on the same object, the same
	 * signaler instance will be returned.
	 */
	public static inline function getFullScreenChangedSignaler(nativeDispatcher:Stage):Signaler<Bool> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, FullScreenEvent.FULL_SCREEN, createFullScreenTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when the mouse pointer moves out of the stage area. If the mouse button is pressed
	 * down, the signal is not dispatched. This method either creates a new signaler, or uses an existing one, depending on
	 * whether this method has been called before. If you call this method twice on the same object, the same signaler instance
	 * will be returned.
	 */
	public static inline function getMouseLeftSignaler(nativeDispatcher:Stage):Signaler<Void> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.MOUSE_LEAVE, createDatalessTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when the scaleMode property of the Stage object is set to StageScaleMode.NO_SCALE
	 * and the SWF file is resized. This method either creates a new signaler, or uses an existing one, depending on whether this
	 * method has been called before. If you call this method twice on the same object, the same signaler instance will be
	 * returned.
	 */
	public static inline function getResizedSignaler(nativeDispatcher:Stage):Signaler<Void> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.RESIZE, createDatalessTranslator);
	}
}
/**
 * A translator used by the full screen signaler to inject the fullscreen state into the signal.
 */
private class FullScreenTranslator implements Translator<Bool> {
	public function new():Void {
	}
	#if debug
	private function toString():String {
		return "[Translator]";
	}
	#end
	public function translate(nativeEvent:NativeEvent):Translation<Bool> {
		return new Translation<Bool>(untyped nativeEvent.fullScreen, nativeEvent.target);
	}
}
