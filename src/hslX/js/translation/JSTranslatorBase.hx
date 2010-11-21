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
package hsl.js.translation;
import hsl.haxe.data.mathematics.Point;
import js.Dom;
import js.Lib;
import hsl.haxe.translation.NativeEvent;
import hsl.haxe.data.mouse.MouseLocation;

/** 
 * Provides common cross-browser functionality for retrieving properties of a native event.
 */
class JSTranslatorBase {
	public function new(?preventDefault :Bool = false):Void {
		_preventDefault = preventDefault;
	}
	/** 
	 * Returns the event released through the dispatched native event.
	 */
	private inline function getEvent(nativeEvent:NativeEvent):Dynamic {
		if (null == nativeEvent) {
			nativeEvent = untyped window.event;
		}
		return nativeEvent;
	}
	/** 
	 * Returns the target of a DOM Event.
	 */
	private function targetFromDOMEvent(event:js.Event):HtmlDom {
		var ieEvent:Event = cast event;
		if (_preventDefault) {
			untyped event.preventDefault();
		}
		var target:HtmlDom = null;
		if (null != ieEvent.target) {
			target = ieEvent.target;
		} else if (null != ieEvent.srcElement) {
			target = ieEvent.srcElement;
		}
		if (3 == target.nodeType) {
			target = target.parentNode;
		}
		return target;
	}
	/** 
	 * Returns a mouse location populated with local and global coordinates.
	 */
	private function localMouseLocationFromDOMEvent(event:js.Event, target:HtmlDom):MouseLocation {
		var ieEvent:Event = cast event;
		if (_preventDefault) {
			untyped event.preventDefault();
		}
		var global:Point =
			if (null != ieEvent.pageX) {
				new Point(ieEvent.pageX, ieEvent.pageY);
			} else if (null != ieEvent.clientX) {
				var documentElement:HtmlDom = untyped(Lib.document).documentElement;
				if ( ! untyped documentElement )
					documentElement = Lib.document.body;
				new Point(ieEvent.clientX + documentElement.scrollLeft, ieEvent.clientY + documentElement.scrollTop);
			} else {
				new Point(0, 0);
			}
		var local:Point = global.getLocalLocation(target);
		return new MouseLocation(local.x, local.y, global);
	}
	
	/**
	  * If you don't want gesture/touch events to be picked up by the OS or browser, leave this as true.
	  */
	var _preventDefault :Bool;
}
typedef Event = { > js.Event, srcElement:HtmlDom, pageX:Int, pageY:Int }
