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
 * A subject is an object that might have internal state changes, which could be of interest to their environment. It notifies
 * its environment of such state changes by dispatching signals, rather than directly calling one of the methods of the
 * listeners. Subjects dispatch signals through signalers. Listeners can add themselves to those signalers.
 * 
 * Use of this technique results in low coupling between the subjects and their listeners. See
 * <a href="http://en.wikipedia.org/wiki/Coupling_(computer_science)">Coupling</a> on Wikipedia for more information.
 * 
 * Any class can act as a subject. Subjects can have any number of signalers.
 * 
 * In this example, the "buddy" variable (an instance of the "Dog" class) is a subject. The main class is a listener.
 * <pre>
 * package;
 * import hsl.haxe.direct.DirectSignaler;
 * import hsl.haxe.Signaler;
 * class Main {
 * 	public static function traceSound(sound:String):Void {
 * 		trace(sound);
 * 	}
 * 	public static function main():Void {
 * 		var buddy:Dog = new Dog();
 * 		buddy.barkedSignaler.bind(traceSound);
 * 		buddy.bark();
 * 	}
 * }
 * class Dog {
 * 	public var barkedSignaler(default, null):Signaler&lt;String&gt;;
 * 	public function new():Void {
 * 		barkedSignaler = new DirectSignaler(this);
 * 	}
 * 	public inline function bark():Void {
 * 		barkedSignaler.dispatch("Woof");
 * 	}
 * }
 * </pre>
 */
typedef Subject = {};