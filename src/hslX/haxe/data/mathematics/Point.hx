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
package hsl.haxe.data.mathematics;

/**
 * Points represent a location in a two-dimensional coordinate system.
 */
class Point {
	/**
	 * The x coordinate of the point.
	 */
	public var x(default, null):Float;
	/**
	 * The y coordinate of the point.
	 */
	public var y(default, null):Float;
	/**
	 * Creates a new point.
	 */
	public function new(x:Float, y:Float):Void {
		this.x = x;
		this.y = y;
	}
	/**
	 * Determines whether the passed point equals this one. Returns true if they are equal; false otherwise.
	 */
	public inline function determineEquals(value:PointValue):Bool {
		return x == value.x && y == value.y;
	}
	/**
	 * Given a scope for this point, translate it such that is relative to the stage.
	 */
	public inline function getGlobalLocation(currentScope:NativeScope):Point {
		#if flash9
		var point:flash.geom.Point = currentScope.localToGlobal(new flash.geom.Point(x, y));
		return new Point(point.x, point.y);
		#elseif js
		var globalX:Float = x + currentScope.offsetLeft;
		var globalY:Float = y + currentScope.offsetTop;
		while (currentScope.offsetParent != null) {
			currentScope = currentScope.offsetParent;
			globalX += currentScope.offsetLeft + untyped(currentScope).clientLeft - currentScope.scrollLeft;
			globalY += currentScope.offsetTop  + untyped(currentScope).clientTop  - currentScope.scrollTop;
		}
		return new Point(globalX, globalY);
		#else
		return this;
		#end
	}
	/**
	 * Translate this absolute point such that it is relative to a given scope.
	 */
	public inline function getLocalLocation(targetScope:NativeScope):Point {
		#if flash9
		var point:flash.geom.Point = targetScope.globalToLocal(new flash.geom.Point(x, y));
		return new Point(point.x, point.y);
		#elseif js
		var localX:Float = x - targetScope.offsetLeft;
		var localY:Float = y - targetScope.offsetTop;
		while (targetScope.offsetParent != null) {
			targetScope = targetScope.offsetParent;
			localX -= targetScope.offsetLeft + untyped(targetScope).clientLeft - targetScope.scrollLeft;
			localY -= targetScope.offsetTop  + untyped(targetScope).clientTop  - targetScope.scrollTop;
		}
		return new Point(localX, localY);
		#else
		return this;
		#end
		
	}
	/**
	 * Given a scope for this point, translate it such that it is relative to a different scope.
	 */
	public function translateToScope(currentScope:NativeScope, targetScope:NativeScope):Point {
		return
			if (targetScope == currentScope) {
				this;
			} else {
				getGlobalLocation(currentScope).getLocalLocation(targetScope);
			}
	}
	#if debug
	private function toString():String {
		return "[Point x=" + x + " y=" + y + "]";
	}
	#end
}
typedef PointValue = {
	public var x(default, null):Float;
	public var y(default, null):Float;
}
