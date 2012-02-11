/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.ui.trigger.surface;

import de.polygonal.core.math.Vec2;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DA;
import de.polygonal.ds.HashTable;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.ui.trigger.pointer.Pointer;

using de.polygonal.ds.BitFlags;

class AbstractSurface implements Surface
{
	inline static var SYNC_CENTER  = Bits.BIT_01;
	inline static var SYNC_SURFACE = Bits.BIT_02;
	
	/** An axis-aligned bounding box bounding the surface. */
	public function getBound():AABB2
	{
		return _bound;
	}
	
	/** If true, constraints are applied. Default is true. */
	public var doConstraints:Bool;
	
	public var type(default, null):Int;
	
	/** The surface center of mass, x coordinate. */
	inline public function getX():Float 
	{
		return _center.x;
	}
	
	inline public function setX(x:Float):Void 
	{
		setf(SYNC_CENTER);
		_center.x = x;
	}
	/** The shape's center of mass, y coordinate. */
	inline public function getY():Float 
	{
		return _center.y;
	}
	
	inline public function setY(y:Float):Void 
	{
		setf(SYNC_CENTER);
		_center.y = y;
	}
	
	public var userData:Dynamic;
	
	var _bound:AABB2;
	var _center:Vec2;
	var _constraintList:DA<SurfaceConstraint>;
	var _bits:Int;
	
	var _constraintTable:Hash<SurfaceConstraint>;
	
	function new()
	{
		_bound = new AABB2();
		_center = new Vec2();
		
		doConstraints = true;
		
		invalidate();
	}
	
	public function free():Void
	{
		if (_constraintList != null)
			_constraintList.free();
		_center          = null;
		_constraintTable = null;
		_constraintList  = null;
	}
	
	public function isTouching(pointer:Pointer, sweep:Bool):Bool
	{
		return false;
	}
	
	public function getConstraint(name:String):SurfaceConstraint
	{
		if (_constraintTable == null) return null;
		return _constraintTable.get(name);
	}
	
	public function registerConstraint(x:SurfaceConstraint, ?name:String):Void
	{
		if (_constraintTable == null)
		{
			_constraintTable = new Hash();
			_constraintList = new DA();
		}
		
		if (name != null)
		{
			if (_constraintTable.exists(name)) return;
			_constraintTable.set(name, x);
		}
		
		_constraintList.pushBack(x);
		
		//force instant update
		invalidate();
		update();
	}
	
	public function unregisterConstraint(name:String):Void
	{
		if (_constraintTable == null) return;
		if (_constraintTable.exists(name))
		{
			var c = _constraintTable.get(name);
			_constraintTable.remove(name);
			_constraintList.remove(c);
			
			//force instant update
			invalidate();
			update();
		}
	}
	
	public function invalidate():Void
	{
		setf(SYNC_CENTER | SYNC_SURFACE);
	}
	
	public function update()
	{
		if (hasf(SYNC_CENTER | SYNC_SURFACE))
		{
			//if shape changed sync center with shape
			if (hasf(SYNC_SURFACE)) _hookSyncCenter();
			
			//if center changed sync shape with center
			if (hasf(SYNC_CENTER))
			{
				//evaluate constraints
				if (doConstraints && _constraintList != null)
				{		
					for (c in _constraintList) c.evaluate(_center);
				}
				
				_hookSyncSurface();
			}
			
			//always update shape bound
			_hookSyncBound();
			
			clrf(SYNC_CENTER | SYNC_SURFACE);
		}
	}
	
	/* surface changed => update center */
	function _hookSyncCenter()
	{
		throw "override for implementation";
	}
	
	/* center changed => update surface */
	function _hookSyncSurface()
	{
		throw "override for implementation";
	}
	
	/* update surface bound */
	function _hookSyncBound()
	{
		throw "override for implementation";
		return null;
	}
}