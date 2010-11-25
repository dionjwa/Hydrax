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
 * The license of HSL might change in the near future, most likely to match the license of the haXe core libraries.
 */
package hsl.haxe.direct;
import hsl.haxe.Bond;
import hsl.haxe.Subject;

/**
 * A doubly linked bond, used by the direct signalers. The bond has a reference to the next and the previous bond in the list.
 */
class DirectSignalerBond<Datatype1, Datatype2, Datatype3> extends Bond {
	private var destroyed:Bool;
	// It seems that in AS3 it is not allowed to write to private (protected) fields in ways that are allowed in haXe. Therefore,
	// these fields are public in AS3.
	#if as3 public #else private #end var next:DirectSignalerBond<Datatype1, Datatype2, Datatype3>;
	#if as3 public #else private #end var previous:DirectSignalerBond<Datatype1, Datatype2, Datatype3>;
	public function new():Void {
		super();
		// Set destroyed to false, unless the target is flash9, as in that case the default value is false anyway.
		#if !flash9
		halted = false;
		#end
	}
	/**
	 * Calls the listener stored inside. Classes that extend this one should override this method.
	 */
	public function callListener(data1:Datatype1, data2:Datatype2, data3:Datatype3, currentTarget:Subject, origin:Subject, propagationStatus:PropagationStatus):Void {
	}
	/**
	 * Determines whether the passed bond equals this one. Returns true if they are equal; false otherwise. Classes that extend
	 * this one should override this method.
	 */
	#if as3 public #else private #end function determineEquals(value:DirectSignalerBond<Datatype1, Datatype2, Datatype3>):Bool {
		return false;
	}
	public override function destroy():Void {
		// If this bond has already been destroyed, don't destroy it again.
		if (destroyed == false) {
			previous.next = next;
			next.previous = previous;
			destroyed = true;
		}
	}
	
	public function destroyAll():Void {
		// If this bond has already been destroyed, don't destroy it again.
		if (destroyed == false) {
			previous.next = next;
			next.previous = previous;
			destroyed = true;
		}
	}
}