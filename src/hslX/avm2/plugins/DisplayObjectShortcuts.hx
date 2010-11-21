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
import flash.display.DisplayObject;
import flash.display.Stage;
import flash.events.Event;
import hsl.avm2.translation.DatalessTranslator;
import hsl.haxe.Signaler;
import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;

/**
 * Shortcuts for the flash display object.
 */
class DisplayObjectShortcuts {
	private static var signalerVault:AVM2SignalerVault;
	private static function createDatalessTranslator():DatalessTranslator<Void> {
		return new DatalessTranslator<Void>();
	}
	private static function createStageTranslator():StageTranslator {
		return new StageTranslator();
	}
	/**
	 * Gets a signaler that dispatches signals when the display object is added to the stage display list, either directly or 
	 * through the addition of a sub tree in which the display object is contained. The dispatched signals contain the stage.
	 * This method either creates a new signaler, or uses an existing one, depending on whether this method has been called
	 * before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getAddedToStageSignaler(nativeDispatcher:DisplayObject):Signaler<Stage> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.ADDED_TO_STAGE, createStageTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when the playhead is entering a new frame. If the playhead is not moving, or if
	 * there is only one frame, this event is dispatched continuously in conjunction with the frame rate. This method either
	 * either creates a new signaler, or uses an existing one, depending on whether this method has been called before. If you
	 * call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getFrameEnteredSignaler(nativeDispatcher:DisplayObject):Signaler<Void> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.ENTER_FRAME, createDatalessTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when the display object about to be removed from the stage display list.
	 * This method either creates a new signaler, or uses an existing one, depending on whether this method has been called
	 * before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getRemoveFromStageRequestedSignaler(nativeDispatcher:DisplayObject):Signaler<Void> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.REMOVED_FROM_STAGE, createDatalessTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when the display object is about to be rendered to the stage after the stage has
	 * been invalidated. This method either creates a new signaler, or uses an existing one, depending on whether this method has
	 * been called before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getRenderRequestedSignaler(nativeDispatcher:DisplayObject):Signaler<Void> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.RENDER, createDatalessTranslator);
	}
}
/**
 * A translator used by the added to stage signaler to inject the stage into the signal.
 */
private class StageTranslator implements Translator<Stage> {
	public function new():Void {
	}
	#if debug
	private function toString():String {
		return "[Translator]";
	}
	#end
	public function translate(nativeEvent:NativeEvent):Translation<Stage> {
		return new Translation<Stage>(untyped nativeEvent.currentTarget.stage, nativeEvent.target);
	}
}