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

private typedef Array3Friend<T> = 
{
	private var _a:Array<T>;
	private var _w:Int;
	private var _h:Int;
	private var _d:Int;
}

/**
 * <p>A three-dimensional array based on a rectangular sequential array.</p>
 * <p><o>Worst-case running time in Big O notation</o></p>
 */
class Array3<T> implements Collection<T>
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
	var _d:Int;
	var _iterator:Array3Iterator<T>;
	
	/**
	 * Creates a three-dimensional array with dimensions <code>width</code>, <code>height</code> and <code>depth</code>.<br/>
	 * The minimum size is 2x2x2.
	 * @throws de.polygonal.core.util.AssertionError invalid <code>width</code>, <code>height</code> or <code>depth</code> (debug only).
	 */
	public function new(width:Int, height:Int, depth:Int)
	{
		D.assert(width >= 2 && height >= 2 && depth >= 2, Sprintf.format("invalid size (width:%d, height:%d, depth: %d)", [width, height, depth]));
		
		_w            = width;
		_h            = height;
		_d            = depth;
		_a            = ArrayUtil.alloc(size());
		_iterator     = null;
		key           = HashKey.next();
		reuseIterator = false;
	}

	/**
	 * Returns the element that is stored in column <code>x</code>, row <code>y</code> and layer <code>z</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code>/<code>z</code> out of range (debug only).
	 */
	inline public function get(x:Int, y:Int, z:Int):T
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		
		return __get(getIndex(x, y, z));
	}
	
	/**
	 * Returns the element that is stored in column cell.<code>x</code>, row cell.<code>y</code> and layer cell.<code>z</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code>/<code>z</code> out of range (debug only).
	 */
	inline public function getAt(cell:Array3Cell):T
	{
		return __get(getIndex(cell.x, cell.y, cell.z));
	}
	
	/**
	 * Replaces the element at column <code>x</code>, row <code>y</code> and layer <code>z</code> with <code>val</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code>/<code>z</code> out of range (debug only).
	 */
	inline public function set(x:Int, y:Int, z:Int, val:T):Void
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		
		__set(getIndex(x, y, z), val);
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
		resize(x, _h, _d);
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
		resize(_w, x, _d);
	}
	
	/**
	 * The depth (#layers).
	 * <o>1</o>
	 */
	inline public function getD():Int
	{
		return _d;
	}
	
	/**
	 * Sets the depth to <code>x</code>.<br/>
	 * The minimum value is 2.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError invalid height (debug only).
	 */
	inline public function setD(x:Int):Void
	{
		resize(_w, _h, x);
	}
	
	/**
	 * Computes an index into the linear array from the <code>x</code>, <code>y</code> and <code>z</code> index.
	 * <o>1</o>
	 */
	inline public function getIndex(x:Int, y:Int, z:Int):Int
	{
		return (z * _w * _h) + (y * _w) + x;
	}
	
	/**
	 * Returns the index of the first occurrence of the element <code>x</code> or returns -1 if element <code>x</code> does not exist.<br/>
	 * The index is in the range &#091;0, size() - 1&#093;.
	 * <o>n</o>
	 */
	inline public function indexOf(x:T):Int
	{
		var i = 0;
		var j = size();
		while (i < j)
		{
			if (_a[i] == x) break;
			i++;
		}
		
		return (i == j) ? -1 : i;
	}
	
	/**
	 * Returns true if <code>x</code>, <code>y</code> and <code>z</code> are valid.
	 */
	inline public function inRange(x:Int, y:Int, z:Int):Bool
	{
		return x >= 0 && x < _w && y >= 0 && y < _h && z >= 0 && z < _d;
	}
	
	/**
	 * Returns the cell coordinates of the first occurrence of the element <code>x</code> or null if element <code>x</code> does not exist.
	 * <o>n</o>
	 * @param cell stores the result.
	 * @return a reference to <code>cell</code>.
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> is null (debug only).
	 */
	inline public function cellOf(x:T, cell:Array3Cell):Array3Cell
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
	inline public function indexToCell(i:Int, cell:Array3Cell):Array3Cell
	{
		D.assert(i >= 0 && i < size(), Sprintf.format("index out of range (%d)", [i]));
		D.assert(cell != null, "cell is null");
		
		var s = _w * _h;
		var t = i % s;
		cell.z = Std.int(i / s);
		cell.y = Std.int(t / _w);
		cell.x = t % _w;
		return cell;
	}
	
	/**
	 * Computes an array index into the linear array from the <code>cell</code> coordinates.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>cell</code> index out of range or <code>cell</code> is null (debug only).
	 */
	inline public function cellToIndex(cell:Array3Cell):Int
	{
		D.assert(cell != null, "cell != null");
		D.assert(cell.x >= 0 && cell.x < getW(), Sprintf.format("x index out of range (%d)", [cell.x]));
		D.assert(cell.y >= 0 && cell.y < getH(), Sprintf.format("y index out of range (%d)", [cell.y]));
		D.assert(cell.z >= 0 && cell.z < getD(), Sprintf.format("z index out of range (%d)", [cell.z]));
		
		return getIndex(cell.x, cell.y, cell.z);
	}
	
	/**
	 * Copies all elements stored in layer <code>z</code> by reference into a two-dimensional array.
	 * <o>n</o>
	 * @param output stores the "slice" of this three-dimensional array.
	 * @return a reference to <code>output</code>.
	 * @throws de.polygonal.core.util.AssertionError <code>z</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError invalid layer or <code>output</code> is null or <code>output</code> too small (debug only).
	 */
	public function getLayer(z:Int, output:Array2<T>):Array2<T>
	{
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		D.assert(output != null, "output != null");
		D.assert(output.getW() == getW() && output.getH() == getH(), Sprintf.format("output too small (w: %d, d: %d)", [output.getW(), output.getH()]));
		
		var offset = z * _w * _h;
		for (x in 0..._w)
			for (y in 0..._h)
				output.set(x, y, __get(offset + (y * _w) + x));
		return output;
	}
	
	/**
	 * Copies all elements stored in row <code>y</code> and layer <code>z</code> by reference into the <code>output</code> array.<br/>
	 * <o>n</o>
	 * @return a reference to the <code>output</code> array.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code> out of range or <code>output</code> is null (debug only).
	 */
	public function getRow(z:Int, y:Int, output:Array<T>):Array<T>
	{
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		D.assert(output != null, "output != null");
		
		var offset = (z * _w * _h) + (y * _w);
		for (x in 0..._w) output.push(__get(offset + x));
		return output;
	}
	
	/**
	 * Overwrites all elements in row <code>y</code> and layer <code>z</code> with the elements stored in the <code>input</code> array.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>z</code>/<code>y</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or insufficient input values (debug only).
	 */
	public function setRow(z:Int, y:Int, input:Array<T>):Void
	{
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		D.assert(input != null, "input is null");
		D.assert(input.length >= size(), "insufficient values");
		
		var offset = (z * _w * _h) + (y * _w);
		for (x in 0..._w) __set(offset + x, input[x]);
	}
	
	/**
	 * Copies all elements stored in column <code>x</code> and layer <code>z</code> by reference into the <code>output</code> array.
	 * <o>n</o>
	 * @return a reference to the <code>output</code> array.
	 * @throws de.polygonal.core.util.AssertionError <code>z</code>/<code>x</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>output</code> is null (debug only).
	 */
	inline public function getCol(z:Int, x:Int, output:Array<T>):Array<T>
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		D.assert(output != null, "output != null");
		
		var offset = z * _w * _h;
		for (i in 0..._h) output.push(__get(offset + (i * _w + x)));
		return output;
	}

	/**
	 * Overwrites all elements in column <code>x</code> and layer <code>z</code> with the elements stored in the <code>input</code> array.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>z</code>/<code>x</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or insufficient input values (debug only).
	 */
	public function setCol(z:Int, x:Int, input:Array<T>):Void
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(z >= 0 && z < getD(), Sprintf.format("z index out of range (%d)", [z]));
		D.assert(input != null, "input is null");
		D.assert(input.length >= getH(), "insufficient values");
		
		var offset = z * _w * _h;
		for (i in 0..._h) __set(offset + (i * _w + x), input[i]);
	}
	
	/**
	 * Copies all elements stored in the pile at column <code>x</code> and row <code>y</code> by reference into the <code>output</code> array.
	 * <o>n</o>
	 * @return a reference to the <code>output</code> array.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>output</code> is null (debug only).
	 */
	inline public function getPile(x:Int, y:Int, output:Array<T>):Array<T>
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(output != null, "output != null");
		
		var offset1 = _w * _h;
		var offset2 = (y * _w + x);
		for (z in 0..._d) output.push(__get(z * offset1 + offset2));
		return output;
	}
	
	/**
	 * Overwrites all elements in column <code>x</code> and row <code>y</code> with the elements stored in the <code>input</code> array.
	 * <o>n</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x</code>/<code>y</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>input</code> is null or insufficient input values (debug only).
	 */
	public function setPile(x:Int, y:Int, input:Array<T>):Void
	{
		D.assert(x >= 0 && x < getW(), Sprintf.format("x index out of range (%d)", [x]));
		D.assert(y >= 0 && y < getH(), Sprintf.format("y index out of range (%d)", [y]));
		D.assert(input != null, "input is null");
		D.assert(input.length >= getD(), "insufficient values");
		
		var offset1 = _w * _h;
		var offset2 = (y * _w + x);
		for (z in 0..._d)
			__set(z * offset1 + offset2, input[z]);
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
	 * The function signature is: <em>process(oldValue, xIndex, yIndex, zIndex):newValue</em>
	 * <o>n</o>
	 */
	public function walk(process:T->Int->Int->Int->T):Void
	{
		for (z in 0..._d)
		{
			for (y in 0..._h)
			{
				for (x in 0..._w)
				{
					var i = z * _w * _h + y * _w + x;
					__set(i, process(__get(i), x, y, z));
				}
			}
		}
	}
	
	/**
	 * Resizes this three-dimensional array.
	 * <o>n</o>
	 * @param width the new width (minimum is 2).
	 * @param height the new height (minimum is 2).
	 * @param depth the new depth (minimum is 2).
	 * @throws de.polygonal.core.util.AssertionError invalid dimensions (debug only).
	 */
	public function resize(width:Int, height:Int, depth:Int):Void
	{
		D.assert(width >= 2 && height >= 2 && depth >= 1, Sprintf.format("invalid size (width:%d, height:%d, depth: %d)", [width, height, depth]));
		
		if (width == _w && height == _h && depth == _d) return;
		var t = _a;
		_a = ArrayUtil.alloc(width * height * depth);
		
		var minX = width  < _w ? width  : _w;
		var minY = height < _h ? height : _h;
		var zmin = depth  < _d ? depth  : _d;
		
		for (z in 0...zmin)
		{
			var t1 = z * width * height;
			var t2 = z * _w * _h;
			
			for (y in 0...minY)
			{
				var t3 = y * width;
				var t4 = y * _w;
				
				for (x in 0...minX)
					__set(t1 + t3 + x, t[t2 + t4 + x]);
			}
		}
		
		_w = width;
		_h = height;
		_d = depth;
	}
	
	/**
	 * Swaps the element at column/row/layer <code>x0</code>, <code>y0</code>, <code>z0</code> with the element at column/row/layer <code>x1</code>, <code>y1</code>, <code>z1</code>.
	 * <o>1</o>
	 * @throws de.polygonal.core.util.AssertionError <code>x0</code>/<code>y0</code>/<code>z0</code> or <code>x1</code>/<code>y1</code>/<code>z1</code> out of range (debug only).
	 * @throws de.polygonal.core.util.AssertionError <code>x0</code>, <code>y0</code>, <code>z0</code> equals <code>x1</code>, <code>y1</code>, <code>z1</code> (debug only).
	 */
	inline public function swap(x0:Int, y0:Int, z0:Int, x1:Int, y1:Int, z1:Int):Void
	{
		D.assert(x0 >= 0 && x0 < getW(), Sprintf.format("x0 index out of range (%d)", [x0]));
		D.assert(y0 >= 0 && y0 < getH(), Sprintf.format("y0 index out of range (%d)", [y0]));
		D.assert(z0 >= 0 && z0 < getD(), Sprintf.format("z0 index out of range (%d)", [z0]));
		D.assert(x1 >= 0 && x1 < getW(), Sprintf.format("x1 index out of range (%d)", [x1]));
		D.assert(y1 >= 0 && y1 < getH(), Sprintf.format("y1 index out of range (%d)", [y1]));
		D.assert(z1 >= 0 && z1 < getD(), Sprintf.format("z1 index out of range (%d)", [z1]));
		D.assert(!(x0 == x1 && y0 == y1 && z0 == z1), Sprintf.format("source indices equal target indices (x: %d, y: %d, z: %d)", [x0, y0, z0]));
		
		var i = (z0 * _w * _h) + (y0 * _w) + x0;
		var j = (z1 * _w * _h) + (y1 * _w) + x1;
		var t = __get(i);
		__set(i, __get(j));
		__set(j, t);
	}
	
	/**
	 * Grants access to the rectangular sequential array storing the elements of this three-dimensional array.<br/>
	 * Useful for fast iteration or low-level operations.
	 * <o>1</o>
	 */
	inline public function getArray():Array<T>
	{
		return _a;
	}
	
	/**
	 * Shuffles the elements of this collection by using the Fisher-Yates algorithm.<br/>
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
				__set(i,  t);
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
	 * Use <em>getLayer()</em> to print the elements at a specific layer.
	 */
	public function toString():String
	{
		return Sprintf.format("{Array3, %dx%dx%d}", [getW(), getH(), getD()]);
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
	 * Returns true if this three-dimensional array contains the element <code>x</code>. 
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
	 * @return true if at least one occurrence of <code>x</code> is nullified.
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
	 * Clears this three-dimensional array by nullifying all elements.<br/>
	 * The <code>purge</code> parameter has no effect.
	 * <o>1 or n if <code>purge</code> is true</o>
	 */
	inline public function clear(purge = false):Void
	{
		var NULL:Null<T> = null;
		for (i in 0..._a.length) __set(i, null);
	}

	/**
	 * Returns a new <em>Array3Iterator</em> object to iterate over all elements contained in this three-dimensional array.<br/>
	 * Order: Row-major order (layer-by-layer, row-by-row).
	 * @see <a href="http://haxe.org/ref/iterators" target="_blank">http://haxe.org/ref/iterators</a>
	 */
	public function iterator():Itr<T>
	{
		if (reuseIterator)
		{
			if (_iterator == null)
				_iterator = new Array3Iterator<T>(this);
			else
				_iterator.reset();
			return _iterator;
		}
		else
			return new Array3Iterator<T>(this);
	}

	/**
	 * The number of elements in this three-dimensional array.<br/>
	 * Always equals <em>getW()</em> * <em>getH()</em> * <em>getD()</em>.
	 * <o>1</o>
	 */
	inline public function size():Int
	{
		return _w * _h * _d;
	}
	
	/**
	 * Unsupported operation - always returns false in release mode.
	 */
	public function isEmpty():Bool
	{
		return false;
	}
	
	/**
	 * Returns an array containing all elements in this three-dimensional array.<br/>
	 * Order: Row-major order (layer-by-layer, row-by-row).
	 */
	public function toArray():Array<T>
	{
		var a:Array<T> = ArrayUtil.alloc(size());
		for (i in 0...size()) a[i] = __get(i);
		return a;
	}
	
	#if flash10
	/**
	 * Returns a Vector.&lt;T&gt; object containing all elements in this three-dimensional array.<br/>
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
	 * Returns a dense array containing all elements in this three-dimensional array.<br/>
	 * Order: Row-major order (layer-by-layer, row-by-row).
	 */
	public function toDA():DA<T>
	{
		var a = new DA<T>(size());
		for (i in 0...size()) a.pushBack(__get(i));
		return a;
	}
	
	/**
	 * Duplicates this three-dimensional array. Supports shallow (structure only) and deep copies (structure & elements).
	 * @param assign if true, the <code>copier</code> parameter is ignored and primitive elements are copied by value whereas objects are copied by reference.<br/>
	 * If false, the <em>clone()</em> method is called on each element. <warn>In this case all elements have to implement <em>Cloneable</em>.</warn>
	 * @param copier a custom function for copying elements. Replaces element.<em>clone()</em> if <code>assign</code> is false.
	 * @throws de.polygonal.core.util.AssertionError element is not of type <em>Cloneable</em> (debug only).
	 */
	public function clone(assign:Bool = true, ?copier:T->T):Collection<T>
	{
		var copy = new Array3<T>(getW(), getH(), getD());
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
class Array3Iterator<T> implements de.polygonal.ds.Itr<T>
{
	var _f:Array3<T>;
	
	var _a:Array<T>;
	var _i:Int;
	var _s:Int;
	
	public function new(f:Array3<T>)
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
	
	inline function __a<T>(f:Array3Friend<T>) return f._a
	inline function __size<T>(f:Array3Friend<T>) return f._w * f._h * f._d
}

/**
 * Stores the x,y,z position of a three-dimensional cell. 
 */
class Array3Cell
{
	/**
	 * The column index. 
	 */
	public var x:Int;
	
	/**
	 * The row index. 
	 */
	public var y:Int;
	
	/**
	 * The depth index. 
	 */
	public var z:Int;
	
	public function new(x = 0, y = 0, z = 0)
	{
		this.x = x;
		this.y = y;
		this.z = z;
	}
}