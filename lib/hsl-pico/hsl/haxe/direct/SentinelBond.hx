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
import hsl.haxe.Subject;

/**
 * A sentinel "bond". The sentinel is not a real bond, as it does not bind the signaler to a listener. Rather it is the value
 * before the first bond and after the last bond of this signaler. It contains logic that helps the signaler working with the
 * linked list structure.
 */
class SentinelBond<Datatype1, Datatype2, Datatype3> extends DirectSignalerBond<Datatype1, Datatype2, Datatype3> {
	/**
	 * Indicates whether this sentinel is connected to other bonds (true), or not (false).
	 */
	public var isConnected(getIsConnected, null):Bool;
	/**
	 * Creates a new sentinel bond.
	 */
	public function new():Void {
		super();
		next = previous = this;
	}
	/**
	 * Inserts a bond between the sentinel and the previous bond. Effectively, the newely added bond ends up being the last one
	 * in the list.
	 */
	public inline function add(value:DirectSignalerBond<Datatype1, Datatype2, Datatype3>):DirectSignalerBond<Datatype1, Datatype2, Datatype3> {
		value.next = this;
		value.previous = previous;
		previous = previous.next = value;
		return value;
	}
	public override function callListener(data1:Datatype1, data2:Datatype2, data3:Datatype3, currentTarget:Subject, origin:Subject, propagationStatus:PropagationStatus):Void {
		var node:DirectSignalerBond<Datatype1, Datatype2, Datatype3> = next;
		// TODO: This type of equality check could be slower than nescessary in PHP as such checks might involve comparison of
		// properties, rather than references. Some conditional compiling code here might speed things up for that target.
		while (node != this && propagationStatus.immediatePropagationStopped == false) {
			node.callListener(data1, data2, data3, currentTarget, origin, propagationStatus);
			node = node.next;
		}
	}
	/**
	 * Determines whether this sentinel is connected to other bonds (true), or not (false).
	 */
	private inline function getIsConnected():Bool {
		// TODO: This type of equality check could be slower than nescessary in PHP as such checks might involve comparison of
		// properties, rather than references. Some conditional compiling code here might speed things up for that target.
		return next != this;
	}
	/**
	 * Removes a bond connected to the sentinel.
	 * 
	 * The sentinel will look for the first bond equal to the passed value connected to it, and destroy it.
	 */
	public inline function remove(value:DirectSignalerBond<Datatype1, Datatype2, Datatype3>):Void {
		var node:DirectSignalerBond<Datatype1, Datatype2, Datatype3> = next;
		// TODO: This type of equality check could be slower than nescessary in PHP as such checks might involve comparison of
		// properties, rather than references. Some conditional compiling code here might speed things up for that target.
		while (node != this) {
			if (node.determineEquals(value)) {
				node.destroy();
				break;
			}
			node = node.next;
		}
	}
	
	public inline function removeAll():Void {
		var node:DirectSignalerBond<Datatype1, Datatype2, Datatype3> = next;
		// TODO: This type of equality check could be slower than nescessary in PHP as such checks might involve comparison of
		// properties, rather than references. Some conditional compiling code here might speed things up for that target.
		while (node != this) {
		    node.destroy();
			node = node.next;
		}
	}
}