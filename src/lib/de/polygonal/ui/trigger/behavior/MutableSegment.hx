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
package de.polygonal.ui.trigger.behavior;

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.geom.primitive.Segment2;
import de.polygonal.ui.trigger.pointer.MousePointer;
import de.polygonal.ui.trigger.pointer.Pointer;
import de.polygonal.ui.trigger.surface.CircleSurface;
import de.polygonal.ui.trigger.surface.constraint.DistanceConstraint;
import de.polygonal.ui.trigger.surface.LineSurface;
import de.polygonal.ui.trigger.Trigger;
import de.polygonal.ui.trigger.TriggerEvent;

class MutableSegment implements IObserver
{
	var _trigLine:Trigger;
	var _surfLine:LineSurface;
	
	var _trigVert1:Trigger;
	var _surfVert1:CircleSurface;
	var _surfVert1Const:DistanceConstraint;
	
	var _trigVert2:Trigger;
	var _surfVert2:CircleSurface;
	var _surfVert2Const:DistanceConstraint;
	
	var _minLength:Float;
	var _maxLength:Float;
	
	public var dragLineEnabled(_dragLineEnabledGetter, _dragLineEnabledSetter):Bool;
	inline function _dragLineEnabledGetter():Bool { return _trigLine.dragEnabled; }
	inline function _dragLineEnabledSetter(x:Bool):Bool
	{
		_trigLine.dragEnabled = x;
		return x;
	}
	
	public var vertex1DragEnabled(_vertex1DragEnabledGetter, _vertex1DragEnabledSetter):Bool;
	function _vertex1DragEnabledGetter():Bool { return _trigVert1.dragEnabled; }
	function _vertex1DragEnabledSetter(x:Bool):Bool
	{
		_trigVert1.dragEnabled = x;
		return x;
	}
	
	public var vertex2DragEnabled(_vertex2DragEnabledGetter, _vertex2DragEnabledSetter):Bool;
	function _vertex2DragEnabledGetter():Bool { return _trigVert2.dragEnabled; }
	function _vertex2DragEnabledSetter(x:Bool):Bool
	{
		_trigVert2.dragEnabled = x;
		return x;
	}
	
	public var minLength(_minLengthGetter, _minLengthSetter):Float;
	function _minLengthGetter():Float { return _surfVert1Const.minDistance; }
	function _minLengthSetter(x:Float):Float
	{
		if (_surfVert1Const == null)
		{
			//create & apply constraints
			var segment = getSegment();
			_surfVert1Const = new DistanceConstraint(segment.b, x, _maxLength);
			_surfVert2Const = new DistanceConstraint(segment.a, x, _maxLength);
			_surfVert1.registerConstraint(_surfVert1Const, "vert1");
			_surfVert2.registerConstraint(_surfVert2Const, "vert2");
		}
		else
		{
			//update & apply constraints
			_surfVert1Const.minDistance = x;
			_surfVert2Const.minDistance = x;
			
			//enforce instant update
			_surfVert1.invalidate();
			_surfVert2.invalidate();
			_surfVert1.update();
			_surfVert2.update();
		}
		
		//match segment to endpoints
		_surfLine.setSegment(
			_surfVert1.getX(), _surfVert1.getY(), 
			_surfVert2.getX(), _surfVert2.getY());
		
		return x;
	}
	
	public var maxLength(_maxLengthGetter, _maxLengthSetter):Float;
	function _maxLengthGetter():Float { return _surfVert1Const.maxDistance; }
	function _maxLengthSetter(x:Float):Float
	{
		if (_surfVert1Const == null)
		{
			//create & apply constraints
			var segment = getSegment();
			_surfVert1Const = new DistanceConstraint(segment.b, _minLength, x);
			_surfVert2Const = new DistanceConstraint(segment.a, _minLength, x);
			_surfVert1.registerConstraint(_surfVert1Const);
			_surfVert2.registerConstraint(_surfVert2Const);
		}
		else
		{
			//update constraints
			_surfVert1Const.maxDistance = x;
			_surfVert2Const.maxDistance = x;
			
			//apply constraints
			_surfVert1.invalidate();
			_surfVert2.invalidate();
			_surfVert1.update();
			_surfVert2.update();
		}
		
		//match segment to endpoints
		_surfLine.setSegment(
			_surfVert1.getX(), _surfVert1.getY(), 
			_surfVert2.getX(), _surfVert2.getY());
		
		return x;
	}
	
	public function getSegment():Segment2
	{
		return _surfLine.segment;
	}
	
	public function getTrigger():Trigger
	{
		return _trigLine;
	}
	
	public function new(ax:Float, ay:Float, bx:Float, by:Float, threshold = 10.0, ?pointer:Pointer, infinite = false)
	{
		if (pointer == null) pointer = MousePointer.instance();
		
		_surfLine  = new LineSurface(ax, ay, bx, by, threshold, infinite);
		_surfVert1 = new CircleSurface(ax, ay, threshold);
		_surfVert2 = new CircleSurface(bx, by, threshold);
		_trigLine  = new Trigger(pointer, _surfLine);
		_trigVert1 = new Trigger(pointer, _surfVert1);
		_trigVert2 = new Trigger(pointer, _surfVert2);
		
		_trigLine.userData  = "line";
		_trigVert1.bubbleEnabled = true;
		_trigVert1.userData = "vertex1";
		_trigVert2.bubbleEnabled = true;
		_trigVert2.userData = "vertex2";
		_trigLine.attach(this);
		_trigLine.appendChild(_trigVert1);
		_trigLine.appendChild(_trigVert2);
		
		_minLength = 0;
		_maxLength = Mathematics.POSITIVE_INFINITY;
		
		vertex1DragEnabled = true;
		vertex2DragEnabled = true;
		dragLineEnabled    = true;
	}
	
	public function free():Void
	{
		_trigLine.free();
		_surfLine.free();
		
		_trigVert1.free();
		_trigVert2.free();
		_trigVert1.free();
		_trigVert2.free();
		
		_trigLine       = null;
		_trigVert1      = null;
		_trigVert2      = null;
		_surfLine       = null;
		_surfVert1      = null;
		_surfVert2      = null;
		_surfVert1Const = null;
		_surfVert2Const = null;
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		if (type == TriggerEvent.DRAG)
		{
			//rebuild
			var segment = getSegment();
			
			switch (cast(userData, Trigger))
			{
				case _trigLine:
					var c1 = _surfVert1.circle.c;
					c1.x = segment.a.x;
					c1.y = segment.a.y;
					
					var c2 = _surfVert2.circle.c;
					c2.x = segment.b.x;
					c2.y = segment.b.y;
					_surfVert1.invalidate();
					_surfVert2.invalidate();
				
				case _trigVert1:
					segment.a.x = _surfVert1.getX();
					segment.a.y = _surfVert1.getY();
					_surfLine.invalidate();
				
				case _trigVert2:
					segment.b.x = _surfVert2.getX();
					segment.b.y = _surfVert2.getY();
					_surfLine.invalidate();
			}
		}
	}
}