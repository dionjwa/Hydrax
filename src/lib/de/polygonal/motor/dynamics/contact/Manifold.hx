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
package de.polygonal.motor.dynamics.contact;

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.dynamics.contact.ManifoldPoint;

/**
 * A manifold for two touching convex shapes.
 */
class Manifold
{
	/** The next manifold in the list. */
	public var next:Manifold;
	
	/** The shared collision normal (normalized). */
	public var ncoll:Vec2;

	/** The number of manifold points */
	public var pointCount:Int;
	
	/** Manifold point #1. */
	public var mp1:ManifoldPoint;
	
	/** Manifold point #2. */
	public var mp2:ManifoldPoint;
	
	public function new()
	{
		mp1 = new ManifoldPoint();
		mp2 = mp1.next = new ManifoldPoint();
		ncoll = new Vec2();
	}
	
	public function iterator():Iterator<ManifoldPoint>
	{
		return new ManifoldPointIterator(this);
	}
	
	public function free()
	{
		mp1.free();
		mp2.free();
		
		mp1   = null;
		mp2   = null;
		next  = null;
		ncoll = null;
	}
}

class ManifoldPointIterator
{
	var _mp:ManifoldPoint;
	var _i:Int;
	var _s:Int;
	
	public function new(manifold:Manifold)
	{
		var k = manifold.pointCount;
		if (k > 0)
		{
			_s = k;
			_mp = manifold.mp1;
		}
	}
	
	public function hasNext():Bool
	{
		return _i < _s;
	}
	
	public function next():ManifoldPoint
	{
		var t = _mp;
		
		if (_i < _s)
		{
			_i++;
			_mp = _mp.next;
		}
		
		return t;
	}
}