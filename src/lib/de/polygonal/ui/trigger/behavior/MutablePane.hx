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
import de.polygonal.core.event.Observable;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.ui.alignment.Axis;
import de.polygonal.ui.alignment.Bin;
import de.polygonal.ui.trigger.pointer.MousePointer;
import de.polygonal.ui.trigger.pointer.Pointer;
import de.polygonal.ui.trigger.surface.BoxSurface;
import de.polygonal.ui.trigger.surface.LineSurface;
import de.polygonal.ui.trigger.surface.Surface;
import de.polygonal.ui.trigger.surface.SurfaceConstraint;
import de.polygonal.ui.trigger.Trigger;
import de.polygonal.ui.trigger.TriggerEvent;

using de.polygonal.core.math.Mathematics;

/**
 * <pre>
 * v2   e2   v3
 *   +------+ 
 * e1| face |e3
 *   +------+
 * v1   e0   v0
 * </pre>
 */  
class MutablePane extends Observable, implements IObserver
{
	inline public static var FEATURE_VERT_0 = 0;
	inline public static var FEATURE_VERT_1 = 1;
	inline public static var FEATURE_VERT_2 = 2;
	inline public static var FEATURE_VERT_3 = 3;
	inline public static var FEATURE_EDGE_0 = 4;
	inline public static var FEATURE_EDGE_1 = 5;
	inline public static var FEATURE_EDGE_2 = 6;
	inline public static var FEATURE_EDGE_3 = 7;
	inline public static var FEATURE_FACE   = 8;
	
	public var userData:Dynamic;
	
	public var trigger(default, null):Trigger;
	
	//todo modify bin has to sync triggers
	public var bin(default, null):Bin;
	
	var _triggerList:Array<Trigger>;
	var _vertExtent:Float;
	var _tmp:Vec2;
	
	public var onMove:Void->Void;
	public var onSize:Void->Void;
	
	public function new(x:Float, y:Float, w:Float, h:Float) 
	{
		super();
		
		bin = new Bin(x, y, w, h);
		bin.minInnerSize = new Vec2(50, 50);
		bin.maxInnerSize = new Vec2(300, 200);
		
		_tmp = new Vec2();
		_vertExtent = 8;
		
		bin.gap = _vertExtent;
		
		var pointer = MousePointer.instance();
		
		_triggerList = new Array();
		
		//face
		trigger = new Trigger(pointer, new BoxSurface(x, y, w, h));
		trigger.userData = FEATURE_FACE;
		trigger.dragEnabled = true;
		trigger.attach(this, TriggerEvent.DRAG);
		_triggerList[FEATURE_FACE] = trigger;
		
		//vertices
		for (vert in 0...4)
		{
			var t = _createVertTrigger(vert, pointer, _vertExtent);
			_triggerList[vert] = t;
			trigger.appendChild(t);
		}
		
		//edges
		for (edge in 4...8)
		{
			var t = _createEdgeTrigger(edge, pointer, _vertExtent);
			_triggerList[edge] = t;
			trigger.appendChild(t);
		}
	}
	
	override public function free():Void 
	{
		bin.free();
		for (trigger in _triggerList) trigger.free();
		super.free();
	}
	
	inline public function getTrigger(id:Int)
	{
		return _triggerList[id];
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		var trigger:Trigger = cast userData;
		
		if (type == TriggerEvent.DRAG)
		{
			var x = trigger.surface.getX();
			var y = trigger.surface.getY();
			
			switch (trigger)
			{
				case _triggerList[FEATURE_FACE]:
					bin.centerX = x;
					bin.centerY = y;
					syncEdge13();
					_syncEdge02();
					_syncVert0();
					_syncVert1();
					_syncVert2();
					_syncVert3();
				
				case _triggerList[FEATURE_VERT_0]:
					bin.stretchMaxX(x);
					bin.stretchMaxY(y);
					_syncVert1();
					_syncVert3();
					syncEdge13();
					_syncEdge02();
					_syncFace();
				
				case _triggerList[FEATURE_VERT_1]:
					bin.stretchMinX(x);
					bin.stretchMaxY(y);
					_syncVert0();
					_syncVert2();
					syncEdge13();
					_syncEdge02();
					_syncFace();
				
				case _triggerList[FEATURE_VERT_2]:
					bin.stretchMinX(x);
					bin.stretchMinY(y);
					_syncVert1();
					_syncVert3();
					syncEdge13();
					_syncEdge02();
					_syncFace();
				
				case _triggerList[FEATURE_VERT_3]:
					bin.stretchMaxX(x);
					bin.stretchMinY(y);
					_syncVert0();
					_syncVert2();
					syncEdge13();
					_syncEdge02();
					_syncFace();
				
				case _triggerList[FEATURE_EDGE_0]:
					bin.stretchMaxY(y);
					_syncVert0();
					_syncVert1();
					_syncEdge02();
					_syncFace();
				
				case _triggerList[FEATURE_EDGE_1]:
					bin.stretchMinX(x);
					_syncVert1();
					_syncVert2();
					syncEdge13();
					_syncFace();
				
				case _triggerList[FEATURE_EDGE_2]:
					bin.stretchMinY(y);
					_syncVert2();
					_syncVert3();
					_syncEdge02();
					_syncFace();
				
				case _triggerList[FEATURE_EDGE_3]:
					bin.stretchMaxX(x);
					_syncVert0();
					_syncVert3();
					syncEdge13();
					_syncFace();
			}
			
			if (onMove != null) onMove();
			if (onSize != null) onSize();
		}
	}
	
	function _createVertTrigger(vert:Int, pointer:Pointer, extent:Float):Trigger
	{
		var cx = .0;
		var cy = .0;
		
		switch (vert)
		{
			case FEATURE_VERT_2:
				cx = _minX;
				cy = _minY;
			
			case FEATURE_VERT_1:
				cx = _minX;
				cy = _maxY;
			
			case FEATURE_VERT_3:
				cx = _maxX;
				cy = _minY;
			
			case FEATURE_VERT_0:
				cx = _maxX;
				cy = _maxY;
		}
		
		var bound = new AABB2(0, 0, extent * 2, extent * 2);
		bound.centerX = cx;
		bound.centerY = cy;
		
		var s = new BoxSurface(bound.minX, bound.minY, bound.intervalX, bound.intervalY);
		s.registerConstraint(new SizeLimitConstraint(bin, vert));
		
		var t = new Trigger(pointer, s);
		t.bubbleEnabled = true;
		t.dragEnabled = true;
		t.userData = vert;
		return t;
	}
	
	function _createEdgeTrigger(edge:Int, pointer:Pointer, threshold:Float):Trigger
	{
		var pad = threshold * 2;
		var ax = .0;
		var ay = .0;
		var bx = .0;
		var by = .0;
		
		switch (edge)
		{
			case FEATURE_EDGE_1:
				ax = _minX;
				ay = _minY + pad;
				
				bx = _minX;
				by = _maxY - pad;
			
			case FEATURE_EDGE_3:
				ax = _maxX;
				ay = _minY + pad;
				
				bx = _maxX;
				by = _maxY - pad;
			
			case FEATURE_EDGE_2:
				ax = _minX + pad;
				ay = _minY;
				
				bx = _maxX - pad;
				by = _minY;
			
			case FEATURE_EDGE_0:
				ax = _minX + pad;
				ay = _maxY;
				
				bx = _maxX - pad;
				by = _maxY;
		}
		
		var s = new LineSurface(ax, ay, bx, by, threshold);
		s.registerConstraint(new AxisConstraint(bin, edge.isEven() ? Axis.y : Axis.x));
		s.registerConstraint(new SizeLimitConstraint(bin, edge));
		
		var t = new Trigger(pointer, s);
		t.bubbleEnabled = true;
		t.dragEnabled = true;
		t.userData = edge;
		return t;
	}
	
	inline function _syncVert0()
	{
		var surface = _triggerList[FEATURE_VERT_0].surface;
		surface.setX(_maxX);
		surface.setY(_maxY);
	}
	
	inline function _syncVert1()
	{
		var surface = _triggerList[FEATURE_VERT_1].surface;
		surface.setX(_minX);
		surface.setY(_maxY);
	}
	
	inline function _syncVert2()
	{
		var surface = _triggerList[FEATURE_VERT_2].surface;
		surface.setX(_minX);
		surface.setY(_minY);
	}
	
	inline function _syncVert3()
	{
		var surface = _triggerList[FEATURE_VERT_3].surface;
		surface.setX(_maxX);
		surface.setY(_minY);
	}
	
	inline function syncEdge13()
	{
		var e = _vertExtent * 2;
		
		var s:LineSurface = cast _triggerList[FEATURE_EDGE_2].surface;
		s.segment.set4(_minX + e, _minY, _maxX - e, _minY);
		s.invalidate();
		
		s = cast _triggerList[FEATURE_EDGE_0].surface;
		s.segment.set4(_minX + e, _maxY, _maxX - e, _maxY);
		s.invalidate();
	}
	
	inline function _syncEdge02()
	{
		var e = _vertExtent * 2;
		
		var s:LineSurface = cast _triggerList[FEATURE_EDGE_1].surface;
		s.segment.set4(_minX, _minY + e, _minX, _maxY - e);
		s.invalidate();
		
		s = cast _triggerList[FEATURE_EDGE_3].surface;
		s.segment.set4(_maxX, _minY + e, _maxX, _maxY - e);
		s.invalidate();
	}
	
	inline function _syncFace()
	{
		var s:BoxSurface = untyped _triggerList[FEATURE_FACE].surface;
		var e = _vertExtent;
		s.getBound().set4(_minX + e, _minY + e, _maxX - e, _maxY - e);
		s.invalidate();
	}
	
	var _minX(__minX, never):Float; inline function __minX():Float { return bin.outerBound.minX; }
	var _minY(__minY, never):Float; inline function __minY():Float { return bin.outerBound.minY; }
	var _maxX(__maxX, never):Float; inline function __maxX():Float { return bin.outerBound.maxX; }
	var _maxY(__maxY, never):Float; inline function __maxY():Float { return bin.outerBound.maxY; }
}

private class AxisConstraint implements SurfaceConstraint
{
	var _bin:Bin;
	var _axis:Axis;
	
	public function new(c:Bin, axis:Axis)
	{
		_bin = c;
		_axis = axis;
	}
	
	public function free():Void
	{
		_bin = null;
		_axis = null;
	}
	
	public function evaluate(x:Vec2):Void
	{
		switch (_axis)
		{
			case Axis.x:
				x.x = x.x;
				x.y = _bin.centerY;
				
			case Axis.y:
				x.x = _bin.centerX;
				x.y = x.y;
		}
	}
}

private class SizeLimitConstraint implements SurfaceConstraint
{
	var _bin:Bin;
	var _feature:Int;
	
	public function new(c:Bin, feature:Int)
	{
		_bin = c;
		_feature = feature;
	}
	
	public function free():Void
	{
		_bin = null;
	}
	
	public function evaluate(x:Vec2):Void
	{
		switch (_feature)
		{
			case MutablePane.FEATURE_VERT_0:
				x.x = maxX(x.x);
				x.y = maxY(x.y);
			
			case MutablePane.FEATURE_VERT_1:
				x.x = minX(x.x);
				x.y = maxY(x.y);
			
			case MutablePane.FEATURE_VERT_2:
				x.x = minX(x.x);
				x.y = minY(x.y);
			
			case MutablePane.FEATURE_VERT_3:
				x.x = maxX(x.x);
				x.y = minY(x.y);
			
			case MutablePane.FEATURE_EDGE_0:
				x.y = maxY(x.y);
			
			case MutablePane.FEATURE_EDGE_1:
				x.x = minX(x.x);
			
			case MutablePane.FEATURE_EDGE_2:
				x.y = minY(x.y);
			
			case MutablePane.FEATURE_EDGE_3:
				x.x = maxX(x.x);
		}
	}
	
	inline function minX(x:Float):Float
	{
		return x.fclamp(_bin.maxX - _bin.maxWidth, _bin.maxX - _bin.minWidth);
	}
	
	inline function minY(y:Float):Float
	{
		return y.fclamp(_bin.maxY - _bin.maxHeight, _bin.maxY - _bin.minHeight);
	}
	
	inline function maxX(x:Float):Float
	{
		return x.fclamp(_bin.minX + _bin.minWidth, _bin.minX + _bin.maxWidth);
	}
	
	inline function maxY(y:Float):Float
	{
		return y.fclamp(_bin.minY + _bin.minHeight, _bin.minY + _bin.maxHeight);
	}
}