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
package de.polygonal.motor.collision.pairwise;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

class CollideCircle implements Collider
{
	var _eps:Float;
	
	public function new(settings:Settings)
	{
		_eps = settings.eps;
	}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void {}
	
	public function free():Void {}
	
	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		var r1 = s1.radius;
		var r2 = s2.radius;
		var r = r1 + r2;
		
		var p1x = s1.x;
		var p1y = s1.y;
		
		var p2x = s2.x;
		var p2y = s2.y;
		
		var dx = p2x - p1x;
		var dy = p2y - p1y;
		
		var dSq = dx * dx + dy * dy;
		if (dSq > r * r)
		{
			manifold.pointCount = 0;
			return;
		}
		
		manifold.pointCount = 1;
		var mp = manifold.mp1;
		var n = manifold.ncoll;
		
		if (dSq <= _eps * _eps)
		{
			mp.sep = -r;
			n.x = 0;
			n.y = 1;
		}
		else
		{
			var d = 1 / Mathematics.invSqrt(dSq);
			mp.sep = d - r;
			n.x = (1 / d) * dx;
			n.y = (1 / d) * dy;
		}
		
		p1x += r1 * n.x;
		p1y += r1 * n.y;
		p2x -= r2 * n.x;
		p2y -= r2 * n.y;
		
		//contact point world space
		mp.x = .5 * (p1x + p2x);
		mp.y = .5 * (p1y + p2y);
		
		//contact point body space
		s1.TBody.mulT(mp, mp.lp1);
		s2.TBody.mulT(mp, mp.lp2);
	}
}