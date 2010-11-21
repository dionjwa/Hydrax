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
import flash.events.Event;
import flash.events.TextEvent;
import flash.text.TextField;
import hsl.avm2.translation.textfield.TextChangedTranslator;
import hsl.avm2.translation.textfield.TextInputTranslator;
import hsl.haxe.Signaler;

/**
 * Shortcuts for text fields.
 */
class TextFieldShortcuts {
	private static var signalerVault:AVM2SignalerVault;
	private static function createTextInputTranslator():TextInputTranslator {
		return new TextInputTranslator();
	}
	private static function createTextChangedTranslator():TextChangedTranslator {
		return new TextChangedTranslator();
	}
	/**
	 * Gets a signaler that dispatches signals when one or more characters are added to the specified TextField. The signal is
	 * dispatched before the text property of the textfield is changed. The dispatched signals contains the text that was added
	 * to the TextField. This method either creates a new signaler, or uses an existing one, depending on whether this method
	 * has been called before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getTextInputtedSignaler(nativeDispatcher:TextField):Signaler<String> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, TextEvent.TEXT_INPUT, createTextInputTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when the text of the specified TextField has changed. The dispatched signals
	 * contains the text of the specified TextField. This method either creates a new signaler, or uses an existing one,
	 * depending on whether this method has been called before. If you call this method twice on the same object, the same
	 * signaler instance will be returned.
	 */
	public static inline function getTextChangedSignaler(nativeDispatcher:TextField):Signaler<String> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(nativeDispatcher, Event.CHANGE, createTextChangedTranslator);
	}
}