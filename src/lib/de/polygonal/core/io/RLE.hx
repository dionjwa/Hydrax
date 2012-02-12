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

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import flash.utils.ByteArray;

/**
 * <p>Run-length encoder/decoder (RLE).</p>
 */
class RLE 
{
	/**
	 * Encodes <code>uncoded</code> into a new byte array.
	 */
	public static function encode(uncoded:ByteArray):ByteArray
	{
		uncoded.position = 0;
		
		var encoded = new ByteArray();
		var curr, prev = Limits.INT32_MAX;
		var count = 0;
		var pos = 0;
		var len:Int = cast uncoded.length;
		
		while (pos < len)
		{
			pos++;
			curr = uncoded.readByte();
			encoded.writeByte(curr);
			
			if (curr == prev)
			{
				count = 0;
				while (pos < len)
				{
					pos++;
					curr = uncoded.readByte();
					if (curr == prev)
					{
						count++;
						if (count == Limits.UINT8_MAX)
						{
							encoded.writeByte(count);
							prev = Limits.INT32_MAX;
							break;
						}
					}
					else
					{
						encoded.writeByte(count);
						encoded.writeByte(curr);
						prev = curr;
						break;
					}
				}
			}
			else
				prev = curr;
		}
		
		return encoded;
	}
	
	/**
	 * Decodes <code>encoded</code> into a new byte array.
	 */
	public static function decode(encoded:ByteArray):ByteArray
	{
		encoded.position = 0;
		
		var uncoded = new ByteArray();
		var curr, prev = Limits.INT32_MAX;
		var count = 0;
		var pos = 0;
		var len = Std.int(encoded.length);
		
		while (pos < len)
		{
			pos++;
			curr = encoded.readByte();
			
			uncoded.writeByte(curr);
			
			if (curr == prev)
			{
				if (pos < len)
				{
					pos++;
					count = encoded.readByte();
				}
				else
					count = -1;
				
				while (count > 0)
				{
					uncoded.writeByte(curr);
					count--;
				}
				
				prev = Limits.INT32_MAX;
			}
			else
				prev = curr;
		}
		
		return uncoded;
	}
}