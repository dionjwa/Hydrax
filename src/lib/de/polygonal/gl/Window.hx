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
package de.polygonal.gl;

import de.polygonal.core.event.Observable;
import de.polygonal.motor.geom.primitive.AABB2;

class Window
{
	public static var initNME             = false;
	public static var initResX            = WindowRes.HVGA_X;
	public static var initResY            = WindowRes.HVGA_Y;
	public static var initFramerate       = 60.;
	public static var initUseHardware     = true;
	public static var initIsResizable     = true;
	public static var initBackgroundColor = 0x999999;
	
	#if flash
	public static var opaqueBackground    = false;
	#end
	
	#if nme
	public static var initTitle = "title";
	public static var initIcon = null;
	#end
	
	public static var resX(default, null):Int;
	public static var resY(default, null):Int;
	
	#if (flash || nme)
	public static var stage(default, null):flash.display.Stage;
	public static var surface(default, null):flash.display.Sprite;
	public static var overlay(default, null):flash.display.Sprite;
	public static var tf(default, null):flash.text.TextField;
	#end
	
	#if flash
	static var _fill:flash.display.Shape;
	#end
	
	static var _observable:Observable;
	public static function getObservable():Observable
	{
		if (_observable == null)
			_observable = new Observable();
		return _observable;
	}
	
	public static function init(initCallback:Void->Void)
	{
		#if js
		_onInit();
		initCallback();
		#elseif flash
		_onInit();
		initCallback();
		#elseif nme
		
		if (initNME)
		{
			nme.Lib.create
			(
				function() { _onInit(); initCallback(); },
				initResX,
				initResY,
				initFramerate,
				initBackgroundColor,
				(initUseHardware ? nme.Lib.HARDWARE : 0) | (initIsResizable ? nme.Lib.RESIZABLE : 0),
				initTitle,
				initIcon
			);
		}
		else
		{
			if (initNME) _onInit();
			initCallback();
		}
		#end
	}
	
	static function _onInit()
	{
		_bound0 = new AABB2();
		_bound1 = new AABB2();
		
		#if (flash || nme)
		var root = flash.Lib.current;
		stage = root.stage;
		#end
		
		#if flash
		resX = stage.stageWidth;
		resY = stage.stageHeight;
		#else
		resX = initResX;
		resY = initResY;
		#end
		
		#if flash
		stage.frameRate = initFramerate;
		if (opaqueBackground)
		{
			_fill = new flash.display.Shape();
			_fill.graphics.beginFill(initBackgroundColor, 1);
			_fill.graphics.drawRect(0, 0, resX, resY);
			_fill.graphics.endFill();
			_fill.cacheAsBitmap = true;
			var root = flash.Lib.current;
			root.addChild(_fill);
		}
		#end
		
		#if (flash || nme)
		var root = flash.Lib.current;
		root.addChild(surface = new flash.display.Sprite());
		root.addChild(overlay = new flash.display.Sprite());
		root.addChild(tf = new flash.text.TextField());
		tf.defaultTextFormat = new flash.text.TextFormat('Consolas', 12);
		tf.autoSize = flash.text.TextFieldAutoSize.LEFT;
		tf.selectable = false;
		
		stage.addEventListener(flash.events.Event.RESIZE, _onResize);
		stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		
		stage.addEventListener(flash.events.Event.ACTIVATE, _onActivate);
		stage.addEventListener(flash.events.Event.DEACTIVATE, _onDeactivate);
		#end
		
		#if (flash || nme)
		_onResize(null);
		#end
	}
	
	static var _bound0:AABB2;
	static var _bound1:AABB2;
	public static function bound():AABB2
	{
		_bound1.set(_bound0);
		return _bound1;
	}
	
	#if (flash || nme)
	static function _onResize(e)
	{
		_bound0.set4(0, 0, stage.stageWidth, stage.stageHeight);
		resX = Std.int(_bound0.maxX);
		resY = Std.int(_bound0.maxY);
		getObservable().notify(WindowEvent.RESIZE);
		
		#if flash
		if (opaqueBackground)
		{
			_fill.graphics.beginFill(initBackgroundColor, 1);
			_fill.graphics.drawRect(0, 0, resX, resY);
			_fill.graphics.endFill();
		}
		#end
	}
	
	static function _onActivate(e):Void 
	{
		stage.frameRate = initFramerate;
		getObservable().notify(WindowEvent.ACTIVATE);
	}
	
	static function _onDeactivate(e):Void 
	{
		getObservable().notify(WindowEvent.DEACTIVATE);
	}
	#end
}