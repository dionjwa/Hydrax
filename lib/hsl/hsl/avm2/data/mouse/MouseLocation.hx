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
package hsl.avm2.data.mouse;
import flash.display.DisplayObject;
import haxe.exception.ArgumentNullException;
import hsl.haxe.data.mathematics.Point;

/**
 * The location, the x and the y coordinate, of the mouse, relative to a scope.
 */
class MouseLocation extends Point {
	/**
	 * The global location of the mouse. The global location is relative to the stage, as opposed to an other scope.
	 */
	public var globalLocation(getGlobalLocation, null):Point;
	/**
	 * The scope to which this mouse location is relative.
	 */
	public var scope(default, null):DisplayObject;
	/**
	 * Creates a new local mouse location.
	 */
	public function new(x:Float, y:Float, scope:DisplayObject):Void {
		super(x, y);
		// If scope is null, throw an exception. Having null for a scope might produce null object reference errors later on: when
		// the globalLocation property is called.
		if (null == scope) {
			throw new ArgumentNullException("scope", 1);
		}
		this.scope = scope;
	}
	private inline function getGlobalLocation():Point {
		var globalPoint:flash.geom.Point = scope.localToGlobal(new flash.geom.Point(x, y));
		return new Point(globalPoint.x, globalPoint.y);
	}
	#if debug
	private override function toString():String {
		return "[MouseLocation x=" + x + " y=" + y + " scope=" + scope + "]";
	}
	#end
	public function translateToScope(targetScope:DisplayObject):MouseLocation {
		// If the passed target scope is equal to the scope of this location, return this object itself. No clone is needed as this
		// object is immutable. Note that if this class is made mutable by extending it, this behavior should be replaced.
		return
			if (targetScope == scope) {
				this;
			} else {
				var point:flash.geom.Point = targetScope.globalToLocal(scope.localToGlobal(new flash.geom.Point(x, y)));
				new MouseLocation(point.x, point.y, targetScope);
			}
	}
}