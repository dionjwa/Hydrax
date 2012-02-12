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
package de.polygonal.gl.text.util;

import de.polygonal.core.io.Base64;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.fmt.ASCII;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.LinkedQueue;
import flash.utils.ByteArray;

/**
 * Generates a formatted class from the font data of an <i>EPSFMetricsReader</i> object.
 */
class ClassFormatter
{
	/** The formatted class. */
	public var output:String;
	
	var _data:EPSFMetricsReader;
	
	public function new(data:EPSFMetricsReader)
	{
		_data = data;
		
		var s = '';
		
		var formattedGlyphData = formatGlyphs();
		
		s += _writeLine(Sprintf.format("package de.polygonal.gl.text.fonts;", [_data.name]));
		s += _writeEmptyLine();
		s += _writeLine("import de.polygonal.gl.text.VectorFont;");
		s += _writeEmptyLine();
		s += _writeLine(Sprintf.format("class %s extends de.polygonal.gl.text.%s", [_data.name, _data.isMonoSpace ? "MonospaceVectorFont" : "ProportionalVectorFont"]));
		s += _writeLine("{");
		
		var superArgs = '';
		if (_data.isMonoSpace)
			superArgs = Sprintf.format("super(%d, %d, %d, %d, %s);", [_data.emsquare, _data.ascent, _data.descent, _data.spacingValues[33], "BOUNDS_TABLE"]);
		else
		{
			var kerning = _data.kerningPairs.length == 0 ? 'null' : "KERNING_TABLE";
			superArgs = Sprintf.format("super(%d, %d, %d, %s, %s, %s);", [_data.emsquare, _data.ascent, _data.descent, "BOUNDS_TABLE", "SPACING_TABLE", kerning]);
		}
		
		s += _writeLine("public function new()", 1);
		s += _writeLine("{", 1);
		
		
		s += _writeLine("#if font_inline", 2);
		s += _writeLine(superArgs, 2);
		s += _writeLine("#else", 2);
		s += _writeLine("super(", 2);
		s += _blockIndent(formatBytes() + ");", 2);
		s += _writeLine("#end", 2);
		s += _writeLine("}", 1);
		s += _writeEmptyLine(1);
		s += _writeLine("#if font_inline", 1);
		
		if (!_data.isMonoSpace)
		{
			var formattedSpacingData = formatSpacing();
			//trace(formattedSpacingData);
			
			s += formattedSpacingData + "\n";
			
			if (_data.kerningPairs.length > 0)
			{
				var formattedKerningData = formatKerning();
				s += formattedKerningData + "\n";
			}
			//trace(formattedKerningData);
		}
		
		s += _blockIndent(_formatBound(), 1);
		s += _writeEmptyLine();
		s += formattedGlyphData;
		s += _writeLine("#end", 1);
		s += '}';
		
		output = s;
	}
	
	function formatBytes():String
	{
		var h = new ByteArrayHandler();
		h.writeBytes(_data);
		var bytes = h.bytes;
		var s = Base64.encode(bytes, true, 200);
		var t = s.split("\n");
		for (i in 0...t.length)
			t[i] = '"' + t[i] + '"';
		return t.join("+\n") + "\n";
	}
	
	function formatSpacing():String
	{
		var s = _formatIntArray(20, "%4d", _data.spacingValues);
		s = "static var SPACING_TABLE:Array<Int> =\n[\n" + _blockIndent(s + '\n', 1) + "];\n";
		s = _blockIndent(s, 1);
		return s;
	}
	
	function formatKerning():String
	{
		var s = _formatIntArray(20, "%4d", KerningTable.compute(_data));
		s = "static var KERNING_TABLE:Array<Int> =\n[\n" + _blockIndent(s + '\n', 1) + "];\n";
		s = _blockIndent(s, 1);
		return s;
	}
	
	function formatGlyphs():String
	{
		var formattedOutput = '';
		
		for (i in 0..._data.charCodeRange.length)
		{
			if (!_data.charCodeRange[i]) continue;
			
			var que:LinkedQueue<Dynamic> = cast _data.glyphData[i].clone(true);
			if (que == null) continue;
			
			trace(Sprintf.format("formatting char code %d", [i]));
			
			var valPos = 0;
			var cmdPos = 0;
			
			var s = '';
			var valStr = '';
			var cmdStr = '';
			
			while (que.size() > 0)
			{
				var k = que.dequeue();
				switch (k)
				{
					case 'm':
						
						var x = que.dequeue();
						var y = que.dequeue();
						valStr += Sprintf.format("_setf(%s + (%2d << 2), x + %#8.3f * s);\n", ['o', valPos++, x]);
						valStr += Sprintf.format("_setf(%s + (%2d << 2), y + %#8.3f * s);\n", ['o', valPos++, y]);
						cmdStr += Sprintf.format("_setb(%s + %2d, 1);\n", ['o', cmdPos++]);
						
						
					case 'l':
						
						var x = que.dequeue();
						var y = que.dequeue();
						valStr += Sprintf.format("_setf(%s + (%2d << 2), x + %#8.3f * s);\n", ['o', valPos++, x]);
						valStr += Sprintf.format("_setf(%s + (%2d << 2), y + %#8.3f * s);\n", ['o', valPos++, y]);
						cmdStr += Sprintf.format("_setb(%s + %2d, 2);\n", ['o', cmdPos++]);
						
					case 'c':
						
						if (valPos > 0)
						{
							s += Sprintf.format("o = _posf(%d);\n", [valPos]);
							s += valStr;
							s += Sprintf.format("o = _posb(%d);\n", [cmdPos]);
							s += cmdStr;
							
							valStr = '';
							cmdStr = '';
							valPos = 0;
							cmdPos = 0;
						}
						
						var x0 = que.dequeue();
						var y0 = que.dequeue();
						var x1 = que.dequeue();
						var y1 = que.dequeue();
						var x2 = que.dequeue();
						var y2 = que.dequeue();
						var x3 = que.dequeue();
						var y3 = que.dequeue();
						s += Sprintf.format("_vr.bezier8(x + %#8.3f * s,y + %#8.3f * s,x + %#8.3f * s,y + %#8.3f * s,x + %#8.3f * s,y + %#8.3f * s,x + %#8.3f * s,y + %#8.3f * s, threshold);\n",
							[x0, y0, x1, y1, x2, y2, x3, y3]);
				}
			}
			
			if (valPos > 0)
			{
				var valOffset = Sprintf.format("o = _posf(%d);\n", [valPos]);
				var cmdOffset = Sprintf.format("o = _posb(%d);\n", [cmdPos]);
				s += valOffset;
				s += valStr;
				s += cmdOffset;
				s += cmdStr;
			}
			
			s = Sprintf.format("\ncase %d:\n\n", [i]) + s;
			s = _blockIndent(s, 3);
			formattedOutput += s;
		}
		
		var s = '';
		s += "\toverride function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void\n";
		s += "\t{\n";
		s += "\t\tvar o = 0;\n";
		s += "\t\tswitch (charCode)\n";
		s += "\t\t{";
		s += formattedOutput;
		s += "\t\t}\n";
		s += "\t}\n";
		formattedOutput = s;
		
		return formattedOutput;
	}
	
	function _formatBound():String
	{
		var data = new Array<Float>();
		var t = _data.glyphBounds;
		for (i in 0...t.length)
		{
			var bound = t[i];
			if (bound != null)
			{
				var charCode = i;
				data.push(charCode);
				data.push(bound.minX);
				data.push(bound.minY);
				data.push(bound.maxX);
				data.push(bound.maxY);
			}
		}
		
		var t = new Array<String>();
		var i = 0;
		var k = Std.int(data.length / 5);
		for (i in 0...k)
			t.push(Sprintf.format("%4d, %10.3f, %10.3f, %10.3f, %10.3f", data.slice(i * 5, i * 5 + 5)));
		
		return "static var BOUNDS_TABLE:Array<Float> =\n[\n" + _blockIndent( t.join(",\n") + "\n", 1) + "];\n";
	}
	
	function _writeLine(text:String, ?indent:Int = 0):String
	{
		var tabs = StringTools.rpad('', "\t", indent);
		return tabs + text + "\n";
	}
	
	function _writeEmptyLine(?indent:Int = 0):String
	{
		return StringTools.rpad('', "\t", indent) + "\n";
	}
	
	function _blockIndent(s:String, levels:Int):String
	{
		var tabs = StringTools.rpad('', "\t", levels);
		var a = s.split("\n");
		var t = a.pop();
		return tabs + a.join("\n" + tabs) + t + "\n";
	}
	
	function _formatIntArray(cols:Int, format:String, data:Array<Int>):String
	{
		var t = new Array<String>();
		var i = 0;
		var k = data.length;
		var cols = 20;
		var remainder = k % cols;
		while (k > remainder)
		{
			t.push(Sprintf.format(_repeat(format, cols, ", "), data.slice(i * cols, i * cols + cols)));
			i++;
			k -= cols;
		}
		
		if (remainder > 0)
		{
			//throw remainder;
			var s = '';
			if (remainder > 1)
			{
				s = Sprintf.format(_repeat(format, remainder - 1, ", "), data.slice(data.length - remainder, data.length - 1));
				s += Sprintf.format(", " + format, [data[data.length - 1]]);
			}
			else
				s = Sprintf.format(format, [data[data.length - 1]]);
			
			t.push(s);
		}
		
		return t.join(",\n");
	}
	
	function _repeat(s:String, count:Int, sep:String):String
	{
		var a = []; for (i in 0...count) a.push(s);
		return a.join(sep);
	}
}