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
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * The base class of a monospaced typeface which uses a single standard width for the glyphs.
 */
class MonospaceVectorFont extends VectorFont
{
	var _charWidth:Float;
	
	#if font_inline
	function new(emsquare:Int, ascent:Int, descent:Int, width:Int, boundTable:Array<Float>)
	{
		super(emsquare, ascent, descent, boundTable);
		_charWidth = _transform(width);
	}
	#else
	function new(bytes:String)
	{
		super(bytes);
		
		var h = _handler;
		
		_emsquare  = h.emsquare;
		_ascent    = h.ascent  / h.emsquare * 100.;
		_descent   = h.descent / h.emsquare * 100.;
		_charWidth = h.width   / h.emsquare * 100.;
		_cmd       = h.glyphCommands;
		_pos       = h.glyphData;
		
		_setGlyphBounds(h.glyphBounds);
	}
	#end
	
	override public function write(s:String, x:Float, y:Float, ?centered = false, ?bound:AABB2, ?tight = false):AABB2
	{
		if (s.length == 0) return null;
		
		var lx = .0;
		var ly = .0;
		
		if (centered)
		{
			var b = getBound(s, x, y, false, true, _aabb);
			var offset = -((b.intervalX) / 2) + (x - b.minX) * 2;
			b.minX += offset;
			b.maxX += offset;
			offset = -((b.intervalY) / 2) + (y - b.minY) * 2;
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
		
		for (i in 0...s.length)
		{
			var code = _getCharCode(s, i);
			
			switch (code)
			{
				case ASCII.SPACE:
				
				lx += _scale * _charWidth;
				if (outputBound) maxX0 = x + lx;
				
				case ASCII.NEWLINE:
				
				lx = 0;
				ly += (_ascent - _descent) * _scale;
				
				case ASCII.TAB:
				
				lx = _getTabOffset(lx, _charWidth * _scale);
				if (outputBound) maxX0 = minX0 + lx;
				
				default:
				
				_draw(code, x + lx, y + ly, _scale, bezierThreshold);
				if (outputBound)
				{
					var b = _glyphBounds[code];
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
						maxX1 = x + lx + _charWidth * _scale;
						minY1 = y + ly - _ascent  * _scale;
						maxY1 = y + ly - _descent * _scale;	
					}
					if (minX1 < minX0) minX0 = minX1;
					if (minY1 < minY0) minY0 = minY1;
					if (maxX1 > maxX0) maxX0 = maxX1;
					if (maxY1 > maxY0) maxY0 = maxY1;
				}
				lx += _scale * _charWidth;
			}
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
		
		for (i in 0...s.length)
		{
			var code = _getCharCode(s, i);
			
			switch (code)
			{
				case ASCII.SPACE:
				
				lx += _scale * _charWidth;
				maxX0 = x + lx;
				
				case ASCII.NEWLINE:
				
				lx = 0;
				ly += (_ascent - _descent) * _scale;
				
				case ASCII.TAB:
				
				lx = _getTabOffset(lx, _charWidth * _scale);
				maxX0 = minX0 + lx;
				
				default:
				
				var b = _glyphBounds[code];
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
					maxX1 = x + lx + _charWidth * _scale;
					minY1 = y + ly - _ascent  * _scale;
					maxY1 = y + ly - _descent * _scale;	
				}
				if (minX1 < minX0) minX0 = minX1;
				if (minY1 < minY0) minY0 = minY1;
				if (maxX1 > maxX0) maxX0 = maxX1;
				if (maxY1 > maxY0) maxY0 = maxY1;
				lx += _scale * _charWidth;
			}
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
		
		for (i in 0...text.length)
		{
			var code = _getCharCode(text, i);
			if (code == ASCII.SPACE)
				xt += _scale * _charWidth;
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
					maxX1 = xt + (_scale * _charWidth);
					minY1 = yt - _ascent * _scale;
					maxY1 = yt - _descent * _scale;
				}
				
				if (minX1 < minX0) minX0 = minX1;
				if (minY1 < minY0) minY0 = minY1;
				if (maxX1 > maxX0) maxX0 = maxX1;
				if (maxY1 > maxY0) maxY0 = maxY1;
				
				output[k++] = new AABB2(minX1, minY1, maxX1, maxY1);
				xt += (_scale * _charWidth);
			}
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
}