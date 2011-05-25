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
import haxe.exception.ArgumentNullException;
import haxe.exception.Exception;

/**
 * A signaler that dispatches signals directly.
 */
class DirectSignaler<Datatype> implements Signaler<Datatype> {
	private var bubblingTargets:List<Signaler<Datatype>>;
	public var isListenedTo(getIsListenedTo, never):Bool;
	private var notificationTargets:List<Signaler<Void>>;
	private var rejectNullData:Bool;
	private var sentinel:SentinelBond<Datatype>;
	public var subject(default, null):Subject;
	/**
	 * The fully qualified class names of the subject.
	 */
	private var subjectClassNames:List<String>;
	
	#if debug
	public function getBonds () :Iterable<Bond>
	{
		if (!sentinel.isConnected) 
			return [];
		return sentinel.getBonds();
	}
	#end

	/**
	 * Creates a new direct signaler.
	 * 
	 * The passed subject will be used as the subject of this signaler. Only the subject is allowed to call the dispatch method.
	 * Signals dispatched by this signaler will have the subject as current target, and in some cases as origin.
	 * 
	 * If the reject null data flag is set, the signaler will throw an exception if the subject attempts to dispatch a signal
	 * with null as data, or the the signaler is about to bubble a signal that contains null as data.
	 */
	 public function new(subject:Subject, ?rejectNullData:Bool):Void {
	 	 
	 	 // If the passed subject is null, throw an exception. Having null for a subject might produce null object reference errors
		// later on: when the listeners use the produced signals.
		if (null == subject) {
			throw new ArgumentNullException("subject", 1);
		}
		this.subject = subject;
		this.rejectNullData = rejectNullData;
		sentinel = new SentinelBond<Datatype>();
	}
	public function addBubblingTarget(value:Signaler<Datatype>):Void {
		if (null == bubblingTargets) {
			bubblingTargets = new List<Signaler<Datatype>>();
		}
		bubblingTargets.add(value);
	}
	public function addNotificationTarget(value:Signaler<Void>):Void {
                if (null == notificationTargets) {
                        notificationTargets = new List<Signaler<Void>>();
                }
                notificationTargets.add(value);
        }
	#if js
	public function bind(listener:Datatype -> Dynamic, ?context :Dynamic, ?callOnceOnly :Bool = false):Bond {
		return sentinel.add(callOnceOnly ? new CallOnceBond(listener, context) : new RegularBond(listener, context));
	}
	public function bindVoid(listener:Void -> Dynamic, ?context :Dynamic, ?callOnceOnly :Bool = false):Bond {
		return sentinel.add(new NiladicBond<Datatype>(listener, context));
	}
	#else
	public function bind(listener:Datatype -> Dynamic, ?callOnceOnly :Bool = false):Bond {
		return sentinel.add(callOnceOnly ? new CallOnceBond(listener) : new RegularBond(listener));
	}
	public function bindVoid(listener:Void -> Dynamic, ?callOnceOnly :Bool = false):Bond {
		return sentinel.add(new NiladicBond<Datatype>(listener));
	}
	#end
	public function bindAdvanced(listener:Signal<Datatype> -> Dynamic):Bond {
		return sentinel.add(new AdvancedBond<Datatype>(listener));
	}
	
	private inline function bubble(data:Datatype, origin:Subject):Void {
		if (null != bubblingTargets) {
			for (bubblingTarget in bubblingTargets) {
				bubblingTarget.dispatch(data, origin);
			}
		}
		if (null != notificationTargets) {
			for (notificationTarget in notificationTargets) {
				notificationTarget.dispatch(null, origin);
			}
		}
	}
	#if (as3 || production)
	public function dispatch(?data:Datatype, ?origin:Subject):Void {
	#else
	public function dispatch(?data:Datatype, ?origin:Subject, ?positionInformation:haxe.PosInfos):Void {
	#end
		#if !production
		#if as3
		// As the automagic position information cannot be used in AS3, use the stacktrace to grab the position information. The
		// following code could be faster, as Stack.callStack() is more expensive than it could be.
		var positionInformation:haxe.PosInfos = null;
		for (stackItem in haxe.Stack.callStack().slice(1)) {
			switch (stackItem) {
				case FilePos(innerStackItem, fileName, line):
				switch (innerStackItem) {
					case Method(className, methodName):
					positionInformation = {fileName: fileName, lineNumber: line, className: className, methodName: methodName, customParams: null};
					default:
				}
				break;
				default:
			}
		}
		if (null != positionInformation && "dispatchNative" != positionInformation.methodName && "bubble" != positionInformation.methodName) {
			verifyCaller(positionInformation);
		}
		#else
		// Verify the caller of this method, which should be the subject of this signaler. As you can see, there's nasty hack here
		// which makes bubbling and dispatching from the translating signalers possible.
		if ("dispatchNative" != positionInformation.methodName && "bubble" != positionInformation.methodName) {
			verifyCaller(positionInformation);
		}
		#end
		#end
		// Verify the data.
		if (rejectNullData && null == data) {
			throw new Exception("Some data that was passed is null, but this signaler has been set to reject null data.", null, 1);
		}
		// Grab the origin.
		origin = getOrigin(origin);
		// Call all the listeners and bubble the signal, if propagation was not stopped.
		if (PropagationStatus.UNDISTURBED == sentinel.callListener(data, subject, origin, PropagationStatus.UNDISTURBED)) {
			bubble(data, origin);
		}
	}
	private function getIsListenedTo():Bool {
		return sentinel.isConnected;
	}
	/**
	 * Returns the passed origin if it is not null. Returns the subject of this signaler if the passed origin is null.
	 */
	private inline function getOrigin(origin:Subject):Subject {
		return
			if (null == origin) {
				subject;
			} else {
				origin;
			}
	}
	#if !production
	/**
	 * Checks whether the class name inside the passed position information equals the class name of the subject of this
	 * signaler. Used in the dispatch method, as that method may only be called by the subject.
	 * 
	 * Two notes.
	 * One, by using this method you check whether the caller is of the same type as the subject, which does not necessarily mean
	 * it's the same instance. This is the expected behavior, as it is consistent with private members.
	 * Two, one could hack his or her way around this check. How to do this should be obvious. The check is not designed to be
	 * unhackable; rather it is designed to prevent developers from accidentally misapplying HSL. Nicolas Cannasse once said
	 * "everything should be made accessible, if you know what you're doing".
	 */
	private function verifyCaller(positionInformation:haxe.PosInfos):Void {
		if (null == subjectClassNames) {
			subjectClassNames = haxe.TypeTools.getClassNames(subject);
		}
		for (subjectClassName in subjectClassNames) {
			if (subjectClassName == positionInformation.className) {
				return;
			}
		}
		throw new Exception("This method may only be called by the subject of the signaler.", null, 2);
	}
	#end
	public function removeBubblingTarget(value:Signaler<Datatype>):Void {
		if (null != bubblingTargets) {
			bubblingTargets.remove(value);
		}
	}
	public function removeNotificationTarget(value:Signaler<Void>):Void {
		if (null != notificationTargets) {
			notificationTargets.remove(value);
		}
	}
	#if debug
	private function toString():String {
		return "[Signaler isListenedTo=" + isListenedTo + "]";
	}
	#end
	public function unbind(listener:Datatype -> Dynamic):Void {
		sentinel.remove(new RegularBond(listener));
	}
	public function unbindAdvanced(listener:Signal<Datatype> -> Dynamic):Void {
		sentinel.remove(new AdvancedBond<Datatype>(listener));
	}
	public function unbindVoid(listener:Void -> Dynamic):Void {
		sentinel.remove(new NiladicBond<Datatype>(listener));
	}
	public function unbindAll():Void {
		sentinel.removeAll();
	}
}
/**
 * A doubly linked bond. The bond has a reference to the next and the previous bond in the list.
 */
private class LinkedBond<Datatype> extends Bond {
	private var destroyed:Bool;
	// It seems that in AS3 it is not allowed to write to private (protected) fields in ways that are allowed in haXe. Therefore,
	// these fields are public in AS3.
	#if as3 public #else private #end var next:LinkedBond<Datatype>;
	#if as3 public #else private #end var previous:LinkedBond<Datatype>;
	public function new():Void {
		super();
		// Set destroyed to false, unless the target is flash9, as in that case the default value is false anyway.
		#if !flash9
		destroyed = false;
		#end
	}
	/**
	 * Calls the listener stored inside. Classes that extend this one should override this method.
	 */
	public function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		return propagationStatus;
	}
	/**
	 * Determines whether the passed bond equals this one. Returns true if they are equal; false otherwise. Classes that extend
	 * this one should override this method.
	 */
	#if as3 public #else private #end function determineEquals(value:LinkedBond<Datatype>):Bool {
		return false;
	}
	public override function destroy():Void {
		// The actual logic for this implementation of the destroy method is in the unlink method. This way, the sentinel can call
		// unlink directly, which is inlined.
		unlink();
	}
	// It seems that in AS3 it is not allowed to call private (protected) methods in ways that are allowed in haXe. Therefore,
	// this method is public in AS3.
	#if as3 public #else private #end inline function unlink():Void {
		// If this bond has already been destroyed, don't destroy it again.
		if (false == destroyed) {
			previous.next = next;
			next.previous = previous;
			destroyed = true;
		}
	}
}
/**
 * A sentinel "bond". The sentinel is not a real bond, as it does not bind the signaler to a listener. Rather it is the value
 * before the first bond and after the last bond of this signaler. It contains logic that helps the signaler working with the
 * linked list structure.
 */
private class SentinelBond<Datatype> extends LinkedBond<Datatype> {
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
	public inline function add(value:LinkedBond<Datatype>):LinkedBond<Datatype> {
		value.next = this;
		value.previous = previous;
		return previous = previous.next = value;
	}
	public override function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		var node:LinkedBond<Datatype> = next;
		while (node != this && PropagationStatus.IMMEDIATELY_STOPPED != propagationStatus) {
			propagationStatus = node.callListener(data, currentTarget, origin, propagationStatus);
			node = node.next;
		}
		return propagationStatus;
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
	public inline function remove(value:LinkedBond<Datatype>):Void {
		var node:LinkedBond<Datatype> = next;
		while (node != this) {
			if (node.determineEquals(value)) {
				node.unlink();
				break;
			}
			node = node.next;
		}
	}
	
	public inline function removeAll():Void {
		while (next != null && next != this) {
           next.destroy();
		}
	}
	
	#if debug
	public function getBonds () :Iterable<Bond> {
		if (!isConnected) 
			return [];
		var bonds = new Array<Bond>();
		var b = next;
		while (b != null && b != this) {
			bonds.push(b);
			b = b.next;
		}
		return bonds;
	}
	#end
}
/**
 * A regular bond is a bond that is created in result of a call to the bind method.
 */
private class RegularBond<Datatype> extends LinkedBond<Datatype> {
	private var listener:Datatype -> Void;
	#if js
	private var context :Dynamic;
	
	public function new(listener:Datatype -> Void, ?context :Dynamic):Void {
		super();
		this.context = context;
		this.listener = listener;
	}
	#else
	public function new(listener:Datatype -> Void):Void {
		super();
		this.listener = listener;
	}
	#end
	public override function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		if (false == halted) {
		    #if js
		    if (context != null) {
		        untyped listener.call(context, data);
		    } else {
		        listener(data);
		    }
		    #else
            listener(data);
		    #end
		}
		return propagationStatus;
	}
	#if as3 public #else private #end override function determineEquals(value:LinkedBond<Datatype>):Bool {
		// Since the first check makes sure the type of the passed value is equal to this one, it is safe to assume that the passed
		// value has a listener property in the second. However, AS3 compilers don't like this. We have to cast it explicitly for
		// them.
		#if as3
		return Std.is(value, RegularBond) && Reflect.compareMethods(cast(value, RegularBond<Dynamic>).listener, listener);
		#else
		return Std.is(value, RegularBond) && Reflect.compareMethods((untyped value).listener, listener);
		#end
	}
	
	#if js
	public override function destroy():Void {
	    super.destroy();
	    context = null;
	}
	#end
}
/**
 * A niladic bond is a bond that is created in result of a call to the bindVoid method.
 */
private class NiladicBond<Datatype> extends LinkedBond<Datatype> {
	private var listener:Void -> Void;
	
	#if js
	private var context :Dynamic;
	
	/**
	 * Creates a new niladic bond.
	 */
	public function new(listener:Void -> Void, ?context :Dynamic):Void {
		super();
		this.context = context;
		this.listener = listener;
	}
	#else
	public function new(listener:Void -> Void):Void {
		super();
		this.listener = listener;
	}
	#end
	
	public override function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		if (false == halted) {
			#if js
		    if (context != null) {
		        untyped listener.call(context);
		    } else {
		        listener();
		    }
		    #else
            listener();
		    #end
		}
		return propagationStatus;
	}
	#if as3 public #else private #end override function determineEquals(value:LinkedBond<Datatype>):Bool {
		// Since the first check makes sure the type of the passed value is equal to this one, it is safe to assume that the passed
		// value has a listener property in the second. However, AS3 compilers don't like this. We have to cast it explicitly for
		// them.
		#if as3
		return Std.is(value, NiladicBond) && Reflect.compareMethods(cast(value, NiladicBond<Dynamic>).listener, listener);
		#else
		return Std.is(value, NiladicBond) && Reflect.compareMethods((untyped value).listener, listener);
		#end
	}
}
/**
 * An advanced bond is a bond that is created in result of a call to the bindAdvanced method.
 */
private class AdvancedBond<Datatype> extends LinkedBond<Datatype> {
	private var listener:Signal<Datatype> -> Void;
	/**
	 * Creates a new advanced bond.
	 */
	public function new(listener:Signal<Datatype> -> Void):Void {
		super();
		this.listener = listener;
	}
	public override function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		if (halted == false) {
			var signal:Signal<Datatype> = new Signal<Datatype>(data, this, currentTarget, origin);
			listener(signal);
			if (signal.immediatePropagationStopped) {
				return PropagationStatus.IMMEDIATELY_STOPPED;
			} else if (signal.propagationStopped) {
				return PropagationStatus.STOPPED;
			}
		}
		return propagationStatus;
	}
	#if as3 public #else private #end override function determineEquals(value:LinkedBond<Datatype>):Bool {
		// Since the first check makes sure the type of the passed bond is equal to this one, it is safe to assume that the passed
		// bond has a listener property in the second. However, AS3 compilers don't like this. We have to cast it explicitly for
		// them.
		#if as3
		return Std.is(value, AdvancedBond) && Reflect.compareMethods(cast(value, AdvancedBond<Dynamic>).listener, listener);
		#else
		return Std.is(value, AdvancedBond) && Reflect.compareMethods((untyped value).listener, listener);
		#end
	}
}

/**
 * An advanced bond that destroys itself when the listener is called.
 */
private class CallOnceBond<Datatype> extends RegularBond<Datatype> {
	/**
	 * Creates a new CallOnceBond.
	 */
	 
	#if js
	public function new(listener:Datatype -> Void, ?context :Dynamic):Void {
		super(listener, context);
	}
	#else
	public function new(listener:Datatype -> Void):Void {
		super(listener);
	}
	#end
	public override function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		if (halted == false) {
			var status = super.callListener(data, currentTarget, origin, propagationStatus);
			trace("listener called, destroying bond");
			destroy();
			return status;
		}
		return propagationStatus;
	}
}

/**
 * An advanced bond that destroys itself when the listener is called.
 */
private class CallOnceNiladicBond<Datatype> extends NiladicBond<Datatype> {
	/**
	 * Creates a new CallOnceBond.
	 */
	 
	#if js
	public function new(listener:Void -> Void, ?context :Dynamic):Void {
		super(listener, context);
	}
	#else
	public function new(listener:Void -> Void):Void {
		super(listener);
	}
	#end
	public override function callListener(data:Datatype, currentTarget:Subject, origin:Subject, propagationStatus:Int):Int {
		if (halted == false) {
			var status = super.callListener(data, currentTarget, origin, propagationStatus);
			destroy();
			return status;
		}
		return propagationStatus;
	}
}
class PropagationStatus {
	public static inline var IMMEDIATELY_STOPPED:Int = 1;
	public static inline var STOPPED:Int = 2;
	public static inline var UNDISTURBED:Int = 3;
}
