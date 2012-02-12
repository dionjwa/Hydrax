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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.fmt.ASCII;
import de.polygonal.ds.mem.IntMemory;
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * The base class of a proportional typeface which uses varying widths for the glyphs.
 */
class ProportionalVectorFont extends VectorFont
{
	/** If false, kerning is disabled. Default is true. */
	public var applyKerning:Bool;
	
	var _spacingTable:IntMemory;
	var _kerningTable:IntMemory;
	
	#if font_inline
	function new(emsquare:Float, ascent:Float, descent:Float, boundTable:Array<Float>, spacingTable:Array<Int>, kerningTable:Array<Int>)
	{
		super(emsquare, ascent, descent, boundTable);
		_initSpacingKerning(spacingTable, kerningTable);
		applyKerning = true;
	}
	#else
	function new(bytes:String)
	{
		super(bytes);
		
		var h = _handler;
		
		_emsquare = h.emsquare;
		_ascent   = h.ascent  / h.emsquare * 100.;
		_descent  = h.descent / h.emsquare * 100.;
		_cmd      = h.glyphCommands;
		_pos      = h.glyphData;
		
		_setGlyphBounds(h.glyphBounds);
		_initSpacingKerning(h.spacingTable, h.kerningTable);
		applyKerning = true;
	}
	#end
	
	/** Nullifies references so all used resources can be garbage collected. */
	override public function free():Void
	{
		_spacingTable = null; //free() is called in VectorFontData
		_kerningTable = null;
		
		super.free();
	}
	
	override public function write(s:String, x:Float, y:Float, ?centered = false, ?bound:AABB2, ?tight = false):AABB2
	{
		if (s == null || s.length == 0) return null;
		
		var lx = .0;
		var ly = .0;
		
		if (centered)
		{
			var b = getBound(s, x, y, false, tight, _aabb);
			var offset = -(b.intervalX / 2) + (x - b.minX) * 2;
			b.minX += offset;
			b.maxX += offset;
			offset = -b.centerY + (y - b.minY) * 2;
			offset = -(b.intervalY / 2) + (y - b.minY) * 2;
			b.minY += offset;
			b.maxY += offset;
			write(s, b.minX, b.minY, false, bound, tight);
			return null;
		}
		
		var outputBound = bound != null;
		
		var minX0 = x, minX1;
		var minY0 = y, maxX1;
		var maxX0 = x, minY1;
		var maxY0 = y, maxY1;
		
		var t;
		var code = _getCharCode(s, 0);
		switch (code)
		{
			case ASCII.SPACE:
				lx += _getSpacing(code);
				if (outputBound) maxX0 = x + lx;
			
			case ASCII.NEWLINE:
				ly += (_ascent - _descent) * _scale;
			
			case ASCII.TAB:
				lx = _getTabOffset(lx, _getSpacing(ASCII.SPACE));
				if (outputBound) maxX0 = minX0 + lx;
			
			default:
				_draw(code, x, y, _scale, bezierThreshold);
				if (outputBound)
				{
					var b = _glyphBounds[code];
					if (tight)
					{
						minX0 = x + b.minX * _scale;
						minY0 = y + b.minY * _scale;
						maxX0 = x + b.maxX * _scale;
						maxY0 = y + b.maxY * _scale;
					}
					else
					{
						minX0 = x;
						maxX0 = x + _getSpacing(code);
						minY0 = y - _ascent  * _scale;
						maxY0 = y - _descent * _scale;	
					}
				}
				lx += _getSpacing(code);
		}
		
		var i = 1;
		var k = s.length;
		while (i < k)
		{
			var nextCode = _getCharCode(s, i);
			switch (nextCode)
			{
				case ASCII.SPACE:
					t = _getSpacing(nextCode);
					lx += t;
					if (outputBound) maxX0 += t;
				
				case ASCII.NEWLINE:
					t = (_ascent - _descent) * _scale;
					lx = 0;
					ly += t;
					if (outputBound) maxY0 += t;
				
				case ASCII.TAB:
					lx = _getTabOffset(lx, _getSpacing(ASCII.SPACE));
					if (outputBound) maxX0 = x + lx;
				
				default:
					lx += _getKerning(code, nextCode);
					_draw(nextCode, x + lx, y + ly, _scale, bezierThreshold);
					
					if (outputBound)
					{
						var b = _glyphBounds[nextCode];
						if (tight)
						{
							minX1 = x + lx + b.minX * _scale;
							maxX1 = x + lx + b.maxX * _scale;
							minY1 = y + ly + b.minY * _scale;
							maxY1 = y + ly + b.maxY * _scale;
						}
						else
						{
							minX1 = x + lx;
							maxX1 = x + lx + _getSpacing(nextCode);
							minY1 = y + ly - _ascent  * _scale;
							maxY1 = y + ly - _descent * _scale;	
						}
						if (minX1 < minX0) minX0 = minX1;
						if (minY1 < minY0) minY0 = minY1;
						if (maxX1 > maxX0) maxX0 = maxX1;
						if (maxY1 > maxY0) maxY0 = maxY1;
					}
					
					lx += _getSpacing(nextCode);
			}
			
			code = nextCode;
			i++;
		}
		
		if (outputBound) bound.set4(minX0, minY0, maxX0, maxY0);
		return bound;
	}
	
	override public function getBound(s:String, x:Float, y:Float, centered:Bool, tight:Bool, output:AABB2):AABB2
	{
		var lx = .0;
		var ly = .0;
		
		var minX0 = x, minX1;
		var minY0 = y, maxX1;
		var maxX0 = x, minY1;
		var maxY0 = y, maxY1;
		
		var t;
		var code = _getCharCode(s, 0);
		switch (code)
		{
			case ASCII.SPACE:
			
			lx += _getSpacing(code);
			maxX0 = x + lx;
			
			case ASCII.NEWLINE:
			
			ly += (_ascent - _descent) * _scale;
			
			case ASCII.TAB:
			
			lx = _getTabOffset(lx, _getSpacing(ASCII.SPACE));
			maxX0 = minX0 + lx;
			
			default:
			
			var b = _glyphBounds[code];
			if (tight)
			{
				minX0 = x + b.minX * _scale;
				minY0 = y + b.minY * _scale;
				maxX0 = x + b.maxX * _scale;
				maxY0 = y + b.maxY * _scale;
			}
			else
			{
				minX0 = x;
				maxX0 = x + _getSpacing(code);
				minY0 = y - _ascent  * _scale;
				maxY0 = y - _descent * _scale;	
			}
			
			lx += _getSpacing(code);
		}
		
		var i = 1;
		var k = s.length;
		while (i < k)
		{
			var nextCode = _getCharCode(s, i);
			switch (nextCode)
			{
				case ASCII.SPACE:
				
				t = _getSpacing(nextCode);
				lx += t;
				maxX0 += t;
				
				case ASCII.NEWLINE:
				
				t = (_ascent - _descent) * _scale;
				ly += t;
				maxY0 += t;
				
				case ASCII.TAB:
				
				lx = _getTabOffset(lx, _getSpacing(ASCII.SPACE));
				maxX0 = x + lx;
				
				default:
				
				lx += _getKerning(code, nextCode);
				var b = _glyphBounds[nextCode];
				if (tight)
				{
					minX1 = x + lx + b.minX * _scale;
					maxX1 = x + lx + b.maxX * _scale;
					minY1 = y + ly + b.minY * _scale;
					maxY1 = y + ly + b.maxY * _scale;
				}
				else
				{
					minX1 = x + lx;
					maxX1 = x + lx + _getSpacing(nextCode);
					minY1 = y + ly - _ascent  * _scale;
					maxY1 = y + ly - _descent * _scale;	
				}
				if (minX1 < minX0) minX0 = minX1;
				if (minY1 < minY0) minY0 = minY1;
				if (maxX1 > maxX0) maxX0 = maxX1;
				if (maxY1 > maxY0) maxY0 = maxY1;
				
				lx += _getSpacing(nextCode);
			}
			
			code = nextCode;
			i++;
		}
		
		if (centered)
		{
			var offset = -((maxX0 - minX0) / 2) + (x - minX0);
			minX0 += offset;
			maxX0 += offset;
			
			offset = -((maxY0 - minY0) / 2) + (y - minY0);
			minY0 += offset;
			maxY0 += offset;
		}
		
		output.set4(minX0, minY0, maxX0, maxY0);
		return output;
	}
	
	//TODO fix getIndividualBound
	override public function getIndividualBounds(text:String, x:Float, y:Float, centered:Bool, tight:Bool):Array<AABB2>
	{
		var xt = x;
		var yt = y;
		
		var k = 0;
		for (i in 0...text.length)
		{
			if (!ASCII.isWhite(text.charCodeAt(i)))
				k++;
		}
		
		var output = new Array<AABB2>();
		k = 0;
		
		var minX0 = Mathematics.POSITIVE_INFINITY;
		var minY0 = Mathematics.POSITIVE_INFINITY;
		var maxX0 = Mathematics.NEGATIVE_INFINITY;
		var maxY0 = Mathematics.NEGATIVE_INFINITY;
		var minX1, minY1, maxX1, maxY1;
		
		var code = _getCharCode(text, 0);
		if (code == ASCII.SPACE)
			xt += _getSpacing(code)
		else
		if (code == ASCII.NEWLINE)
		{
			xt = x;
			yt += (_ascent - _descent) * _scale;
		}
		else
		{
			var bound = _glyphBounds[code];
			
			if (tight)
			{
				minX1 = bound.minX * _scale + xt;
				minY1 = bound.minY * _scale + yt;
				maxX1 = bound.maxX * _scale + xt;
				maxY1 = bound.maxY * _scale + yt;
			}
			else
			{
				minX1 = xt;
				maxX1 = xt + _getSpacing(code);
				minY1 = yt - _ascent * _scale;
				maxY1 = yt - _descent * _scale;
			}
			if (minX1 < minX0) minX0 = minX1;
			if (minY1 < minY0) minY0 = minY1;
			if (maxX1 > maxX0) maxX0 = maxX1;
			if (maxY1 > maxY0) maxY0 = maxY1;
			output[k++] = new AABB2(minX1, minY1, maxX1, maxY1);
			xt += _getSpacing(code);
		}
		
		for (i in 1...text.length)
		{
			var nextCode = _getCharCode(text, i);
			if (nextCode == ASCII.SPACE)
				xt += _getSpacing(nextCode);
			else
			if (nextCode == ASCII.NEWLINE)
			{
				xt = x;
				yt += (_ascent - _descent) * _scale;
			}
			else
			{
				xt += _getKerning(code, nextCode);
				var bound = _glyphBounds[nextCode];
				
				if (tight)
				{
					minX1 = bound.minX * _scale + xt;
					minY1 = bound.minY * _scale + yt;
					maxX1 = bound.maxX * _scale + xt;
					maxY1 = bound.maxY * _scale + yt;
				}
				else
				{
					minX1 = xt;
					maxX1 = xt + _getSpacing(nextCode);
					minY1 = yt - _ascent * _scale;
					maxY1 = yt - _descent * _scale;
				}
				if (minX1 < minX0) minX0 = minX1;
				if (minY1 < minY0) minY0 = minY1;
				if (maxX1 > maxX0) maxX0 = maxX1;
				if (maxY1 > maxY0) maxY0 = maxY1;
				
				output[k++] = new AABB2(minX1, minY1, maxX1, maxY1);
				xt += _getSpacing(nextCode);
			}
			code = nextCode;
		}
		
		if (centered)
		{
			var xOffset = -((maxX0 - minX0) / 2) + (x - minX0);
			var yOffset = -((maxY0 - minY0) / 2) + (y - minY0);
			for (i in output)
			{
				i.minX += xOffset;
				i.maxX += xOffset;
				i.minY += yOffset;
				i.maxY += yOffset;
			}
		}
		
		return output;
	}
	
	inline function _getKerning(charCodeA:Int, charCodeB:Int):Float
	{
		if (_kerningTable == null)
			return 0;
		else
		if (applyKerning)
		{
			var shift = _kerningTable.get(charCodeA);
			var count = _kerningTable.get(shift);
			
			var i = shift + 1;
			var k = i + count;
			
			var kern = 0;
			while (i < k)
			{
				if (_kerningTable.get(i) == charCodeB)
				{
					kern = _kerningTable.get(i + 1);
					break;
				}
				i += 2;
			}
			return _transform(kern);
		}
		else
			return 0;
	}
	
	inline function _getSpacing(charCode:Int):Float
	{
		return _transform(_spacingTable.get(charCode));
	}
	
	function _initSpacingKerning(spacingTable:Array<Int>, kerningTable:Array<Int>):Void
	{
		var className = Type.getClassName(Type.getClass(this));
		var data = VectorFont.GetSharedData().get(className);
		
		#if debug
		de.polygonal.core.util.Assert.assert(data != null, "data != null");
		#end
		
		if (data.spacingTable == null)
		{
			data.spacingTable = new IntMemory(spacingTable.length, className + ".spacingTable");
			for (i in 0...spacingTable.length) data.spacingTable.set(i, spacingTable[i]);
		}
		
		if (data.kerningTable == null && kerningTable != null)
		{
			data.kerningTable = new IntMemory(kerningTable.length, className + ".kerningTable");
			for (i in 0...kerningTable.length) data.kerningTable.set(i, kerningTable[i]);
		}
		
		_spacingTable = data.spacingTable;
		_kerningTable = data.kerningTable;
	}
}