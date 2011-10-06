/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/
package box2D.collision;
	
import box2D.common.math.B2Vec2;
import box2D.common.math.B2XForm;
import box2D.collision.shapes.B2Shape;
import box2D.common.math.B2Sweep;
import box2D.common.B2Settings;

class B2TimeOfImpact
 {
// This algorithm uses conservative advancement to compute the time of
// impact (TOI) of two shapes.
// Refs: Bullet, Young Kim
//
public function new() { }
// This algorithm uses conservative advancement to compute the time of
// impact (TOI) of two shapes.
// Refs: Bullet, Young Kim
//
public static var s_p1:B2Vec2 = new B2Vec2();
public static var s_p2:B2Vec2 = new B2Vec2();
public static var s_xf1:B2XForm = new B2XForm();
public static var s_xf2:B2XForm = new B2XForm();
//
public static function TimeOfImpact(	shape1:B2Shape, sweep1:B2Sweep,
								shape2:B2Shape, sweep2:B2Sweep) : Float
{
	var math1:Float;
	var math2:Float;
	
	var r1:Float = shape1.m_sweepRadius;
	var r2:Float = shape2.m_sweepRadius;
	//B2Settings.b2Assert(sweep1.t0 == sweep2.t0);
	//B2Settings.b2Assert(1.0 - sweep1.t0 > box2D.common.math.B2Math.MIN_VALUE);
	var t0:Float = sweep1.t0;
	//b2Vec2 v1 = sweep1.c - sweep1.c0;
	var v1X:Float = sweep1.c.x - sweep1.c0.x;
	var v1Y:Float = sweep1.c.y - sweep1.c0.y;
	//b2Vec2 v2 = sweep2.c - sweep2.c0;
	var v2X:Float = sweep2.c.x - sweep2.c0.x;
	var v2Y:Float = sweep2.c.y - sweep2.c0.y;
	var omega1:Float = sweep1.a - sweep1.a0;
	var omega2:Float = sweep2.a - sweep2.a0;
	var alpha:Float = 0.0;
	var p1:B2Vec2 = s_p1;
	var p2:B2Vec2 = s_p2;
	var k_maxIterations:Int = 20;	// TODO_ERIN B2Settings
	var iter:Int = 0;
	//b2Vec2 normal = b2Vec2_zero;
	var normalX:Float = 0.0;
	var normalY:Float = 0.0;
	var distance:Float = 0.0;
	var targetDistance:Float = 0.0;
	while (true)
	{
		var t:Float = (1.0 - alpha) * t0 + alpha;
		//b2XForm xf1, xf2;
		var xf1:B2XForm = s_xf1;
		var xf2:B2XForm = s_xf2;
		sweep1.GetXForm(xf1, t);
		sweep2.GetXForm(xf2, t);
		
		// Get the distance between shapes.
		distance = B2Distance.Distance(p1, p2, shape1, xf1, shape2, xf2);
		
		if (iter == 0)
		{
			// Compute a reasonable target distance to give some breathing room
			// for conservative advancement.
			if (distance > 2.0 * B2Settings.b2_toiSlop)
			{
				targetDistance = 1.5 * B2Settings.b2_toiSlop;
			}
			else
			{
				//targetDistance = Math.max(0.05 * B2Settings.b2_toiSlop, distance - 0.5 * B2Settings.b2_toiSlop);
				math1 = 0.05 * B2Settings.b2_toiSlop;
				math2 = distance - 0.5 * B2Settings.b2_toiSlop;
				targetDistance = math1 > math2 ? math1 : math2;
			}
		}
		
		if (distance - targetDistance < 0.05 * B2Settings.b2_toiSlop || iter == k_maxIterations)
		{
			break;
		}
		
		//normal = p2 - p1;
		normalX = p2.x - p1.x;
		normalY = p2.y - p1.y;
		//normal.Normalize();
		var nLen:Float = Math.sqrt(normalX*normalX + normalY*normalY);
		normalX /= nLen;
		normalY /= nLen;
		
		// Compute upper bound on remaining movement.
		//float32 approachVelocityBound = b2Dot(normal, v1 - v2) + b2Abs(omega1) * r1 + b2Abs(omega2) * r2;
		var approachVelocityBound:Float = 	(normalX*(v1X - v2X) + normalY*(v1Y - v2Y))
											+ (omega1 < 0 ? -omega1 : omega1) * r1 
											+ (omega2 < 0 ? -omega2 : omega2) * r2;
		//if (Math.abs(approachVelocityBound) < box2D.common.math.B2Math.MIN_VALUE)
		if (approachVelocityBound == 0)
		{
			alpha = 1.0;
			break;
		}
		
		// Get the conservative time increment. Don't advance all the way.
		var dAlpha:Float = (distance - targetDistance) / approachVelocityBound;
		//float32 dt = (distance - 0.5f * b2_linearSlop) / approachVelocityBound;
		var newAlpha:Float = alpha + dAlpha;
		
		// The shapes may be moving apart or a safe distance apart.
		if (newAlpha < 0.0 || 1.0 < newAlpha)
		{
			alpha = 1.0;
			break;
		}
		
		// Ensure significant advancement.
		if (newAlpha < (1.0 + 100.0 * box2D.common.math.B2Math.MIN_VALUE) * alpha)
		{
			break;
		}
		
		alpha = newAlpha;
		
		++iter;
	}
	return alpha;
}
}