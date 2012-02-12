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
package de.polygonal.motor.collision.nbody.pair;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.ds.mem.ByteMemory;

class PairCounter
{
	var _max:Int;
	var _data:ByteMemory;
	
	public function new(max:Int)
	{
		_max = max;
		_data = new ByteMemory(max * (max + 1) >> 1);
		
		trace(Sprintf.format("allocated %d KiB for %d object ids", [_data.size >> 10, max]));
	}
	
	public function free():Void
	{
		_data.free;
	}
	
	inline public function get(a:Int, b:Int):Int
	{
		return _data.get(_getKey(a, b));
	}
	
	inline public function increment(a:Int, b:Int):Int
	{
		var i = _getKey(a, b);
		var k = _data.get(i) + 1;
		
		#if debug
		de.polygonal.core.util.Assert.assert(k <= 0xff, 'k <= 0xff');
		#end
		
		_data.set(i, k);
		return k;
	}
	
	inline public function decrement(a:Int, b:Int):Int
	{
		var i = _getKey(a, b);
		var k = _data.get(i) - 1;
		
		#if debug
		de.polygonal.core.util.Assert.assert(k >= 0, 'k >= 0');
		#end
		
		_data.set(i, k);
		return k;
	}
	
	inline function _getKey(x:Int, y:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x != y, "x != y");
		#end
		
		if (x < y)
			return (y * (y + 1) >> 1) + x;
		else
			return (x * (x + 1) >> 1) + y;
	}
	
	public function toString():String
	{
		var s = "";
		for (i in 0..._max)
		{
			for (j in i + 1..._max)
			{
				var count = _data.get(_getKey(i, j));
				if (count > 0) s += Sprintf.format('%02d %02d: %d\n', [i, j, count]);
			}
		}
		return s;
	}
}