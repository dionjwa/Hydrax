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
package haxe.exception;
import haxe.Stack;

/**
 * General base class for exceptions.
 */
class Exception {
	/**
	 * The initial exception that triggered the chain of exceptions resulting in this exception to be thrown. If this exception
	 * does not have any inner exceptions, this property is equal to this exception.
	 */
	public var baseException(getBaseException, null):Exception;
	/**
	 * The exception that was thrown causing this exception to be thrown. If this exception does not have any inner exceptions,
	 * this property is null.
	 */
	public var innerException(default, null):Exception;
	/**
	 * The message associated with and describing this exception.
	 */
	public var message(default, null):String;
	/**
	 * The trace to the place where this exception was generated and thrown.
	 */
	public var stackTrace(default, null):Iterable<StackItem>;
	/**
	 * The same as the stackTrace property, only more accurately typed.
	 */
	private var stackTraceArray:Array<StackItem>;
	
	/**
	 * Creates a new exception. Creating an exception automatically generates the corresponding stacktrace.
	 */
	public function new(?message:String, ?innerException:Exception, ?numberOfStackTraceShifts:Int) {
		// If no message is passed, use "Unknown exception".
		this.message =
			if (null == message) {
				"Unknown exception";
			} else {
				message;
			}
		this.innerException = innerException;
		generateStackTrace(numberOfStackTraceShifts);
		stackTrace = stackTraceArray;
	}
	
	/**
	 * Generates the stacktrace. Is called in the constructor of this class. Calling this from somewhere else will result in a
	 * corrupted stacktrace.
	 */
	private inline function generateStackTrace(numberOfStackTraceShifts) {
		// Shift off the number of stack trace shifts defined in the constructor, plus one for the constructor of this class.
		stackTraceArray = Stack.callStack().slice(numberOfStackTraceShifts + 1);
		// Shift off any constructor calls of s-ubclasses of this one.
		var exceptionClass:Class<Dynamic> = Type.getClass(this);
		while (Exception != exceptionClass) {
			stackTraceArray.shift();
			exceptionClass = Type.getSuperClass(exceptionClass);
		}
	}
	/**
	 * Gets the base exception of this one.
	 */
	private inline function getBaseException():Exception {
		var result:Exception = this;
		while (null != result.innerException) {
			result = result.innerException;
		}
		return result;
	}
	private function toString():String {
		return message + Stack.toString(stackTraceArray);
	}
}