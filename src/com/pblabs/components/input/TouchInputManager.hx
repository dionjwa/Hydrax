/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import de.polygonal.core.math.Vec2;

import hsl.haxe.Signaler;
import hsl.js.data.Touch;
import hsl.js.translating.JSSignaler;

using hsl.js.data.Touch;

/**
 * Javascript only ATM.  What other platforms support gestures?
 * 
 * Funnels gesture events into signals.
 * Can funnel into MouseInputManager if no specific gesture Logic.
 * 
 */
class TouchInputManager extends BaseInputManager
{
	@inject
	public var mouse :MouseInputManager;
	
	public var touchStart (default, null) :Signaler<TouchEvent>;
	public var touchMove (default, null) :Signaler<TouchEvent>;
	public var touchEnd (default, null) :Signaler<TouchEvent>;
	/** Not yet implemented  http://www.netcu.de/jquery-touchwipe-iphone-ipad-library */
	public var swipe (default, null) :Signaler<SwipeData>;
	public var preventDefault :Bool;
	
	/** Currently not implemented */
	public var convertTouchEventsToMouse :Bool;
	
	public function new (?convertToMouseEvents :Bool = true, ?preventDefault :Bool = true)
	{
		super();
		this.preventDefault = preventDefault;
		convertTouchEventsToMouse = convertToMouseEvents;
	}
	
	override public function startup () :Void
	{
		super.startup();
		bindSignals();
		
		/**
		  * Channel touch events into mouse events so that we 
		  * can just handle mouse events.
		  */
		if (convertTouchEventsToMouse && mouse != null) {
			var self = this;
			touchStart.bind(function (e :TouchEvent) :Void {
				if (preventDefault) {
					e.preventDefault();
				}
				#if testing
				var s = "";
				for (touch in e.touches) {
					s += " (" + touch.clientX + ", " + touch.clientY +")";
				}
				js.Lib.document.getElementById("haxe :touchStart").innerHTML = "touchStart :" + s;
				#end
				
				//Compute the average touch if the user puts down more than one finger at the same time
				var meanTouch = new Vec2();
				for (touch in e.changedTouches) {
					meanTouch.x += touch.clientX;
					meanTouch.y += touch.clientY;
				}
				meanTouch.x /= e.changedTouches.length;
				meanTouch.y /= e.changedTouches.length;
				
				//When converting to mouse input, ignore extra touches
				if (e.touches.length > 1 && e.changedTouches.length >= 1) {
					return;
				}
				var touch = e.touches.item(0);
				self._firstTouchId = touch.identifier;
				
				self.mouse.manualMouseDown(meanTouch.x, meanTouch.y, e.touches.length);
				
				// for (touch in e.touches) {
				//	 //Just treat the first touch as the mouse
				//	 mouseInput.manualMouseDown(touch.clientX, touch.clientY);
				//	 break;
				// }
			});
			
			touchMove.bind(function (e :TouchEvent) :Void {
				if (preventDefault) {
					e.preventDefault();
				}
				#if testing
				var s = "";
				for (touch in e.changedTouches) {
					s += " (" + touch.clientX + ", " + touch.clientY +")";
				}
				js.Lib.document.getElementById("haxe :touchMove").innerHTML = "touchMove :" + s;
				#end
				
				// var touch = e.touches.item(0);
				// mouseInput.manualMouseMove(touch.clientX, touch.clientY);
				
				for (touch in e.changedTouches) {
					if (touch.identifier == self._firstTouchId) {
						self.mouse.manualMouseMove(touch.clientX, touch.clientY, e.touches.length);
						break;
					}
				}
			});
			
			touchEnd.bind(function (e :TouchEvent) :Void {
				if (preventDefault) {
					e.preventDefault();
				}
				#if testing
				var s = "";
				for (touch in e.changedTouches) {
					s += " (" + touch.clientX + ", " + touch.clientY +")";
				}
				js.Lib.document.getElementById("haxe :touchEnd").innerHTML = "touchEnd :" + s;
				#end
				
				for (touch in e.changedTouches) {
					if (touch.identifier == self._firstTouchId) {
						self.mouse.manualMouseUp(touch.clientX, touch.clientY, e.touches.length);
						break;
					}
				}
			});
		}
		
		if (convertTouchEventsToMouse && mouse == null) {
			org.transition9.util.Log.error("Convert touch events to mouse, but no MouseInputManager");
		}
		
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		
		#if js
		#if debug
		org.transition9.util.Assert.isFalse(touchStart.isListenedTo);
		org.transition9.util.Assert.isFalse(touchMove.isListenedTo);
		org.transition9.util.Assert.isFalse(touchEnd.isListenedTo);
		org.transition9.util.Assert.isFalse(swipe.isListenedTo);
		#end
		touchStart = null;
		touchMove = null;
		touchEnd = null;
		swipe = null;
		#end
	}
	
	function bindSignals () :Void
	{
		#if js
		touchStart = new hsl.js.translating.JSSignaler(this, js.Lib.document, JSEventType.TOUCHSTART, new hsl.js.translation.touch.TouchTranslator(false));
		touchMove = new hsl.js.translating.JSSignaler(this, js.Lib.document, JSEventType.TOUCHMOVE, new hsl.js.translation.touch.TouchTranslator(false));
		touchEnd = new hsl.js.translating.JSSignaler(this, js.Lib.document, JSEventType.TOUCHEND, new hsl.js.translation.touch.TouchTranslator(false));
		#else
		org.transition9.util.Log.error("Platform gestures are not yet implemented.  Currently JS only.");
		#end
	}
	
	var _firstTouchId :Int;
}
