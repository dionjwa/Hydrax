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

#if !alchemy
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.ArrayUtil;
#end

/**
 * <p>A chunk of "alchemy memory" for storing 32-bit signed integers.</p>
 */
class IntMemory extends MemoryAccess
{
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a byte array.
	 * If no range is specified, all <code>input</code> bytes are copied.<br/>
	 * <warn>The bytes are written in little endian format.</warn>
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if (flash9 || cpp)
	public static function toByteArray(input:IntMemory, min = -1, max = -1):flash.utils.ByteArray
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.size;
		
		D.assert(min >= 0, Sprintf.format("min out of range (%d)", [min]));
		D.assert(max <= input.size, Sprintf.format("max out of range (%d)", [max]));
		D.assert(max - min > 0, Sprintf.format("min equals max (%d)", [min]));
		
		min = input.getAddr(min);
		max = input.getAddr(max - 1);
		
		var output = new flash.utils.ByteArray();
		output.endian = flash.utils.Endian.LITTLE_ENDIAN;
		#if alchemy
		while (min <= max)
		{
			output.writeInt(flash.Memory.getI32(min));
			min += 4;
		}
		#else
		for (i in 0...(max - min) + 1) output.writeInt(input.get(min + i));
		#end
		output.position = 0;
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to an <em>IntMemory</em> object.
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the byte storing the first integer.
	 * @param min index pointing to the byte storing the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if (flash9 || cpp)
	public static function ofByteArray(input:flash.utils.ByteArray, min = -1, max = -1):IntMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		input.position = min;
		min >>= 2;
		max >>= 2;
		var output = new IntMemory(max - min, "ofByteArray");
		for (i in min...max) output.set(i - min, input.readInt());
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <code>BytesData</code> object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.<br/>
	 * <warn>The bytes are written in little endian format.</warn>
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function toBytesData(input:IntMemory, min = -1, max = -1):haxe.io.BytesData
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.size;
		
		D.assert(min >= 0, Sprintf.format("min out of range (%d)", [min]));
		D.assert(max <= input.size, Sprintf.format("max out of range (%d)", [max]));
		D.assert(max - min > 0, Sprintf.format("min equals max (%d)", [min]));
		
		min = input.getAddr(min);
		max = input.getAddr(max - 1);
		
		var output = new haxe.io.BytesOutput();
		for (i in 0...(max - min) + 1) output.writeInt32(haxe.Int32.ofInt(input.get(min + i)));
		return output.getBytes().getData();
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to an <em>IntMemory</em> object.
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the byte storing the first integer.
	 * @param min index pointing to the byte storing the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function ofBytesData(input:haxe.io.BytesData, min = -1, max = -1):IntMemory
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
		
		var bytesInput = new haxe.io.BytesInput(haxe.io.Bytes.ofData(input), min);
		min >>= 2;
		max >>= 2;
		var output = new IntMemory(max - min, "ofBytesData");
		for (i in min...max) output.set(i - min, haxe.Int32.toInt(bytesInput.readInt32()));
		
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to an array.
	 * If no range is specified, all <code>input</code> bytes are copied.
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function toArray(input:IntMemory, min = -1, max = -1):Array<Int>
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.size;
		
		D.assert(min >= 0, Sprintf.format("min out of range (%d)", [min]));
		D.assert(max <= input.size, Sprintf.format("max out of range (%d)", [max]));
		D.assert(max - min > 0, Sprintf.format("min equals max (%d)", [min]));
		
		var output = new Array();
		
		#if alchemy
		min = input.getAddr(min);
		max = input.getAddr(max - 1);
		while (min <= max)
		{
			output.push(flash.Memory.getI32(min));
			min += 4;
		}
		#else
		for (i in 0...max - min) output[i] = input.get(min + i);
		#end
		
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to an <em>IntMemory</em> object.
	 * If no range is specified, all <code>input</code> values are copied.
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function ofArray(input:Array<Int>, min = -1, max = -1):IntMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		var output = new IntMemory(max - min, "ofArray");
		for (i in min...max) output.set(i - min, input[i]);
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a vector object
	 * If no range is specified, all <code>input</code> bytes are copied.
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @param output the <code>Vector</code> object to write into. If null, a new Vector object is created on-the-fly.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if flash10
	public static function toVector(input:IntMemory, min = -1, max = -1, output:flash.Vector<Int> = null):flash.Vector<Int>
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.size;
		
		D.assert(min >= 0, Sprintf.format("min out of range (%d)", [min]));
		D.assert(max <= input.size, Sprintf.format("max out of range (%d)", [max]));
		D.assert(max - min > 0, Sprintf.format("min equals max (%d)", [min]));
		
		#if debug
		if (output != null)
			if (output.fixed)
				D.assert(Std.int(output.length) >= max - min, "output vector is too small");
		#end
		
		if (output == null) output = new flash.Vector<Int>(max - min, true);
		
		#if alchemy
		min = input.getAddr(min);
		max = input.getAddr(max - 1);
		var i = 0;
		while (min <= max)
		{
			output[i++] = flash.Memory.getI32(min);
			min += 4;
		}
		#else
		for (i in 0...max - min) output[i] = input.get(min + i);
		#end
		
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a vector object.
	 * If no range is specified, all <code>input</code> bytes are copied.
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if flash10
	public static function toUnsignedVector(input:IntMemory, min = -1, max = -1):flash.Vector<UInt>
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.size;
		
		D.assert(min >= 0, Sprintf.format("min out of range (%d)", [min]));
		D.assert(max <= input.size, Sprintf.format("max out of range (%d)", [max]));
		D.assert(max - min > 0, Sprintf.format("min equals max (%d)", [min]));
		
		var output = new flash.Vector<UInt>(max - min, true);
		
		#if alchemy
		min = input.getAddr(min);
		max = input.getAddr(max - 1);
		var i = 0;
		while (min <= max)
		{
			output[i++] = flash.Memory.getI32(min);
			min += 4;
		}
		#else
		for (i in 0...max - min) output[i] = input.get(min + i);
		#end
		
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to an <em>IntMemory</em> object.
	 * If no range is specified, all <code>input</code> values are copied.
 	 * @param min index pointing to the first integer.
	 * @param max index pointing to the last integer.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if flash10
	public static function ofVector(input:flash.Vector<Int>, min = -1, max = -1):IntMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		var output = new IntMemory(max - min, "ofVector");
		for (i in min...max) output.set(i - min, input[i]);
		
		return output;
	}
	#end

	#if !alchemy
		#if flash10
		var _data:flash.Vector<Int>;
		#else
		var _data:Array<Int>;
		#end
	#end
	
	var _size:Int;
	
	/**
	 * The size measured in integers. 
	 */
	public var size(__size, never):Int;
	inline function __size() return _size
	
	/**
	 * Creates a byte array capable of storing a total of <code>size</code> integers. 
	 */
	public function new(size:Int, name = "?")
	{
		super(size << 2, name);
		_size = size;
		
		#if !alchemy
			#if flash10
			_data = new flash.Vector<Int>(size, true);
			#else
			_data = new Array<Int>();
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
	public function clone():IntMemory
	{
		var c = new IntMemory(_bytes >> 2, name);
		#if alchemy
		var src = getAddr(0);
		var dst = c.getAddr(0);
		for (i in 0..._size)
			flash.Memory.setI32(dst + (i << 2), flash.Memory.getI32(src + (i << 2)));
		#else
		var t = c._data;
		for (i in 0..._size) t[i] = _data[i];
		#end
		return c;
	}
	
	/**
	 * Sets all integers to the value <code>x</code>. 
	 */
	public function fill(x:Int):Void
	{
		#if alchemy
		flash.Memory.setI32(0, x);
		flash.Memory.setI32(4, x);
		var d = flash.Memory.getDouble(0);
		var offset = getAddr(0);
		for (i in 0..._size >> 1)
			flash.Memory.setDouble(offset + (i << 3), d);
		if ((_size & 1) == 1)
			flash.Memory.setI32(getAddr(_size - 1), x);
		#else
		for (i in 0..._size) _data[i] = x;
		#end
	}
	
	/**
	 * Adjusts the size of this object so it's capable of storing <code>newSize</code> integers.
	 * @throws de.polygonal.core.util.AssertionError invalid size (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory was already deallocated (debug only).
	 */
	override public function resize(newSize:Int):Void
	{
		D.assert(newSize >= 0, Sprintf.format("invalid size (%d)", [newSize]));
		
		#if alchemy
		super.resize(newSize << 2);
		#else
			#if flash10
			var tmp = new flash.Vector<Int>(newSize, true);
			for (i in 0...Mathematics.min(newSize, _size)) tmp[i] = _data[i];
			#else
			var tmp:Array<Int> = ArrayUtil.alloc(newSize);
			ArrayUtil.copy(_data, tmp, 0, _size);
			#end
			_data = tmp;
		#end
		
		_size = newSize;
	}
	
	/**
	 * Returns the integer at index <code>i</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function get(i:Int):Int
	{
		#if alchemy
		return flash.Memory.getI32(getAddr(i));
		#else
		return _data[i];
		#end
	}
	
	/**
	 * Replaces the integer at the index <code>i</code> with the integer <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function set(i:Int, x:Int):Void
	{
		#if alchemy
		flash.Memory.setI32(getAddr(i), x);
		#else
		_data[i] = x;
		#end
	}
	
	/**
	 * Swaps the integer at index <code>i</code> with the integer at index <code>j</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function swp(i:Int, j:Int):Void
	{
		D.assert(i != j, Sprintf.format("i equals j (%d)", [i]));
		
		#if alchemy
		var ai = getAddr(i);
		var aj = getAddr(j);
		var tmp = flash.Memory.getI32(ai);
		flash.Memory.setI32(ai, flash.Memory.getI32(aj));
		flash.Memory.setI32(ai, tmp);
		#else
		var tmp = _data[i]; _data[i] = _data[j]; _data[j] = tmp;
		#end
	}
	
	/**
	 * Returns the memory byte offset of the first byte storing the integer at index <code>i</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function getAddr(i:Int):Int
	{
		D.assert(i >= 0 && i < _size, Sprintf.format("segfault, index %d", [i]));
		D.assert(_memory != null, "memory deallocated");
		
		#if alchemy
		return _offset + (i << 2);
		#else
		return i;
		#end
	}
	
	#if !alchemy
	override public function clear():Void
	{
		for (i in 0...size) _data[i] = 0;
	}
	#end
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var mem = new new de.polygonal.ds.mem.IntMemory(4);
	 * for (i in 0...4) {
	 *     mem.set(i, i);
	 * }
	 * trace(mem);</pre>
	 * <pre class="console">
	 * {IntMemory, size: 4}
	 * |<
	 *   0 -> 0
	 *   1 -> 1
	 *   2 -> 2
	 *   3 -> 3
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		if (_memory == null) return "{IntMemory (unassigned)}";
		var s = Sprintf.format("{IntMemory, size: %d, name: %s}", [size, name]);
		s += "\n|<\n";
		for (i in 0...size)
			s += Sprintf.format("  %3d -> %#d\n", [i, get(i)]);
		s += "\n>|";
		return s;
		#else
		return Sprintf.format("{IntMemory, size: %d, name: %s}", [size, name]);
		#end
	}
}