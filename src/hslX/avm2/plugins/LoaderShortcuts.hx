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
import flash.display.Loader;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import hsl.avm2.translation.DatalessTranslator;
import hsl.avm2.translation.error.ErrorMessageTranslator;
import hsl.avm2.translation.progress.LoadProgressTranslator;
import hsl.avm2.translation.web.HTTPStatusTranslator;
import hsl.avm2.translation.web.ReceivedDataTranslator;
import hsl.haxe.data.progress.LoadProgress;
import hsl.haxe.data.web.HTTPStatus;
import hsl.haxe.Signaler;
import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;

/**
 * Shortcuts for loaders.
 */
class LoaderShortcuts {
	private static var signalerVault:AVM2SignalerVault;
	private static function createDatalessTranslator<Datatype>():DatalessTranslator<Datatype> {
		return new DatalessTranslator<Datatype>();
	}
	private static function createContentTranslator():ContentTranslator {
		return new ContentTranslator();
	}
	private static function createHTTPStatusTranslator():HTTPStatusTranslator {
		return new HTTPStatusTranslator();
	}
	private static function createErrorMessageTranslator():ErrorMessageTranslator {
		return new ErrorMessageTranslator();
	}
	private static function createLoadProgressTranslator():LoadProgressTranslator {
		return new LoadProgressTranslator();
	}
	/**
	 * Gets a signaler that dispatches signals after all the received data is decoded. The dispatched signals contain the root
	 * display object of the SWF, PNG, JPG, or GIF file that was loaded by using the load method or the loadBytes method. This
	 * method either creates a new signaler, or uses an existing one, depending on whether this method has been called before. If
	 * you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getCompletedSignaler(loader:Loader):Signaler<DisplayObject> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(loader.contentLoaderInfo, Event.COMPLETE, createContentTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when data is received as the download operation progresses. The dispatched signals
	 * contain the load progress. This method either creates a new signaler, or uses an existing one, depending on whether this
	 * method has been called before. If you call this method twice on the same object, the same signaler instance will be
	 * returned.
	 */
	public static inline function getDataReceivedSignaler(loader:Loader):Signaler<LoadProgress> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(loader.contentLoaderInfo, ProgressEvent.PROGRESS, createLoadProgressTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when an HTTP status is received. The dispatched signals contain the HTTP status.
	 * This method either creates a new signaler, or uses an existing one, depending on whether this method has been called
	 * before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getHTTPStatusReceivedSignaler(loader:Loader):Signaler<HTTPStatus> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(loader.contentLoaderInfo, HTTPStatusEvent.HTTP_STATUS, createHTTPStatusTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when a download operation results in a fatal error that terminates the download.
	 * The dispatched signals contain the related error message. This method either creates a new signaler, or uses an existing
	 * one, depending on whether this method has been called before. If you call this method twice on the same object, the same
	 * signaler instance will be returned.
	 */
	public static inline function getIOErrorOccurredSignaler(loader:Loader):Signaler<String> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(loader.contentLoaderInfo, IOErrorEvent.IO_ERROR, createErrorMessageTranslator);
	}
	/**
	 * Gets a signaler that dispatches signals when a download operation attempts to download data from a server outside the
	 * security sandbox. The dispatched signals contain the related error message. This method either creates a new signaler, or
	 * uses an existing one, depending on whether this method has been called before. If you call this method twice on the same
	 * object, the same signaler instance will be returned.
	 */
	public static inline function getSecurityErrorOccurredSignaler(loader:Loader):Signaler<String> {
		if (null == signalerVault) {
			signalerVault = new AVM2SignalerVault();
		}
		return signalerVault.getSignaler(loader.contentLoaderInfo, SecurityErrorEvent.SECURITY_ERROR, createErrorMessageTranslator);
	}
}
/**
 * A translator used by the completed signaler to inject the content of the loader into the signal.
 */
private class ContentTranslator implements Translator<DisplayObject> {
	public function new():Void {
	}
	#if debug
	private function toString():String {
		return "[Translator]";
	}
	#end
	public function translate(nativeEvent:NativeEvent):Translation<DisplayObject> {
		return new Translation<DisplayObject>(untyped nativeEvent.currentTarget.content, nativeEvent.target);
	}
}