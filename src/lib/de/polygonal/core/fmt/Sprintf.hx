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
package de.polygonal.core.fmt;

import de.polygonal.ds.Bits;
import de.polygonal.core.fmt.ASCII;

using de.polygonal.core.fmt.NumberFormat;
using de.polygonal.core.math.Mathematics;
using de.polygonal.core.fmt.ASCII;
using de.polygonal.ds.Bits;
using Std;

//TODO unsigned flag

/**
 * <p>A C sprintf implementation.</p>
 * <p>See <a href="http://www.cplusplus.com/reference/clibrary/cstdio/sprintf.html" target="_blank">http://www.cplusplus.com/reference/clibrary/cstdio/sprintf.html</a> for a complete reference.</p>
 */
class Sprintf
{
	inline static var BIT_MINUS = Bits.BIT_01;
	inline static var BIT_PLUS  = Bits.BIT_02;
	inline static var BIT_SPACE = Bits.BIT_03;
	inline static var BIT_SHARP = Bits.BIT_04;
	inline static var BIT_ZERO  = Bits.BIT_05;

	inline static var BIT_h     = Bits.BIT_06;
	inline static var BIT_l     = Bits.BIT_07;
	inline static var BIT_L     = Bits.BIT_08;
	
	inline static var BIT_c     = Bits.BIT_09;
	inline static var BIT_d     = Bits.BIT_10;
	inline static var BIT_i     = Bits.BIT_11;
	inline static var BIT_e     = Bits.BIT_12;
	inline static var BIT_E     = Bits.BIT_13;
	inline static var BIT_f     = Bits.BIT_14;
	inline static var BIT_g     = Bits.BIT_15;
	inline static var BIT_G     = Bits.BIT_16;
	inline static var BIT_o     = Bits.BIT_17;
	inline static var BIT_s     = Bits.BIT_18;
	inline static var BIT_u     = Bits.BIT_19;
	inline static var BIT_x     = Bits.BIT_20;
	inline static var BIT_X     = Bits.BIT_21;
	inline static var BIT_p     = Bits.BIT_22;
	inline static var BIT_n     = Bits.BIT_23;
	inline static var BIT_b     = Bits.BIT_24;
	
	inline static var MASK_SPECIFIERS = BIT_c | BIT_d | BIT_i | BIT_e | BIT_E |
										BIT_f | BIT_g | BIT_G | BIT_o | BIT_s |
										BIT_u | BIT_x | BIT_X | BIT_p | BIT_n | BIT_b;
	
	static var _instance:Sprintf = null;
	
	/**
	 * Writes formatted data to a string.
	 * @param fmt the string that contains the formatted text.<br/>
	 * It can optionally contain embedded format tags that are substituted by the values specified in subsequent argument(s) and formatted as requested.<br/>
	 * The number of arguments following the format parameters should at least be as much as the number of format tags.<br/>
	 * The format tags follow this prototype: '%[flags][width][.precision][length]specifier'.
	 * @param arg depending on the format string, the function may expect a sequence of additional arguments, each containing one value to be inserted instead of each %-tag specified in the format parameter, if any.<br/>
	 * The argument array length should match the number of %-tags that expect a value.
	 * @return the formatted string.
	 */
	public static function format(fmt:String, arg:Array<Dynamic>):String
	{
		if (_instance == null)
			_instance = new Sprintf();
		return _instance._format(fmt, arg);
	}
	
	#if flash10
	var _bits:flash.Vector<Int>;
	#else
	var _bits:Array<Int>;
	#end
	
	function new()
	{
		#if flash10
		_bits = new flash.Vector<Int>(0xff, true);
		#else
		_bits = new Array<Int>();
		#end
		var format = "-+ #0hlLcdieEfgGosuxXpnb";
		for (i in 0...0xff) _bits[i] = 0;
		for (i in 0...format.length) _bits[cca(format, i)] = 1 << i;
	}
	
	function _format(fmt:String, arg:Array<Dynamic>):String
	{
		var a = 0;
		var o = "";
		var i = 0;
		var k = fmt.length;
		while (i < k)
		{
			var c = cca(fmt, i++);
			if (c == ASCII.PERCENT)
			{
				//found "%", check if next character is also "%"
				c = cca(fmt, i++);
				if (c == 37)
				{
					//output "%"
					o += "%";
				}
				else
				{
					//{read flags: -+(space)#0
					var bits = 0;
					while (_bits[c].hasBits(BIT_MINUS | BIT_ZERO | BIT_SPACE | BIT_PLUS | BIT_SHARP))
					{
						bits = bits.setBits(_bits[c]);
						c = cca(fmt, i++);
					}
					if (bits.incBits(BIT_MINUS | BIT_ZERO))
					{
						#if verbose
						trace("warning: `0' flag ignored with '-' flag in printf format");
						#end
						bits = bits.clrBits(BIT_ZERO);
					}
					if (bits.incBits(BIT_SPACE | BIT_PLUS))
					{
						#if verbose
						trace("warning: ` ' flag ignored with '+' flag in printf format");
						#end
						bits = bits.clrBits(BIT_SPACE);
					}
					//}
					//{read width: (number) or "*"
					var widthFromArgument = false;
					var width = 0;
					if (c == ASCII.ASTERISK)
					{
						widthFromArgument = true;
						c = cca(fmt, i++);
					}
					else
					{
						//0..9
						if (c.isDigit())
						{
							width = c - ASCII.ZERO;
							c = cca(fmt, i++);
							if (c.isDigit())
							{
								width = c - ASCII.ZERO + width * 10;
								c = cca(fmt, i++);
								if (c.isDigit())
								{
									//TODO warning truncating number
									while (c.isDigit())
										c = cca(fmt, i++);
								}
							}
						}
					}
					//}
					//{read .precision: ".number" or ".*"
					var precision = -1;
					if (c == ASCII.PERIOD)
					{
						c = cca(fmt, i++);
						if (c == ASCII.ASTERISK)
						{
							precision = Std.int(arg[a++]);
							c = cca(fmt, i++);
						}
						else
						{
							if (c.isDigit())
							{
								precision = c - ASCII.ZERO;
								c = cca(fmt, i++);
								if (c.isDigit())
								{
									precision = c - ASCII.ZERO + precision * 10;
									c = cca(fmt, i++);
									if (c.isDigit())
									{
										//TODO warning truncating number
										while (c.isDigit())
											c = cca(fmt, i++);
									}
								}
							}
							else
								precision = 0;
						}
					}
					//}
					//{read length: hlL
					while (_bits[c].hasBits(BIT_h | BIT_l | BIT_L))
					{
						bits = bits.setBits(_bits[c]);
						c = cca(fmt, i++);
					}
					//}
					//{read specifier: cdieEfgGosuxX
					var x = "";
					if (widthFromArgument) width = arg[a++];
					var f = _bits[c];
					if (f.hasBits(MASK_SPECIFIERS))
					{
						if (f.hasBits(BIT_f))
						{
							//"f" : decimal floating point
							
							//set default precision if not specified
							if (precision == -1) precision = 6;
							
							var n:Float = arg[a++];
							
							if (precision == 0)
							{
								x = n.round().string();
								//force decimal point?
								if (bits.hasBits(BIT_SHARP)) x += ".";
							}
							else
							{
								n = n.roundTo(Math.pow(.1, precision));
								x = n.toFixed(precision);
							}
							
							if (bits.hasBits(BIT_PLUS) && n >= 0)
								x = "+" + x;
							else
							if (bits.hasBits(BIT_SPACE) && n >= 0)
								x = " " + x;
							
							o += _padNumber(x, n, bits, width);
						}
						else
						if (f.hasBits(BIT_c | BIT_s))
						{
							//"c" : character
							//"s" : string of characters
							
							if (bits.hasBits(BIT_PLUS))
							{
								bits = bits.clrBits(BIT_PLUS);
								#if verbose
								trace("warning: `+' flag used with `%s' printf format");
								#end
							}
							if (bits.hasBits(BIT_SPACE))
							{
								bits = bits.clrBits(BIT_SPACE);
								#if verbose
								trace("warning: ` ' flag used with `%s' printf format");
								#end
							}
							else
							if (bits.hasBits(BIT_ZERO))
							{
								bits = bits.clrBits(BIT_ZERO);
								#if verbose
								trace("warning: `0' flag used with `%s' printf format");
								#end
							}
							else
							if (bits.hasBits(BIT_SHARP))
							{
								bits = bits.clrBits(BIT_SHARP);
								#if verbose
								trace("warning: ` #' flag used with `%s' printf format");
								#end
							}
							
							if (f == BIT_s)
							{
								x = Std.string(arg[a++]);
								//.(number) for s: this is the maximum number of characters to be printed
								if (precision > 0) x = x.substr(0, precision);
							}
							else
								x = String.fromCharCode(arg[a++]);
							
							var k = x.length;
							if (width > 0 && k < width)
							{
								width -= k;
								
								//left-justify (right justification is the default)
								if (bits.hasBits(BIT_MINUS))
									x = _rpad(x, " ", width);
								else
									x = _lpad(x, " ", width);
							}
							
							o += x;
						}
						else
						if (f.hasBits(BIT_d | BIT_i | BIT_o | BIT_u | BIT_x | BIT_X | BIT_b))
						{
							//"d" or "i": signed decimal integer
							//"o" : signed octal
							//"u" : unsigned decimal integer
							//"x" : unsigned hexadecimal integer
							//"X" : unsigned hexadecimal integer (capital letters)
							//"b" : binary
							
							//precision specifies the minimum number of digits to be written;
							//if the value to be written is shorter than this number, the result is padded with leading zeros
							//the value is not truncated even if the result is longer;
							//a precision of 0 means that no character is written for the value 0
							if (precision == -1) precision = 1;
							
							var n:Int = arg[a++];
							
							if (precision == 0 && n == 0)
								x = "";
							else
							{
								if (f.hasBits(BIT_h))
									n &= 0xffff;
								else
								if (f.hasBits(BIT_o))
								{
									x = n.toOct();
									if (bits.hasBits(BIT_SHARP)) x = "0" + x;
								}
								else
								if (f.hasBits(BIT_x))
								{
									x = n.toHex().toLowerCase();
									if (bits.hasBits(BIT_SHARP) && n != 0) x = "0x" + x;
								}
								else
								if (f.hasBits(BIT_X))
								{
									x = n.toHex().toUpperCase();
									if (bits.hasBits(BIT_SHARP) && n != 0) x = "0X" + x;
								}
								else
								if (f.hasBits(BIT_b))
								{
									x = n.toBin();
									if (precision > 1)
									{
										if (x.length < precision)
										{
											precision -= x.length;
											for (i in 0...precision)
												x = "0" + x;
										}
										precision = 0;
									}
									if (bits.hasBits(BIT_SHARP)) x = "b" + x;
								}
								else
									x = n.string();
									
								if (precision > 1 && x.length < precision)
								{
									if (n > 0)
									{
										for (i in 0...precision - 1)
											x = "0" + x;
									}
									else
									{
										x = "0" + -n;
										for (i in 0...precision - 2)
											x = "0" + x;
										x = "-" + x;
									}
								}
							}
							if (n >= 0)
							{
								if (bits.hasBits(BIT_PLUS))
									x = "+" + x;
								else
								if (bits.hasBits(BIT_SPACE))
									x = " " + x;
							}
							
							o += _padNumber(x, n, bits, width);
						}
						else
						if (f.hasBits(BIT_e | BIT_E))
						{
							//"e" : scientific notation (mantise/exponent) using e character
							//"E" : scientific notation (mantise/exponent) using E character
							if (precision == -1) precision = 6;
							
							var n:Float = arg[a++];
							var sign = n.fsgn();
							n = n.fabs();
							
							var expCount = 0;
							if (n > 1)
							{
								while (n > 10)
								{
									n /= 10;
									expCount++;
								}
							}
							else
							{
								while (n < 1)
								{
									n *= 10;
									expCount--;
								}
							}
							
							var t = .1; for (i in 0...precision - 1) t *= .1;
							n = n.roundTo(t);
							
							x += (sign < 0 ? "-" : bits.hasBits(BIT_PLUS) ? "+" : "") + n.string().substr(0, precision + 2);
							x += f.hasBits(BIT_e) ? "e" : "E";
							x += expCount > 0 ? "+" : "-";
							
							if (expCount < 10)  x = _rpad(x, "0", 2);
							else
							if (expCount < 100) x = _rpad(x, "0", 1);
							
							x += expCount.abs().string();
							o += x;
						}
						else
						if (f.hasBits(BIT_g | BIT_G))
						{
							//"g" : use the shorter of %e or %f
							//"G" : use the shorter of %E or %f
							precision = 0;
							
							var flags = "";
							if (bits.hasBits(BIT_MINUS)) flags += "-";
							if (bits.hasBits(BIT_PLUS))  flags += "+";
							if (bits.hasBits(BIT_SPACE)) flags += " ";
							if (bits.hasBits(BIT_ZERO)) flags += "0";
							
							var n:Float = arg[a++];
							
							//Sprintf.format("%%%s.%df", [flags, precision]);
							var a = _format("%" + flags + "." + precision + "f", [n]);
							var b = _format("%" + flags + "." + precision + ((c == 71) ? "E" : "e"), [n]); //71: G
							
							if (bits.hasBits(BIT_SHARP))
							{
								if (a.indexOf(".") != -1)
								{
									var pos = a.length - 1;
									while (cca(a, pos) == ASCII.ZERO) pos--;
									a = a.substr(0, pos);
								}
							}
							
							o += a.length < b.length ? a : b;
						}
						else
						if (f.hasBits(BIT_p | BIT_n))
						{
							throw "warning: specifier 'p' and 'n' are not supported";
						}
					}
					else
						throw "malformed format string: no specifier found";
					//}
				}
			}
			else
				o += fmt.charAt(i - 1);
		}
		return o;
	}
	
	inline function _padNumber(x:String, n:Float, bits:Int, width:Int):String
	{
		var k = x.length;
		if (width > 0 && k < width)
		{
			width -= k;
			
			//left-justify (right justification is the default)
			if (bits.hasBits(BIT_MINUS))
				x = _rpad(x, " ", width);
			else
			{
				if (n >= 0)
					x = _lpad(x, bits.hasBits(BIT_ZERO) ? "0" : " ", width);
				else
				{
					if (bits.hasBits(BIT_ZERO))
					{
						//shift minus sign to left-most position
						x = "-" + _lpad(x.substr(1), "0", width);
					}
					else
						x = _lpad(x, " ", width);
				}
			}
		}
		
		return x;
	}
	
	inline function _lpad(s:String, c:String, k:Int):String
	{
		var t = c;
		for (i in 0...k - 1) t += c;
		return t + s;
	}
	
	inline function _rpad(s:String, c:String, k:Int):String
	{
		var t = c;
		for (i in 0...k - 1) t += c;
		return s + t;
	}
	
	inline function cca(s:String, pos:Int):Int
	{
		return StringTools.fastCodeAt(s, pos);
	}
}