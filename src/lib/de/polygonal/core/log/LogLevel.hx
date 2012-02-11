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
package de.polygonal.core.log;

import de.polygonal.ds.Bits;

using de.polygonal.ds.Bits;

/**
 * <p>A set of standard logging levels that can be used to constrain logging output.</p>
 */
class LogLevel
{
	static var _names = ["DEBUG", "INFO", "WARN", "ERROR", "OFF"];
	
	/**
	 * A message level providing tracing information.<br/>
	 * Value 0x01.
	 */
	inline public static var DEBUG = Bits.BIT_01;
	
	/**
	 * A message level for informational messages.<br/>
	 * Value 0x02.
	 */
	inline public static var INFO = Bits.BIT_02;
	
	/**
	 * A message level indicating a potential problem.<br/>
	 * Value 0x04.
	 */
	inline public static var WARN = Bits.BIT_03;
	
	/**
	 * A message level indicating a serious failure.<br/>
	 * Value 0x08.
	 */
	inline public static var ERROR = Bits.BIT_04;
	
	/**
	 * A special level that can be used to turn off logging.<br/>
	 * Value 0x10.
	 */
	inline public static var OFF = Bits.BIT_05;
	
	/**
	 * A bitfield of all log levels.<br/>
	 * Value b11111.
	 */
	inline public static var ALL = LogLevel.DEBUG | LogLevel.INFO | LogLevel.WARN | LogLevel.ERROR | LogLevel.OFF;

	/**
	 * Returns the human-readable name of a log level.
	 */
	inline static public function getName(level:Int):String
	{
		return _names[level.ntz()];
	}
}