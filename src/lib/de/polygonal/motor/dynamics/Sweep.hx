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
package de.polygonal.motor.dynamics;

import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;

/**
 * This describes the motion of a body/shape for TOI computation.
 * Shapes are defined with respect to the body origin, which may no coincide with the C.O.M..
 * However, to support dynamics we must interpolate the C.O.M. position.
 */
class Sweep 
{
	/**
	 * Time interval [t0, 1], where t0 is [0, 1].
	 */
	public var t0:Float;
	
	/**
	 * Local center of mass position.
	 */
	public var localCenter:Vec2;
	
	/**
	 * Center world positions.
	 */
	public var c0:Vec2;
	public var c:Vec2;
	
	/**
	 * World angles.
	 */
	public var a0:Float; 
	public var a:Float;
	
	var _settings:Settings;
	
	public function new()
	{
		_settings = World.settings;
		
		localCenter = new Vec2();
		c0 = new Vec2();
		c = new Vec2();
	}
	
	inline public function setAngle(angle:Float):Void
	{
		a0 = a = angle;
	}
	
	inline public function setCenter(xform:Mat32):Void
	{
		xform.mul(localCenter, c0);
		c.x = c0.x;
		c.y = c0.y;
	}
	
	/**
	 * Compute the transform for a0, c0.
	 */
	inline public function getT0(T:Mat32):Mat32
	{
		T.setAngle(a0);
		
		T.tx = c0.x - T.mulx(localCenter.x, localCenter.y);
		T.ty = c0.y - T.muly(localCenter.x, localCenter.y);
		return T;
	}
	
	/**
	 * Compute the transform for a1, c1.
	 */
	inline public function getXForm1(T:Mat32):Mat32
	{
		T.setAngle(a);
		
		T.tx = c.x - T.mulx(localCenter.x, localCenter.y);
		T.ty = c.y - T.muly(localCenter.x, localCenter.y);
		return T;
	}
	
	/**
	 * Advance the sweep forward, yielding a new initial state.
	 * @param t the new initial time.
	 */
	inline public function advance(t:Float):Void
	{
		if (t0 < t && (1. - t0) > _settings.eps)
		{
			var alpha = (t - t0) / (1. - t0);
			var t = 1. - alpha;
			c0.x = t * c0.x + alpha * c.x;
			c0.y = t * c0.y + alpha * c.y;
			a0   = t * a0   + alpha * a;
			t0   = t;
		}
	}
	
	/**
	 * Gets the interpolated transform at a specific time.
	 * @param T Returns the interpolated transform.
	 * @param t The normalized time in 1;0,1&#093;
	 */
	public function getXForm(t:Float, T:Mat32):Void
	{
		//center = p + R * localCenter
		if (1 - t0 > _settings.eps)
		{
			var alpha = (t - t0) / (1 - t0);
			T.tx = (1 - alpha) * c0.x + alpha * c.x;
			T.ty = (1 - alpha) * c0.y + alpha * c.y;
			T.setAngle((1 - alpha) * a0 + alpha * a);
		}
		else
		{
			T.tx = c.x;
			T.ty = c.y;
			T.setAngle(a);
		}

		//shift to origin
		var lx = localCenter.x;
		var ly = localCenter.y;
		T.tx -= T.mul22x(lx, ly);
		T.ty -= T.mul22y(lx, ly);
	}
}