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
package de.polygonal.core.math;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;
import de.polygonal.ds.Cloneable;

//TODO docs
class Mat22 implements Cloneable<Mat22>
{
	inline public static function concat(A:Mat22, B:Mat22, out:Mat22):Mat22
	{
		var t1 = A.m11;
		var t2 = A.m12;
		var t3 = A.m21;
		var t4 = A.m22;
		var t5 = B.m11;
		var t6 = B.m12;
		var t7 = B.m21;
		var t8 = B.m22;
		out.m11 = t1 * t5 + t2 * t7; out.m12 = t1 * t6 + t2 * t8;
		out.m21 = t3 * t5 + t4 * t7; out.m22 = t3 * t6 + t4 * t8;
		return out;
	}
	
	public var m11:Float; public var m12:Float;
	public var m21:Float; public var m22:Float;
	
	public function new(?col1:Vec2, ?col2:Vec2) 
	{
		if (col1 == null)
		{
			m11 = 1;
			m21 = 0;
		}
		else
		{
			m11 = col1.x;
			m21 = col1.y;
		}
			
		if (col2 == null)
		{
			m12 = 0;
			m22 = 1;
		}
		else
		{
			m12 = col2.x;
			m22 = col2.y;
		}
	}
	
	inline public function mul(v:Vec2, out:Vec2):Void
	{
		var x = v.x;
		var y = v.y;
		out.x = x * m11 + y * m12;
		out.y = x * m21 + y * m22;
	}
	
	inline public function mulx(x:Float, y:Float):Float
	{
		return x * m11 + y * m12;
	}
	
	inline public function muly(x:Float, y:Float):Float
	{
		return x * m21 + y * m22;
	}
	
	inline public function setAngle(angle:Float)
	{
		var c = Math.cos(angle), s = Math.sin(angle);
		m11 = c; m12 =-s;
		m21 = s; m22 = c;
	}
	
	inline public function transpose():Void
	{
		var tmp = m21; m21 = m12; m12 = tmp;
	}
	
	inline public function setCol1(x:Float, y:Float):Void
	{
		m11 = x;
		m21 = y;
	}
	
	inline public function setCol2(x:Float, y:Float):Void
	{
		m12 = x;
		m22 = y;
	}
	
	inline public function identity():Void
	{
		m11 = 1; m12 = 0;
		m21 = 0; m22 = 1;
	}
	
	inline public function getAngle():Float
	{
		return Math.atan2(m21, m11);
	}
	
	/** Returns the string form of the value that the object represents. */
	public function toString():String
	{
		return Sprintf.format("Mat22\n%6.3f %6.3f\n%6.3f %6.3f", [m11, m21, m12, m22]);
	}
	
	/** Creates and returns a copy of this object. */
	public function clone():Mat22
	{
		var c = new Mat22();
		c.m11 = m11; c.m12 = m12;
		c.m21 = m21; c.m22 = m22;
		return c;
	}
}