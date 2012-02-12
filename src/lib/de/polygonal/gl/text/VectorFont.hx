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
package de.polygonal.gl.text;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.fmt.ASCII;
import de.polygonal.core.util.Assert;
import de.polygonal.gl.VectorRenderer;
import de.polygonal.motor.geom.primitive.AABB2;

#if !font_inline
import de.polygonal.gl.text.util.ByteArrayHandler;
import de.polygonal.core.io.Base64;
#end

/**
 * A font drawing system using the FP10 vector renderer + 'alchemy memory'.
 */
class VectorFont
{
	static var _SharedData:Hash<VectorFontData> = null;
	public static function GetSharedData()
	{
		if (_SharedData == null)
			_SharedData = new Hash();
		return _SharedData;
	}
	
	/**
	 * The threshold for drawing b&eacute;zier curves.
	 * The resolution (aka the smoothness of the curve) increases as the threshold goes to zero. 
	 * When the threshold is zero or negative, the curve is approximated by just two segments.
	 */
	public var bezierThreshold:Float;
	
	/** The tabulator size. Default is 4. */
	public var tabSize:Int;
	
	var _vr:VectorRenderer;
	var _scale:Float;
	var _size:Float;
	
	var _tabSize:Int;
	var _tabSpacing:Float;
	
	var _ascent:Float;
	var _descent:Float;
	var _emsquare:Float;
	
	var _aabb:AABB2;
	var _glyphBounds:Array<AABB2>;
	var _glyphRange:Array<Bool>;
	
	#if font_inline
	function new(emsquare:Float, ascent:Float, descent:Float, boundsTable:Array<Float>)
	{
		_scale = 1.;
		_size = 100;
		
		_emsquare = emsquare;
		_ascent   = ascent  / emsquare * 100.;
		_descent  = descent / emsquare * 100.;
		_setGlyphBounds(boundsTable);
		
		_aabb = new AABB2();
		bezierThreshold = 0.;
		tabSize = 4;
	}
	#else
	static var _bytes = new Hash<ByteArrayHandler>();
	
	var _cmd:Array<flash.Vector<Int>>;
	var _pos:Array<flash.Vector<Float>>;
	var _handler:ByteArrayHandler;
	
	function new(bytes:String)
	{
		//cache decoded data
		var C = Type.getClass(this);
		var className = Type.getClassName(C);
		if (_bytes.exists(className))
			_handler = _bytes.get(className);
		else
		{
			_handler = new ByteArrayHandler();
			_handler.readBytes(Base64.decode(bytes, new flash.utils.ByteArray(), true));
			_bytes.set(className, _handler);
		}
		
		bezierThreshold = 0.;
		tabSize = 4;
		_scale = 1.;
		_size = 100;
		_aabb = new AABB2();
	}
	#end
	
	/** Nullifies references so all used resources can be garbage collected. */
	public function free():Void
	{
		var className = Type.getClassName(Type.getClass(this));
		var data = GetSharedData().get(className);
		
		#if debug
		de.polygonal.core.util.Assert.assert(data != null, "data != null");
		#end
		
		data.counter--;
		if (data.counter == 0)
		{
			data.free();
			GetSharedData().remove(className);
		}
		
		_vr = null;
		_aabb = null;
		_glyphBounds = null;
		_glyphRange = null;
		
		#if !font_inline
		var _cmd = null;
		var _pos = null;
		#end
	}
	
	/** Assigns a renderer that handles all drawing commands. */
	public function setRenderer(vr:VectorRenderer):Void
	{
		_vr = vr;
	}
	
	/** Defines the font size. A value of 100 equals 72pt or one inch. */
	public var size(_gsize, _ssize):Float;
	inline function _gsize():Float { return _size; }
	inline function _ssize(x:Float):Float
	{
		_scale = (_size = x) / 100;
		return x;
	}
	
	/**
	 * Draws <i>text</i> to the screen at the position <i>x</i>,<i>y</i>, which is the lower-left
	 * corner of the first character.
	 * @param centered If true, the text is centered around <i>x</i>,<i>y</i>.
	 * @param bound If specified, returns the bound of the text that was written.
	 * @param tight Computes a tight bounding box spanning all characters (if <i>bound</i> was specified).
	 */
	public function write(text:String, x:Float, y:Float, ?centered = false, ?bound:AABB2, ?tight = false):AABB2
	{
		throw "override for implementation";
		return null;
	}
	
	/**
	 * Draws all supported characters to the screen at the position <i>x</i>,<i>y</i>, which is the
	 * lower-left corner of the first character.
	 * @param maxWidth The number of characters to fit per line.
	 * @return A tight bounding box spanning all characters.
	 */
	public function writeCharSet(x:Float, y:Float, maxWidth:Float):AABB2
	{
		var name = Type.getClassName(Type.getClass(this));
		var text = name.substr(name.lastIndexOf('.') + 1) + "\n";
		
		var s = text;
		var c = 0;
		
		for (i in 0..._glyphRange.length)
		{
			if (!_glyphRange[i] || i == ASCII.NEWLINE || i == ASCII.TAB) continue;
			
			text += String.fromCharCode(i);
			s += String.fromCharCode(i);
			if (getBound(s, x, y, false, true, new AABB2()).intervalX > maxWidth)
			{
				text += "\n";
				s = '';
			}
		}
		
		var bound = write(text, x, y, false, new AABB2(), true);
		return bound;
	}
	
	/**
	 * Computes a single axis-aligned bounding box spanning all characters specified in <i>text</i>,
	 * where <i>x</i>, <i>y</i> defines the position of the first character. <i>x</i> is measured
	 * relative to the left edge of the character, while <i>y</i> is the position of the character's
	 * baseline.
	 * 
	 * @param centered If true, the bounding box is centered around <i>x</i>,<i>y</i>.
	 * @param tight If true, computes a tight bounding box, otherwise computes a loose bounding box
	 * using the character's maximum width and the distance from the top of the tallest ascender to
	 * the bottom of the longest descender.
	 * @param output Returns the result.
	 */
	public function getBound(text:String, x:Float, y:Float, centered:Bool, tight:Bool, output:AABB2):AABB2
	{
		throw "override for implementation";
		return output;
	}
	
	/**
	 * Computes an axis-aligned bounding box for each character specified in <i>text</i>, where
	 * <i>x</i>, <i>y</i> defines the position of the first character.
	 * @param centered If true, the bounding boxes are centered around <i>x</i>,<i>y</i>.
	 * @param tight If true, computes a tight bounding box, otherwise computes a loose bounding box
	 * using the character's maximum width and the distance from the top of the tallest ascender to
	 * the bottom of the longest descender.
	 */
	public function getIndividualBounds(text:String, x:Float, y:Float, centered:Bool, tight:Bool):Array<AABB2>
	{
		throw "override for implementation";
		return null;
	}
	
	function _setGlyphBounds(input:Array<Float>):Void
	{
		var className = Type.getClassName(Type.getClass(this));
		var data = GetSharedData().get(className);
		if (data == null)
		{
			data = new VectorFontData();
			GetSharedData().set(className, data);
			
			var t = new Array<Bool>();
			var i = 0;
			var k = input.length;
			while (i < k)
			{
				var charCode = input[i];
				t[Std.int(charCode)] = true;
				i += 5;
			}
			
			var a = data.glyphRange = new Array<Bool>();
			for (i in 0...t.length) a[i] = t[i] ? true : false;
			a[ASCII.TAB]     = true;
			a[ASCII.NEWLINE] = true;
			a[ASCII.SPACE]   = true;
			
			var i = 0;
			var a = data.glyphBounds = new Array<AABB2>();
			while (i < k)
			{
				var charCode = input[i];
				var minX = input[i + 1];
				var minY = input[i + 2];
				var maxX = input[i + 3];
				var maxY = input[i + 4];
				a[Std.int(charCode)] = new AABB2(minX, minY, maxX, maxY);
				i += 5;
			}
		}
		
		_glyphBounds = data.glyphBounds;
		_glyphRange  = data.glyphRange;
		
		data.counter++;
	}
	
	#if font_inline
	function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		throw "override for implementation";
	}
	#else
	function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		#if debug
		Assert.assert(_vr != null, "no VectorRenderer assigned");
		#end
		
		var cmd = _cmd[charCode];
		var pos = _pos[charCode];
		
		var i = 0;
		
		for (c in cmd)
		{
			switch (c)
			{
				case 1:
				
				var a = x + pos[i + 0] * s;
				var b = y + pos[i + 1] * s;
				_vr.moveTo2(a, b);
				i += 2;
				
				case 2:
				
				var a = x + pos[i + 0] * s;
				var b = y + pos[i + 1] * s;
				_vr.lineTo2(a, b);
				i += 2;
				
				case 3:
				
				var a = x + pos[i + 0] * s;
				var b = y + pos[i + 1] * s;
				var c = x + pos[i + 2] * s;
				var d = y + pos[i + 3] * s;
				var e = x + pos[i + 4] * s;
				var f = y + pos[i + 5] * s;
				var g = x + pos[i + 6] * s;
				var h = y + pos[i + 7] * s;
				_vr.bezier8(a, b, c, d, e, f, g, h, threshold);
				i += 8;
			}
		}
	}
	#end
	
	function _getCharCode(s:String, i:Int):Int
	{
		var c = untyped s.cca(i);
		if (c < _glyphRange.length)
		{
			if (!_glyphRange[c])
				throw Sprintf.format("unsupported character %d [%#x]", [c, c]);
		}
		return c;
	}
	
	inline function _transform(x:Float):Float
	{
		return x / _emsquare * 100 * _scale;
	}
	
	inline function _getTabOffset(x:Float, w:Float):Float
	{
		var s = w * tabSize;
		var fpart = x / s;
		var ipart = Math.ceil(fpart);
		return (ipart == fpart) ? (x + s) : (ipart * s);
	}
	
	inline function _bez(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, threshold:Float):Void
	{
		_vr.bezier8(x0, y0, x1, y1, x2, y2, x3, y3, threshold);
	}
	
	inline function _posb(x:Int):Int
	{
		return __posb(_vr, x);
	}
	
	inline function _posf(x:Int):Int
	{
		return __posf(_vr, x);
	}
	
	inline function _setb(addr:Int, x:Int)
	{
		#if alchemy
		flash.Memory.setByte(addr, x);
		#else
		__bufb(_vr).set(addr, x);
		#end
	}
	
	inline function _setf(addr:Int, x:Float)
	{
		#if alchemy
		flash.Memory.setFloat(addr, x);
		#else
		var t = _pi0(_vr);
		__buff(_vr).set(t + ((addr - t) >> 2), x);
		#end
	}
	
	inline static function _pi0(f: { private var _pi0:Int; })
	{
		return f._pi0;
	}
	
	inline static function __bufb(f: { private var _cb:de.polygonal.ds.mem.ByteMemory;  } ) { return f._cb; }
	inline static function __buff(f: { private var _db:de.polygonal.ds.mem.FloatMemory; } ) { return f._db; }
	inline static function __posb(f: { private function _posb(n:Int):Int; }, x:Int):Int       { return f._posb(x); }
	inline static function __posf(f: { private function _posf(n:Int):Int; }, x:Int):Int       { return f._posf(x); }
}

private class VectorFontData
{
	public var counter:Int;
	public var glyphBounds:Array<AABB2>;
	public var glyphRange:Array<Bool>;
	public var spacingTable:de.polygonal.ds.mem.IntMemory;
	public var kerningTable:de.polygonal.ds.mem.IntMemory;
	
	public function new() {}
	
	public function free():Void
	{
		for (i in 0...glyphBounds.length)
			glyphBounds[i] = null;
		glyphBounds = null;
		glyphRange  = null;
		
		if (spacingTable != null) spacingTable.free();
		if (kerningTable != null) kerningTable.free();
	}
}