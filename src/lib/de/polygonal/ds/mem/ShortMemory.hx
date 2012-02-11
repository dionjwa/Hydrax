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
 * <p>A chunk of 'alchemy memory' for storing 16-bit signed integers.</p>
 */
class ShortMemory extends MemoryAccess
{
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a byte array.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.<br/>
	 * <warn>The bytes are written in little endian format.</warn>
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if (flash9 || cpp)
	public static function toByteArray(input:ShortMemory, min = -1, max = -1):flash.utils.ByteArray
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
			output.writeShort(flash.Memory.getUI16(min));
			min += 2;
		}
		#else
		for (i in 0...(max - min) + 1) output.writeShort(input.get(min + i));
		#end
		output.position = 0;
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <em>ShortMemory</em> object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the byte storing the first short.
	 * @param min index pointing to the byte storing the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	#if (flash9 || cpp)
	public static function ofByteArray(input:flash.utils.ByteArray, min = -1, max = -1):ShortMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		input.position = min;
		min >>= 1;
		max >>= 1;
		var output = new ShortMemory(max - min, "ofByteArray");
		for (i in min...max) output.set(i - min, input.readShort());
		return output;
	}
	#end
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a byte array.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.<br/>
	 * <warn>The bytes are written in little endian format.</warn>
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function toBytesData(input:ShortMemory, min = -1, max = -1):haxe.io.BytesData
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.size;
		
		D.assert(min >= 0, Sprintf.format("min out of range (%d)", [min]));
		D.assert(max <= input.size, Sprintf.format("max out of range (%d)", [max]));
		D.assert(max - min > 0, Sprintf.format("min equals max (%d)", [min]));
		
		var output = new haxe.io.BytesOutput();
		for (i in 0...max - min)
			output.writeInt16(input.get(min + i));
		return output.getBytes().getData();
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <em>ShortMemory</em> object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the byte storing the first short.
	 * @param min index pointing to the byte storing the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function ofBytesData(input:haxe.io.BytesData, min = -1, max = -1):ShortMemory
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
		min >>= 1;
		max >>= 1;
		var output = new ShortMemory(max - min, "ofBytesData");
		for (i in min...max) output.set(i - min, bytesInput.readInt16());
		
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to an array.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function toArray(input:ShortMemory, min = -1, max = -1):Array<Int>
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
			output.push(flash.Memory.getUI16(min));
			min += 2;
		}
		#else
		for (i in 0...max - min) output[i] = input.get(min + i);
		#end
		
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <em>ShortMemory</em> object.<br/>
	 * If no range is specified, all <code>input</code> values are copied.
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function ofArray(input:Array<Int>, min = -1, max = -1):ShortMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		var output = new ShortMemory(max - min, "ofArray");
		for (i in min...max) output.set(i - min, input[i]);
		
		return output;
	}
	
	#if flash10
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a vector object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @param output the <code>Vector</code> object to write into. If null, a new Vector object is created on-the-fly.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function toVector(input:ShortMemory, min = -1, max = -1, output:flash.Vector<Int> = null):flash.Vector<Int>
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
			output[i++] = flash.Memory.getUI16(min);
			min += 2;
		}
		#else
		for (i in 0...max - min) output[i] = input.get(min + i);
		#end
		
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a vector object.<br/>
	 * If no range is specified, all <code>input</code> bytes are copied.
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function toUnsignedVector(input:ShortMemory, min = -1, max = -1):flash.Vector<UInt>
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
			output[i++] = flash.Memory.getUI16(min);
			min += 2;
		}
		#else
		for (i in 0...max - min) output[i] = input.get(min + i);
		#end
		
		return output;
	}
	
	/**
	 * Converts <code>input</code> in the range &#091;<code>min</code>, <code>max</code>&#093; to a <em>ShortMemory</em> object.<br/>
	 * If no range is specified, all <code>input</code> values are copied.
	 * @param min index pointing to the first short.
	 * @param max index pointing to the last short.
	 * @throws de.polygonal.core.util.AssertionError invalid range, invalid <code>input</code> or memory deallocated (debug only).
	 */
	public static function ofVector(input:flash.Vector<Int>, min = -1, max = -1):ShortMemory
	{
		D.assert(input != null, "invalid input");
		
		if (min == -1) min = 0;
		if (max == -1) max = input.length;
		
		D.assert(min >= 0, "min >= 0");
		D.assert(max <= Std.int(input.length), "max <= input.length");
		
		var output = new ShortMemory(max - min, "ofVector");
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
	 * The size measured in bytes. 
	 */
	public var size(__size, never):Int;
	inline function __size() return _size
	
	/**
	 * Creates a byte array capable of storing a total of <code>size</code> shorts. 
	 */
	public function new(size:Int, name = "?")
	{
		super(size << 1, name);
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
	public function clone():ShortMemory
	{
		var c = new ShortMemory(_bytes >> 1, name);
		#if alchemy
		var src = getAddr(0);
		var dst = c.getAddr(0);
		for (i in 0..._size)
			flash.Memory.setI16(dst + (i << 1), flash.Memory.getUI16(src + (i << 1)));
		#else
		var t = c._data;
		for (i in 0..._size) t[i] = _data[i];
		#end
		return c;
	}
	
	/**
	 * Sets all shorts to the value <code>x</code>. 
	 */
	public function fill(x:Int):Void
	{
		#if alchemy
		var offset = getAddr(0);
		flash.Memory.setI16(0, x);
		flash.Memory.setI16(2, x);
		flash.Memory.setI16(4, x);
		flash.Memory.setI16(6, x);
		var d = flash.Memory.getDouble(0);
		for (i in 0...(_size << 1) >> 3)
			flash.Memory.setDouble(offset + (i << 3), d);
		
		var r = _size & 3;
		if (r > 0)
		{
			offset = getAddr(_size - r);
			for (i in 0...r) flash.Memory.setI16(offset + (i << 1), x);
		}
		#else
		for (i in 0..._size) _data[i] = x;
		#end
	}
	
	/**
	 * Adjusts the size of this object so it's capable of storing <code>newSize</code> shorts.
	 * @throws de.polygonal.core.util.AssertionError invalid size (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory was already deallocated (debug only).
	 */
	override public function resize(newSize:Int):Void
	{
		D.assert(newSize >= 0, Sprintf.format("invalid size (%d)", [newSize]));
		
		#if alchemy
		super.resize(newSize << 1);
		#else
			#if flash10
			var tmp = new flash.Vector<Int>(newSize, true);
			for (i in 0...Mathematics.min(newSize, _size)) tmp[i] = _data[i];
			#else
			var tmp = ArrayUtil.alloc(newSize);
			ArrayUtil.copy(_data, tmp, 0, _size);
			#end
			_data = tmp;
		#end
		
		_size = newSize;
	}
	
	/**
	 * Returns the short at index <code>i</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function get(i:Int):Int
	{
		#if alchemy
		return flash.Memory.getUI16(getAddr(i));
		#else
		return _data[i];
		#end
	}
	
	/**
	 * Replaces the short at the index <code>i</code> with the short <code>x</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function set(i:Int, x:Int):Void
	{
		#if alchemy
		flash.Memory.setI16(getAddr(i), x);
		#else
		_data[i] = x;
		#end
	}
	
	/**
	 * Swaps the short at index <code>i</code> with the short at index <code>j</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>i</code> equals <code>j</code> (debug only).
	 */
	inline public function swp(i:Int, j:Int):Void
	{
		D.assert(i != j, Sprintf.format("i equals j (%d)", [i]));
		
		#if alchemy
		var ai = getAddr(i);
		var aj = getAddr(j);
		var tmp = flash.Memory.getUI16(ai);
		flash.Memory.setI16(ai, flash.Memory.getUI16(aj));
		flash.Memory.setI16(ai, tmp);
		#else
		var tmp = _data[i]; _data[i] = _data[j]; _data[j] = tmp;
		#end
	}
	
	/**
	 * Returns the memory byte offset of the first byte storing the short at index <code>i</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError memory deallocated (debug only).
	 */
	inline public function getAddr(i:Int):Int
	{
		D.assert(i >= 0 && i < _size, Sprintf.format("segfault, index %d", [i]));
		D.assert(_memory != null, "memory deallocated");
		
		#if alchemy
		return _offset + (i << 1);
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
	 * var mem = new new de.polygonal.ds.mem.ShortMemory(4);
	 * for (i in 0...4) {
	 *     mem.set(i, i);
	 * }
	 * trace(mem);</pre>
	 * <pre class="console">
	 * {ShortMemory, size: 4}
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
		if (_memory == null) return "{ShortMemory (unassigned)}";
		var s = Sprintf.format("{ShortMemory, size: %d, name: %s}", [size, name]);
		s += "\n|<\n";
		for (i in 0...size)
			s += Sprintf.format("  %3d -> %#.3f\n", [i, get(i)]);
		s += "\n>|";
		return s;
		#else
		return Sprintf.format("{ShortMemory, size: %d, name: %s}", [size, name]);
		#end
	}
}