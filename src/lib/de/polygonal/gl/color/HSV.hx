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
package de.polygonal.gl.color;

class HSV 
{
	/** The hue in the range &#091;0,360&#093; */
	public var h:Float;
	
	/** The saturation in the range &#091;0,1&#093; If s == 0, then h = -1 (undefined). */
	public var s:Float;
	
	/** The value in the range &#091;0,1&#093; */
	public var v:Float;
	
	public function new(h = .0, s = .0, v = .0)
	{
		set(h, s, v);
	}
	
	inline public function set(h:Float, s:Float, v:Float):Void
	{
		//#if debug
		//de.polygonal.core.util.Assert.assert(h >= 0 && h <= 360, "h >= 0 && h <= 360");
		//de.polygonal.core.util.Assert.assert(s >= 0 && s <= 1, "s >= 0 && s <= 1");
		//de.polygonal.core.util.Assert.assert(v >= 0 && v <= 1, "v >= 0 && v <= 1");
		//#end
		
		this.h = s == 0 ? -1 : h;
		this.s = s;
		this.v = v;
	}
}