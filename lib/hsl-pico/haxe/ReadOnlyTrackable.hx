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
package haxe;
import haxe.exception.ArgumentNullException;
import haxe.exception.Exception;
import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

/**
 * A read-only trackable value. If this value is overwritten, a signal is dispatched. This allows you to track this value for
 * changes. As the value is read-only, it can only be written by the owner.
 */
class ReadOnlyTrackable<Datatype> {
	/**
	 * A signaler that dispatches signals after this value has been overwritten. The signals contain the new value.
	 */
	public var changedSignaler(default, null):Signaler<Datatype>;
	private var owner:Dynamic;
	private var ownerClassNames:List<String>;
	/**
	 * The previous value.
	 */
	public var previousValue(default, null):Datatype;
	/**
	 * The actual value.
	 */
	public var value(default, null):Datatype;
	/**
	 * Creates a new read-only trackable.
	 */
	public function new(initialValue:Datatype, owner:Dynamic):Void {
		changedSignaler = new DirectSignaler(this);
		// If the passed owner is null, throw an exception. Having null for an owner might produce null object reference errors
		// later on: when the set method is called.
		if (null == owner) {
			throw new ArgumentNullException("owner", 1);
		}
		this.owner = owner;
		previousValue = value = initialValue;
	}
	#if !production
	/**
	 * Checks whether the class name inside the passed position information equals the class name of the owner of this trackable.
	 */
	private function verifyCaller(positionInformation:PosInfos):Void {
		if (null == ownerClassNames) {
			ownerClassNames = TypeTools.getClassNames(owner);
		}
		for (ownerClassName in ownerClassNames) {
			if (ownerClassName == positionInformation.className) {
				return;
			}
		}
		throw new Exception("This method may only be called by the owner of the trackable.", null, 2);
	}
	#end
	/**
	 * Overwrites the current value.
	 */
	#if (as3 || production)
	public function set(newValue:Datatype):Void {
	#else
	public function set(newValue:Datatype, ?positionInformation:PosInfos):Void {
	#end
		// As the automagic position information cannot be used in AS3, use the stacktrace to grab the position information. The
		// following code could be faster, as Stack.callStack() is more expensive than it could be.
		#if !production
		#if as3
		var positionInformation:PosInfos = null;
		for (stackItem in Stack.callStack().slice(1)) {
			switch (stackItem) {
				case FilePos(innerStackItem, fileName, line):
				switch (innerStackItem) {
					case Method(className, methodName):
					verifyCaller({fileName: fileName, lineNumber: line, className: className, methodName: methodName, customParams: null});
					break;
					default:
				}
				break;
				default:
			}
		}
		if (null != positionInformation) {
			verifyCaller(positionInformation);
		}
		#else
		verifyCaller(positionInformation);
		#end
		#end
		previousValue = value;
		changedSignaler.dispatch(value = newValue);
	}
	private function toString():String {
		return Std.string(value);
	}
}
