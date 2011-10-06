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
import box2D.collision.shapes.B2Shape;
/// This structure is used to report contact points.
class B2ContactPoint
 {
	public function new() { 
		position = new B2Vec2();
		velocity = new B2Vec2();
		normal = new B2Vec2();
		id = new B2ContactID();
		separation = 0.0;
		friction = 0.0;
		restitution = 0.0;
	}
	
	public var shape1:B2Shape;						///< the first shape
	public var shape2:B2Shape;						///< the second shape
	public var position:B2Vec2 ;		///< position in world coordinates
	public var velocity:B2Vec2 ;		///< velocity of point on body2 relative to point on body1 (pre-solver)
	public var normal:B2Vec2 ;		///< points from shape1 to shape2
	public var separation:Float;					///< the separation is negative when shapes are touching
	public var friction:Float;						///< the combined friction coefficient
	public var restitution:Float;					///< the combined restitution coefficient
	public var id:B2ContactID ;	///< the contact id identifies the features in contact
}