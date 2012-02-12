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
package de.polygonal.core.tween;

import de.polygonal.ds.Bits;
import flash.display.DisplayObject;
import de.polygonal.core.tween.ease.Ease;

using de.polygonal.ds.BitFlags;

class DisplayObjectTween extends Tween, implements TweenTarget
{
	inline public static var X        = Bits.BIT_01;
	inline public static var Y        = Bits.BIT_02;
	inline public static var WIDTH    = Bits.BIT_03;
	inline public static var HEIGHT   = Bits.BIT_04;
	inline public static var SCALEX   = Bits.BIT_05;
	inline public static var SCALEY   = Bits.BIT_06;
	inline public static var ROTATION = Bits.BIT_07;
	inline public static var ALPHA    = Bits.BIT_08; 
	
	var _bits:Int;
	var _o:DisplayObject;
	
	public function new(?key:String, o:DisplayObject, flags:Int, ease:Ease, to:Float, duration:Float, ?interpolateState = true)
	{
		_o = o;
		_bits = flags;
		super(key, this, ease, to, duration, interpolateState);
	}
	
	override public function free():Void 
	{
		super.free();
		_o = null;
	}
	
	public function flags(x:Int):DisplayObjectTween
	{
		_bits = x;
		return this;
	}
	
	public function set(x:Float):Void 
	{
		if (hasf(X))        _o.x        = x;
		if (hasf(Y))        _o.y        = x;
		if (hasf(ROTATION)) _o.rotation = x;
		if (hasf(SCALEX))   _o.scaleX   = x;
		if (hasf(SCALEY))   _o.scaleY   = x;
		if (hasf(WIDTH))    _o.width    = x;
		if (hasf(HEIGHT))   _o.height   = x;
		if (hasf(ALPHA))    _o.alpha    = x;
	}
	
	public function get():Float 
	{
		return
		if (hasf(X))        _o.x;
		else
		if (hasf(Y))        _o.y;
		else
		if (hasf(ROTATION)) _o.rotation;
		else
		if (hasf(SCALEX))   _o.scaleX;
		else
		if (hasf(SCALEY))   _o.scaleY;
		else
		if (hasf(WIDTH))    _o.width;
		else
		if (hasf(HEIGHT))   _o.height;
		else
		if (hasf(ALPHA))    _o.alpha;
	}
}