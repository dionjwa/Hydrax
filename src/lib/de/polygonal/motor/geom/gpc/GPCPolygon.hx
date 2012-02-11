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
package de.polygonal.motor.geom.gpc;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.BitVector;
import de.polygonal.ds.DA;
import de.polygonal.ds.pooling.DynamicObjectPool;

/**
 * <p>A data structure that is used by the <em>GPC</em> class to describe polygons (both input & clipped polygons).</p>
 */
class GPCPolygon
{
	/**
	 * The total number of contours (includes external boundaries and holes).
	 */
	public var numContours(_numContoursGetter, never):Int;
	inline function _numContoursGetter():Int { return _contours.size(); }
	
	var _contours:DA<DA<Float>>;
	var _holeFlags:DA<Bool>;
	var _pool:DynamicObjectPool<DA<Float>>;
	
	/**
	 * Creates an empty polygon.
	 */
	public function new()
	{
		_contours  = new DA();
		_holeFlags = new DA();
		_pool      = new DynamicObjectPool(null, function() return new DA<Float>(), null, 0);
	}
	
	/**
	 * Preallocates vertex lists.<br/>
	 * This improves performance at the cost of using more memory.<br/>
	 * If no vertex lists are preallocated, <code>addContour()</code> always allocates a new array for storing incoming vertices.
	 * @param numContours the total number of vertex lists to preallocate.
	 * @param numVertices the initial capacity of each vertex list.
	 */
	public function reserve(numContours:Int, numVertices:Int):Void
	{
		_pool = new DynamicObjectPool(null, function() return new DA(numVertices), numContours);
	}
	
	/**
	 * Destroys this object by explicitly nullifying all references for GC'ing used resources.
	 */
	public function free():Void
	{
		_contours.free();
		_holeFlags.free();
		_pool.free();
		
		_holeFlags = null;
		_contours  = null;
		_pool      = null;
	}
	
	/**
	 * Clears all contours and hole flags.
	 */
	public function clear():Void
	{
		_holeFlags.clear();
		_contours.clear();
		_pool.reclaim();
	}
	
	/**
	 * Returns an iterator over all contours.
	 */
	public function iterator():Iterator<DA<Float>>
	{
		return _contours.iterator();
	}
	
	/**
	 * Returns true if the contour at index <code>i</code> forms a hole.
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only).
	 */
	inline public function isHoleAt(i:Int):Bool
	{
		D.assert(i >= 0 && i < numContours, Sprintf.format("i index out of range (%d)", [i]));
		return _holeFlags.get(i);
	}
	
	/**
	 * Returns the contour at index <code>i</code>.<br/>
	 * A contour is stored using this format: [x0, y0, x1, y1, ..., xn, yn].
	 * @throws de.polygonal.core.util.AssertionError index out of range (debug only). 
	 */
	inline public function getContourAt(i:Int):DA<Float>
	{
		D.assert(i >= 0 && i < numContours, Sprintf.format("i index out of range (%d)", [i]));
		return _contours.get(i);
	}
	
	/**
	 * Adds a contour to this polygon.
	 * @param vertexList a list of points
	 * @param n the number of points in <code>vertexList</code>.
	 * @param isHole if true, marks the contour as a hole contour.<br/>
	 * Clip operations set the contour hole flags on the resulting polygon, input polygons should have no hole flags.
	 */
	public function addContour(vertexList:Array<Float>, n:Int, ?isHole = false):Void
	{
		D.assert(vertexList.length >= 0 && Mathematics.isEven(vertexList.length), Sprintf.format("invalid number of vertices (%d)", [vertexList.length]));
		
		var a = _pool.get();
		a.clear();
		for (i in 0...n) a.pushBack(vertexList[i]);
		
		_holeFlags.pushBack(isHole);
		_contours.pushBack(a);
	}
}