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
package hsl.haxe.plugins;
import hsl.haxe.Signaler;

/**
 * A vault that stores signalers.
 */
class SignalerVault<NativeDispatcherType> {
	private var signalerCells:Hash<List<SignalerCell<NativeDispatcherType>>>;
	/**
	 * Creates a new signaler vault.
	 */
	public function new():Void {
		signalerCells = new Hash<List<SignalerCell<NativeDispatcherType>>>();
	}
	/**
	 * Gets a signaler for the passed native dispatcher and the passed signal identifier. This method creates a new signaler if
	 * it cannot find one that has been created earlier. New signalers are created using the passed createSignaler function.
	 */
	public function getSignaler<Datatype>(nativeDispatcher:NativeDispatcherType, signalIdentifier:String, createSignaler:NativeDispatcherType -> Signaler<Datatype>):Signaler<Datatype> {
		var signalerCellList:List<SignalerCell<NativeDispatcherType>> =
			if (signalerCells.exists(signalIdentifier)) {
				signalerCells.get(signalIdentifier);
			} else {
				var result:List<SignalerCell<NativeDispatcherType>> = new List<SignalerCell<NativeDispatcherType>>();
				signalerCells.set(signalIdentifier, result);
				result;
			}
		for (signalerCell in signalerCellList) {
			if (signalerCell.nativeDispatcher == nativeDispatcher) {
				return untyped signalerCell.signaler;
			}
		}
		var result:Signaler<Datatype> = createSignaler(nativeDispatcher);
		signalerCellList.add(new SignalerCell<NativeDispatcherType>(nativeDispatcher, result));
		return result;
	}
}
class SignalerCell<NativeDispatcherType> {
	public var nativeDispatcher(default, null):NativeDispatcherType;
	public var signaler(default, null):Signaler<Dynamic>;
	public function new(nativeDispatcher:NativeDispatcherType, signaler:Signaler<Dynamic>):Void {
		this.nativeDispatcher = nativeDispatcher;
		this.signaler = signaler;
	}
}
