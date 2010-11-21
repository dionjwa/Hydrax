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
package hsl.haxe.plugins;
import haxe.Http;
import hsl.haxe.data.web.HTTPStatus;
import hsl.haxe.direct.DirectSignaler;
import hsl.haxe.Subject;
import hsl.haxe.translating.DynamicFunctionSignaler;
import hsl.haxe.Signaler;

/**
 * Shortcuts for the HTTP class.
 */
class HTTPShortcuts {
	private static inline var COMPLETED:String = "completed";
	private static inline var ERROR_OCCURRED:String = "errorOccurred";
	private static inline var HTTP_STATUS_RECEIVED:String = "httpStatusReceived";
	private static var signalerVault:SignalerVault<Http>;
	private static function createCompletedSignaler(nativeDispatcher:Http):Signaler<String> {
		return new DynamicFunctionSignaler<String>(nativeDispatcher, nativeDispatcher, "onData", true);
	}
	private static function createErrorOccurredSignaler(nativeDispatcher:Http):Signaler<String> {
		return new DynamicFunctionSignaler<String>(nativeDispatcher, nativeDispatcher, "onError", true);
	}
	private static function createHTTPStatusReceivedSignaler(nativeDispatcher:Http):Signaler<HTTPStatus> {
		return new HTTPStatusReceivedSignaler(nativeDispatcher);
	}
	/**
	 * Gets a signaler that dispatches signals after all the received data is decoded. The dispatched signals contain the data
	 * that was received. This method either creates a new signaler, or uses an existing one, depending on whether this method
	 * has been called before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getCompletedSignaler(nativeDispatcher:Http):Signaler<String> {
		if (null == signalerVault) {
			signalerVault = new SignalerVault<Http>();
		}
		return signalerVault.getSignaler(nativeDispatcher, COMPLETED, createCompletedSignaler);
	}
	/**
	 * Gets a signaler that dispatches signals when an HTTP status is received. The dispatched signals contain the HTTP status.
	 * This method either creates a new signaler, or uses an existing one, depending on whether this method has been called
	 * before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getHTTPStatusReceivedSignaler(nativeDispatcher:Http):Signaler<HTTPStatus> {
		if (null == signalerVault) {
			signalerVault = new SignalerVault<Http>();
		}
		return signalerVault.getSignaler(nativeDispatcher, HTTP_STATUS_RECEIVED, createHTTPStatusReceivedSignaler);
	}
	/**
	 * Gets a signaler that dispatches signals when a download operation results in a fatal error that terminates the download.
	 * This includes security-related errors. The dispatched signals contain the related error message. This method either
	 * creates a new signaler, or uses an existing one, depending on whether this method has been called before. If you call this
	 * method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getErrorOccurredSignaler(nativeDispatcher:Http):Signaler<String> {
		if (null == signalerVault) {
			signalerVault = new SignalerVault<Http>();
		}
		return signalerVault.getSignaler(nativeDispatcher, ERROR_OCCURRED, createErrorOccurredSignaler);
	}
}
/**
 * A helper class that allows us to dispatch signals with HTTP statusses inside, rather than integers.
 */
class HTTPStatusReceivedSignaler extends DirectSignaler<HTTPStatus> {
	public function new(nativeDispatcher:Http):Void {
		super(nativeDispatcher);
		nativeDispatcher.onStatus = dispatchNative;
	}
	private function dispatchNative(statusCode:Int):Void {
		dispatch(new HTTPStatus(statusCode));
	}
}