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
 * A signalers is a tool, used by a subject to notify its environment (listeners). Subjects create their signalers, usually in
 * their constructors. Listeners add themselves to signalers by calling one of the binding methods.
 * 
 * <ul><li>
 * If you are familiar with as3-signals by Robert Penner: signalers are similar to "signals" in that library.
 * </li><li>
 * If you are familiar with events in ActionScript 3.0: signalers have some similarities to "event dispatchers" in that system.
 * There is one major difference, though: an event dispatcher can dispatch events of different event types; but in this library
 * each type of signal has its own signaler.
 * </li></ul>
 */
interface Signaler<Datatype> {
	/**
	 * Indicates whether the signaler is listened to by at least one listener.
	 * 
	 * This property can be used for speed optimizations. If a signaler is not listened to, its subject does not have to
	 * calculate a value if that value will only be sent in a signal.
	 * 
	 * In this example the "Ball" class only calculates the distance if a listener is added to the signaler:
	 * <pre>
	 * package;
	 * import hsl.haxe.direct.DirectSignaler;
	 * import hsl.haxe.Signaler;
	 * class Ball {
	 * 	public var distanceUpdatedSignaler(default, null):DirectSignaler&lt;Float&gt;;
	 * 	public function new():Void {
	 * 		distanceUpdatedSignaler = new DirectSignaler(this);
	 * 	}
	 * 	public function move(x:Float, y:Float):Void {
	 * 		if (distanceUpdatedSignaler.isListenedTo) {
	 * 			var distance:Float = Math.sqrt(x * x + y * y);
	 * 			distanceUpdatedSignaler.dispatch(distance);
	 * 		}
	 * 	}
	 * }
	 * </pre>
	 */
	public var isListenedTo(getIsListenedTo, null):Bool;
	/**
	 * The subject this signaler belongs to.
	 */
	public var subject(default, null):Subject;
	/**
	 * Adds a bubbling target to the signaler. The signaler will bubble to this bubbling target in bubbling processes.
	 * 
	 * <ul><li>
	 * If you are familiar with events in ActionScript 3.0, or as3-signals by Robert Penner: those systems do not have an
	 * equivalent to this method, as they don't allow you to manually define where events/signals bubble to.
	 * </li></ul>
	 */
	public function addBubblingTarget(value:Signaler<Datatype>):Void;
	/**
	 * Adds a notification target to the signaler. The signaler will notify to this notification target in bubbling processes,
	 * however, the data inside the signal will not be passed to this notification target.
	 * 
	 * <ul><li>
	 * If you are familiar with events in ActionScript 3.0, or as3-signals by Robert Penner: those systems do not have an
	 * equivalent to this method, as they don't allow you to manually define where events/signals bubble to.
	 * </li></ul>
	 */
	public function addNotificationTarget(value:Signaler<Void>):Void;
	/**
	 * Binds this signaler to a listener function that accepts an argument of the datatype of this signaler, and returns nothing.
	 * Returns the bond between the signaler. The bond can be removed by calling either the unbind method of the signaler, or the
	 * destroy method of the returned bond.
	 * 
	 * <ul><li>
	 * If you are familiar with jQuery: this method is similar to the "bind" method of that library.
	 * </li><li>
	 * If you are familiar with as3-signals by Robert Penner: this method is similar to the "add" method of that library.
	 * </li><li>
	 * If you are familiar with events in ActionScript 3.0: this method is similar to the "addEventListener" method of that
	 * system, though the bindAdvanced method of this library has more similarities to addEventListener.
	 * </li></ul>
	 */
	 
	#if js
	public function bind(listener:Datatype -> Dynamic, ?context :Dynamic):Bond;
	#else
	public function bind(listener:Datatype -> Dynamic):Bond;
	#end
	/**
	 * Binds this signaler to a listener function that accepts a signal, and returns nothing. Returns the bond between the
	 * signaler. The bond can be removed by calling either the unbindAdvanced method of the signaler, or the destroy method of
	 * the returned bond.
	 * 
	 * <ul><li>
	 * If you are familiar with jQuery: this method is similar to the "bind" method of that library.
	 * </li><li>
	 * If you are familiar with as3-signals by Robert Penner: this method is similar to the "add" method of that library, though
	 * the bind method of this library has more similarities to add.
	 * </li><li>
	 * If you are familiar with events in ActionScript 3.0: this method is similar to the "addEventListener" method of that
	 * system.
	 * </li></ul>
	 */
	public function bindAdvanced(listener:Signal<Datatype> -> Dynamic):Bond;
	/**
	 * Binds this signaler to a listener function that accepts nothing, and returns nothing. Returns the bond between the
	 * signaler. The bond can be removed by calling either the unbindVoid method of the signaler, or the destroy method of the
	 * returned bond.
	 * 
	 * <ul><li>
	 * If you are familiar with jQuery: this method is similar to the "bind" method of that library.
	 * </li><li>
	 * If you are familiar with as3-signals by Robert Penner: this method is similar to the "add" method of that library, though
	 * the bind method of this library has more similarities to add.
	 * </li><li>
	 * If you are familiar with events in ActionScript 3.0: this method is similar to the "addEventListener" method of that
	 * system, though the bindAdvanced method of this library has more similarities to addEventListener.
	 * </li></ul>
	 */
	public function bindVoid(listener:Void -> Dynamic):Bond;
	/**
	 * Dispatches a signal, containing the passed data. All the listeners that are listening to this signaler will be notified.
	 * The signal will bubble to all of the bubbling targets that were added to this signaler. This method may only be called
	 * by the subject of the signaler.
	 */
	#if (as3 || production)
	public function dispatch(?data:Datatype, ?origin:Subject):Void;
	#else
	public function dispatch(?data:Datatype, ?origin:Subject, ?positionInformation:haxe.PosInfos):Void;
	#end
	private function getIsListenedTo():Bool;
	/**
	 * Removes a bubbling target from the signaler. The signaler will stop bubbling to this bubbling target. If the signaler
	 * does not have the passed value as a bubbling target, calling this method has no effect.
	 */
	public function removeBubblingTarget(value:Signaler<Datatype>):Void;
	/**
	 * Removes a notification target from the signaler. The signaler will stop notifying this notification target. If the
	 * signaler does not have the passed value as a notification target, calling this method has no effect.
	 */
	public function removeNotificationTarget(value:Signaler<Void>):Void;
	/**
	 * Removed the bond between this signaler and a listener. If such bond does not exist, calling this method has no effect.
	 */
	public function unbind(listener:Datatype -> Dynamic):Void;
	/**
	 * Removed the bond between this signaler and a listener. If such bond does not exist, calling this method has no effect.
	 */
	public function unbindAdvanced(listener:Signal<Datatype> -> Dynamic):Void;
	/**
	 * Removed the bond between this signaler and a listener. If such bond does not exist, calling this method has no effect.
	 */
	public function unbindVoid(listener:Void -> Dynamic):Void;
	
	public function unbindAll():Void;
}
