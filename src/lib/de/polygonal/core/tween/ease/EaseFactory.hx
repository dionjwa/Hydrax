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
 * <p>Creates different easing interpolations.</p>
 */
class EaseFactory
{
	static var _instance:EaseFactory;
	public  static function create(type:Ease):Interpolation<Float>
	{
		if (_instance == null)
			_instance = new EaseFactory();
		return _instance._create(type);
	}
	
	var _none:NullEase;
	var _powEaseIn2:PowEaseIn;
	var _powEaseIn3:PowEaseIn;
	var _powEaseIn4:PowEaseIn;
	var _powEaseIn5:PowEaseIn;
	var _powEaseOut2:PowEaseOut;
	var _powEaseOut3:PowEaseOut;
	var _powEaseOut4:PowEaseOut;
	var _powEaseOut5:PowEaseOut;
	var _powEaseInOut2:PowEaseInOut;
	var _powEaseInOut3:PowEaseInOut;
	var _powEaseInOut4:PowEaseInOut;
	var _powEaseInOut5:PowEaseInOut;
	var _sinEaseIn:SinEaseIn;
	var _sinEaseOut:SinEaseOut;
	var _sinEaseInOut:SinEaseInOut;
	var _expEaseIn:ExpEaseIn;
	var _expEaseOut:ExpEaseOut;
	var _expEaseInOut:ExpEaseInOut;
	var _circularEaseIn:CircularEaseIn;
	var _circularEaseOut:CircularEaseOut;
	var _circularEaseInOut:CircularEaseInOut;
	var _backEaseIn:BackEaseIn;
	var _backEaseOut:BackEaseOut;
	var _backEaseInOut:BackEaseInOut;
	var _elasticEaseIn:ElasticEaseIn;
	var _elasticEaseOut:ElasticEaseOut;
	var _elasticEaseInOut:ElasticEaseInOut;
	var _bounceEaseIn:BounceEaseIn;
	var _bounceEaseOut:BounceEaseOut;
	var _bounceEaseInOut:BounceEaseInOut;
	
	function new()
	{
		_none               = new NullEase();
		_powEaseIn2         = new PowEaseIn(2);
		_powEaseIn3         = new PowEaseIn(3);
		_powEaseIn4         = new PowEaseIn(4);
		_powEaseIn5         = new PowEaseIn(5);
		_powEaseOut2        = new PowEaseOut(2);
		_powEaseOut3        = new PowEaseOut(3);
		_powEaseOut4        = new PowEaseOut(4);
		_powEaseOut5        = new PowEaseOut(5);
		_powEaseInOut2      = new PowEaseInOut(2);
		_powEaseInOut3      = new PowEaseInOut(3);
		_powEaseInOut4      = new PowEaseInOut(4);
		_powEaseInOut5      = new PowEaseInOut(5);
		_sinEaseIn          = new SinEaseIn();
		_sinEaseOut         = new SinEaseOut();
		_sinEaseInOut       = new SinEaseInOut();
		_expEaseIn          = new ExpEaseIn();
		_expEaseOut         = new ExpEaseOut();
		_expEaseInOut       = new ExpEaseInOut();
		_circularEaseIn     = new CircularEaseIn();
		_circularEaseOut    = new CircularEaseOut();
		_circularEaseInOut  = new CircularEaseInOut();
		_backEaseIn         = new BackEaseIn();
		_backEaseOut        = new BackEaseOut();
		_backEaseInOut      = new BackEaseInOut();
		_elasticEaseIn      = new ElasticEaseIn();
		_elasticEaseOut     = new ElasticEaseOut();
		_elasticEaseInOut   = new ElasticEaseInOut();
		_bounceEaseIn       = new BounceEaseIn();
		_bounceEaseOut      = new BounceEaseOut();
		_bounceEaseInOut    = new BounceEaseInOut();
	}
	
	function _create(x:Ease):Interpolation<Float>
	{
		switch (x)
		{
			case None:
				return _none;
			
			case PowIn(degree):
				switch (degree)
				{
					case 2: return _powEaseIn2;
					case 3: return _powEaseIn3;
					case 4: return _powEaseIn4;
					case 5: return _powEaseIn5;
				}
			
			case PowOut(degree):
				switch (degree)
				{
					case 2: return _powEaseOut2;
					case 3: return _powEaseOut3;
					case 4: return _powEaseOut4;
					case 5: return _powEaseOut5;
				}
				
			case PowInOut(degree):
				switch (degree)
				{
					case 2: return _powEaseInOut2;
					case 3: return _powEaseInOut3;
					case 4: return _powEaseInOut4;
					case 5: return _powEaseInOut5;
				}
				
			case SinIn:    return _sinEaseIn;
			case SinOut:   return _sinEaseOut;
			case SinInOut: return _sinEaseInOut;
			
			case ExpIn:    return _expEaseIn;
			case ExpOut:   return _expEaseOut;
			case ExpInOut: return _expEaseInOut;
			
			case CircularIn:    return _circularEaseIn;
			case CircularOut:   return _circularEaseOut;
			case CircularInOut: return _circularEaseInOut;
			
			case BackIn(overshoot):    return overshoot == null ? _backEaseIn    : new BackEaseIn(overshoot);
			case BackOut(overshoot):   return overshoot == null ? _backEaseOut   : new BackEaseOut(overshoot);
			case BackInOut(overshoot): return overshoot == null ? _backEaseInOut : new BackEaseInOut(overshoot);
			
			case ElasticIn(period, amplitude):    return (period == null && amplitude == null) ? _elasticEaseIn    : new ElasticEaseIn(amplitude, period);
			case ElasticOut(period, amplitude):   return (period == null && amplitude == null) ? _elasticEaseOut   : new ElasticEaseOut(amplitude, period);
			case ElasticInOut(period, amplitude): return (period == null && amplitude == null) ? _elasticEaseInOut : new ElasticEaseInOut(amplitude, period);
			
			case BounceIn:    return _bounceEaseIn;
			case BounceOut:   return _bounceEaseOut;
			case BounceInOut: return _bounceEaseInOut;
		}
		
		return null;
	}
}