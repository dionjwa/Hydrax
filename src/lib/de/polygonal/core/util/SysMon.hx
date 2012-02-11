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
package de.polygonal.core.util;

#if !flash10
"SysMon is only available for flash10+"
#end

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mean;
import de.polygonal.core.time.Timebase;
import de.polygonal.core.time.TimebaseEvent;
import de.polygonal.core.time.Timeline;
import de.polygonal.core.time.TimelineEvent;
import de.polygonal.ds.ArrayUtil;
import de.polygonal.ds.mem.MemoryManager;
import de.polygonal.gl.DisplayListUtils;
import de.polygonal.gl.text.fonts.proggy.ProggyOptiS;
import de.polygonal.gl.text.MonospaceBitmapFont;
import de.polygonal.gl.Window;
import de.polygonal.core.math.Vec2;
import de.polygonal.ui.UI;
import de.polygonal.ui.UIEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Shape;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.Lib;
import flash.system.Capabilities;
import flash.system.System;

using de.polygonal.core.math.Mathematics;
using de.polygonal.core.fmt.Sprintf;

class SysMon implements IObserver
{
	inline static var REDRAW_FPS_MODULO   = 4;
	inline static var REDRAW_FPS_INTERVAL = .5;
	inline static var REDRAW_MEM_INTERVAL = 1.;
	inline static var GRAPH_WIDTH         = #if alchemy 39 * 6 #else 180 #end;
	inline static var GRAPH_HEIGHT        = 32;
	inline static var FONT_HEIGHT         = 10;
	inline static var MM_HEIGHT           = 10;
	inline static var INIT_MAX_MEM_SIZE   = 32;
	
	static var _instance:SysMon;
	public static function show():Void
	{
		if (_instance == null)
		{
			_instance = new SysMon();
			Window.stage.addChild(_instance._bitmap);
		}
	}
	
	public static function hide():Void
	{
		if (_instance != null)
		{
			_instance._free();
			_instance = null;
		}
	}
	
	public static function toggle():Void
	{
		if (_instance != null)
			hide();
		else
			show();
	}
	
	var _bitmap:Bitmap;
	var _memoryManagerShape:Shape;
	var _graph1:AliasedGraph;
	var _graph2:AliasedGraph;
	var _graph3:AliasedGraph;
	var _font:MonospaceBitmapFont;
	var _playerVersion:String;
	var _isDebugPlayer:String;
	var _formatArgs:Array<Dynamic>;
	var _matrix:Matrix;
	var _pointGraph:Point;
	var _pointText:Vec2;
	var _useGradient:Bool;
	var _tooltipEnabled:Bool;
	
	var _meanFps:Mean;
	var _meanMem:Mean;
	var _past:Int;
	var _tick:Int;
	
	var _blipFrameRateHistory:Int;
	var _drawFrameRateHistory:Bool;
	var _blipMemoryHistory:Int;
	var _drawMemoryHistory:Bool;
	
	var _curMem:Int;
	var _maxMem:Int;
	var _memHistory:Que;
	var _freeMem:Float;
	
	var _clampCounter:Int;
	
	function new()
	{
		_bitmap = new Bitmap(new BitmapData(GRAPH_WIDTH, FONT_HEIGHT + #if alchemy MM_HEIGHT + #end GRAPH_HEIGHT + 1, true, 0x00ffffff)); 
		_bitmap.name = "SysMon";
		_bitmap.addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		switch (type)
		{
			case TimelineEvent.BLIP:
				if (userData == _blipFrameRateHistory)
					_drawFrameRateHistory = true;
				if (userData == _blipMemoryHistory)
					_drawMemoryHistory = true;
				
			case TimebaseEvent.RENDER:
				_tick++;
				if (_tick < _bitmap.stage.frameRate) //warm start
				{
					_past = Lib.getTimer();
					return;
				}
				
				var now = Lib.getTimer();
				var dt = now - _past;
				_meanFps.add(dt);
				_past = now;
				_curMem = System.totalMemory >> 20;
				_meanMem.add(_curMem);
				
				#if flash10_1
				_freeMem = System.freeMemory / 0x100000;
				#end
				
				if ((_tick % REDRAW_FPS_MODULO == 0) || _drawFrameRateHistory || _drawMemoryHistory || _clampCounter > 0) _draw();
			
			case TimebaseEvent.CLAMP:
				_clampCounter = Std.int(1000 * Timebase.get.getTickRate());
				
			case UIEvent.MOUSE_DOWN:
				var index = _getTooltipIndex();
				if (index == 0) System.pause();
				if (index == 1)
				{
					try
					{
						new flash.net.LocalConnection().connect("foo");
						new flash.net.LocalConnection().connect("foo");
					}
					catch (unknown:Dynamic) {}
					System.gc();
				}
				if (index == 4) MemoryManager.defrag();
				if (index == 5) MemoryManager.pack();
				
				var x = UI.instance().mouse.x;
				var y = UI.instance().mouse.y;
				if (y > FONT_HEIGHT && y < FONT_HEIGHT + MM_HEIGHT)
				{
					if (x < GRAPH_WIDTH)
					{
						_useGradient = !_useGradient;
						untyped MemoryManager.instance()._changed = true; //force redraw hack
					}
				}
		}
	}
	
	function _draw():Void
	{
		var bmd = _bitmap.bitmapData;
		var a = _formatArgs;
		
		bmd.lock();
		
		//fps
		_font.x = _font.y = 0;
		_font.setColor(0xff000000, 0xffff00ff);
		a[0] = (1000 / _meanFps.val()).round().min(60);
		_font.drawText(bmd, "%02d".format(a));
		
		//vm memory
		_font.setColor(0xff000000, 0xff00ff00);
		a[0] = _curMem;
		a[1] = _meanMem.val().round().min(999);
		a[2] = _maxMem.min(999);
		
		#if flash10_1
		a[3] = Std.int(_freeMem);
		_font.drawText(bmd, " %03d/%03d/%03d:%03d".format(a));
		#else
		_font.drawText(bmd, " %03d/%03d:---".format(a));
		#end
		
		//memory manager
		_font.setColor(0xff000000, 0xff666666);
		#if alchemy
		if ((MemoryManager.bytesUsed() >> 10) > 999)
			a[0] = (MemoryManager.bytesUsed() >> 20).min(999);
		else
			a[0] = MemoryManager.bytesUsed() >> 10;
			
		if ((MemoryManager.bytesTotal() >> 10) > 999)
			a[1] = (MemoryManager.bytesTotal() >> 20).min(999);
		else
			a[1] = MemoryManager.bytesTotal() >> 10;
		a[2] = (MemoryManager.size()).min(9999);
		a[3] = (MemoryManager.BLOCK_SIZE_BYTES >> 10).min(999);
		_font.drawText(bmd, " %03d/%03d:%04d:%03d".format(a));
		#end
		
		//player version + debug flag
		_font.setColor(0xff000000, 0xffffffff);
		a[0] = _playerVersion;
		a[1] = _isDebugPlayer;
		_font.drawText(bmd, " v%-4s %s".format(a));
		
		//memory manager
		#if (alchemy && !swc)
		MemoryManager.draw(_memoryManagerShape.graphics, 0, 0, GRAPH_WIDTH, FONT_HEIGHT, 0x333333, _useGradient, 0xFFFF00);
		bmd.draw(_memoryManagerShape, _matrix);
		#end
		
		//short-term frame rate
		var fps = (1000 / _meanFps.val()).fmin(60);
		var alpha = fps / _bitmap.stage.frameRate;
		_graph1.add(alpha, 0xffff00ff);
		_graph1.commit();
		
		//long-term frame rate
		if (_drawFrameRateHistory)
		{
			_drawFrameRateHistory = false;
			var fps = (1000 / _meanFps.val()).fmin(60);
			var alpha = fps / _bitmap.stage.frameRate;
			_graph2.add(alpha, 0x40ff00ff);
			_graph2.commit();
		}
		
		//long-term memory
		if (_drawMemoryHistory)
		{
			_drawMemoryHistory = false;
			var refit = false;
			if (_curMem > _maxMem)
			{
				_maxMem <<= 1;
				refit = true;
			}
			else
			if (_curMem < (_maxMem >> 2) && _maxMem > 32)
			{
				_maxMem >>= 1;
				refit = true;
			}
			if (refit)
			{
				var x = _graph3.x;
				_graph3.clr();
				for (i in 0..._memHistory.size)
					_graph3.add(_memHistory.get(i) / _maxMem, 0xFF00FF00);
			}
			
			if (_memHistory.size == GRAPH_WIDTH)
				_memHistory.dequeue();
			_memHistory.enqueue(_curMem);
			
			_graph3.add(_curMem / _maxMem, 0xFF00FF00);
			_graph3.commit();
		}
		
		bmd.copyPixels(_graph1.bitmapData, _graph1.bitmapData.rect, _pointGraph);
		bmd.copyPixels(_graph2.bitmapData, _graph2.bitmapData.rect, _pointGraph, null, null, true);
		bmd.copyPixels(_graph3.bitmapData, _graph3.bitmapData.rect, _pointGraph, null, null, true);
		
		//tooltip
		var id = _getTooltipIndex();
		if (id != -1)
		{
			_font.x = 0;
			_font.y = FONT_HEIGHT + MM_HEIGHT + 1;
			_font.setColor(0, 0xffffffff);
			
			if ((MemoryManager.bytesUsed() >> 10) > 999)
			a[0] = (MemoryManager.bytesUsed() >> 20).min(999);
			else
				a[0] = MemoryManager.bytesUsed() >> 10;
				
			if ((MemoryManager.bytesTotal() >> 20) > 999)
				a[1] = (MemoryManager.bytesTotal() >> 20).min(999);
			else
				a[1] = MemoryManager.bytesTotal() >> 10;
			
			var s = "";
			switch (id)
			{
				case 0: s = "frames per second\nclick to freeze";
				case 1: s = "VM used memory (MiB)\nclick to force GC";
				case 2: s = "VM used memory ~ y-axis (MiB)";
				case 3: s = "VM free memory (MiB)";
				case 4: a[0] = ((MemoryManager.bytesUsed() >> 10) > 999) ? "MiB" : "KiB";
						s = "alchemy used memory (%s)\nclick to defrag".format(a);
				case 5: a[0] = ((MemoryManager.bytesTotal() >> 10) > 999) ? "MiB" : "KiB";
						s = "alchemy total memory (%s)\nclick to pack".format(a);
				case 6: s = "alchemy #allocated intervals";
				case 7: s = "alchemy malloc block size (KiB)";
				case 8: a[0] = flash.system.Capabilities.version;
						a[1] = flash.system.System.vmVersion;
						s = "%s (%s)".format(a);
				case 9: s = "Debug player";
			}
			
			_font.drawText(bmd, s);
		}
		
		if (_clampCounter > 0)
		{
			_clampCounter--;
			_font.x = _font.y = 0;
			_font.setColor(0xffff0000, 0xffffffff);
			_font.drawText(bmd, "WARNING: ACCUMULATOR CLAMPED");
		}
		
		bmd.unlock();
	}
	
	function _init()
	{
		_playerVersion        = Capabilities.version.substr(4).split(",").splice(0, 2).join(".");
		_isDebugPlayer        = Capabilities.isDebugger ? "d" : "r";
		_formatArgs           = ArrayUtil.alloc(6);
		_font                 = new ProggyOptiS();
		_memoryManagerShape   = new Shape();
		_matrix               = new Matrix();
		_pointGraph           = new Point(0, FONT_HEIGHT #if alchemy + MM_HEIGHT #end + 1);
		_pointText            = new Vec2();
		_curMem               = System.totalMemory >> 20;
		_maxMem               = INIT_MAX_MEM_SIZE;
		_freeMem              = .0;
		#if flash10_1
		_freeMem              = System.freeMemory / 0x100000;
		#end
		_graph1               = new AliasedGraph(GRAPH_WIDTH, GRAPH_HEIGHT, 0x00000000);
		_graph2               = new AliasedGraph(GRAPH_WIDTH, GRAPH_HEIGHT, 0x00000000);
		_graph3               = new AliasedGraph(GRAPH_WIDTH, GRAPH_HEIGHT, 0x00000000);
		_meanFps              = new Mean(100);
		_meanMem              = new Mean(100);
		_memHistory           = new Que(GRAPH_WIDTH);
		_blipFrameRateHistory = Timeline.sSchedule(0, REDRAW_FPS_INTERVAL, -1);
		_blipMemoryHistory    = Timeline.sSchedule(0, REDRAW_MEM_INTERVAL, -1);
		
		_font.setColor(0xffffffff, 0xff000000);
		_matrix.translate(0, FONT_HEIGHT);
		
		Timebase.sAttach(this, TimebaseEvent.RENDER | TimebaseEvent.CLAMP);
		Timeline.sAttach(this, TimelineEvent.BLIP);
		UI.sAttach(this, UIEvent.MOUSE_DOWN);
		
		Window.stage.addEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		_tooltipEnabled = false;
	}
	
	function _free()
	{
		Timeline.instance().cancel(_blipMemoryHistory);
		Timeline.instance().cancel(_blipFrameRateHistory);
		Timeline.sDetach(this);
		Timebase.sDetach(this);
		UI.sDetach(this);
		Window.stage.removeEventListener(Event.MOUSE_LEAVE, _onMouseLeave);
		Window.stage.removeEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		_bitmap.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		_bitmap.parent.removeEventListener(Event.ADDED, _onAdded);
		
		DisplayListUtils.detach(_bitmap);
		_bitmap.bitmapData.dispose();
		
		_graph1.free();
		_graph2.free();
		_graph3.free();
		
		_memHistory.free();
		_font.free();
		_meanFps.free();
		_meanMem.free();
		
		_bitmap             = null;
		_memoryManagerShape = null;
		_memHistory         = null;
		_font               = null;
		_meanFps            = null;
		_formatArgs         = null;
		_matrix             = null;
		_pointGraph         = null;
		_graph1             = null;
		_graph2             = null;
		_graph2             = null;
	}
	
	function _getTooltipIndex()
	{
		if (!_tooltipEnabled) return -1;
		
		var m = UI.instance().mouse;
		
		if (m.y <= FONT_HEIGHT)
		{
			var x = Std.int(m.x / 6);
			#if alchemy
			if (x >=  0 && x <=  1) return 0;
			if (x >=  3 && x <=  5) return 1;
			if (x >=  7 && x <=  9) return 2;
			if (x >= 11 && x <= 13) return 3;
			if (x >= 15 && x <= 17) return 4;
			if (x >= 19 && x <= 21) return 5;
			if (x >= 23 && x <= 26) return 6;
			if (x >= 28 && x <= 30) return 7;
			if (x >= 32 && x <= 36) return 8;
			if (x >= 38 && x <= 38) return 9;
			#else
			if (x >=  0 && x <=  1) return 0;
			if (x >=  3 && x <=  5) return 1;
			if (x >=  7 && x <=  9) return 2;
			if (x >= 11 && x <= 13) return 3;
			if (x >= 15 && x <= 19) return 8;
			if (x >= 21 && x <= 21) return 9;
			#end
		}
		
		return -1;
	}
	
	function _onAddedToStage(e:Event) 
	{
		_bitmap.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		_bitmap.parent.addEventListener(Event.ADDED, _onAdded);
		
		_init();
	}
	
	function _onAdded(e:Event) 
	{
		if (e.target.parent == _bitmap.parent)
			if (_bitmap.parent.getChildIndex(_bitmap) < _bitmap.parent.getChildIndex(e.target))
				_bitmap.parent.swapChildren(_bitmap, e.target);
	}
	
	function _onMouseLeave(e:Event)
	{
		Window.stage.removeEventListener(Event.MOUSE_LEAVE, _onMouseLeave);
		Window.stage.addEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		_tooltipEnabled = false;
	}
	
	function _onMouseMove(e:Event)
	{
		_tooltipEnabled = true;
		Window.stage.removeEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		Window.stage.addEventListener(Event.MOUSE_LEAVE, _onMouseLeave);
	}
}

private class AliasedGraph
{
	public var bitmapData(default, null):BitmapData;
	public var sourceRect(default, null):Rectangle;
	
	var _buffer:flash.Vector<UInt>;
	
	var _w:Int;
	var _h:Int;
	
	var _x0:Int;
	var _x1:Int;
	var _y0:Int;
	
	var _fillClr:Int;
	var _init:Bool;
	
	public function new(w:Int, h:Int, fillClr:Int, initAlpha = .0)
	{
		bitmapData = new BitmapData(_w = w, _h = h, true, _fillClr = fillClr);
		
		#if flash10
		_buffer = bitmapData.getVector(sourceRect = bitmapData.rect);
		#end
		
		_init = true;
		
		_y0 = Std.int(h * initAlpha);
		_x0 = _w - 2;
		_x1 = _w - 1;
	}
	
	public function free():Void
	{
		bitmapData.dispose();
		
		sourceRect = null;
		bitmapData = null;
		_buffer    = null;
	}
	
	public var x(_xGetter, _xSetter):Int;
	inline function _xGetter():Int { return _x1; }
	inline function _xSetter(x:Int):Int
	{
		_x0 = _x1 = x;
		return x;
	}
	
	inline public function commit()
	{
		bitmapData.setVector(sourceRect, _buffer);
	}
	
	inline public function clr():Void
	{
		for (i in 0..._buffer.length) _buffer[i] = _fillClr;
		
		_x0 = _w - 2;
		_x1 = _w - 1;
		_init = true;
	}
	
	inline public function add(alpha:Float, clr:Int):Void
	{
		alpha = alpha.fclamp(0, 1);
		
		_x0 = _x1;
		_x1 = (_x1 + 1) % _w;
		
		for (y in 0..._h) setPixel(_x1, y, _fillClr);
		var y1 = (_h - 1) - ((_h - 1) * alpha).round();
		
		if (_init)
		{
			_y0 = y1;
			_init = false;
		}
		
		setPixel(_x1, y1, clr);
		
		if ((y1 - _y0).abs() > 1)
		{
			if (y1 < _y0)
			{
				for (y in y1 + 1..._y0)
					setPixel(_x1, y, clr);
			}
			else
			if (y1 > _y0)
			{
				for (y in _y0 + 1...y1)
					setPixel(_x1, y, clr);
			}
		}
		
		_y0 = y1;
	}
	
	inline function setPixel(x:Int, y:Int, clr:Int)
	{
		_buffer[y * _w + x] = clr;
	}
}

private class Que
{
	public var size:Int;
	
	var _a:Array<Int>;
	var _capacity:Int;
	var _front:Int;
	
	public function new(size:Int)
	{
		_capacity = size;
		size = _front = 0;
		_a = ArrayUtil.alloc(_capacity);
	}
	
	public function free():Void
	{
		_a = null;
	}

	inline public function enqueue(x:Int):Void
	{
		_a[(size++ + _front) % _capacity] = x;
	}
	
	inline public function dequeue():Void
	{
		_front++;
		if (_front == _capacity)
			_front = 0;
		size--;
	}
	
	inline public function get(i:Int):Int
	{
		return _a[(i + _front) % _capacity];
	}
}