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
package de.polygonal.core.time;

import de.polygonal.core.math.Mean;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DA;

using de.polygonal.ds.BitFlags;

class StopWatch
{
	static var _instance:StopWatch;
	public static function instance():StopWatch
	{
		if (_instance == null)
			_instance = new StopWatch();
		return _instance;
	}
	
	var _bits:Int;
	
	var _time:DA<Float>;
	var _mean:DA<Mean>;
	
	inline public static function clock(slot:Int):Void { instance()._clock(slot); }
	inline public static function query(slot:Int):Float { return instance()._query(slot); }
	inline public static function total():Float { return instance()._total(); }
	inline public static function clear():Void { return instance()._clear(); }
	
	function new()
	{
		_time = new DA(32, 32);
		_time.fill(0, 32);
		
		_mean = new DA<Mean>(32, 32);
		_mean.assign(Mean, [1000], 32);
	}
	
	function _free()
	{
		for (i in _mean) i.free();
		
		_time.free();
		_mean.free();
		
		_time = null;
		_mean = null;
	}
	
	inline function _clock(slot:Int)
	{
		#if debug
		de.polygonal.core.util.Assert.assert(slot >= 0 && slot < 32, 'slot >= 0 && slot < 32');
		#end
		
		var now = haxe.Timer.stamp();
		
		if (hasf(1 << slot))
		{
			_mean.get(slot).add(now - _time.get(slot));
			clrf(1 << slot);
		}
		else
		{
			_time.set(slot, now);
			setf(1 << slot);
		}
	}
	
	inline function _query(slot:Int)
	{
		#if debug
		de.polygonal.core.util.Assert.assert(!hasf(1 << slot), '!hasf(1 << slot)');
		#end
		
		return _mean.get(slot).val();
	}
	
	inline function _total()
	{
		var t = 0.;
		for (i in 0...32) t += _mean.get(i).val();
		return t;
	}
	
	inline function _clear()
	{
		nulf();
	}
}