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
package de.polygonal.core.io;

import haxe.io.Bytes;
import haxe.io.BytesData;
import haxe.io.BytesInput;
import haxe.io.BytesOutput;
import de.polygonal.ds.ArrayUtil;
import de.polygonal.core.util.Assert;

/**
 * <p>A Base64 encoder/decoder.</p>
 */
class Base64
{
	static var _output:BytesData;
	static var _instance:Base64 = null;
	inline static function get():Base64
	{
		if (_instance == null)
			_instance = new Base64();
		return _instance;
	}
	
	var BASE64_CHARS:String;
	
	#if flash10
	var BASE64_ENCODE:flash.Vector<Int>;
	var BASE64_DECODE:flash.Vector<Int>;
	#else
	var BASE64_ENCODE:Array<Int>;
	var BASE64_DECODE:Array<Int>;
	#end
	
	var _buffer:BytesData;
	var _tmp:BytesData;
	
	function new()
	{
		_buffer = new BytesData();
		_output = new BytesData();
		_tmp = new BytesData();
		
		BASE64_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
		
		#if flash10
		BASE64_ENCODE = new flash.Vector<Int>(BASE64_CHARS.length, true);
		BASE64_DECODE = new flash.Vector<Int>(127, true);
		#else
		BASE64_ENCODE = ArrayUtil.alloc(BASE64_CHARS.length);
		BASE64_DECODE = ArrayUtil.alloc(127);
		#end
		for (i in 0...BASE64_CHARS.length)
		{
			BASE64_ENCODE[i] = BASE64_CHARS.charCodeAt(i);
			BASE64_DECODE[BASE64_CHARS.charCodeAt(i)] = i;
		}
	}
	
	/**
	 * Encodes a <em>BytesData</em> object into a string in Base64 notation.
	 * @param source the source data.
	 * @param breakLines if true, breaks lines every <code>maxLineLength</code> characters.<br/>
	 * Disabling this behavior violates strict Base64 specification, but makes the encoding faster.
	 * @param maxLineLength the maximum line length of the output. Default is 76.
	 */
	inline public static function encode(source:BytesData, breakLines = false, maxLineLength = 76):String
	{
		return get()._encode(source, breakLines, maxLineLength);
	}
	
	/**
	 * Shortcut for encoding a string into a string in Base64 notation.
	 * @param source the source data.
	 * @param breakLines if true, breaks lines every <code>maxLineLength</code> characters.<br/>
	 * Disabling this behavior violates strict Base64 specification, but makes the encoding faster.
	 * @param maxLineLength the maximum line length of the output. Default is 76.
	 */
	inline public static function encodeString(source:String, breakLines = false, maxLineLength = 76):String
	{
		return get()._encodeStr(source, breakLines, maxLineLength);
	}
	
	/**
	 * Decodes a Base64 encoded string into a <em>BytesData</em> object.
	 * @param source the source data.
	 * @param breakLines if true, removes all newline (\n) characters from the <code>source</code> string before
	 * decoding it.<br/>
	 * Use this flag if the source was encoded with <code>breakLines</code> = true.
	 * Default is false.
	 */
	inline public static function decode(source:String, out:BytesData = null, breakLines = false):BytesData
	{
		return get()._decode(source, out, breakLines);
	}
	
	/**
	 * Shortcut for decoding a Base64 encoded string directly into a string.
	 * @param source the source data.
	 * @param breakLines if true, removes all newline (\n) characters from the <code>source</code> string before
	 * decoding it.<br/>
	 * Use this flag if the source was encoded with <code>breakLines</code> = true.
	 * Default is false.
	 */
	inline public static function decodeString(source:String, breakLines = false):String
	{
		return get()._decodeStr(source, breakLines);
	}
	
	function _encodeStr(source:String, breakLines = false, maxLineLength = 76):String
	{
		#if flash
		_tmp.clear();
		_tmp.writeUTFBytes(source);
		return _encode(_tmp, breakLines, maxLineLength);
		#elseif js
		var output = new BytesOutput();
		output.writeString(source);
		return _encode(output.getBytes().getData(), breakLines, maxLineLength);
		#end
	}
	
	function _decodeStr(source:String, breakLines = false, maxLineLength = 76):String
	{
		#if flash
		_tmp.clear();
		#elseif js
		ArrayUtil.shrink(_tmp, 0);
		#end
		
		_decode(source, _tmp, breakLines);
		
		#if flash
		return _tmp.readUTFBytes(_tmp.length);
		#elseif js
		var input = new BytesInput(Bytes.ofData(_tmp));
		return input.readString(_tmp.length);
		#end
	}
	
	function _encode(source:BytesData, breakLines = false, maxLineLength = 76):String
	{
		#if flash
		source.position = 0;
		_buffer.length = 0;
		#elseif js
		ArrayUtil.shrink(_buffer, 0);
		#end
		
		var i = 0;
		var p = 0;
		var s = '';
		var k = Std.int(source.length);
		var remainder = k % 3;
		k -= remainder;
		var b = _buffer;
		
		//process 24bits at once (3x8bits)
		while (p < k)
		{
			//convert 3 x 8bit --> 4 x 6bit
			var byte1 = (source[p    ] << 24) >>> 24;
			var byte2 = (source[p + 1] << 24) >>> 24;
			var byte3 = (source[p + 2] << 24) >>> 24;
			
			b[i + 0] = BASE64_ENCODE[ (byte1 & 0xfc) >> 2                ];
			b[i + 1] = BASE64_ENCODE[((byte1 & 0x03) << 4) | (byte2 >> 4)];
			b[i + 2] = BASE64_ENCODE[((byte2 & 0x0f) << 2) | (byte3 >> 6)];
			b[i + 3] = BASE64_ENCODE[  byte3 & 0x3f                      ];
			
			i += 4;
			p += 3;
		}
		
		if (remainder == 1)
		{
			//process 2 x 6bit
			var byte1 = (source[p] << 24) >>> 24;
			
			b[i + 0] = BASE64_ENCODE[(byte1 & 0xfc) >> 2];
			b[i + 1] = BASE64_ENCODE[(byte1 & 0x03) << 4];
			b[i + 2] = 61;
			b[i + 3] = 61;
		}
		else
		if (remainder == 2)
		{
			//process 3 x 6bit
			var byte1 = (source[p    ] << 24) >>> 24;
			var byte2 = (source[p + 1] << 24) >>> 24;
			b[i + 0] = BASE64_ENCODE[ (byte1 & 0xfc) >> 2                ];
			b[i + 1] = BASE64_ENCODE[((byte1 & 0x03) << 4) | (byte2 >> 4)];
			b[i + 2] = BASE64_ENCODE[ (byte2 & 0x0f) << 2                ];
			b[i + 3] = 61;
		}
		
		#if flash
		s = b.readUTFBytes(b.length);
		#elseif js
		s = Bytes.ofData(b).readString(0, b.length);
		#end
		
		if (breakLines)
		{
			var maxLines:Int = cast(s.length / maxLineLength);
			remainder = s.length % maxLineLength;
			var lines = new Array<String>();
			k = 0;
			for (i in 0...maxLines)
			{
				lines[i] = s.substr(k, maxLineLength);
				k += maxLineLength;
			}
			
			lines.push(s.substr(k));
			s = lines.join('\n');
		}
		
		return s;
	}
	
	function _decode(source:String, out:BytesData, breakLines = false):BytesData
	{
		if (out == null) out = new BytesData();
		if (breakLines) source = ~/\n/g.replace(source, '');
		
		var k = source.length;
		var i = 0;
		var p = 0;
		var v = BASE64_DECODE;
		
		#if debug
		for (i in 0...source.length)
		{
			var code = source.charCodeAt(i);
			D.assert(code == 61 || code == 43 || code == 47 || (code >= 48 && code <= 57) || (code >= 97 && code <= 122) || (code >= 65 && code <= 90), 'invalid character in input string: \'' + code + '\'');
		}
		#end
		
		#if flash
		_buffer.length = 0;
		_buffer.writeUTFBytes(source);
		#elseif js
		var output = new BytesOutput();
		output.writeString(source);
		_buffer = output.getBytes().getData();
		#end
		
		var b = _buffer;
		
		if (k > 4)
		{
			k -= 4;
			while (p < k)
			{
				//char code -> position 0...64
				var s1 = v[b[p    ]];
				var s2 = v[b[p + 1]];
				var s3 = v[b[p + 2]];
				var s4 = v[b[p + 3]];
				
				//convert 4 x 6bit to 3 x 8 bit
				var byte1 = (s1 << 2) + ((s2 & 0x30) >> 4);
				var byte2 = ((s2 & 0x0f) << 4) + ((s3 & 0x3c) >> 2);
				var byte3 = ((s3 & 0x03) << 6) + s4;
				
				out[i    ] = byte1;
				out[i + 1] = byte2;
				out[i + 2] = byte3;
				
				i += 3;
				p += 4;
			}
		}
		
		var s1 = v[b[p    ]];
		var s2 = v[b[p + 1]];
		var s3 = v[b[p + 2]];
		var s4 = v[b[p + 3]];
		
		var byte1 = (s1 << 2) + ((s2 & 0x30) >> 4);
		var byte2 = ((s2 & 0x0f) << 4) + ((s3 & 0x3c) >> 2);
		var byte3 = ((s3 & 0x03) << 6) + s4;
		
		if (s2 == 64) return out;
		out[i    ] = byte1;
		
		if (s3 == 64) return out;
		out[i + 1] = byte2;
		
		if (s4 == 64) return out;
		out[i + 2] = byte3;
		
		#if flash
		out.position = 0;
		#end
		
		return out;
	}
}