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
package hsl.haxe;

/**
 * A signal is dispatched by a subject, through a signaler. However, only listeners that were added using the bindAdvanced
 * method can access the actual Signal instances.
 */
class Signal<Datatype> {
	/**
	 * The bond that is currently processing the signal.
	 */
	public var currentBond(default, null):Bond;
	/**
	 * The subject that is currently dispatching this signal. This subject might be the origin for this signal, but could also be
	 * dispatching this signal in a bubbling process. For instance, if a user clicks on a button that is inside a menu, and
	 * signals bubble from that button to that menu, the currentTarget will be the button at some point and the menu at another.
	 * The origin will constantly be the button. In other words, the currentTarget is the subject the listener added itself to.
	 * 
	 * <ul><li>
	 * If you are familiar with events in ActionScript 3.0, jQuery, or any other system that was based on DOM level 3 events:
	 * this property is similar to the currentTarget property of the event objects in those systems.
	 * </li></ul>
	 * 
	 * In this example, the currentTarget property is used to determine which button was clicked. Note that this example is
	 * AVM2-specific, and requires the complete version of HSL (not just HSL-pico).
	 * <pre>
	 * package;
	 * import flash.display.Sprite;
	 * import flash.events.MouseEvent;
	 * import flash.Lib;
	 * import hsl.avm2.translating.AVM2Signaler;
	 * import hsl.haxe.direct.DirectSignaler;
	 * import hsl.haxe.Signal;
	 * import hsl.haxe.Signaler;
	 * class Main {
	 * 	public static function addButton(x:Float, color:Int):Void {
	 * 		var button:Button = new Button(color);
	 * 		button.x = x;
	 * 		button.clickedSignaler.bindAdvanced(handleButtonClicked);
	 * 		Lib.current.addChild(button);
	 * 	}
	 * 	public static function handleButtonClicked(signal:Signal&lt;Void&gt):Void {
	 * 		var button:Button = cast(signal.currentTarget, Button);
	 * 		trace("A button was clicked with this color: #" + StringTools.hex(button.color));
	 * 		removeButton(button);
	 * 	}
	 * 	private static function removeButton(button:Button):Void {
	 * 		button.clickedSignaler.unbindAdvanced(handleButtonClicked);
	 * 		Lib.current.removeChild(button);
	 * 	}
	 * 	public static function main():Void {
	 * 		addButton(0, 0x61C8E1);
	 * 		addButton(150, 0x61C8E1);
	 * 		addButton(300, 0xF68A1E);
	 * 		addButton(450, 0x61C8E1);
	 * 	}
	 * }
	 * class Button extends Sprite {
	 * 	public var clickedSignaler(default, null):Signaler&lt;Void&gt;;
	 * 	public var color:Int;
	 * 	public function new(color:Int):Void {
	 * 		super();
	 * 		clickedSignaler = new AVM2Signaler(this, this, MouseEvent.CLICK);
	 * 		this.color = color;
	 * 		buttonMode = true;
	 * 		draw();
	 * 	}
	 * 	private inline function draw():Void {
	 * 		graphics.beginFill(color);
	 * 		graphics.drawRoundRect(0, 0, 125, 77, 16);
	 * 		graphics.endFill();
	 * 	}
	 * }
	 * </pre>
	 * Note that this example is somewhat complex, and might be hard to understand if you are not familiar with the basics of
	 * this library.
	 */
	public var currentTarget(default, null):Subject;
	/**
	 * The data element in this signal.
	 */
	public var data(default, null):Datatype;
	/**
	 * Deprecated. Equal to the data property.
	 */
	public var data1(getData, null):Datatype;
	/**
	 * Indicates whether stopImmediatePropagation method was called on this signal (true) or not (false).
	 */
	public var immediatePropagationStopped(default, null):Bool;
	/**
	 * The subject that initially dispatched this signal. For instance, if a user clicks on a button that is inside a menu, and
	 * signals bubble from that button to that menu, the currentTarget will be the button at some point and the menu at another.
	 * The origin will constantly be the button. In other words, the origin is the subject that called the dispatch method.
	 * 
	 * <ul><li>
	 * If you are familiar with events in ActionScript 3.0, jQuery, or any other system that was based on DOM level 3 events:
	 * this property is similar to the target property of the event objects in those systems.
	 * </li></ul>
	 */
	public var origin(default, null):Subject;
	/**
	 * Indicates whether stopPropagation method was called on this signal (true) or not (false). stopPropagation calls on other
	 * signals, even in the same dispatch process, don't influence this property.
	 */
	public var propagationStopped(default, null):Bool;
	/**
	 * Creates a new signal. Signals are usually created by signalers, so this constructor will probably not be called outside of
	 * the library itself.
	 */
	public function new(data:Datatype, currentBond:Bond, currentTarget:Subject, origin:Subject):Void {
		this.data = data;
		this.currentBond = currentBond;
		this.currentTarget = currentTarget;
		this.origin = origin;
		// Set immediatePropagationStopped and propagationStopped to false, unless the target is flash9, as in that case the
		// default value is false anyway.
		#if !flash9
		immediatePropagationStopped = false;
		propagationStopped = false;
		#end
	}
	private inline function getData():Datatype {
		return data;
	}
	/**
	 * Stops all propagation of the signal. The subject currently dispatching this signal (as found in the target property of
	 * this the signal) stops doing so right away. Any other listeners that are listening are not notified.
	 * 
	 * <ul><li>
	 * If you are familiar with events in ActionScript 3.0, jQuery, or any other system that was based on DOM level 3 events:
	 * this method is similar to the stopImmediatePropagation method of the event objects in those systems.
	 * </li></ul>
	 * 
	 * In this example, the stopImmediatePropagation method is used to mute the sound that was produces by the "Muter" class:
	 * <pre>
	 * package;
	 * import hsl.haxe.direct.DirectSignaler;
	 * import hsl.haxe.Bond;
	 * import hsl.haxe.Signal;
	 * import hsl.haxe.Signaler;
	 * class Main {
	 * 	public static function traceCheer():Void {
	 * 		trace("Yay!");
	 * 	}
	 * 	public static function main():Void {
	 * 		var speaker:Speaker = new Speaker();
	 * 		var muter:Muter = new Muter(speaker);
	 * 		speaker.soundProducedSignaler.bindVoid(traceCheer);
	 * 		// This has no effect: the muter stops the signal propagation.
	 * 		speaker.produceSound();
	 * 		muter.disable();
	 * 		// This traces the cheer: the muter is disabled.
	 * 		speaker.produceSound();
	 * 		muter.enable();
	 * 		// This has no effect: the muter is re-enabled.
	 * 		speaker.produceSound();
	 * 	}
	 * }
	 * class Speaker {
	 * 	public var soundProducedSignaler(default, null):Signaler&lt;Void&gt;;
	 * 	public function new():Void {
	 * 		soundProducedSignaler = new DirectSignaler(this);
	 * 	}
	 * 	public inline function produceSound():Void {
	 * 		soundProducedSignaler.dispatch();
	 * 	}
	 * }
	 * class Muter {
	 * 	private var muteBond:Bond;
	 * 	public function new(speaker:Speaker):Void {
	 * 		muteBond = speaker.soundProducedSignaler.bindAdvanced(mute);
	 * 	}
	 * 	public inline function disable():Void {
	 * 		muteBond.halt();
	 * 	}
	 * 	public inline function enable():Void {
	 * 		muteBond.resume();
	 * 	}
	 * 	private function mute(signal:Signal&lt;Void&gt;):Void {
	 * 		signal.stopImmediatePropagation();
	 * 	}
	 * }
	 * </pre>
	 * Note that this example is somewhat complex, and might be hard to understand if you are not familiar with the basics of
	 * this library.
	 */
	public inline function stopImmediatePropagation():Void {
		immediatePropagationStopped = true;
	}
	/**
	 * Stops the bubbling of the signal. The subject currently dispatching this signal (as found in the target property of this
	 * the signal) will not bubble it to its bubbling targets. Calling this method does not prevent other listeners of the same
	 * signaler from being called: see stopImmediatePropagation for that functionality.
	 * 
	 * <ul><li>
	 * If you are familiar with events in ActionScript 3.0, jQuery, or any other system that was based on DOM level 3 events:
	 * this method is similar to the stopPropagation method of the event objects in those systems.
	 * </li></ul>
	 */
	public inline function stopPropagation():Void {
		propagationStopped = true;
	}
	#if debug
	private function toString():String {
		return "[GenericSignal data=" + data + "]";
	}
	#end
}