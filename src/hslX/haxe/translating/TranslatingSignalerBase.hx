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
package hsl.haxe.translating;
import haxe.exception.ArgumentNullException;
import haxe.exception.Exception;
import haxe.PosInfos;
import hsl.haxe.direct.DirectSignaler;
import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;
import hsl.haxe.Subject;

/**
 * A translating signaler serves as a bridge between a native event system and HSL, by re-dispatching native events as HSL
 * signals. This class serves as a base class for the translating signalers.
 */
class TranslatingSignalerBase<Datatype> extends DirectSignaler<Datatype> {
	private var translator:Translator<Datatype>;
	/**
	 * Creates a new translating signaler base. As this is a base class, this constructor will probably not be called outside of
	 * the library itself.
	 */
	public function new(subject:Subject, translator:Translator<Datatype>, ?rejectNullData:Bool):Void {
		super(subject, rejectNullData);
		this.translator = translator;
	}
	private function dispatchNative(nativeEvent:NativeEvent):Void {
		// Translate the native event.
		var translation:Translation<Datatype> = translator.translate(nativeEvent);
		#if debug
		if (null == translation) {
			throw new Exception("The translate method of the translator returned null, which is not allowed. It should return a translation with null values inside, instead.");
		}
		#end
		dispatch(translation.data, translation.origin);
	}
	/**
	 * Stops translating translating and re-dispatching native events/signals. Translating signalers will likely add references
	 * to native dispatchers. Calling this method will remove those references, allowing the translating signaler to be garbage
	 * collected even if the native dispatchers are not.
	 */
	#if production
	public function stop():Void {
	#else
	public function stop(?positionInformation:PosInfos):Void {
		verifyCaller(positionInformation);
	#end
	}
}
