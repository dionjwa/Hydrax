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
package de.polygonal.ds.mem;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.BitVector;

#if !alchemy
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.ArrayUtil;
#end

#if neko
using haxe.Int32;
#end

/**
 * <p>A bit-vector using fast "alchemy-memory" for data storage.</p>
 */
class BitMemory extends MemoryAccess
{
	/**
	 * Converts <code>input</code> to a <code>ByteArray</code> object.
	 * <warn>The bytes are written in little endian format.</warn>
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	#if (flash9 || cpp)
	public static function toByteArray(input:BitMemory):flash.utils.ByteArray
	{
		var output = new flash.utils.ByteArray();
		output.endian = flash.utils.Endian.LITTLE_ENDIAN;
		
		var x = 0;
		var b = 0;
		for (i in 0...input.size)
		{
			if (input.has(i)) x |= 1 << b;
			b++;
			if (b & 7 == 0)
			{
				output.writeByte(x);
				x = 0;
				b = 0;
			}
		}
		
		if (b > 0) output.writeByte(x);
		output.position = 0;
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <em>ByteMemory</em> object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if (flash9 || cpp)
	public static function ofByteArray(input:flash.utils.ByteArray, min = -1, max = -1):BitMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		var output = new BitMemory((max - min) << 3, "ofByteArray");
		#if alchemy
		var a = output.getAddr(0);
		for (i in min...max) flash.Memory.setByte(a++, cast input[i]);
		#else
		var i = 0;
		for (j in min...max)
		{
			var byte = input[j];
			for (k in 0...8)
			{
				var bit = byte & 1;
				byte >>= 1;
				if (bit == 1) output.set(i);
				i++;
			}
		}
		#end
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> to a <code>BytesData</code> object.
	 * <warn>The bytes are written in little endian format.</warn>
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	public static function toBytesData(input:BitMemory):haxe.io.BytesData
	{
		var output = new haxe.io.BytesOutput();
		output.bigEndian = false;
		
		var x = 0;
		var b = 0;
		for (i in 0...input.size)
		{
			if (input.has(i)) x |= 1 << b;
			b++;
			if (b & 7 == 0)
			{
				output.writeByte(x);
				x = 0;
				b = 0;
			}
		}
		
		if (b > 0) output.writeByte(x);
		return output.getBytes().getData();
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <em>ByteMemory</em> object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function ofBytesData(input:haxe.io.BytesData, min = -1, max = -1):BitMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max =
		#if neko
		neko.NativeString.length(input);
		#else
		input.length;
		#end
		
		D.assert(min >= 0, "min >= 0");
		
		#if neko
		D.assert(max <= neko.NativeString.length(input), "max <= input.length");
		#else
		D.assert(max <= Std.int(input.length), "max <= input.length");
		#end
		
		var output = new BitMemory((max - min) << 3, "ofByteArray");
		#if alchemy
		var a = output.getAddr(0);
		for (i in min...max)
			flash.Memory.setByte(a++, cast input[i]);
		#else
			#if flash
			var i = 0;
			for (j in min...max)
			{
				var byte = input[j];
				for (k in 0...8)
				{
					var bit = byte & 1;
					byte >>= 1;
					if (bit == 1) output.set(i);
					i++;
				}
			}
			#else
			var input2 = haxe.io.Bytes.ofData(input);
			var i = 0;
			for (j in min...max)
			{
				var byte = input2.get(j);
				for (k in 0...8)
				{
					var bit = byte & 1;
					byte >>= 1;
					if (bit == 1) output.set(i);
					i++;
				}
			}
			#end
		#end
		return output;
	}
	
	/**
	 * Converts <code>input</code> to a <em>BitVector</em> object.
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	public static function toBitVector(input:BitMemory):BitVector
	{
		var bytes = toBytesData(input);
		var bv = new BitVector(input.size);
		bv.ofBytes(bytes);
		return bv;
	}
	
	#if !alchemy
		#if flash10
		var _data:flash.Vector<Int>;
		#else
		var _data:Array<Int>;
		#end
	#end
	
	var _size:Int;
	
	/**
	 * The size measured in bits. 
	 */
	public var size(__size, never):Int;
	inline function __size() return _size
	
	/**
	 * Creates a bit vector capable of storing a total of <code>size</code> bits. 
	 */
 	public function new(size:Int, name = "?")
	{
		#if neko
		super(((size % 31) > 0 ? (Std.int(size / 31) + 1) : Std.int(size / 31)) << 2, name);
		#else
		super(((size & 31) > 0 ? ((size >> 5) + 1) : (size >> 5)) << 2, name);
		#end
		
		_size = size;
		
		#if !alchemy
			#if flash10
			_data = new flash.Vector<Int>(_bytes >> 2, true);
			#else
			_data = new Array<Int>();
			for (i in 0..._bytes >> 2) _data[i] = 0;
			#end
		#end
	}
	
	#if !alchemy
	override public function free():Void
	{
		_data = null;
		super.free();
	}
	#end
	
	/**
	 * Creates a deep copy of this object. 
	 */
	public function clone():BitMemory
	{
		var c = new BitMemory(_size, name);
		#if alchemy
		var src = getAddr(0);
		var dst = c.getAddr(0);
		for (i in 0..._bytes >> 2)
			flash.Memory.setI32(dst + (i << 2), flash.Memory.getI32(src + (i << 2)));
		#else
		var t = c._data;
		for (i in 0..._bytes >> 2) t[i] = _data[i];
		#end
		return c;
	}
	
	/**
	 * Sets all bits to the value <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> is not 0 or 1 (debug only).
	 */
	public function fill(x:Int):Void
	{
		D.assert(x == 0 || x == 1, "x == 0 || x == 1");
		
		#if alchemy
		var offset = getAddr(0);
		var bits = x == 0 ? 0 : -1;
		flash.Memory.setI32(0, bits);
		flash.Memory.setI32(4, bits);
		var d = flash.Memory.getDouble(0);
		for (i in 0...(_bytes >> 2) >> 1)
			flash.Memory.setDouble(offset + (i << 3), d);
		
		if (((_bytes >> 2) & 1) == 1)
			flash.Memory.setI32(offset + (_bytes - 4), bits);
		#else
		if (x == 0)
			for (i in 0..._bytes >> 2) _data[i] = 0;
		else
			for (i in 0..._bytes >> 2) _data[i] =-1;
		#end
	}
	
	/**
	 * Adjusts the size of this object so it's capable of storing <code>newSize</code> bits.
	 * @throws de.polygonal.core.util.AssertionError invalid size (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory was already deallocated (debug only).
	 */
	override public function resize(newSize:Int):Void
	{
		D.assert(newSize >= 0, Sprintf.format("invalid size (%d)", [newSize]));
		
		var newBytes = ((size & 31) > 0 ? ((size >> 5) + 1) : (size >> 5)) << 2;
		
		#if alchemy
		super.resize(newBytes);	
		#else
			#if flash10
			var tmp = new flash.Vector<Int>(newBytes >> 2, true);
			for (i in 0...Mathematics.min(newSize, _size)) tmp[i] = _data[i];
			#else
			var tmp:Array<Int> = ArrayUtil.alloc(newBytes >> 2);
			ArrayUtil.copy(_data, tmp, 0, _size);
			#end
			_data = tmp;
		#end
		
		_size = newSize;
	}
	
	/**
	 * Returns true if the bit at index <code>i</code> is 1.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function has(i:Int):Bool
	{
		#if alchemy
		return ((flash.Memory.getI32(getAddr(i)) & (1 << (i & 31))) >> (i & 31)) != 0;
		#else
			#if neko
			return (_data[getAddr(i)] & (1 << (i % 31))) >> (i % 31) != 0;
			#else
			return (_data[getAddr(i)] & (1 << (i & 31))) >> (i & 31) != 0;
			#end
		#end
	}
	
	/**
	 * Returns 1 if the bit at index <code>i</code> is set, otherwise zero.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function get(i:Int):Int
	{
		#if alchemy
			return ((flash.Memory.getI32(getAddr(i)) & (1 << (i & 31))) >> (i & 31));
		#else
			#if neko
			return (_data[getAddr(i)] & (1 << (i % 31))) >> (i % 31);
			#else
			return (_data[getAddr(i)] & (1 << (i & 31))) >> (i & 31);
			#end
		#end
	}
	
	/**
	 * Sets the bit at index <code>i</code> to 1.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function set(i:Int):Void
	{
		var idx = getAddr(i);
		#if alchemy
		flash.Memory.setI32(idx, flash.Memory.getI32(idx) | (1 << (i & 31)));
		#else
			#if neko
			_data[idx] = _data[idx] | (1 << (i % 31));
			#else
			_data[idx] = _data[idx] | (1 << (i & 31));
			#end
		#end
	}
	
	/**
	 * Sets the bit at index <code>i</code> to 0.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function clr(i:Int):Void
	{
		var idx = getAddr(i);
		#if alchemy
		flash.Memory.setI32(idx, flash.Memory.getI32(idx) & ~(1 << (i & 31)));
		#else
			#if neko
			_data[idx] = _data[idx] & (1 << (i % 31)).ofInt().complement().toInt();
			#else
			_data[idx] = _data[idx] & ~(1 << (i & 31));
			#end
		#end
	}
	
	/**
	 * Sets all bits to 0.
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function clrAll():Void
	{
		#if alchemy
		for (i in 0..._size) flash.Memory.setI32(getAddr(i), 0);
		#else
		for (i in 0..._size) _data[getAddr(i)] = 0;
		#end
	}
	
	/**
	 * Sets all bits to 1.
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function setAll():Void
	{
		#if alchemy
		for (i in 0..._size) flash.Memory.setI32(getAddr(i), -1);
		#else
		for (i in 0..._size) _data[getAddr(i)] = -1;
		#end
	}
	
	/**
	 * Sets the bit at index <code>i</code> to 1 if <code>cond</code> is true or clears the bit at index <code>i</code> if <code>cond</code> is false.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function ofBool(i:Int, cond:Bool):Void
	{
		cond ? set(i) : clr(i);
	}
	
	/**
	 * Returns the memory byte offset for the byte storing the bit at index <code>i</code>.
	 * @throws de.polygonal.core.util.AssertionError segmentation fault (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function getAddr(i:Int):Int
	{
		D.assert(i >= 0 && i < _size, Sprintf.format("segfault, index %d", [i]));
		D.assert(_memory != null, "memory deallocated");
		
		#if alchemy
		return _offset + ((i >> 5) << 2);
		#else
			#if neko
			return (Std.int(i / 31) << 2) >> 2;
			#else
			return ((i >> 5) << 2) >> 2;
			#end
		#end
	}
	
	#if !alchemy
	override public function clear():Void
	{
		for (i in 0...size) _data[getAddr(i)] = 0;
	}
	#end
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var mem = new de.polygonal.ds.mem.BitMemory(32);
	 * for (i in 0...16) {
	 *     mem.set(i);
	 * }
	 * for (i in 16...32) {
	 *     mem.clr(i);
	 * }
	 * trace(mem);</pre>
	 * <pre class="console">
	 * {BitMemory, size: 32}
	 * |<
	 *   0 -> 11111111111111110000000000000000
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		if (_memory == null) return "{BitMemory (unassigned)}";
		var s = Sprintf.format("{BitMemory, size: %d, name: %s}", [size, name]);
		s += "\n|<\n";
		
		for (i in 0...bytes >> 2)
		{
			var t = "";
			for (j in 0...32)
			{
				var k = (i << 5) + j;
				if (k < _size)
					t += has(k) ? "1" : "0";
				else
					t += "#";
			}
			s += Sprintf.format("  %4d -> %s\n", [i, t]);
		}
		s += "\n>|";
		return s;
		#else
		return Sprintf.format("{BitMemory, size: %d, name: %s}", [size, name]);
		#end
	}
}