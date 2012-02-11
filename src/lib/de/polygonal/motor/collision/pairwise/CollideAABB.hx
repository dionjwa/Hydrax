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

import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.contact.ContactID;
import de.polygonal.motor.dynamics.contact.Manifold;
import de.polygonal.motor.Settings;

class CollideAABB implements Collider
{
	inline public static var NEG_YAXIS = 0;
	inline public static var POS_XAXIS = 1;
	inline public static var POS_YAXIS = 2;
	inline public static var NEG_XAXIS = 3;
	
	var _relTol:Float;
	var _absTol:Float;
	
	public function new(settings:Settings)
	{
		_relTol = settings.relTolerance;
		_absTol = settings.absTolerance;
	}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void {}
	
	public function free():Void {}
	
	public function collide(manifold:Manifold, s1:AbstractShape, s2:AbstractShape):Void
	{
		//compare projection intervals
		//shape 1 is always treated as reference shape
		
		var bound1 = s1.aabb;
		var bound2 = s2.aabb;
		
		//positive x-axis interval
		var sep = bound1.minX - bound2.maxX;
		if (sep > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		var sepAxis = POS_XAXIS;
		
		//negative x-axis interval
		var depth = bound2.minX - bound1.maxX;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		if (depth > sep)
		{
			sep = depth;
			sepAxis = NEG_XAXIS;
		}
		
		//positive y-axis interval
		depth = bound1.minY - bound2.maxY;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ey)
		{
			sep = depth;
			sepAxis = POS_YAXIS;
		}
		
		//negative y-axis interval
		depth = bound2.minY - bound1.maxY;
		if (depth > 0)
		{
			manifold.pointCount = 0;
			return;
		}
		if (depth > _relTol * sep + _absTol * s2.ey)
		{
			sep = depth;
			sepAxis = NEG_YAXIS;
		}
		
		//output contact manifold
		manifold.pointCount = 1;
		var mp = manifold.mp1;
		mp.sep = sep;
		mp.id = ContactID.setRefEdge(ContactID.NULL_VALUE, sepAxis);
		mp.id = ContactID.setIncEdge(mp.id, (sepAxis - 2) < 0 ? 2 + sepAxis : (sepAxis - 2));
		
		switch (sepAxis)
		{
			case POS_XAXIS:
				manifold.ncoll.x =-1;
				manifold.ncoll.y = 0;
				
				mp.x = bound2.maxX;
				mp.y = bound2.minY < bound1.minY ? bound1.minY : bound2.minY;
			
			case NEG_XAXIS:
				manifold.ncoll.x = 1;
				manifold.ncoll.y = 0;
				mp.x = bound2.minX;
				mp.y = bound2.minY < bound1.minY ? bound1.minY : bound2.minY;
			
			case POS_YAXIS:
				manifold.ncoll.x = 0;
				manifold.ncoll.y =-1;
				mp.x = bound2.minX < bound1.minX ? bound1.minX : bound2.minX;
				mp.y = bound2.maxY;
			
			case NEG_YAXIS:
				manifold.ncoll.x = 0;
				manifold.ncoll.y = 1;
				mp.x = bound2.minX < bound1.minX ? bound1.minX : bound2.minX;
				mp.y = bound2.minY;
		}
		
		//contact point in body space
		mp.lp1.x = mp.x - s1.TBody.tx;
		mp.lp1.y = mp.y - s1.TBody.ty;
		mp.lp2.x = mp.x - s2.TBody.tx;
		mp.lp2.y = mp.y - s2.TBody.ty;
	}
}