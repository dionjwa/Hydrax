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
import hsl.haxe.direct.DirectSignaler;
import hsl.haxe.Subject;

/**
 * A dynamic function signaler serves as a bridge between the haXe "dynamic function" system, and this library.
 */
class DynamicFunctionSignaler<Datatype> extends DirectSignaler<Datatype> {
	private var dispatcher:Dynamic;
	/**
	 * Creates a new dynamic function signaler. This signaler serves as a bridge between the haXe "dynamic function" system, and
	 * this library.
	 * 
	 * The passed subject will be used as the subject of this signaler. Only the subject is allowed to call the dispatch method.
	 * Signals dispatched by this signaler will have the subject as current target, and in some cases as origin.
	 * 
	 * The passed dispatcher is the object that uses the dynamic function system. The signaler will look for a function with the
	 * name of the passed function name inside that dispatcher.
	 * 
	 * If the skip presence check flag is set, no "The passed dispatcher does not have a X field." exceptions are thrown.
	 * 
	 * If the reject null data flag is set, the signaler will throw an error if the subject attempts to dispatch a signal with
	 * null as data, or the the signaler is about to bubble a signal that contains null as data.
	 * 
	 * In this examle the "Loader" class uses the dynamic function signaler:
	 * <pre>
	 * package;
	 * import haxe.Http;
	 * import hsl.haxe.translating.DynamicFunctionSignaler;
	 * import hsl.haxe.Signaler;
	 * class Loader {
	 * 	public var dataReceivedSignaler(default, null):Signaler&lt;String&gt;
	 * 	private var http:Http;
	 * 	public function new(url:String):Void {
	 * 		http = new Http(url);
	 * 		dataReceivedSignaler = new DynamicFunctionSignaler(this, http, "onData");
	 * 	}
	 * 	public function load():Void {
	 * 		http.request(false);
	 * 	}
	 * }
	 * </pre>
	 */
	public function new(subject:Subject, dispatcher:Dynamic, functionName:String, ?skipPresenceCheck:Bool, ?rejectNullData:Bool):Void {
		super(subject, rejectNullData);
		this.dispatcher = dispatcher;
		#if debug
		if ((null == skipPresenceCheck || false == skipPresenceCheck) && false == Reflect.hasField(dispatcher, functionName)) {
			// TODO: throw a more exception instead of this lame one.
			throw "The passed dispatcher does not have a " + functionName + " field.";
		}
		#end
		Reflect.setField(dispatcher, functionName, dispatchNative);
	}
	private function dispatchNative(?data:Datatype):Void {
		dispatch(data, dispatcher);
	}
}
