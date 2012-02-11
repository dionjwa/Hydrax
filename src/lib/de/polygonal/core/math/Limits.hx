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
package de.polygonal.core.math;

/**
 * Limits for integer and float types.
 */
class Limits 
{
	/**
	 * Min value, signed byte.
	 */
	inline public static var INT8_MIN =-0x80;
	
	/**
	 * Max value, signed byte.
	 */
	inline public static var INT8_MAX = 0x7F;
	
	/**
	 * Max value, unsigned byte.
	 */
	inline public static var UINT8_MAX = 0xFF;
	
	/**
	 * Min value, signed short.
	 */
	inline public static var INT16_MIN =-0x8000;
	
	/**
	 * Max value, signed short.
	 */
	inline public static var INT16_MAX = 0x7FFF;
	
	/**
	 * Max value, unsigned short.
	 */
	inline public static var UINT16_MAX = 0xFFFF;
	
	/**
	 * Min value, signed integer.<br/>
	 * Equals 0x40000000 when targeting neko, otherwise 0x80000000.
	 */
	inline public static var INT32_MIN =
	#if neko
	0x40000000;
	#else
	0x80000000;
	#end
	
	/**
	 * Max value, signed integer.<br/>
	 * Equals 0x3fffffff when targeting neko, otherwise 0x7fffffff.
	 */
	inline public static var INT32_MAX =
	#if neko
	0x3FFFFFFF;
	#else
	0x7fffffff;
	#end
	
	/**
	 * Max value, unsigned integer.<br/>
	 * Equals 0x7fffffff when targeting neko, otherwise 0xffffffff.
	 * 
	 */
	inline public static var UINT32_MAX =
	#if neko
	0x7fffffff;
	#else
	0xffffffff;
	#end
	
	/**
	 * Number of bits using for representing integers.<br/>
	 * Equals 31 when targeting neko, otherwise 32.
	 */
	inline public static var INT_BITS =
	#if neko
	31;
	#else
	32;
	#end
	
	/**
	 * The largest representable number (single-precision IEEE-754).
	 */
	inline public static var FLOAT_MAX = 3.40282346638528e+38;
	
	/**
	 * The smallest representable number (single-precision IEEE-754).
	 */
	inline public static var FLOAT_MIN = -3.40282346638528e+38;
	
	/**
	 * The smallest representable number (double-precision IEEE-754).
	 */
	inline public static var DOUBLE_MAX = 1.79769313486231e+308;
	
	/**
	 * The largest representable number (double-precision IEEE-754).
	 */
	inline public static var DOUBLE_MIN = -1.79769313486231e+308;
}