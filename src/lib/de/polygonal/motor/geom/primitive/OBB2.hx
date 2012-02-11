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
package de.polygonal.motor.geom.primitive;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;
import de.polygonal.ds.Cloneable;
import de.polygonal.core.math.Mat22;

/**
 * A two-dimensional oriented bounding box (OBB). This is a rectangular block with an arbitraty orientation
 * represented by a center point <i>c</i>, an orientation matrix <i>R</i> and two halfedge lengths stored in the vector <i>e</i>.
 */
class OBB2 implements Cloneable<OBB2>
{
	/** The center point. */
	public var c:Vec2;
	
	/** The halfedge length. */
	public var e:Vec2;
	
	/** The orientation matrix. */
	public var R:Mat22;
	
	/**
	 * Creates an oriented bounding box with center (<i>cx</i>,<i>cy</i>),
	 * halfedge length (<i>ex</i>,<i>ey</i>) and <i>angle</i>.
	 */
	public function new(?cx = 0., ?cy = 0., ?ex = 0., ?ey = 0., ?angle = 0.)
	{
		c = new Vec2(cx, cy);
		e = new Vec2(ex, ey);
		R = new Mat22();
		if (angle != 0.) R.setAngle(angle);
	}
	
	/** Computes 4 corner vertices and stores them in <i>out</i>. */
	inline public function getVertexList(out:Array<Vec2>):Array<Vec2>
	{
		var ex = e.x;
		var ey = e.y;
		var cx = c.x;
		var cy = c.y;
		var wx = R.m11 * ex;
		var wy = R.m21 * ex;
		var hx = R.m12 * ey;
		var hy = R.m22 * ey;
		
		var v = out[0];
		v.x = cx + wx + hx;
		v.y = cy + wy + hy;
		
		v = out[1];
		v.x = cx - wx + hx;
		v.y = cy - wy + hy;
		
		v = out[2];
		v.x = cx - wx - hx;
		v.y = cy - wy - hy;
		
		v = out[3];
		v.x = cx + wx - hx;
		v.y = cy + wy - hy;
		
		return out;
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format("OBB c(%.3f|%.3f) e(%.3f|%.3f) a+%.3f", [c.x, c.y, e.x, e.y, R.getAngle()]);
	}
	
	/** Creates and returns a copy of this object. */
	public function clone():OBB2
	{
		var c = new OBB2(c.x, c.y, e.x, e.y);
		c.R = R.clone();
		return c;
	}
}