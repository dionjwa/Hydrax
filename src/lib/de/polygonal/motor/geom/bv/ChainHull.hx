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
package de.polygonal.motor.geom.bv;

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;

class ChainHull
{
	/**
	 * <p>Andrew's monotone chain 2D convex hull algorithm.</p>
	 * <p>Copyright 2001, softSurfer (www.softsurfer.com)</p>
	 * @param p a set of input vertices.
	 * @param h the convex hull.
	 * @param k the number of input vertices. If omitted, k is set to <code>p</code>.length.
	 * @return the number of points in the convex hull.
	 * @throws de.polygonal.core.util.AssertionError <code>k</code> out of bound (debug only).
	 */
	public static function find(p:Array<Vec2>, h:Array<Vec2>, k = 0):Int
	{
		if (k == 0) k = p.length;
		D.assert(k <= p.length, "k out of bound");
		
		if (k < 3)
		{
			for (i in 0...k) h[i] = p[i];
			return k;
		}
		
		_quickSort(p, 0, k);
		
		var bot = 0;
		var top =-1;
		
		var minmin = 0, minmax;
		var minX = p[0].x;
		var i = 1;
		while (i < k)
		{
			if (p[i].x != minX) break;
			i++;
		}
		minmax = i - 1;
		
		if (minmax == k - 1)
		{
			var t1 = p[minmin];
			var t2 = p[minmax];
			h[++top] = t1;
			if (t2.y != t1.y) h[++top] = t2;
			h[++top] = t1;
			return top;
		}
		
		var maminX, mamaxX = k - 1;
		var maxX = p[k - 1].x;
		var i = k - 2;
		while (i >= 0)
		{
			if (p[i].x != maxX) break;
			i--;
		}
		maminX = i + 1;
		
		h[++top] = p[minmin];
		i = minmax;
		
		while (++i <= maminX)
		{
			if (Vec2Util.isLeft3(p[minmin], p[maminX], p[i]) >= 0 && i < maminX)
				continue;
			while (top > 0)
			{
				if (Vec2Util.isLeft3(h[top - 1], h[top], p[i]) > 0)
					break;
				else
					top--;
			}
			h[++top] = p[i];
		}
		
		if (mamaxX != maminX)
			h[++top] = p[mamaxX];
		
		bot = top;
		i = maminX;
		while (--i >= minmax)
		{
			if (Vec2Util.isLeft3(p[mamaxX], p[minmax], p[i]) >= 0 && i > minmax)
				continue;
			while (top > bot)
			{
				if (Vec2Util.isLeft3(h[top - 1], h[top], p[i]) > 0)
					break;
				else
					top--;
			}
			h[++top] = p[i];
		}
		
		if (minmax != minmin)
			h[++top] = p[minmin];
		
		return top;
	}
	
	static function _quickSort(a:Array<Vec2>, first:Int, k:Int):Void
	{
		var last = first + k - 1;
		var lo = first;
		var hi = last;
		if (k > 1)
		{
			var i0 = first;
			var i1 = i0 + (k >> 1);
			var i2 = i0 + k - 1;
			var t0 = a[i0];
			var t1 = a[i1];
			var t2 = a[i2];
			var mid;
			
			var t = compare(t0, t2);
			
			if (t < 0 && compare(t0, t1) < 0)
				mid = compare(t1, t2) < 0 ? i1 : i2;
			else
			{
				if (compare(t1, t0) < 0 && compare(t1, t2) < 0)
					mid = t < 0 ? i0 : i2;
				else
					mid = compare(t2, t0) < 0 ? i1 : i0;
			}
			
			var pivot = a[mid];
			a[mid] = a[first];
			
			while (lo < hi)
			{
				while (compare(pivot, a[hi]) < 0 && lo < hi) hi--;
				if (hi != lo) 
				{
					a[lo] = a[hi];
					lo++;
				}
				while (compare(pivot, a[lo]) > 0 && lo < hi) lo++;
				if (hi != lo)
				{
					a[hi] = a[lo];
					hi--;
				}
			}
			
			a[lo] = pivot;
			_quickSort(a, first, lo - first);
			_quickSort(a, lo + 1, last - lo);
		}
	}
	
	inline static function compare(a:Vec2, b:Vec2):Int
	{
		if      (a.x < b.x) return -1;
		else if (a.x > b.x) return  1;
		else if (a.y < b.y) return -1;
		else if (a.y > b.y) return  1;
		else                return  0;
	}
}