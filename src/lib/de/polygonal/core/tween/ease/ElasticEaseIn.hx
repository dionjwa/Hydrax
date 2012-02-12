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
package de.polygonal.core.tween.ease;

import de.polygonal.core.math.interpolation.Interpolation;
import de.polygonal.core.math.Mathematics;

/**
 * <p>Elastic easing in.</p>
 * <p>Borrowed from Robert Penner Easing Equations v1.5</p>
 * <p>See <a href="http://snippets.dzone.com/posts/show/4005" target="_blank">http://snippets.dzone.com/posts/show/4005</a>.</p>
 */
class ElasticEaseIn implements Interpolation<Float>
{
	var _amplitude:Float;
	var _period:Float;
	
	/**
	 * @param amplitude wave amplitude. Default value equals zero.
	 * @param period wave period. Default value equals 0.3.
	 */
	public function new(amplitude = .0, period = .3)
	{
		_amplitude = amplitude;
		_period    = period;
	}
	
	/**
	 * @param t interpolation parameter in the interval <arg>&#091;0, 1&#093;</arg>.
	 */
	public function interpolate(t:Float):Float
	{
		var s, a;
		if (_amplitude < 1)
		{
			a = 1.;
			s = _period * .25;
		}
		else
		{
			a = _amplitude;
			s = _period / Mathematics.PI2 * Math.asin(1 / a);
		}
		
		return -(a * Math.pow(2, 10 * (t - 1)) * Math.sin((t - 1 - s) * Mathematics.PI2 / _period));
	}
}