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
import de.polygonal.core.fmt.ASCII;
import de.polygonal.core.util.Assert;

/**
 * Helper class for computing the kerning table from an <i>EPSFMetricsReader</i> object.
 */
class KerningTable 
{
	public static function compute(data:EPSFMetricsReader):Array<Int>
	{
		//[charCodeA] => [charCodeA, count, otherCharCode0, otherKern0, otherCharCode1, otherKern1...]
		var t = new Array<Array<Int>>();
		
		//[charCodeA] => count
		var offsetTable = new Array<Int>();
		for (i in data.kerningPairs)
		{
			if (!ASCII.isASCII(i.a) || ASCII.isWhite(i.a)) continue;
			if (!ASCII.isASCII(i.b) || ASCII.isWhite(i.b)) continue;
			
			var slot = t[i.a];
			if (slot == null) slot = t[i.a] = [i.a, 0];
			
			slot[1]++;
			slot[1]++;
			slot.push(i.b);
			slot.push(i.kern);
			offsetTable[i.a] = slot[1];
		}
		
		//create dense array by remove empty kerning pairs
		var tmp = new Array<Array<Int>>();
		for (i in 0...t.length)
		{
			if (t[i] == null) continue;
			tmp.push(t[i]);
		}
		t = tmp;
		
		//compute offset table so table[charCode] => index to kerning data
		var kern = new Array<Int>();
		for (i in 0...data.charCodeRange.length) kern[i] = 0;
		for (i in 0...t.length)
		{
			//remove char code before calculating length
			var charCode = t[i].shift();
			kern[charCode] = 0;
			for (j in 0...i) kern[charCode] += t[j].length;
			
			//offset by length of offset table
			kern[charCode] += data.charCodeRange.length;
		}
		
		//table[charCode][kern] => table[charCode0, charCodeN, kern0, kernN]
		for (i in 0...t.length)
		{
			for (j in 0...t[i].length)
				kern.push(t[i][j]);
		}
		
		//better validate
		for (i in data.kerningPairs)
		{
			var info = i;
			if (!ASCII.isASCII(info.a) || ASCII.isWhite(info.a)) continue;
			if (!ASCII.isASCII(info.b) || ASCII.isWhite(info.b)) continue;
			
			var offs = kern[info.a];
			var c = kern[offs];
			
			var found = false;
			
			var i = offs + 1;
			var k = i + c;
			while (i < k)
			{
				if (kern[i] == info.b)
				{
					found = true;
					break;
				}
				
				i += 2;
			}
			Assert.assert(found, "found");
		}
		
		return kern;
	}
}