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

import de.polygonal.core.io.Base64;
import de.polygonal.core.io.RLE;
import de.polygonal.core.fmt.ASCII;
import de.polygonal.ds.BitVector;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

/**
 * A monospace bitmap stores each glyph as an array of pixels.
 */
class MonospaceBitmapFont 
{
	public var charW(default, null):Int;
	public var charH(default, null):Int;
	
	public var x:Int;
	public var y:Int;
	
	var _glyphs:BitmapData;
	var _sourceRect:Rectangle;
	var _destPoint:Point;
	
	var _paletteRect:Rectangle;
	var _palettePoint:Point;
	
	var _r:Array<Int>;
	var _g:Array<Int>;
	var _b:Array<Int>;
	var _a:Array<Int>;
	
	function new(glyphs:String)
	{
		_r = new Array<Int>();
		_g = new Array<Int>();
		_b = new Array<Int>();
		_a = new Array<Int>();
		
		_decode(glyphs);
	}
	
	public function free():Void
	{
		_glyphs.dispose();
		
		_glyphs       = null;
		_sourceRect   = null;
		_paletteRect  = null;
		_destPoint    = null;
		_palettePoint = null;
		_r            = null;
		_g            = null;
		_b            = null;
		_a            = null;
	}
	
	public function setColor(background:Int, foreground:Int):Void
	{
		_a[0x00] = background & 0xff000000;
		_r[0x00] = background & 0x00ff0000;
		_g[0x00] = background & 0x0000ff00;
		_b[0x00] = background & 0x000000ff;
		_a[0xff] = foreground & 0xff000000;
		_r[0xff] = foreground & 0x00ff0000;
		_g[0xff] = foreground & 0x0000ff00;
		_b[0xff] = foreground & 0x000000ff;
	}
	
	public function drawText(bitmapData:BitmapData, text:String):Void
	{
		var x0 = x;
		var y0 = y;
		
		_destPoint.x = x;
		_destPoint.y = y;
		
		var k = text.length;
		for (i in 0...k)
		{
			var charCode = text.charCodeAt(i);
			if (charCode < ASCII.EXCLAM)
			{
				if (charCode == ASCII.NEWLINE)
				{
					x = x0;
					y += charH;
					continue;
				}
			}
			
			charCode -= ASCII.SPACE;
			
			_sourceRect.x = charCode * charW;
			_destPoint.x = x;
			_destPoint.y = y;
			bitmapData.copyPixels(_glyphs, _sourceRect, _destPoint);
			x += charW;
		}
		
		_paletteRect.x      = x0;
		_paletteRect.y      = y0;
		_paletteRect.width  = x - x0;
		_paletteRect.height = charH;
		_palettePoint.x     = x0;
		_palettePoint.y     = y0;
		
		bitmapData.paletteMap(bitmapData, _paletteRect, _palettePoint, _r, _g, _b, _a);
	}
	
	function _decode(base64Encoded:String)
	{
		var base64Uncoded = Base64.decode(base64Encoded, new ByteArray(), true);
		var rleUncoded = RLE.decode(base64Uncoded);
		
		charW = rleUncoded[rleUncoded.length - 3];
		charH = rleUncoded[rleUncoded.length - 2];
		
		var charCount = rleUncoded[rleUncoded.length - 1];
		
		_sourceRect = new Rectangle(0, 0, charW, charH);
		_destPoint = new Point(0, 0);
		
		_paletteRect = new Rectangle(0, 0, 0, 0);
		_palettePoint = new Point();
		
		var bv = new BitVector(0);
		bv.ofBytes(rleUncoded);
		
		_glyphs = new BitmapData((charW + 1) * charCount, charH, true, 0x00000000); //+1 add space
		
		for (i in 0...charCount)
		{
			for (y in 0...charH)
			{
				for (x in 0...charW)
				{
					var index = (i * charW * charH) + y * charW + x;
					_glyphs.setPixel32(x + ((i + 1) * charW), y, bv.has(index) ? 0xffffffff : 0x00000000); //+1 add space
				}
			}
		}
		
		bv.free();
	}
}