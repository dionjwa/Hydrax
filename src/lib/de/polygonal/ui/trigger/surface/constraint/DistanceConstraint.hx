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
package de.polygonal.ui.trigger.surface.constraint;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.gl.VectorRenderer;
import de.polygonal.ui.trigger.surface.Surface;
import de.polygonal.ui.trigger.surface.SurfaceConstraint;

class DistanceConstraint implements SurfaceConstraint
{
	public var target(default, null):Vec2;
	
	public var minDistance:Float;
	public var maxDistance:Float;
	
	public function new(target:Vec2, minDist:Float, maxDist:Float)
	{
		this.target = target;
		minDistance = minDist;
		maxDistance = maxDist;
	}
	
	public function free():Void
	{
		
	}
	
	public function evaluate(c:Vec2):Void
	{
		var dx = target.x - c.x;
		var dy = target.y - c.y;
		var dist = Vec2Util.dot4(dx, dy, dx, dy);
		
		if (minDistance > 0)
		{
			if (dist < minDistance * minDistance)
			{
				if (dist < Mathematics.EPS)
					c.x += minDistance - dist;
				else
				{
					dist = Math.sqrt(dist);
					dx /= dist;
					dy /= dist;
					c.x -= dx * (minDistance - dist);
					c.y -= dy * (minDistance - dist);
				}
			}
		}
		
		if (maxDistance > 0 && maxDistance != Mathematics.POSITIVE_INFINITY)
		{
			if (dist > maxDistance * maxDistance)
			{
				dist = Math.sqrt(dist);
				dx /= dist;
				dy /= dist;
				c.x += dx * (dist - maxDistance);
				c.y += dy * (dist - maxDistance);
			}
		}
	}
}