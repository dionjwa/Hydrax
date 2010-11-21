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
package hsl.avm2.translating;
import flash.events.IEventDispatcher;
import haxe.PosInfos;
import hsl.avm2.translation.DatalessTranslator;
import hsl.haxe.translating.TranslatingSignalerBase;
import hsl.haxe.translation.Translator;
import hsl.haxe.Subject;

/**
 * An AVM2 signaler serves as a bridge between the ActionScript 3.0 event system, and this library.
 */
class AVM2Signaler<Datatype> extends TranslatingSignalerBase<Datatype> {
	private var nativeDispatcher:IEventDispatcher;
	private var nativeEventType:String;
	/**
	 * Creates a new AVM2 signaler. This signaler serves as a bridge between the ActionScript 3.0 event system, and this library.
	 * 
	 * The passed subject will be used as the subject of this signaler. Only the subject is allowed to call the dispatch method.
	 * Signals dispatched by this signaler will have the subject as current target, and in some cases as origin.
	 * 
	 * The passed native dispatcher is the object that dispatcher the events that will be translated. The native event type is
	 * the type of the events that will be translated. The native dispatcher can be the same as the subject, but it could be an
	 * other object, too.
	 * 
	 * If the reject null data flag is set, the signaler will throw an error if the subject attempts to dispatch a signal with
	 * null as data, or the the signaler is about to bubble a signal that contains null as data.
	 * 
	 * In this examle the "CircularButton" class uses the AVM2 signaler:
	 * <pre>
	 * package;
	 * import flash.display.Sprite;
	 * import flash.events.MouseEvent;
	 * import hsl.avm2.translating.AVM2Signaler;
	 * import hsl.avm2.translation.mouse.ModifierKeysStateTranslator;
	 * import hsl.haxe.data.keyboard.ModifierKeysState;
	 * import hsl.haxe.Signaler;
	 * class CircularButton extends Sprite {
	 * 	public var clickedSignaler(default, null):Signaler<ModifierKeysState>;
	 * 	public function new():Void {
	 * 		super();
	 * 		clickedSignaler = new AVM2Signaler(this, this, MouseEvent.CLICK, new ModifierKeysStateTranslator());
	 * 		buttonMode = true;
	 * 		draw();
	 * 	}
	 * 	private inline function draw():Void {
	 * 		graphics.beginFill(0x10992A);
	 * 		graphics.drawCircle(50, 50, 50);
	 * 		graphics.endFill();
	 * 	}
	 * }
	 * </pre>
	 */
	public function new(subject:Subject, nativeDispatcher:IEventDispatcher, nativeEventType:String, ?translator:Translator<Datatype>, ?rejectNullData:Bool):Void {
		// If the passed translator is null, use a dataless translator.
		if (null == translator) {
			translator = new DatalessTranslator<Datatype>();
		}
		super(subject, translator, rejectNullData);
		this.nativeDispatcher = nativeDispatcher;
		this.nativeEventType = nativeEventType;
		// Add a listener to the passed native dispatcher.
		addInternalListener();
	}
	private function addInternalListener():Void {
		nativeDispatcher.addEventListener(nativeEventType, dispatchNative);
	}
	private function removeInternalListener():Void {
		nativeDispatcher.removeEventListener(nativeEventType, dispatchNative);
	}
	#if production
	public override function stop():Void {
	#else
	public override function stop(?positionInformation:PosInfos):Void {
		super.stop(positionInformation);
	#end
		removeInternalListener();
	}
}
