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

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.fmt.ASCII;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.LinkedQueue;
import de.polygonal.ds.LinkedStack;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.gl.VectorRenderer;

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.Lib;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.net.FileReferenceList;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

private enum TokenType 
{
	VOID;
	CHAR;
	CHAR_INFO;
	INT;
	FLOAT;
	OPERATOR;
}

private enum OPCode 
{
	MOVE_TO;
	LINE_TO;
	CURVE_TO;
	STROKE;
	STROKE_CLOSE;
}

/** Reads Fontographer 4.1 .eps and .met files. */
class EPSFMetricsReader
{
	public function new(eps:String, met:String, range:Array<Array<Int>>)
	{
		charCodeRange = new Array<Bool>();
		
		for (i in range)
		{
			if (i.length == 2)
			{
				for (j in i[0]...i[1] + 1)
				{
					charCodeRange[j] = true;
				}
			}
			else
			{
				charCodeRange[i[0]] = true;
			}
		}
		
		for (i in 0...charCodeRange.length)
		{
			if (!charCodeRange[i])
				charCodeRange[i] = false;
		}
		
		trace("processing spacing & kerning table...");
		_readMet(met);
		trace("processing postscript data...");
		_readEps(eps);
	}
	
	public var name:String;
	
	public var isMonoSpace:Bool;
	public var emsquare:Int;
	public var ascent:Int;
	public var descent:Int;
	public var spacingValues:Array<Int>;
	public var kerningPairs:Array<KernInfo>;
	
	var _index:Int;
	
	function _readMet(source:String):Void
	{
		emsquare = _readSignedInteger(source);
		ascent   = _readSignedInteger(source);
		descent  = _readSignedInteger(source);
		
		var s0 = "% Output character spacing";
		var s1 = "% Output kerning pairs";
		
		var i0 = source.indexOf(s0) + s0.length;
		var i1 = source.indexOf(s1);
		
		var spacingData = source.substr(i0, i1 - i0);
		var kerningData = source.substr(i1 + s1.length);
		
		var que = new LinkedQueue<Token>();
		_scanMetrics(spacingData, que);
		_parseSpacing(que);
		
		var que = new LinkedQueue<Token>();
		_scanMetrics(kerningData, que);
		_parseKerning(que);
		
		isMonoSpace = true;
		var width = spacingValues[ASCII.EXCLAM];
		
		var width = -1;
		for (i in 0...charCodeRange.length)
		{
			if (charCodeRange[i])
			{
				if (width == -1)
					width = spacingValues[i];
				else
				{
					if (width != spacingValues[i])
					{
						isMonoSpace = false;
						break;
					}
				}
			}
		}
	}
	
	function _scanMetrics(s:String, queue:LinkedQueue<Token>):Void
	{
		_index = 0;
		
		var width = false;
		var paren = false;
		var escape = false;
		while (_index < s.length)
		{
			var code = s.charCodeAt(_index);
			var char = s.charAt(_index);
			if (code <= ASCII.SPACE)
			{
				if (char == ' ')
				{
					if (!paren)
					{
						_index++;
						continue;
					}
				}
				else
				{
					_index++;
					continue;
				}
			}
			
			switch (char)
			{
				case 'w':
				
				if (s.charAt(_index + 1) == "i")
				{
					_index += "width".length;
					continue;
				}
				
				case 'k':
				
				if (s.charAt(_index + 1) == "e")
				{
					_index += "kern".length;
					continue;
				}
				
				case '\\':
				
				if (paren)
				{
					if (escape)
						escape = false;
					else
					{
						escape = true;
						_index++;
						continue;
					}
				}
				
				case '(':
				
				if (escape)
				{
					escape = false;
				}
				else
				if (paren)
				{
					escape = false;
				}
				else
				{
					paren = true;
					_index++;
					continue;
				}
				
				case ')':
				
				if (escape)
				{
					escape = false;
				}
				else
				{
					paren = false;
					_index++;
					continue;
				}
			}
			
			var token = new Token();
			if (paren)
			{
				token.type = TokenType.CHAR;
				token.char = char;
			}
			else
			{
				var sign = (s.charAt(_index) == '-');
				if ((code >= ASCII.ZERO && code <= ASCII.NINE) || sign)
				{
					token.type = TokenType.INT;
					
					if (sign) token.int = _readSignedInteger(s);
					else token.int = _readUnsignedInteger(s);
				}
				else
				{
					token.type = TokenType.CHAR;
					token.char = s.charAt(_index);
				}
			}
			
			if (token.type != TokenType.VOID)
				queue.enqueue(token);
			_index++;
		}
	}
	
	function _parseSpacing(source:LinkedQueue<Token>):Void
	{
		spacingValues = new Array<Int>();
		
		var stack = new LinkedStack<Token>();
		while (source.size() > 0)
		{
			var token = source.dequeue();
			stack.push(token);
			
			if (stack.size() == 2)
			{
				var width = stack.pop().int;
				
				var charCode, char;
				
				var token = stack.pop();
				if (token.type == TokenType.INT)
				{
					charCode = token.int;
					char = String.fromCharCode(charCode);
				}
				else
				{
					charCode = token.char.charCodeAt(0);
					char = token.char;
				}
				
				//SPACE is required
				if (!charCodeRange[charCode] && charCode != ASCII.SPACE) continue;
				spacingValues[charCode] = width;
			}
		}
	}
	
	function _parseKerning(source:LinkedQueue<Token>):Void
	{
		kerningPairs = new Array<KernInfo>();
		
		var stack = new LinkedStack<Token>();
		while (source.size() > 0)
		{
			var token = source.dequeue();
			stack.push(token);
			
			if (stack.size() == 3)
			{
				token = stack.pop();
				var v = token.int;
				
				token = stack.pop();
				var b = -1;
				if (token.type == CHAR)
					b = token.char.charCodeAt(0);
				else
				if (token.type == INT)
					b = token.int;
				
				token = stack.pop();
				var a = -1;
				if (token.type == CHAR)
					a = token.char.charCodeAt(0);
				else
				if (token.type == INT)
					a = token.int;
				
				if (charCodeRange[a] && charCodeRange[b])
					kerningPairs.push(new KernInfo(a, b, v));	
			}
		}
	}
	
	public var glyphBounds:Array<AABB2>;
	public var glyphData:Array<LinkedQueue<Dynamic>>;
	
	public var charCodeRange:Array<Bool>;
	
	var _maxHeight:Float;
	
	var _vr:VectorRenderer;
	var _canvas:Sprite;
	var _xPenOffset:Float;
	var _yPenOffset:Float;
	
	function _readEps(source:String):Void
	{
		glyphBounds = new Array<AABB2>();
		_maxHeight = -1;
		
		_vr = new VectorRenderer();
		_canvas = new Sprite();
		Lib.current.addChild(_canvas);
		_canvas.x = 100;
		_canvas.y = 100;
		_xPenOffset = 0;
		_yPenOffset = 0;
		
		var x = source.indexOf("%%[Char name=]");
		source = source.substr(x);
		
		var que = new LinkedQueue<Token>();
		
		trace("scanning...");
		_scanEPSF(source, que);
		
		//var t:LinkedQueue<Token> = cast que.clone(true);
		//while (t.size() > 0) trace(t.dequeue());
		
		trace("parsing...");
		_parseEPSF(que);
	}
	
	/** Nullifies references so all used resources can be garbage collected. */
	public function free():Void
	{
		_vr.free();
		_canvas.graphics.clear();
	}
	
	function _scanEPSF(s:String, queue:LinkedQueue<Token>):Void
	{
		_index = 0;
		while (_index < s.length)
		{
			var t = new Token();
			var c = s.charAt(_index);
			switch (c)
			{
				case '%':
				
				while (c == '%') c = s.charAt(++_index);
				if (c == 'T')
				{
					//%%Trailer
					t.type = VOID;
					return;
				}
				else
				if (c == '[')
				{
					//%%[Char name=], Char number, x offset, y offset, x width, y width, unicode value
					//%%Note:exclam=33 9 620 34.729 0 33
					while (c != ':') c = s.charAt(++_index);
					while (c != '=') c = s.charAt(++_index);
					_index++;
					
					t.type = CHAR_INFO;
					t.charInfo = new CharInfo();
					t.charInfo.charNumber   = _readUnsignedInteger(s);
					t.charInfo.xOffset      = _readFloat(s);
					t.charInfo.yOffset      = _readFloat(s);
					t.charInfo.xWidth       = _readFloat(s);
					t.charInfo.yWidth       = _readFloat(s);
					t.charInfo.unicodeValue = _readSignedInteger(s);
				}
				
				case '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-':
				
				t.float = _readFloat(s);
				t.type = FLOAT;
				
				case 'm':
				
				t.type = OPERATOR;
				t.operator = MOVE_TO;
				
				case 'c':
				
				t.type = OPERATOR;
				t.operator = CURVE_TO;
				
				case 'l':
				
				t.type = OPERATOR;
				t.operator = LINE_TO;
				
				case 's':
				
				t.type = OPERATOR;
				t.operator = STROKE;
				
				case 'S':
				
				t.type = OPERATOR;
				t.operator = STROKE_CLOSE;
			}
			
			if (t.type != VOID)
				queue.enqueue(t);
			_index++;
		}
	}
	
	function _parseEPSF(source:LinkedQueue<Token>):Void
	{
		_vr.setLineStyle(0, 0.5, 0);
		_vr.crossHair3(0, 0, 20);
		
		glyphData = new Array<LinkedQueue<Dynamic>>();
		
		var foundGlyphs = new Array<Bool>();
		
		var buffer = new LinkedQueue<Token>();
		while (source.size() > 0)
		{
			var token = source.dequeue();
			if (token.type == CHAR_INFO)
			{
				if (buffer.size() > 1)
				{
					var charInfo = buffer.peek().charInfo;
					trace( buffer.peek() );
					var charNumber = charInfo.charNumber;
					if (charCodeRange[charNumber])
					{
						foundGlyphs[charNumber] = true;
						
						_flush(buffer, glyphData[charNumber] = new LinkedQueue<Dynamic>());
						//offset character rendering
						if (_xPenOffset > 600)
						{
							_xPenOffset = 0;
							_yPenOffset += _maxHeight + 10;
							_maxHeight = -1;
						}
					}
					else
						buffer.clear();
				}
			}
			
			buffer.enqueue(token);
		}
		
		var charInfo = buffer.peek().charInfo;
		var charNumber = charInfo.charNumber;
		foundGlyphs[charNumber] = true;
		glyphData[charNumber] = new LinkedQueue<Dynamic>();
		if (charCodeRange[charNumber]) _flush(buffer, glyphData[charNumber]);
		
		//untag missing glyphs
		for (i in 33...charCodeRange.length)
		{
			if (!foundGlyphs[i])
			{
				trace(Sprintf.format("char %d is missing", [i]));
				charCodeRange[i] = false;
			}
		}
		
		_vr.flush(_canvas.graphics);
	}
	
	function _flush(buffer:LinkedQueue<Token>, output:LinkedQueue<Dynamic>):Void
	{
		_vr.setLineStyle(0, 1, 0);
		
		var stack = new LinkedStack<Token>();
		
		var x = 0.0;
		var y = 0.0;
		
		var aabb = new AABB2();
		
		var token = buffer.dequeue();
		
		#if debug
		Assert.assert(token.type == CHAR_INFO, "token.type == CHAR_INFO");
		#end
		
		var char = token.charInfo;
		
		//char width
		_vr.style.setLineColor(0x8000FF, 0.5);
		_vr.style.lineThickness = 1;
		_vr.applyLineStyle();
		
		_vr.moveTo2(_xPenOffset + 2, _yPenOffset + 5);
		_vr.lineTo2(_xPenOffset - 2 +  spacingValues[char.charNumber] / emsquare * 100, _yPenOffset + 5);
		_vr.moveTo2(0, 0);
		_vr.style.lineColor = 0x000000;
		_vr.style.lineThickness = 0;
		_vr.applyLineStyle();
		
		var c = 0;
		var xOffset = 0.0;
		var yOffset = 0.0;
		
		for (i in 0...buffer.size())
		{
			var token = buffer.dequeue();
			stack.push(token);
			if (token.type == OPERATOR)
			{
				switch (token.operator)
				{
					case STROKE, STROKE_CLOSE:
						
						stack.pop();
						
					case MOVE_TO:
						
						stack.pop();
						
						y = stack.pop().float;
						x = stack.pop().float;
						
						#if debug
						Assert.assert(x < 1000.0, "x < 1000.0" + x);
						Assert.assert(y < 1000.0, "x < 1000.0" + y);
						#end
						
						//first move command eq. offset
						if (c == 0)
						{
							c++;
							xOffset = x;
							yOffset = y;
							continue;
						}
						
						var p = _transform(x, y, xOffset, yOffset);
						x = p.x;
						y = p.y;
						
						output.enqueue('m');
						output.enqueue(x);
						output.enqueue(y);
						
						
						_drawMoveTo(x, y, c);
						
						//drawIndex(x, y, 'm' + c);
						c++;
						
					case LINE_TO:
						
						stack.pop();
						y = stack.pop().float;
						x = stack.pop().float;
						
						#if debug
						Assert.assert(x < 1000.0, "x < 1000.0" + x);
						Assert.assert(y < 1000.0, "x < 1000.0" + y);
						#end
						
						var p = _transform(x, y, xOffset, yOffset);
						x = p.x;
						y = p.y;
						
						output.enqueue('l');
						output.enqueue(x);
						output.enqueue(y);
						
						aabb.addPoint(x, y);
						
						_drawLineTo(x, y, c);
						
						//drawIndex(x, y, 'l' + c);
						c++;
						
					case CURVE_TO:
						
						stack.pop();
						var y3 = stack.pop().float;
						var x3 = stack.pop().float;
						
						#if debug
						Assert.assert(x3 < 1000.0, "x3 < 1000.0" + x3);
						Assert.assert(y3 < 1000.0, "x3 < 1000.0" + y3);
						#end
						
						var p = _transform(x3, y3, xOffset, yOffset);
						x3 = p.x;
						y3 = p.y;
						
						var y2 = stack.pop().float;
						var x2 = stack.pop().float;
						
						#if debug
						Assert.assert(x2 < 1000.0, "x2 < 1000.0" + x2);
						Assert.assert(y2 < 1000.0, "x2 < 1000.0" + y2);
						#end
						
						var p = _transform(x2, y2, xOffset, yOffset);
						x2 = p.x;
						y2 = p.y;
						
						var y1 = stack.pop().float;
						var x1 = stack.pop().float;
						
						#if debug
						Assert.assert(x1 < 1000.0, "x1 < 1000.0" + x1);
						Assert.assert(y1 < 1000.0, "y1 < 1000.0" + y1);
						#end
						
						var p = _transform(x1, y1, xOffset, yOffset);
						x1 = p.x;
						y1 = p.y;
						
						aabb.addPoint(x3, y3);
						aabb.addPoint(x2, y2);
						aabb.addPoint(x1, y1);
						aabb.addPoint(x, y);
						
						output.enqueue('c');
						output.enqueue(x);
						output.enqueue(y);
						output.enqueue(x1);
						output.enqueue(y1);
						output.enqueue(x2);
						output.enqueue(y2);
						output.enqueue(x3);
						output.enqueue(y3);
						
						_drawCurveTo(x, y, x1, y1, x2, y2, x3, y3);
						
						//drawIndex(x, y, 'c' + (c + 0));
						//drawIndex(x, y, 'c' + (c + 1));
						//drawIndex(x, y, 'c' + (c + 2));
						//drawIndex(x, y, 'c' + (c + 3));
						
						x = x3;
						y = y3;
						c += 4;
				}
			}
		}
		
		glyphBounds[char.charNumber] = aabb.clone();
		_maxHeight = Math.max(_maxHeight, aabb.intervalY);
		
		aabb.minX += _xPenOffset;
		aabb.maxX += _xPenOffset;
		aabb.minY += _yPenOffset;
		aabb.maxY += _yPenOffset;
		
		_vr.setFillColor(0xFFFF80, 0.1);
		_vr.clearStroke();
		_vr.fillStart();
		_vr.aabb(aabb);
		_vr.fillEnd();
		_xPenOffset += x;
	}
	
	function _drawMoveTo(x:Float, y:Float, c:Int):Void
	{
		x += _xPenOffset;
		y += _yPenOffset;
		_vr.setLineStyle(0xFF8000, 1, 0);
		_vr.crossHair3(x, y , 4);
		_vr.moveTo2(x, y);
	}
	
	function _drawLineTo(x:Float, y:Float, c:Int):Void
	{
		x += _xPenOffset;
		y += _yPenOffset;
		_vr.setLineStyle(0x00FF00, 1, 0);
		_vr.lineTo2(x, y);
	}
	
	function _drawCurveTo(x:Float, y:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float):Void
	{
		x  += _xPenOffset;
		y  += _yPenOffset;
		x1 += _xPenOffset;
		y1 += _yPenOffset;
		x2 += _xPenOffset;
		y2 += _yPenOffset;
		x3 += _xPenOffset;
		y3 += _yPenOffset;
		
		_vr.setLineStyle(0x00FFFF, 1, 0);
		_vr.bezier8(x, y, x1, y1, x2, y2, x3, y3, 0.0);
		
		//_vr.setLineStyle(0xFF00FF, 0.25, 0);
		//_vr.crossHair2(x, y, 2);
		//_vr.crossHair2(x1, y1, 2);
		//_vr.crossHair2(x2, y2, 2);
		//_vr.crossHair2(x3, y3, 2);
	}
	
	function _drawIndex(x:Float, y:Float, s:String):Void
	{
		x += _xPenOffset;
		y += _yPenOffset;
		var tf = new TextField();
		tf.text = s;
		tf.setTextFormat(new TextFormat("Arial", 2, 0));
		tf.selectable = false;
		tf.autoSize = TextFieldAutoSize.LEFT;
		_canvas.addChild(tf);
		tf.x = x - tf.width / 2;
		tf.y = y - tf.height / 2;
	}
	
	function _transform(x:Float, y:Float, xOffset:Float, yOffset:Float):Vec2
	{
		var m = new Matrix();
		m.tx = -xOffset;
		m.ty = -yOffset;
		m.scale(1.0, -1.0);
		var p = m.transformPoint(new Point(x, y));
		return new Vec2(p.x, p.y);
	}
	
	function _readSignedInteger(s:String):Int
	{
		var x = 0;
		while (true)
		{
			var code = s.charCodeAt(_index);
			if ((code < 48 || code > 57) && code != 45)
			{
				_index++;
				continue;
			}
			break;
		}
		
		var sign = 1;
		if (s.charAt(_index) == '-')
		{
			sign = -1;
			_index++;
		}
		
		while (true)
		{
			var code = s.charCodeAt(_index);
			if (code >= 48 && code <= 57)
			{
				x *= 10;
				x += (code - 48);
				_index++;
				continue;
			}
			break;
		}
		
		return x * sign;
	}
	
	function _readUnsignedInteger(s:String):Int
	{
		var x = 0;
		while (true)
		{
			var code = s.charCodeAt(_index);
			if (code < 48 || code > 57)
			{
				_index++;
				continue;
			}
			break;
		}
		while (true)
		{
			var code = s.charCodeAt(_index);
			if (code >= 48 && code <= 57)
			{
				x *= 10;
				x += (code - 48);
				_index++;
				continue;
			}
			break;
		}
		return x;
	}
	
	function _readFloat(s:String):Float
	{
		var x = 0.0;
		
		while (true)
		{
			var code = s.charCodeAt(_index);
			if ((code < 48 || code > 57) && code != 45 && code != 46)
			{
				_index++;
				continue;
			}
			break;
		}
		
		var sign = 1;
		if (s.charAt(_index) == '-')
		{
			sign = -1;
			_index++;
		}
		
		while (true)
		{
			var code = s.charCodeAt(_index);
			if (code >= 48 && code <= 57)
			{
				x *= 10.0;
				x += (code - 48);
				_index++;
				continue;
			}
			break;
		}
		
		var code = s.charCodeAt(_index);
		if (code == 46)
		{
			_index++;
			var divisor = 10.0;
			while (true)
			{
				var code = s.charCodeAt(_index);
				if (code >= 48 && code <= 57)
				{
					x += (code - 48) / divisor;
					divisor *= 10.0;
					_index++;
					continue;
				}
				break;
			}
		}
		
		return x * sign;
	}
}

private class Token
{
	public var type:TokenType;
	
	public var charInfo:CharInfo;
	public var char:String;
	public var int:Int;
	public var float:Float;
	public var operator:OPCode;
	
	public function new()
	{
		type = VOID;
	}
	
	public function toString():String
	{
		switch (type)
		{
			case VOID:
			
			return "VOID";
			
			case CHAR:
			
			return Sprintf.format("CHAR %s[%d]", [char, char.charCodeAt(0)]);
			
			case CHAR_INFO:
			
			return Sprintf.format("CHAR_INFO #%d x: %.3f y: %.3f w: %.3f h: %.3f uni %d",
				[charInfo.charNumber, charInfo.xOffset, charInfo.yOffset, charInfo.xWidth, charInfo.yWidth, charInfo.unicodeValue]);
			
			case FLOAT:
			
			return Sprintf.format("FLOAT %.3f", [float]);
			
			case INT:
			
			return Sprintf.format("INT %.3f", [int]);
			
			case OPERATOR:
			
			return Sprintf.format("OPERATOR %s", [operator]);
		}
	}
}

private class CharInfo
{
	public var charNumber:Int;
	public var xOffset:Float;
	public var yOffset:Float;
	public var xWidth:Float;
	public var yWidth:Float;
	public var unicodeValue:Int;
	
	public function new()
	{
	}
}

private class KernInfo
{
	public var a:Int;
	public var b:Int;
	public var kern:Int;
	
	public function new(a:Int, b:Int, kern:Int)
	{
		this.a = a;
		this.b = b;
		this.kern = kern;
	}
	
	public function toString():String
	{
		return Sprintf.format("KernInfo a: %d[%s] b: %d[%s] kern: %d", [a, String.fromCharCode(a), b, String.fromCharCode(b), kern]);
	}
}