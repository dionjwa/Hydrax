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

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.IntIntHashTable;

using de.polygonal.core.math.Mathematics;

class PairCounterHash
{
	var _data:IntIntHashTable;
	
	public function new(max:Int)
	{
		#if debug
		de.polygonal.core.util.Assert.assert(Mathematics.isPow2(max), "Mathematics.isPow2(max)");
		#end
		
		_data = new IntIntHashTable(max, max);
	}
	
	public function free():Void
	{
		_data.free();
	}
	
	inline public function get(a:Int, b:Int):Int
	{
		return _data.get(_getKey(a, b));
	}
	
	inline public function increment(a:Int, b:Int):Int
	{
		var i = _getKey(a, b);
		
		var k = _data.get(i);
		if (k == IntIntHashTable.KEY_ABSENT)
		{
			_data.set(i, 1);
			return 1;
		}
		else
		{
			k++;
			
			#if debug
			de.polygonal.core.util.Assert.assert(k <= 0xff, "k <= 0xff");
			#end
			
			_data.remap(i, k);
			return k;
		}
	}
	
	inline public function decrement(a:Int, b:Int):Int
	{
		var i = _getKey(a, b);
		var k = _data.get(i) - 1;
		
		#if debug
		de.polygonal.core.util.Assert.assert(k != Limits.INT32_MAX, "k != Limits.INT32_MAX");
		#end
		
		_data.remap(i, k);
		return k;
	}
	
	inline function _getKey(x:Int, y:Int):Int
	{
		if (x < y)
			return (y * (y + 1) >> 1) + x;
		else
			return (x * (x + 1) >> 1) + y;
	}
}