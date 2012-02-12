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

using de.polygonal.core.math.Mathematics;

/**
 * Color Conversion Algorithms.<br/>
 * From <a href="http://www.cs.rit.edu/~ncs/color/t_convert.html" target="_blank">http://www.cs.rit.edu/~ncs/color/t_convert.html</a>
 */
class ColorConversion 
{
	/**
	 * Converts an <i>rgb</i> color value to a <i>hsv</i> color value.
	 * @param hsv Stores the result. If omitted, the method creates a new HSV object.
	 * @return The <i>hsv</i> object or a new HSV object if <i>hsv</i> was not specified.
	 */
	inline public static function RGBtoHSV(rgb:RGB, ?hsv:HSV):HSV
	{
		if (hsv == null) hsv = new HSV();
		
		var r = rgb.r;
		var g = rgb.g;
		var b = rgb.b;
		
		var min = r.fmin(g.fmin(b));
		var max = r.fmax(g.fmax(b));
		
		hsv.v = max;
		
		var delta = max - min;
		
		if (max != 0)
		{
			hsv.s = delta / max;
			
			var h;
		
			if (r == max)
				h = (g - b) / delta;
			else
			if (g == max)
				h = 2 + (b - r) / delta;
			else
				h = 4 + (r - g) / delta;
			
			h *= 60;
			if (h < 0) h += 360;
			hsv.h = h;
		}
		else
		{
			hsv.s = 0;
			hsv.h = -1;
			
		}
		
		return hsv;
	}

	/**
	 * Converts a <i>hsv</i> color value to an <i>rgb</i> color value.
	 * @param rgb Stores the result. If omitted, the method creates a new RGB object.
	 * @return The <i>rgb</i> object or a new RGB object if <i>rgb</i> was not specified.
	 */
	inline public static function HSVtoRGB(hsv:HSV, ?rgb:RGB):RGB
	{
		if (rgb == null) rgb = new RGB();
		
		var s = hsv.s;
		var v = hsv.v;
		
		if (s == 0)
		{
			rgb.set(v, v, v);
			return rgb;
		}
		else
		{
			var h = hsv.h;
			h /= 60;
			var i = h.floor();
			var f = h - i;
			var p = v * (1 - s);
			var q = v * (1 - s * f);
			var t = v * (1 - s * (1 - f));
			
			switch (i)
			{
				case 0:  rgb.set(v, t, p);
				case 1:  rgb.set(q, v, p);
				case 2:  rgb.set(p, v, t);
				case 3:  rgb.set(p, q, v);
				case 4:  rgb.set(t, p, v);
				default: rgb.set(v, p, q);
			}
			
			return rgb;
		}
	}
}