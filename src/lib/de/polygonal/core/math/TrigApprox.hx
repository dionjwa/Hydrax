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
import de.polygonal.core.util.Assert;
import de.polygonal.core.util.Assert;

/**
 * <p>Fast and accurate sine/cosine approximations.</p>
 * <p>See <a href="http://lab.polygonal.de/2007/07/18/fast-and-accurate-sinecosine-approximation/" target="_blank">http://lab.polygonal.de/2007/07/18/fast-and-accurate-sinecosine-approximation/</a></p>
 * <p>Example:</p>
 * <pre class="prettyprint">
 * var sin = TrigApprox.hqSin(angle);
 * var cos = TrigApprox.hqCos(angle);</pre>
 */
class TrigApprox
{
	inline static var B =  4 / Mathematics.PI;
	inline static var C = -4 / (Mathematics.PI * Mathematics.PI);
	inline static var Q = .775;
    inline static var P = .225;
	
	/**
	 * Computes a low-precision sine approximation from an angle <code>x</code> measured in radians.<br/>
	 * The input angle has to be in the range &#091;-PI, PI&#093;.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> out of range (debug only).
	 */
	inline public static function lqSin(x:Float):Float
	{
		D.assert(x >= -Math.PI && x <= Math.PI, Sprintf.format("x out of range (%.3f)", [x]));
		
		if (x < 0)
			return 1.27323954 * x + .405284735 * x * x;
		else
			return 1.27323954 * x - .405284735 * x * x;
	}
	
	/**
	 * Computes a low-precision cosine approximation from an angle <code>x</code> measured in radians.<br/>
	 * The input angle has to be in the range &#091;-PI, PI&#093;.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> out of range (debug only).
	 */
	inline public static function lqCos(x:Float):Float
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= -Math.PI && x <= Math.PI, Sprintf.format("x out of range (%.3f)", [x]));
		#end
		
		x += Mathematics.PIHALF; if (x > Mathematics.PI) x -= Mathematics.PI2;
		
		if (x < 0)
			return 1.27323954 * x + .405284735 * x * x
		else
			return 1.27323954 * x - .405284735 * x * x;
	}
	
	/**
	 * Computes a high-precision sine approximation from an angle <code>x</code> measured in radians.<br/>
	 * The input angle has to be in the range &#091;-PI, PI&#093;.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> out of range (debug only).
	 */
	inline public static function hqSin(x:Float):Float
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= -Math.PI && x <= Math.PI, Sprintf.format("x out of range (%.3f)", [x]));
		#end
		
		if (x <= 0)
		{
			var s = 1.27323954 * x + .405284735 * x * x;
			if (s < 0)
				return .225 * (s *-s - s) + s;
			else
				return .225 * (s * s - s) + s;
		}
		else
		{
			var s = 1.27323954 * x - .405284735 * x * x;
			if (s < 0)
				return .225 * (s *-s - s) + s;
			else
				return .225 * (s * s - s) + s;
		}
	}
	
	/**
	 * Computes a high-precision cosine approximation from an angle <code>x</code> in radians.<br/>
	 * The input angle has to be in the range &#091;-PI, PI&#093;.
	 * @throws de.polygonal.core.util.AssertionError <code>x</code> out of range (debug only).
	 */
	inline public static function hqCos(x:Float):Float
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= -Math.PI && x <= Math.PI, Sprintf.format("x out of range (%.3f)", [x]));
		#end
		
		x += Mathematics.PIHALF; if (x > Mathematics.PI) x -= Mathematics.PI2;
		
		if (x < 0)
		{
			var c = 1.27323954 * x + .405284735 * x * x;
			if (c < 0)
				return .225 * (c *-c - c) + c;
			else
				return .225 * (c * c - c) + c;
		}
		else
		{
			var c = 1.27323954 * x - .405284735 * x * x;
			if (c < 0)
				return .225 * (c *-c - c) + c;
			else
				return .225 * (c * c - c) + c;
		}
	}	
	
	/**
	 * Fast arctan2 approximation.<br/>
	 * See <a href="http://www.dspguru.com/dsp/tricks/fixed-point-atan2-with-self-normalization" target="_blank">http://www.dspguru.com/dsp/tricks/fixed-point-atan2-with-self-normalization</a>.
	 */
	inline public static function arctan2(y:Float, x:Float):Float
	{
		#if debug
		de.polygonal.core.util.Assert.assert(!(Mathematics.cmpZero(x, 1e-6) && Mathematics.cmpZero(y, 1e-6)), "Mathematics.compareZero(x, 1e-6) && Mathematics.compareZero(y, 1e-6);");
		#end
		
		var t = Mathematics.fabs(y);
		if (x >= .0)
		{
			if (y < .0)
				return-((Mathematics.PI / 4) - (Mathematics.PI / 4) * ((x - t) / (x + t)));
			else
				return ((Mathematics.PI / 4) - (Mathematics.PI / 4) * ((x - t) / (x + t)));
		}
		else
		{
			if (y < .0)
				return-((3. * (Mathematics.PI / 4)) - (Mathematics.PI / 4) * ((x + t) / (t - x)));
			else
				return ((3. * (Mathematics.PI / 4)) - (Mathematics.PI / 4) * ((x + t) / (t - x)));
		}
	}
	
	/**
	 * Returns the floating-point sine and cosine of the argument <code>a</code>.<br/>
	 * This method uses a polynomial approximation.<br/>
	 * Borrowed from the book ESSENTIAL MATHEMATICS FOR GAMES & INTERACTIVE APPLICATIONS
	 * Copyright (C) 2008 by Elsevier, Inc. All rights reserved.
	 * @param out a vector storing the result, where <code>out</code>.x equals sine and <code>out.y</code> equals cosine.
	 */
	inline public static function sinCos(a:Float, out:Vec2):Void
	{
		var negate = false;
		if (a < 0.)
		{
			a = -a;
			negate = true;
		}
		
		var fa = (1 / Mathematics.PIHALF) * a;
		var ia:Int = cast fa;
		fa = (a - (201 / 128.) * ia) - 4.8382679e-4 * ia;
		
		switch (ia & 3)
		{
			case 0:
				out.x = IvPolynomialSinQuadrant(fa);
				out.y = IvPolynomialSinQuadrant(-((fa - (201 / 128.)) - 4.8382679e-4));
			
			case 1:
				out.x = IvPolynomialSinQuadrant(-((fa - (201 / 128.)) - 4.8382679e-4));
				out.y = IvPolynomialSinQuadrant(-fa);
			
			case 2:
				out.x = IvPolynomialSinQuadrant(-fa);
				out.y = IvPolynomialSinQuadrant(((fa - (201 / 128.)) - 4.8382679e-4));
			
			case 3:
				out.x = IvPolynomialSinQuadrant(((fa - (201 / 128.)) - 4.8382679e-4));
				out.y = IvPolynomialSinQuadrant(fa);
		}
		
		if (negate) out.x = -out.x;
	}
	
	inline static function IvPolynomialSinQuadrant(a:Float)
	{
		return a * (1. + a * a * (-.16666 + a * a * (.0083143 - a * a * .00018542)));
	}
}