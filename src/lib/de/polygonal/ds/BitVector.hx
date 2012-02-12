﻿/*
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
package de.polygonal.ds;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.util.Assert;

using de.polygonal.ds.Bits;

#if neko
using haxe.Int32;
#end

/**
 * <p>An array data structure that compactly stores individual bits (Boolean values).</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class BitVector implements Hashable
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	#if flash10
	var _bits:flash.Vector<Int>;
	#else
	var _bits:Array<Int>;
	#end
	var _arrSize:Int;
	var _bitSize:Int;
	
	/**
	 * Creates a bit-vector capable of storing a total of <code>size</code> bits. 
	 */
	public function new(size:Int)
	{
		_bits = null;
		_bitSize = 0;
		_arrSize = 0;
		
		resize(size);
		
		key = HashKey.next();
	}
	
	/**
	 * Destroys this object by explicitly nullifying the array storing the bits.
	 * <o>1</o>
	 */
	public function free():Void
	{
		_bits = null;
	}
	
	/**
	 * The exact number of bits that the bit-vector can store.
	 * <o>1</o>
	 */
	inline public function capacity():Int
	{
		return _bitSize;
	}
	
	/**
	 * The total number of bits set to 1.
	 * <o>n</o>
	 */
	inline public function size():Int
	{
		var c = 0;
		for (i in 0..._arrSize)
			c += _bits[i].ones();
		return c;
	}
	
	/**
	 * The total number of 32-bit integers allocated for storing the bits.
	 * <o>1</o>
	 */
	inline public function bucketSize():Int
	{
		return _arrSize;
	}
	
	/**
	 * Returns true if the bit at index <code>i</code> is 1.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function has(i:Int):Bool
	{
		D.assert(i < capacity(), Sprintf.format("i index out of range (%d)", [i]));
		
		#if neko
		var p = Std.int(i / 31);
		var b = i % 31;
		return ((_bits[p] & (1 << b)) >> b) != 0;
		#else
		return ((_bits[i >> 5] & (1 << (i & 31))) >> (i & 31)) != 0;
		#end
	}
	
	/**
	 * Sets the bit at index <code>i</code> to 1.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function set(i:Int):Void
	{
		D.assert(i < capacity(), Sprintf.format("i index out of range (%d)", [i]));
		
		#if neko
		var p = Std.int(i / 31);
		_bits[p] = _bits[p] | (1 << (i % 31));
		#else
		var p = i >> 5;
		_bits[p] = _bits[p] | (1 << (i & 31));
		#end
	}
	
	/**
	 * Sets the bit at index <code>i</code> to 0.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function clr(i:Int):Void
	{
		D.assert(i < capacity(), Sprintf.format("i index out of range (%d)", [i]));
		
		#if neko
		var p = Std.int(i / 31);
		_bits[p] = (_bits[p] & ((1 << (i % 31)).ofInt().complement().toInt()));
		#else
		var p = i >> 5;
		_bits[p] = _bits[p] & (~(1 << (i & 31)));
		#end
	}
	
	/**
	 * Sets all bits in the bit-vector to 0.
	 * <o>n</o>
	 */
	inline public function clrAll():Void
	{
		for (i in 0..._arrSize) _bits[i] = 0;
	}
	
	/**
	 * Sets all bits in the bit-vector to 1.
	 * <o>n</o>
	 */
	inline public function setAll():Void
	{
		for (i in 0..._arrSize) _bits[i] = -1;
	}
	
	/**
	 * Clears all bits in the range <arg>&#091;min, max)</arg>.
	 * This is faster than clearing individual bits by using the <code>clr</code> method.
	 * @throws de.polygonal.core.util.AssertionError min out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError max out of range (debug only).
	 * <o>n</o>
	 */
	inline public function clrRange(min:Int, max:Int):Void
	{
		D.assert(min >= 0 && min <= max && max < _bitSize, Sprintf.format("min/max out of range (%d/%d)", [min, max]));
		var n = max - min;
		
		#if neko
		if (n < 31)
			for (i in min...max) clr(i);
		else
		{
			var r = n % 31;
			for (i in min...Std.int((max - r) / 31)) _bits[i] = 0;
			for (i in max - r...max) clr(i);
		}
		#else
		if (n < 32)
			for (i in min...max) clr(i);
		else
		{
			var r = n & 31;
			for (i in min...(max - r) >> 5) _bits[i] = 0;
			for (i in max - r...max) clr(i);
		}
		#end
	}
	
	/**
	 * Sets all bits in the range <arg>&#091;min, max)</arg>.
	 * This is faster than setting individual bits by using the <code>set</code> method.
	 * @throws de.polygonal.core.util.AssertionError min out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError max out of range (debug only).
	 * <o>n</o>
	 */
	inline public function setRange(min:Int, max:Int):Void
	{
		D.assert(min >= 0 && min <= max && max < _bitSize, Sprintf.format("min/max out of range (%d/%d)", [min, max]));
		var n = max - min;
		
		#if neko
		if (n < 31)
			for (i in min...max) set(i);
		else
		{
			var r = n % 31;
			for (i in min...Std.int((max - r) / 31)) _bits[i] = -1;
			for (i in max - r...max) set(i);
		}
		#else
		if (n < 32)
			for (i in min...max) set(i);
		else
		{
			var r = n & 31;
			for (i in min...(max - r) >> 5) _bits[i] = -1;
			for (i in max - r...max) set(i);
		}
		#end
	}
	
	/**
	 * Sets the bit at index <code>i</code> to 1 if <code>cond</code> is true or clears the bit at index <code>i</code> if <code>cond</code> is false.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only) (debug only).
	 */
	inline public function ofBool(i:Int, cond:Bool):Void
	{
		cond ? set(i) : clr(i);
	}
	
	/**
	 * Resizes the bit-vector to <code>x</code> bits.<br/>
	 * Preserves existing values if the new size &gt; old size.
	 * <o>n</o>
	 */
	public function resize(x:Int):Void
	{
		if (_bitSize == x) return;
		
		#if neko
		var newSize = Std.int(x / 31);
		if ((x % 31) > 0) newSize++;
		#else
		var newSize = x >> 5;
		if ((x & 31) > 0) newSize++;
		#end
		
		if (_bits == null)
		{
			#if flash10
			_bits = new flash.Vector<Int>(newSize, true);
			#else
			_bits = new Array<Int>();
			#end
			
			for (i in 0...newSize) _bits[i] = 0;
		}
		else
		if (newSize < _arrSize)
		{
			#if flash10
			var t = new flash.Vector<Int>(newSize, true);
			#else
			var t = new Array<Int>();
			#end
			
			for (i in 0...newSize) t[i] = _bits[i];
			_bits = t;
		}
		else
		{
			if (_arrSize != newSize)
			{
				#if flash10
				var t = new flash.Vector<Int>(newSize, true);
				#else
				var t = new Array<Int>();
				for (i in 0...newSize) t[i] = 0;
				#end
				for (i in 0..._arrSize) t[i] = _bits[i];
				_bits = t;
			}
		}
		
		_bitSize = x;
		_arrSize = newSize;
	}
	
	/**
	 * Writes the data in this bit-vector to a byte array.<br/>
	 * The number of bytes equals <em>bucketSize()</em> * 4 and the number of bits equals <em>capacity()</em>.
	 * <o>n</o>
	 * @param bigEndian the byte order (default is little endian)
	 */
	public function toBytes(bigEndian = false):haxe.io.BytesData
	{
		#if flash9
		var output = new flash.utils.ByteArray();
		if (!bigEndian) output.endian = flash.utils.Endian.LITTLE_ENDIAN;
		for (i in 0..._arrSize)
			output.writeInt(_bits[i]);
		return output;
		#else
		var output = new haxe.io.BytesOutput();
		output.bigEndian = bigEndian;
		for (i in 0..._arrSize)
			output.writeInt32(haxe.Int32.ofInt(_bits[i]));
		return output.getBytes().getData();
		#end
	}
	
	/**
	 * Copies the bits from <code>bytes</code> into this bit vector.<br/>
	 * The bit-vector is resized to the size of <code>bytes</code>.
	 * <o>n</o>
	 * @param bigEndian the input byte order (default is little endian)
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null (debug only).
	 */
	public function ofBytes(bytes:haxe.io.BytesData, bigEndian = false):Void
	{
		#if flash9
		var input = bytes;
		input.position = 0;
		if (!bigEndian) input.endian = flash.utils.Endian.LITTLE_ENDIAN;
		#else
		var input = new haxe.io.BytesInput(haxe.io.Bytes.ofData(bytes));
		input.bigEndian = bigEndian;
		#end
		
		#if neko
		var k = neko.NativeString.length(bytes);
		#else
		var k = bytes.length;
		#end
		
		var numBytes = k & 3;
		var numIntegers = (k - numBytes) >> 2;
		_arrSize = numIntegers + (numBytes > 0 ? 1 : 0);
		_bitSize = _arrSize << 5;
		_bits    = #if flash10 new flash.Vector<Int>(_arrSize, true); #else new Array<Int>(); #end
		for (i in 0..._arrSize) _bits[i] = 0;
		for (i in 0...numIntegers)
		{
			#if flash9
			_bits[i] = input.readInt();
			#elseif cpp
			_bits[i] = (cast input.readInt32()) & 0xFFFFFFFF;
			#else
			_bits[i] = cast input.readInt32();
			#end
		}
		var index = numIntegers << 5;
		var shift = 0, t = 0;
		for (i in 0...numBytes)
		{
			var byte = input.readByte();
			for (j in 0...8)
			{
				if ((byte & 1) == 1) set(index);
				byte >>= 1;
				index++;
			}
		}
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var bv = new de.polygonal.ds.BitVector(40);
	 * for (i in 0...bv.capacity()) {
	 *     if (i & 1 == 0) {
	 *         bv.set(i);
	 *     }
	 * }
	 * trace(bv);</pre>
	 * <pre class="console">
	 * {BitVector, set/all: 20/40}
	 * |<
	 *   0 -> b01010101010101010101010101010101
	 *   1 -> b00000000000000000000000001010101
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var s = Sprintf.format("{BitVector, set/all: %d/%d}", [size(), capacity()]);
		if (size() == 0) return s;
		s += "\n|<\n";
		for (i in 0..._arrSize)
			s += Sprintf.format("  %4d -> %#.32b\n", [i, _bits[i]]);
		s += ">|";
		return s;
		#else
		return Sprintf.format("{BitVector, set/all: %d/%d}", [size(), capacity()]);
		#end
	}
	
	/**
	 * Creates a copy of this bit vector.
	 * <o>n</o>
	 */
	public function clone():BitVector
	{
		var copy = new BitVector(_bitSize);
		var t = copy._bits;
		for (i in 0..._arrSize)
			t[i] = _bits[i];
		return copy;
	}
}