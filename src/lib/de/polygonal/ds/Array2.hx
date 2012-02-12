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
package de.polygonal.ds;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.util.Assert;
import de.polygonal.core.util.Instance;

private typedef Array2Friend<T> = 
{
	private var _a:Array<T>;
	private var _w:Int;
	private var _h:Int;
}

/**
 * <p>A two-dimensional array based on a rectangular sequential array.</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class Array2<T> implements Collection<T>
{
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	/**
	 * If true, reuses the iterator object instead of allocating a new one when calling <code>iterator()</code>.<br/>
	 * The default is false.<br/>
	 * <warn>If true, nested iterations are likely to fail as only one iteration is allowed at a time.</warn>
	 */
	public var reuseIterator:Bool;
	
	var _a:Array<T>;
	var _w:Int;
	var _h:Int;
	var _iterator:Array2Iterator<T>;
	
	/**
	 * Creates a two-dimensional array with dimensions <code>width</code> and <code>height</code>.<br/>
	 * The minimum size is 2x2.
	 * @throws de.polygonal.core.util.AssertionError invalid <code>width</code> or <code>height</code> (debug only).
	 */
	public function new(width:Int, height:Int)
	{
		D.assert(width >= 2 && height >= 2, Sprintf.format("invalid size (width:%d, height:%d)", [width, height]));
		
		_w            = width;
		_h            = height;
		_a            = ArrayUtil.alloc(size());
		_iterator     = null;
		key           = HashKey.next();
		reuseIterator = false;
	}
	
	/**
	 * Returns the element that is stored in column <code>x</code> and row <code>y</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code> out of range (debug only).
	 */
	inline public function get(x:Int, y:Int):T
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		
		return __get(getIndex(x, y));
	}
	
	/**
	 * Returns the element that is stored in column <code>cell.x</code> and row <code>cell.y</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> is null (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code> out of range (debug only).
	 */
	inline public function getAt(cell:Array2Cell):T
	{
		D.assert(cell != null, 'cell is null');
		return __get(getIndex(cell.x, cell.y));
	}
	
	/**
	 * Replaces the element at column <code>x</code> and row <code>y</code> with <code>val</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code> out of range (debug only).
	 */
	inline public function set(x:Int, y:Int, val:T):Void
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		
		__set(getIndex(x, y), val);
	}
	
	/**
	 * Returns the element at index <code>i</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function getAtIndex(i:Int):T
	{
		D.assert(i >= 0 && i < size(), Sprintf.format("index out of range (%d)", [i]));
		return __get(getIndex(i % _w, Std.int(i / _w)));
	}
	
	/**
	 * Replaces the element at index <code>i</code> with the <code>x</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function setAtIndex(i:Int, x:T):Void
	{
		D.assert(i >= 0 && i < size(), Sprintf.format("index out of range (%d)", [i]));
		__set(getIndex(i % _w, Std.int(i / _w)), x);
	}
	
	/**
	 * The width (#columns).
	 * <o>1</o>
	 */
	inline public function getW():Int
	{
		return _w;
	}
	
	/**
	 * Sets the width to <code>x</code>.<br/>
	 * The minimum value is 2.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid width (debug only).
	 */
	inline public function setW(x:Int):Void
	{
		resize(x, _h);
	}
	
	/**
	 * The height (#rows).
	 * <o>1</o>
	 */
	inline public function getH():Int
	{
		return _h;
	}
	
	/**
	 * Sets the height to <code>x</code>.<br/>
	 * The minimum value is 2.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid height (debug only).
	 */
	inline public function setH(x:Int):Void
	{
		resize(_w, x);
	}
	
	/**
	 * Computes an index into the linear array from the <code>x<code> and <code>y</code> index.
	 * <o>1</o>
	 */
	inline public function getIndex(x:Int, y:Int):Int
	{
		return y * _w + x;
	}
	
	/**
	 * Returns the index of the first occurrence of the element <code>x</code> or returns -1 if element <code>x</code> does not exist.<br/>
	 * The index is in the range &#091;0, size() - 1&#093;.
	 * <o>n</o>
	 */
	inline public function indexOf(x:T):Int
	{
		var i = 0;
		var j = _w * _h;
		while (i < j)
		{
			if (_a[i] == x) break;
			i++;
		}
		
		return (i == j) ? -1 : i;
	}
	
	/**
	 * Returns true if <code>x</code> and <code>y</code> are valid.
	 */
	inline public function inRange(x:Int, y:Int):Bool
	{
		return x >= 0 && x < _w && y >= 0 && y < _h;
	}
	
	/**
	 * Returns the cell coordinates of the first occurrence of the element <code>x</code> or null if element <code>x</code> does not exist.
	 * <o>n</o>
	 * @param cell stores the result.
	 * @return a reference to <code>cell</code>.
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> is null (debug only).
	 */
	inline public function cellOf(x:T, cell:Array2Cell):Array2Cell
	{
		D.assert(cell != null, "cell != null");
		
		var i = indexOf(x);
		if (i == -1)
			return null;
		else
			return indexToCell(i, cell);
	}
	
	/**
	 * Transforms the index <code>i</code> into <code>cell</code> coordinates.
	 * <o>1</o>
	 * @param cell stores the result.
	 * @return a reference to <code>cell</code>.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> is null (debug only).
	 */
	inline public function indexToCell(i:Int, cell:Array2Cell):Array2Cell
	{
		D.assert(i >= 0 && i < size(), Sprintf.format("index out of range (%d)", [i]));
		D.assert(cell != null, "cell is null");
		
		cell.y = Std.int(i / _w);
		cell.x = i % _w;
		return cell;
	}
	
	/**
	 * Computes an array index into the linear array from the <code>cell</code> coordinates.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> index out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> is null (debug only).
	 */
	inline public function cellToIndex(cell:Array2Cell):Int
	{
		D.assert(cell != null, "cell != null");
		D.assert(cell.x >= 0 && cell.x < getW(), Sprintf.format("x index out of range (%d)", [cell.x]));
		D.assert(cell.y >= 0 && cell.y < getH(), Sprintf.format("y index out of range (%d)", [cell.y]));
		
		return getIndex(cell.x, cell.y);
	}
	
	/**
	 * Copies all elements stored in row <code>y</code> by reference into the <code>output</code> array.
	 * <o>n</o>
	 * @return a reference to the <code>output</code> array.
	 * @throws de.polygonal.core.util.AssertionError <code>y</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>output</code> is null (debug only).
	 */
	inline public function getRow(y:Int, output:Array<T>):Array<T>
	{
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(output != null, "output is null");
		
		var offset = y * _w;
		for (x in 0..._w)
			output[x] = __get(offset + x);
		return output;
	}
	
	/**
	 * Overwrites all elements in row <code>y</code> with the elements stored in the <code>input</code> array.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>y</code> out of range or <code>input</code> is null or insufficient input values (debug only).
	 */
	public function setRow(y:Int, input:Array<T>):Void
	{
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(input != null, "input is null");
		D.assert(input.length >= getW(), "insufficient input values");
		
		var offset = y * _w;
		for (x in 0..._w)
			__set(offset + x, input[x]);
	}
	
	/**
	 * Copies all elements stored in column <code>x</code> by reference into the <code>output</code> array.
	 * <o>n</o>
	 * @return a reference to the <code>output</code> array.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>output</code> is null (debug only).
	 */
	public function getCol(x:Int, output:Array<T>):Array<T>
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(output != null, "output is null");
		
		for (i in 0..._h)
			output[i] = __get(i * _w + x);
		return output;
	}
	
	/**
	 * Overwrites all elements in column <code>x</code> with the elements stored in the <code>input</code> array.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or insufficient input values (debug only).
	 */
	public function setCol(x:Int, input:Array<T>):Void
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(input != null, "input is null");
		D.assert(input.length >= getH(), "insufficient input values");
		
		for (y in 0..._h)
			__set(getIndex(x, y), input[y]);
	}
	
	/**
	 * Replaces all existing elements with objects of type <code>C</code>.
	 * <o>n</o>
	 * @param C the class to instantiate for each element.
	 * @param args passes additional constructor arguments to the class <code>C</code>.
	 */
	public function assign(C:Class<T>, ?args:Array<Dynamic>):Void
	{
		for (i in 0...size()) __set(i, Instance.create(C, args));
	}
	
	/**
	 * Replaces all existing elements with the instance of <code>x</code>. 
	 * <o>n</o>
	 */
	public function fill(x:T):Void
	{
		for (i in 0...size()) __set(i, x);
	}
	
	/**
	 * Invokes the <code>process</code> function for each element.<br/>
	 * The function signature is: <em>process(oldValue, xIndex, yIndex):newValue</em>
	 * <o>n</o>
	 */
	public function walk(process:T->Int->Int->T):Void
	{
		for (y in 0..._h)
		{
			for (x in 0..._w)
			{
				var i = getIndex(x, y);
				__set(i, process(__get(i), x, y)); 
			}
		}
	}

	/**
	 * Resizes this two-dimensional array.
	 * <o>n</o>
	 * @param width the new width (minimum is 2).
	 * @param height the new height (minimum is 2).
	 * @throws de.polygonal.core.util.AssertionError invalid dimensions (debug only).
	 */
	public function resize(w:Int, h:Int):Void
	{
		D.assert(w >= 2 && h >= 2, Sprintf.format("invalid size (w:%d, h:%d)", [w, h]));
		
		if (w == _w && h == _h) return;
		var t = _a;
		_a = ArrayUtil.alloc(w * h);
		
		var minX = w < _w ? w : _w;
		var minY = h < _h ? h : _h;
		
		for (y in 0...minY)
		{
			var t1 = y *  w;
			var t2 = y * _w;
			for (x in 0...minX)
				__set(t1 + x, t[t2 + x]);
		}
		
		_w = w;
		_h = h;
	}
	
	/**
	 * Shifts all columns to the west by one position.<br/>
	 * Columns are wrapped so the column at index 0 is not lost but appended to the rightmost column.
	 * <o>n</o>
	 */
	public function shiftW():Void
	{
		var t, k;
		for (y in 0..._h)
		{
			k = y * _w;
			t = __get(k);
			for (x in 1..._w)
				__set(k + x - 1, __get(k + x));
			__set(k + _w - 1, t);
		}
	}
	
	/**
	 * Shifts all columns to the east by one position.<br/>
	 * Columns are wrapped, so the column at index &#091;<em>getW()</em> - 1&#093; is not lost but prepended to the leftmost column.
	 * <o>n</o>
	 */
	public function shiftE():Void
	{
		var t, x, k;
		for (y in 0..._h)
		{
			k = y * _w;
			t = __get(k + _w - 1);
			x = _w - 1;
			while (x-- > 0)
				__set(k + x + 1, __get(k + x));
			__set(k, t);
		}
	}

	/**
	 * Shifts all rows to the north by one position.<br/>
	 * Rows are wrapped, so the row at index 0 is not lost but appended to the bottommost row.
	 * <o>n</o>
	 */
	public function shiftN():Void
	{
		var t;
		var k = _h - 1;
		var l = (_h - 1) * _w;
		for (x in 0..._w)
		{
			t = __get(x);
			for (y in 0...k)
				__set(getIndex(x, y), __get((y + 1) * _w + x));
			__set(l + x, t);
		}
	}

	/**
	 * Shifts all rows to the south by one position.<br/>
	 * Rows are wrapped, so row at index &#091;<em>getH()</em> - 1&#093; is not lost but prepended to the topmost row.
	 * <o>n</o>
	 */
	public function shiftS():Void
	{
		var t, k, y;
		var k = _h - 1;
		var l = k * _w;
		for (x in 0..._w)
		{
			t = __get(l + x);
			y = k;
			while(y-- > 0) __set((y + 1) * _w + x, __get(getIndex(x, y)));
			__set(x, t);
		}
	}
	
	/**
	 * Swaps the element at column/row <code>x0</code>, <code>y0</code> with the element at column/row <code>x1</code>, <code>y1</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x0</code>/<code>y0</code> or <code>x1</code>/<code>y1</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>x0</code>, <code>y0</code> equals <code>x1</code>, <code>y1</code> (debug only).
	 */
	inline public function swap(x0:Int, y0:Int, x1:Int, y1:Int):Void
	{
		D.assert(x0 >= 0 && x0 < getW(), Sprintf.format("x0 index out of range (%d)", [x0]));
		D.assert(y0 >= 0 && y0 < getH(), Sprintf.format("y0 index out of range (%d)", [y0]));
		D.assert(x1 >= 0 && x1 < getW(), Sprintf.format("x1 index out of range (%d)", [x1]));
		D.assert(y1 >= 0 && y1 < getH(), Sprintf.format("y1 index out of range (%d)", [y1]));
		D.assert(!(x0 == x1 && y0 == y1), Sprintf.format("source indices equal target indices (x: %d, y: %d)", [x0, y0]));
		
		var i = y0 * _w + x0;
		var j = y1 * _w + x1;
		var t = __get(i);
		__set(i, __get(j));
		__set(j, t);
	}

	/**
	 * Appends the elements of the <code>input</code> array in the range &#091;0, <em>getW()</em>&#093; by adding a new row.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or too short (debug only).
	 */
	public function appendRow(input:Array<T>):Void
	{
		D.assert(input != null, "input is null");
		D.assert(input.length >= getW(), "insufficient input values");
		
		var t = _w * _h++;
		for (x in 0..._w) __set(x + t, input[x]);
	}
	
	/**
	 * Appends the elements of the <code>input</code> array in the range &#091;0, <em>getH()</em>&#093; by adding a new column.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or too short (debug only).
	 */
	public function appendCol(input:Array<T>):Void
	{
		D.assert(input != null, "input is null");
		D.assert(input.length >= getH(), "insufficient input values");
		
		var l = size() + _h;
		var i = _h - 1;
		var j = _h;
		var x = _w;
		var y = l;
		while (y-- > 0)
		{
			if (++x > _w)
			{
				x = 0;
				j--;
				__set(y, input[i--]);
			}
			else
				__set(y, __get(y - j));
		}
		_w++;
	}
	
	/**
	 * Prepends the elements of the <code>input</code> array in the range &#091;0, <em>getW()</em>&#093; by adding a new row.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or too short (debug only).
	 */
	public function prependRow(input:Array<T>):Void
	{
		D.assert(input != null, "input is null");
		D.assert(input.length >= getW(), "insufficient input values");
		
		_h++;
		var y = size();
		while (y-- > _w)
			__set(y, __get(y - _w));
		
		y++;
		
		while (y-- > 0)
			__set(y, input[y]);
	}
	
	/**
	 * Prepends the elements of the <code>input</code> array in the range &#091;0, <em>getH()</em>&#093; by adding a new column.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or too short (debug only).
	 */
	public function prependCol(input:Array<T>):Void
	{
		D.assert(input != null, "input is null");
		D.assert(input.length >= getH(), "insufficient input values");
		
		var l = size() + _h;
		var i = _h - 1;
		var j = _h;
		var x = 0;
		var y = l;
		while (y-- > 0)
		{
			if (++x > _w)
			{
				x = 0;
				j--;
				__set(y, input[i--]);
			}
			else
				__set(y, __get(y - j));
		}
		_w++;
	}
	
	/**
	 * Transposes this two-dimensional array.
	 * <o>n</o>
	 */
	public function transpose():Void
	{
		if (_w == _h)
		{
			for (y in 0..._h)
				for (x in y + 1..._w)
					swap(x, y, y, x);
		}
		else
		{
			var t = new Array<T>();
			for (y in 0..._h)
				for (x in 0..._w)
					t[x * _h + y] = get(x, y);
			_a = t;
			_w ^= _h;
			_h ^= _w;
			_w ^= _h;
		}
	}
	
	/**
	 * Grants access to the rectangular sequential array storing the elements of this two-dimensional array.<br/>
	 * Useful for fast iteration or low-level operations.
	 * <o>1</o>
	 */
	inline public function getArray():Array<T>
	{
		return _a;
	}
	
	/**
	 * Copies all elements from the given nested two-dimensional array <code>a</code> into this two-dimensional array.
	 * @throws de.polygonal.core.util.AssertionError invalid dimensions of <code>a</code> (debug only).
	 */
	public function setNestedArray(a:Array<Array<T>>):Void
	{
		D.assert(a.length == getH() && a[0] != null && a[0].length == getW(), 'invalid input');
		
		var w = a[0].length;
		for (y in 0...a.length)
		{
			var row = a[y];
			for (x in 0...w)
				__set(getIndex(x, y), row[x]);
		}
	}
	
	/**
	 * Shuffles the elements of this collection by using the Fisher-Yates algorithm.<
	 * <o>n</o>
	 * @param rval a list of random double values in the range between 0 (inclusive) to 1 (exclusive) defining the new positions of the elements.
	 * If omitted, random values are generated on-the-fly by calling <em>Math.random()</em>.
	 * @throws de.polygonal.core.util.AssertionError insufficient random values (debug only).
	 */
	public function shuffle(?rval:DA<Float>):Void
	{
		var s = size();
		if (rval == null)
		{
			var m = Math;
			while (--s > 1)
			{
				var i = Std.int(m.random() * s);
				var t = __get(s);
				__set(s, __get(i));
				__set(i, t);
			}
		}
		else
		{
			D.assert(rval.size() >= size(), "insufficient random values");
			
			var j = 0;
			while (--s > 1)
			{
				var i = Std.int(rval.get(j++) * s);
				var t = __get(s);
				__set(s, __get(i));
				__set(i, t);
			}
		}
	}
	
	/**
	 * Returns a string representing the current object.<br/>
	 * Prints out all elements if compiled with the <em>-debug</em> directive.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * var array2 = new de.polygonal.ds.Array2&lt;String&gt;(4, 4);
	 * array2.walk(function(val:String, x:Int, y:Int):String { return Std.string(x) + "." + Std.string(y); });
	 * trace(array2);</pre>
	 * <pre class="console">
	 * {Array2, 4x4}
	 * |<
	 *   &#091;0.0&#093;&#091;1.0&#093;&#091;2.0&#093;&#091;3.0&#093;
	 *   &#091;0.1&#093;&#091;1.1&#093;&#091;2.1&#093;&#091;3.1&#093;
	 *   &#091;0.2&#093;&#091;1.2&#093;&#091;2.2&#093;&#091;3.2&#093;
	 *   &#091;0.3&#093;&#091;1.3&#093;&#091;2.3&#093;&#091;3.3&#093;
	 * >|</pre>
	 */
	public function toString():String
	{
		#if debug
		var l = 0;
		for (i in 0...size())
		{
			var s = Std.string(__get(i));
			l = Std.int(Math.max(s.length, l));
		}
		var s = Sprintf.format("{Array2, %dx%d}", [_w, _h]);
		s += "\n|<\n";
		var offset, value;
		for (y in 0..._h)
		{
			s += "  ";
			offset = y * _w;
			for (x in 0..._w)
				s += Sprintf.format("[%" + l + "s]", [Std.string(__get(offset + x))]);
			s += "\n";
		}
		
		s += ">|";
		return s;
		#else
		return Sprintf.format("{Array2, %dx%d}", [_w, _h]);
		#end
	}
	
	/*///////////////////////////////////////////////////////
	// collection
	///////////////////////////////////////////////////////*/
	
	/**
	 * Destroys this object by explicitly nullifying all elements for GC'ing used resources.<br/>
	 * Improves GC efficiency/performance (optional).
	 * <o>n</o>
	 */
	public function free():Void
	{
		var NULL:Null<T> = null;
		for (i in 0...size()) __set(i, NULL);
		_a = null;
		_iterator = null;
	}
	
	/**
	 * Returns true if this two-dimensional array contains the element <code>x</code>. 
	 * <o>n</o>
	 */
	public function contains(x:T):Bool
	{
		for (i in 0...size())
		{
			if (__get(i) == x)
				return true;
		}
		return false;
	}
	
	/**
	 * Nullifies all occurrences of <code>x</code>.<br/>
	 * The size is not altered.
	 * <o>n</o>
	 * @return true if at least one occurrence of <code>x</code> was nullified.
	 */
	public function remove(x:T):Bool
	{
		var found = false;
		for (i in 0...size())
		{
			if (__get(i) == x)
			{
				__set(i, null);
				found = true;
			}
		}
		
		return found;
	}
	
	/**
	 * Clears this two-dimensional array by nullifying all elements.<br/>
	 * The <code>purge</code> parameter has no effect.
	 * <o>1 or n if <code>purge</code> is true</o>
	 */
	public function clear(purge = false):Void
	{
		var NULL:Null<T> = null;
		for (i in 0..._a.length) __set(i, NULL);
	}
	
	/**
	 * Returns a new <em>Array2Iterator</em> object to iterate over all elements contained in this two-dimensional array.<br/>
	 * Order: Row-major order (row-by-row).
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<T>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
				_iterator = new Array2Iterator<T>(this);
			else
				_iterator.reset();
			return _iterator;
		}
		else
			return new Array2Iterator<T>(this);
	}
	
	/**
	 * The number of elements in this two-dimensional array.<br/>
	 * Always equals <em>getW()</em> * <em>getH()</em>.
	 * <o>1</o>
	 */
	inline public function size():Int
	{
		return _w * _h;
	}
	
	/**
	 * Unsupported operation - always returns false in release mode.
	 * <o>1</o>
	 */
	public function isEmpty():Bool
	{
		return false;
	}
	
	/**
	 * Returns an array containing all elements in this two-dimensional array.<br/>
	 * Order: Row-major order (row-by-row).
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(size());
		for (i in 0...size()) a[i] = __get(i);
		return a;
	}
	
	#if flash10
	/**
	 * Returns a Vector.&lt;T&gt; object containing all elements in this two-dimensional array.<br/>
	 * Order: Row-major order (row-by-row).
	 */
	public function toVector():flash.Vector<Dynamic>
	{
		var a = new flash.Vector<Dynamic>(size(), false);
		for (i in 0...size()) a[i] = __get(i);
		return a;
	}
	#end
	
	/**
	 * Returns a dense array containing all elements in this two-dimensional array.<br/>
	 * Order: Row-major order (row-by-row).
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(size());
		for (i in 0...size()) a.pushBack(__get(i));
		return a;
	}
	
	/**
	 * Duplicates this two-dimensional array. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		var copy = new Array2<T>(_w, _h);
		if (assign)
		{
			for (i in 0...size())
				copy.__set(i, untyped __get(i));
		}
		else
		if (copier == null)
		{
			var c:Cloneable<T> = null;
			for (i in 0...size())
			{
				D.assert(Std.is(__get(i), Cloneable), Sprintf.format("element is not of type Cloneable (%s)", [__get(i)]));
				c = untyped __get(i);
				copy.__set(i, c.clone());
			}
		}
		else
		{
			for (i in 0...size())
				copy.__set(i, copier(__get(i)));
		}
		return copy;
	}
	
	inline function __get(i:Int) return _a[i]
	inline function __set(i:Int, x:T) _a[i] = x
}

#if doc
private
#end
class Array2Iterator<T> implements de.polygonal.ds.Itr<T>
{
	var _f:Array2<T>;
	
	var _a:Array<T>;
	var _i:Int;
	var _s:Int;
	
	public function new(f:Array2<T>)
	{
		_f = f;
		reset();
	}
	
	inline public function reset():Itr<T>
	{
		_a = __a(_f);
		_s = __size(_f);
		_i = 0;
		return this;
	}
	
	inline public function hasNext():Bool
	{
		return _i < _s;
	}

	inline public function next():T
	{
		return _a[_i++];
	}
	
	inline public function remove():Void
	{
		//just nullify value
		D.assert(_i > 0, 'call next() before removing an element');
		_a[_i - 1] = null;
	}
	
	inline function __a<T>(f:Array2Friend<T>) return f._a
	inline function __size<T>(f:Array2Friend<T>) return f._w * f._h
}

/**
 * Stores the x,y position of a two-dimensional cell. 
 */
class Array2Cell
{
	/**
	 * The column index. 
	 */
	public var x:Int;
	
	/**
	 * The row index. 
	 */
	public var y:Int;
	
	public function new(x = 0, y = 0)
	{
		this.x = x;
		this.y = y;
	}
}