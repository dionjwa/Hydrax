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
import haxe.PosInfos;

/**
 * This class is a null object implementation of the signaler interface. See
 * <a href="http://en.wikipedia.org/wiki/Null_Object_pattern">Null Object pattern</a> on Wikipedia for more information.
 */
class NullSignaler<Datatype> implements Signaler<Datatype> {
	public var subject(default, null):Subject;
	public var isListenedTo(getIsListenedTo, null):Bool;
	/**
	 * Creates a new null signaler. The passed subject will be stored as the subject property of this signaler.
	 */
	public function new(subject:Subject):Void {
		this.subject = subject;
	}
	public function addBubblingTarget(value:Signaler<Datatype>):Void {
	}
	public function bind(listener:Datatype -> Dynamic):Bond {
		return new Bond();
	}
	public function bindAdvanced(listener:Signal<Datatype> -> Dynamic):Bond {
		return new Bond();
	}
	public function bindVoid(listener:Void -> Dynamic):Bond {
		return new Bond();
	}
	public function dispatch(?data:Datatype, ?origin:Subject, ?positionInformation:PosInfos):Void {
	}
	private function getIsListenedTo():Bool {
		return false;
	}
	public function removeBubblingTarget(value:Signaler<Datatype>):Void {
	}
	#if debug
	private function toString():String {
		return "[Signaler isListenedTo=false]";
	}
	#end
	public function unbind(listener:Datatype -> Dynamic):Void {
	}
	public function unbindAdvanced(listener:Signal<Datatype> -> Dynamic):Void {
	}
	public function unbindVoid(listener:Void -> Dynamic):Void {
	}
}