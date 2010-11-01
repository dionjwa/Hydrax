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
package hsl.js.translating;
import haxe.PosInfos;
import js.Dom;
import js.Lib;
import js.XMLHttpRequest;
import hsl.haxe.Subject;
import hsl.haxe.translating.TranslatingSignalerBase;
import hsl.haxe.translation.Translator;
import hsl.js.translation.DatalessTranslator;

/**
 * A JS signaler serves as a bridge between the native JavaScript event system of the browser, and this library.
 */
class JSSignaler<DataType> extends TranslatingSignalerBase<DataType> {
	private var nativeDispatcher:HtmlDom;
	private var nativeEventType:JSNativeType;
	public function new(subject:Subject, nativeDispatcher:Dynamic, nativeEventType:JSEventType, ?translator:Translator<DataType>, ?rejectNullData:Null<Bool>):Void {
		if (null == translator) {
			translator = new DatalessTranslator<DataType>();
		}
		super(subject, translator, rejectNullData);
		this.nativeDispatcher = nativeDispatcher;
		this.nativeEventType = resolveNativeType(nativeEventType);
		// Use the DOM 2 addEventListener, if availabe.
		if (null != nativeDispatcher.addEventListener) {
			nativeDispatcher.addEventListener(this.nativeEventType.dom2, dispatchNative, false);
		} else {
			try {
				// If addEventListener is not available, check if attachEvent is available. If not, use the DOM 0 "on" technique.
				if (null == nativeDispatcher.attachEvent) {
					Reflect.setField(nativeDispatcher, this.nativeEventType.html4, dispatchNative);
				// If attachEvent is available, use that instead.
				} else {
					nativeDispatcher.attachEvent(this.nativeEventType.html4, dispatchNative);
				}
			} catch (e:Dynamic) {
			}
		}
	}
	/** 
	 * Resolves string names from the JavaScript enum JSEventType supported by HSL, and deals with browser implementations for a
	 * uniform HSL event behaviour.
	 */
	private function resolveNativeType(type:JSEventType):JSNativeType {
		switch (type) {
			case MOUSEWHEEL:
				var useDOMMouseScroll = false;
				if (untyped(document).implementation.hasFeature("MouseEvents", "2.0")) {
					try {
						var handle = null;
						handle = untyped(document).body.addEventListener("DOMMouseScroll", function () {
								useDOMMouseScroll = true; 
								document.removeEventListener("DOMMouseScroll", handle); 
							}, false);
						var event = untyped(document).createEvent("MouseScrollEvents");
						event.initMouseEvent("DOMMouseScroll", true, true, untyped window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
						untyped(document).body.dispatchEvent(event);
					} catch (exception:Dynamic) {}
				}
				return
					if (!useDOMMouseScroll) {
						{ html4:"onmousewheel", dom2:"mousewheel" };
					} else {
						{ html4:"onmousewheel", dom2:"DOMMouseScroll" };
					}
			case CLICK:
				disableContextMenu();
				return { html4:"onclick", dom2:"click" };
			case MOUSEUP:
				disableContextMenu();
				return { html4:"onmouseup", dom2:"mouseup" };
			case MOUSEDOWN:
				disableContextMenu();
				return { html4:"onmousedown", dom2:"mousedown" };
			case ERROR:
				return
					if (Std.is(nativeDispatcher, XMLHttpRequest)) {
						{ html4:"onload", dom2:"load" };
					} else {
						{ html4:"onerror", dom2:"error" };
					}
			default:
				var name:String = Type.enumConstructor(type).toLowerCase();
				return { html4:"on" + name, dom2:name };
		}
	}
	/** 
	 * If set through the conditional compilation command HSL_DISABLE_CONTEXT_MENU, this will disable the right-mouse context
	 * menu, so that right mouse clicks can also be captured. Note: this does not normally work on opera without browser
	 * configuration.
	 */
	private function disableContextMenu():Bool {
		#if HSL_DISABLE_CONTEXT_MENU
		untyped(nativeDispatcher).oncontextmenu = function () {
			return false;
		}
		return true;
		#end
		return false;
	}
	public override function stop(?positionInformation:PosInfos):Void {
		super.stop(positionInformation);
		if (null != untyped(nativeDispatcher).removeEventListener) {
			untyped(nativeDispatcher).removeEventListener(nativeEventType, dispatchNative);
		} else {
			try {
				if (null == untyped(nativeDispatcher).detachEvent) {
					Reflect.deleteField(nativeDispatcher, nativeEventType.html4);
				} else {
					untyped(nativeDispatcher).detachEvent(nativeEventType.html4, dispatchNative);
				}
			} catch (exception:Dynamic) {
			}
		}
	}
	/**
	 * This is only useful if the server responds with a specially crafted header - see
	 * http://msdn.microsoft.com/en-us/library/cc288060(VS.85).aspx for details.
	 */
	#if HSL_ENABLE_XDOMAINREQUEST
	private static function __init__():Void {
		// support new IE 8 features
		untyped {
			if (window.XDomainRequest) {
				var ieOrigXMLHttpRequest = js["XMLHttpRequest"];
				try {
					js["XMLHttpRequest"] = __js__("new XDomainRequest()");
				} catch (exception:Dynamic) {
					js["XMLHttpRequest"] = ieOrigXMLHttpRequest;
				}
			}
		}
	}
	#end
}
/** 
 * Javascript Event types supported by HSL
 */
enum JSEventType {
	ERROR;
	PROGRESS;
	LOAD;
	UNLOAD;
	ABORT;
	CLICK;
	SELECT;
	CHANGE;
	SUBMIT;
	RESET;
	FOCUS;
	BLUR;
	RESIZE;
	SCROLL;
	MOUSEUP;
	MOUSEDOWN;
	MOUSEMOVE;
	MOUSEOVER;
	MOUSEOUT;
	MOUSEWHEEL;
	KEYUP;
	KEYDOWN;
	KEYPRESS;
}
/**
 * Internal reference for mapping HSL event types to native browser event type strings.
 */
typedef JSNativeType = { html4: String, dom2: String }
