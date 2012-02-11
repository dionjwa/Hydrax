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
import de.polygonal.core.fmt.Sprintf;

/**
 * Each contact point is assigned a unique id to facilitate warm starting.
 */
class ContactID
{
	 public static var NULL_VALUE   = 0xffffff01;
	 public static var NULL_FEATURE = 0xfe;
	
	/** The edge that defines the outward contact normal. */
	 public static function getRefEdge(x:Int):Int
	{
		return (x >>> 24) - 1;
	}
	
	/** The edge most anti-parallel to the reference edge. */
	 public static function getIncEdge(x:Int):Int
	{
		return ((x >> 16) & 0x000000ff) - 1;
	}
	
	/** The vertex (0 or 1) on the incident edge that was clipped. */
	 public static function getIncVert(x:Int):Int
	{
		return ((x >> 8) & 0x000000ff) - 1;
	}
	
	/** 1 indicates that the reference edge is on shape2. */
	 public static function getFlip(x:Int):Int
	{
		return (x & 0x000000ff) - 1;
	}
	
	/** Sets the reference edge in <i>id</i> to <i>x</i> */
	 public static function setRefEdge(id:Int, x:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= 0 && x <= 0xfe, "x >= 0 && x <= 0xfe");
		#end
		
		return (id & ~0xff000000) | ((x + 1) << 24);
	}
	
	/** Sets the incident edge in <i>id</i> to <i>x</i> */
	 public static function setIncEdge(id:Int, x:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= 0 && x <= 0xfe, "x >= 0 && x <= 0xfe");
		#end
		
		return (id & ~0x00ff0000) | ((x + 1) << 16);
	}
	
	/** Sets the incident vertex in <i>id</i> to <i>x</i> */
	 public static function setIncVert(id:Int, x:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= 0 && x <= 0xfe, "x >= 0 && x <= 0xfe");
		#end
		
		return (id & ~0x0000ff00) | ((x + 1) << 8);
	}
	
	/** Sets the flip flag in <i>id</i> to <i>x</i> */
	 public static function setFlip(id:Int, x:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x == 0 || x == 1 || x == NULL_FEATURE, "x == 0 || x == 1");
		#end
		
		return (id & ~0x000000ff) | (x + 1);
	}
	
	/** Combines reference edge, incident edge, incident vertex and flip into a single integer value for fast comparison. */
	 public static function bake(refEdge:Int, incEdge:Int, incVert:Int, flip:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(refEdge <= NULL_FEATURE, "refEdge <= NULL_FEATURE");
		de.polygonal.core.util.Assert.assert(incEdge <= NULL_FEATURE, "incEdge <= NULL_FEATURE");
		de.polygonal.core.util.Assert.assert(incVert <= NULL_FEATURE, "incVert <= NULL_FEATURE");
		de.polygonal.core.util.Assert.assert(flip == 0 || flip == 1, "flip == 0 || flip == 1");
		#end
		return (refEdge + 1) << 24 | (incEdge + 1) << 16 | (incVert + 1) << 8 | (flip + 1);
	}
	
	public static function toString(x:Int):String
	{
		if (x == NULL_VALUE)
			return "NULL_KEY";
		else
		{
			var refEdge = getRefEdge(x) == NULL_FEATURE ? "NULL" : Std.string(getRefEdge(x));
			var incEdge = getIncEdge(x) == NULL_FEATURE ? "NULL" : Std.string(getIncEdge(x));
			var incVert = getIncVert(x) == NULL_FEATURE ? "NULL" : Std.string(getIncVert(x));
			var flip    = getFlip(x)    == NULL_FEATURE ? "NULL" : Std.string(getFlip(x));
			return Sprintf.format('RE %d IE %d IV %d F %d', [refEdge, incEdge, incVert, flip]);
		}
	}
}