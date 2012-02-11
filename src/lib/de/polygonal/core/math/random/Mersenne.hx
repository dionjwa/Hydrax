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
package de.polygonal.core.math.random;

/**
 * <p>Mersenne Twister random number generator.</p>
 * <p>Taken from the book "Essential Mathematics for Games And Interactive Applications"</p>
 * <p>Copyright (C) 2008 by Elsevier, Inc. All rights reserved.</p>
 * <p>This class uses the Mersenne Twister type MT19937, it does not use the faster SIMD-oriented Mersenne Twister as that requires 64-bit integers.</p>
 */
class Mersenne extends RNG
{
	inline static var kN         = 624;
	inline static var kM         = 397;
	inline static var kR         = 31;
	inline static var kA         = 0x9908B0DF;
	inline static var kU         = 11;
	inline static var kS         = 7;
	inline static var kT         = 15;
	inline static var kL         = 18;
	inline static var kB         = 0x9D2C5680;
	inline static var kC         = 0xEFC60000;
	inline static var kLowerMask = ((0x00000001) << kR) - 1;
	inline static var kUpperMask = 0xffffffff << kR;
	inline static var kTwistMask = 0x00000001;
	
	#if flash10
		#if alchemy
		var _stateVector:de.polygonal.ds.mem.IntMemory;
		var _kMag01:de.polygonal.ds.mem.IntMemory;
		#else
		var _stateVector:flash.Vector<Int>;
		var _kMag01:flash.Vector<Int>;
		#end
	#else
	var _stateVector:Array<Int>;
	var _kMag01:Array<Int>;
	#end
	
	var _currentEntry:Int;
	
	/**
	 * Default seed value is <code>5489</code>.
	 */
	public function new(seed = 5489)
	{
		super();
		
		_stateVector =
		#if flash10
			#if alchemy
			new de.polygonal.ds.mem.IntMemory(kN);
			#else
			new flash.Vector<Int>(kN, true);
			#end
		#else
		new Array<Int>();
		#end
		
		_kMag01 =
		#if flash10
			#if alchemy
			new de.polygonal.ds.mem.IntMemory(2);
			_kMag01.set(0, 0);
			_kMag01.set(1, kA);
			#else
			new flash.Vector<Int>(2, true);
			_kMag01[0] = 0;
			_kMag01[1] = kA;
			#end
		#else
		new Array<Int>();
		_kMag01[0] = 0;
		_kMag01[1] = kA;
		#end
		
		setSeed(seed);
	}
	
	public function free():Void
	{
		#if (flash10 && alchemy)
		_stateVector.free();
		_kMag01.free();
		#end
		
		_stateVector = null;
		_kMag01 = null;
	}
	
	override public function setSeed(seed:Int):Void
	{
		super.setSeed(seed);
		
		_setState(0, seed);
		
		#if js
		for (i in 1...kN)
		{
			_setState(i, add32(mul32(0x6C078965, ui32(_getState(i - 1) ^ (_getState(i - 1) >>> 30))), i));
			_setState(i, ui32(_getState(i) & 0xffffffff));
		}
		#else
		for (i in 1...kN) _setState(i, (0x6C078965 * (_getState(i - 1) ^ (_getState(i - 1) >>> 30)) + i));
		#end
		
		_currentEntry = kN;
	}
	
	/**
	 * Initialize by an array of <code>keys</code>.
	 */
	public function initByArray(keys:Array<Int>):Void
	{
		var i = 1, j = 0;
		
		setSeed(19650218);
		
		var length = keys.length;
		
		var k = (kN > length ? kN : length);
		
		while (k > 0)
		{
			#if js
			_setState(i, add32(add32(ui32(_getState(i) ^ mul32(ui32(_getState(i-1) ^ (_getState(i - 1) >>> 30)), 1664525)), keys[j]), j));
			_setState(i, ui32(_getState(i) & 0xffffffff));
			#else
			_setState(i, (_getState(i) ^ ((_getState(i - 1) ^ (_getState(i - 1) >>> 30)) * 1664525)) + keys[j] + j);
			#end
			
			i++;
			j++;
			
			if (i >= kN)
			{
				_setState(0, _getState(kN-1));
				i = 1;
			}
			
			if (j >= length) j = 0;
			k--;
		}
		
		k = kN - 1;
		while (k > 0)
		{
			#if js
			_setState(i, sub32(ui32((_getState(i)) ^ mul32(ui32(_getState(i - 1) ^ (_getState(i - 1) >>> 30)), 1566083941)), i));
			_setState(i, ui32(_getState(i) & 0xffffffff));
			#else
			_setState(i, (_getState(i) ^ ((_getState(i - 1) ^ (_getState(i - 1) >>> 30)) * 1566083941)) - i);
			#end
			
			i++;
			if (i >= kN)
			{
				_setState(0, _getState(kN - 1));
				i = 1;
			}
			
			k--;
		}
		
		_setState(0, 0x80000000);
	}
	
	/**
	 * Returns an integral number in the interval <arg>&#091;0, 0xffffffff&#093;</arg>.<br/>
	 */
	override public function random():Float
	{
		if (_currentEntry >= kN)
		{
			var temp:Int;
			
			for (k in 0...kN - kM)
			{
				#if js
				temp = ui32(((_getState(k) & kUpperMask) | (_getState(k + 1) & kLowerMask)));
				_setState(k, ui32(_getState(k + kM) ^ (temp >>> 1) ^ _getMag01(temp & kTwistMask)));
				#else
				temp = ((_getState(k) & kUpperMask) | (_getState(k + 1) & kLowerMask));
				_setState(k, _getState(k + kM) ^ (temp >>> 1) ^ _getMag01(temp & kTwistMask));
				#end
			}
			
			for (k in kN - kM...kN - 1)
			{
				#if js
				temp = ui32((_getState(k) & kUpperMask) | (_getState(k + 1) & kLowerMask));
				_setState(k, ui32(_getState(k + (kM - kN)) ^ (temp >>> 1) ^ _getMag01(temp & kTwistMask)));
				#else
				temp = ((_getState(k) & kUpperMask) | (_getState(k + 1) & kLowerMask));
				_setState(k, _getState(k + (kM - kN)) ^ (temp >>> 1) ^ _getMag01(temp & kTwistMask));
				#end
			}
			
			#if js
			temp = ui32((_getState(kN - 1) & kUpperMask) | (_getState(0) & kLowerMask));
			_setState(kN - 1, ui32(_getState(kM - 1) ^ (temp >>> 1) ^ _getMag01(temp & kTwistMask)));
			#else
			temp = ((_getState(kN - 1) & kUpperMask) | (_getState(0) & kLowerMask));
			_setState(kN - 1, _getState(kM - 1) ^ (temp >>> 1) ^ _getMag01(temp & kTwistMask));
			#end
			
			_currentEntry = 0;
		}
		
		var y = _getState(_currentEntry++);
		
		#if js
		y = ui32(y ^ (y >>> kU));
		y = ui32(y ^ ((y << kS) & kB));
		y = ui32(y ^ ((y << kT) & kC));
		y = ui32(y ^ (y >>> kL));
		#else
		y ^= y >>> kU;
		y ^= (y << kS) & kB;
		y ^= (y << kT) & kC;
		y ^= y >>> kL;
		#end
		
		return y >>> 0;
	}
	
	override public function randomFloat():Float 
	{
		return random() * (1. / 4294967296.);
	}
	
	inline function _getMag01(i:Int)
	{
		#if (flash10 && alchemy)
		return _kMag01.get(i);
		#else
		return _kMag01[i];
		#end
	}
	
	inline function _getState(i:Int)
	{
		#if (flash10 && alchemy)
		return _stateVector.get(i);
		#else
		return _stateVector[i];
		#end
	}
	
	inline function _setState(i:Int, x:Int)
	{
		#if (flash10 && alchemy)
		_stateVector.set(i, x);
		#else
		_stateVector[i] = x;
		#end
	}
	
	#if js
	inline function ui32(x)
	{
		return x < 0 ? (x ^ 0x80000000) + 0x80000000 : x;
	}
	inline function add32(a, b)
	{
		return ui32((a + b) & 0xffffffff);
	}
	inline function sub32(a, b)
	{
		return a < b ? ui32((Std.int(4294967296) - (b - a)) & 0xffffffff) : a - b;
	}
	inline function mul32(a, b)
	{
		var sum = 0;
		for (i in 0...32)
		{
			if (((a >>> i) & 0x1) != 0)
				sum = add32(sum, ui32(b << i));
		}
		return sum;
	}
	#end
}