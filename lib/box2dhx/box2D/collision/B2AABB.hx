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

// A manifold for two touching convex shapes.
class B2AABB
 {
	/// Verify that the bounds are sorted.
	public function new() { 
		lowerBound = new B2Vec2();
		upperBound = new B2Vec2();
	}
	
	/// Verify that the bounds are sorted.
	public inline function IsValid():Bool{
		//b2Vec2 d = upperBound - lowerBound;
		var dX:Float = upperBound.x - lowerBound.x;
		var dY:Float = upperBound.y - lowerBound.y;
		var valid:Bool = dX >= 0.0 && dY >= 0.0;
		valid = valid && lowerBound.IsValid() && upperBound.IsValid();
		return valid;
	}
	public var lowerBound:B2Vec2 ;	///< the lower vertex
	public var upperBound:B2Vec2 ;	///< the upper vertex
}