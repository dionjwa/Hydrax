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

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.shape.CircleShape;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.Settings;

/**
 * This algorithm uses conservative advancement to compute the time of
 * impact (TOI) of two shapes.
 * Refs: Bullet, Young Kim
 */
class TOI 
{
	inline static var MAX_ITERATIONS = 20;
	
	var _sweep1T:Mat32;
	var _sweep2T:Mat32;
	
	var _p1:Vec2;
	var _p2:Vec2;
	
	var _settings:Settings;
	
	public function new(settings:Settings)
	{
		_settings = settings;
		
		_sweep1T = new Mat32();
		_sweep2T = new Mat32();
		
		_p1 = new Vec2();
		_p2 = new Vec2();
	}
	
	public function timeOfImpact(shape1:AbstractShape, sweep1:Sweep, shape2:AbstractShape, sweep2:Sweep)
	{
		#if debug
		de.polygonal.core.util.Assert.assert(sweep1.t0 == sweep2.t0, "sweep1.t0 == sweep2.t0" + [sweep1.t0, sweep2.t0]);
		de.polygonal.core.util.Assert.assert(1 - sweep1.t0 > _settings.eps, "1 - sweep1.t0 > _settings.eps");
		#end
		
		var t0 = sweep1.t0;
		var r1 = shape1.sweepRadius;
		var r2 = shape2.sweepRadius;
		
		var v1x = sweep1.c.x - sweep1.c0.x;
		var v1y = sweep1.c.y - sweep1.c0.y;
		var v2x = sweep2.c.x - sweep2.c0.x;
		var v2y = sweep2.c.y - sweep2.c0.y;
		
		var omega1 = sweep1.a - sweep1.a0;
		var omega2 = sweep2.a - sweep2.a0;
		
		var alpha = .0;
		
		var iter = 0;
		
		var nx, ny;
		
		var distance = .0;
		var targetDistance = .0;
		
		while (true)
		{
			var t = (1 - alpha) * t0 + alpha;
			
			sweep1.getXForm(t, _sweep1T);
			sweep2.getXForm(t, _sweep2T);
			
			//get the distance between shapes
			//distance = b2Distance(p1, p2, shape1, xf1, shape2, xf2); //returns in p1, p2
			distance = _distanceCC(_p1, _p2, shape1, _sweep1T, shape2, _sweep2T);
			
			if (iter == 0)
			{
				//compute a reasonable target distance to give some breathing room for conservative advancement
				if (distance > 2 * _settings.toiSlop)
					targetDistance = 1.5 * _settings.toiSlop;
				else
					targetDistance = Mathematics.fmax(.05 * _settings.toiSlop, distance - .5 * _settings.toiSlop);
			}
			
			if (distance - targetDistance < .05 * _settings.toiSlop || iter == MAX_ITERATIONS) break;
			
			nx = _p2.x - _p1.x;
			ny = _p2.y - _p1.y;
			var norm = Math.sqrt(nx * nx + ny * ny);
			nx /= norm;
			ny /= norm;
			
			//compute upper bound on remaining movement
			var approachVelocityBound = (Vec2Util.dot4(nx, ny, v1x - v2x, v1y - v2y)) + Mathematics.fabs(omega1) * r1 + Mathematics.fabs(omega2) * r2;
			
			if (Mathematics.fabs(approachVelocityBound) < _settings.eps)
			{
				alpha = 1.;
				break;
			}
			
			//get the conservative time increment; don't advance all the way
			var dAlpha = (distance - targetDistance) / approachVelocityBound;
			var newAlpha = alpha + dAlpha;
			
			//the shapes may be moving apart or a safe distance apart
			if (newAlpha < .0 || 1. < newAlpha)
			{
				alpha = 1.;
				break;
			}
			
			//ensure significant advancement
			if (newAlpha < (1. + 100. * _settings.eps) * alpha) break;
			
			alpha = newAlpha;
			
			++iter;
		}
		
		return alpha;
	}
	
	function _distanceCC(x1:Vec2, x2:Vec2, circle1:AbstractShape, T1:Mat32, circle2:AbstractShape, T2:Mat32):Float
	{
		var localPosition;
		
		localPosition = circle1.TLocal;
		var p1x = T1.mulx(localPosition.tx, localPosition.ty);
		var p1y = T1.muly(localPosition.tx, localPosition.ty);
		
		localPosition = circle2.TLocal;
		var p2x = T2.mulx(localPosition.tx, localPosition.ty);
		var p2y = T2.muly(localPosition.tx, localPosition.ty);
		
		var dx = p2x - p1x;
		var dy = p2y - p1y;
		
		var dSqr = Vec2Util.dot4(dx, dy, dx, dy);
		var r1 = circle1.radius - _settings.toiSlop;
		var r2 = circle2.radius - _settings.toiSlop;
		var r = r1 + r2;
		if (dSqr > r * r)
		{
			var norm = Math.sqrt(dx * dx + dy * dy);
			dx /= norm;
			dy /= norm;
			var distance = norm - r;
			
			x1.x = p1x + r1 * dx;
			x1.y = p1y + r1 * dy;
			x2.x = p2x - r2 * dx;
			x2.y = p2y - r2 * dy;
			return distance;
		}
		else
		if (dSqr > _settings.eps * _settings.eps)
		{
			var norm = Math.sqrt(dx * dx + dy * dy);
			dx /= norm;
			dy /= norm;
			
			x1.x = p1x + r1 * dx;
			x1.y = p1y + r1 * dy;
			x2.x = x1.x;
			x2.y = x1.y;
			return 0.;
		}
		
		x1.x = p1x;
		x1.y = p1y;
		
		x2.x = x1.x;
		x2.y = x1.y;
		
		return 0.;
	}
}