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
package de.polygonal.motor.geom.intersect;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.collision.shape.feature.Edge;

class ClipInfo
{
	public var tmin:Float;
	
	/**
	 * Near t value of intersection for ray r = p + t*d.
	 * t equals zero if ray origin is inside.
	 */
	public var t0:Float;
	
	/**
	 * Far t value of intersection for ray r = p + t*d.
	 * t equals zero if ray origin is inside.
	 */
	public var t1:Float;
	
	/** Near intersection edge id. */
	public var e0:Int;
	
	/** Far intersection edge id. */
	public var e1:Int;
	
	/** Near intersection point (if exists). */
	public var q0:Vec2;
	
	/** Far intersection point (if exists). */
	public var q1:Vec2;
	
	//store id's in edges
	public var edge0:Edge;
	public var edge1:Edge;
	
	public function new()
	{
		q0 = new Vec2();
		q1 = new Vec2();
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format("ClipResult t0:%.3f t1:%.3f e0:%d e1:%d q0:(%.3f|%.3f) q1:(%.3f|%.3f)", [t0, t1, e0, e1, q0.x, q0.y, q1.x, q1.y]); 
	}
}