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
 * A bond represents the connection between a signaler and a listener. Bonds are created when listeners add themselves to a
 * signaler.
 * 
 * Bonds are used internally, and can be ignored in common cases. However, sometimes it is useful for listeners to store the
 * bond in a variable. Doing so allows you to halt and resume the bond, and destroy it easily.
 */
class Bond {
	/**
	 * Indicates whether the bond has been halted (true) or not (false). See the halt method for more information.
	 */
	public var halted(default, null):Bool;
	/**
	 * Creates a new bond.
	 */
	public function new():Void {
		// Set halted to false, unless the target is AVM2, as in that case the default value is false anyway.
		#if !flash9
		halted = false;
		#end
	}
	/**
	 * Destroys the bond. The signaler that created this bond will no longer notify listeners through it. Bond cannot be
	 * "undestroyed". To temporary suspend the bond from notifying the associated listener, use the halt method.
	 */
	public function destroy():Void {
	}
	/**
	 * Halts the bond. The bond will ignore any calls, and will not notify any listeners, until the resume method is called. If
	 * the bond was already halted, calling this method has no effect.
	 */
	public inline function halt():Void {
		halted = true;
	}
	/**
	 * Resumes the bond, after it has been halted by calling the halt method. If the bond was not halted, calling this method has
	 * no effect. See the halt method for more information.
	 */
	public inline function resume():Void {
		halted = false;
	}
	#if debug
	private function toString():String {
		return "[Bond]";
	}
	#end
}