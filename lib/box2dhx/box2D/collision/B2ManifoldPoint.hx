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
/// A manifold point is a contact point belonging to a contact
/// manifold. It holds details related to the geometry and dynamics
/// of the contact points.
/// The point is stored in local coordinates because CCD
/// requires sub-stepping in which the separation is stale.
class B2ManifoldPoint
 {
	public function new() { 
	localPoint1 = new B2Vec2();
	localPoint2 = new B2Vec2();
	id = new B2ContactID();
	}
	
	public function Reset() : Void{
		localPoint1.SetZero();
		localPoint2.SetZero();
		separation = 0.0;
		normalImpulse = 0.0;
		tangentImpulse = 0.0;
		id.key = 0;
	}
	public function Set(m:B2ManifoldPoint) : Void{
		localPoint1.SetV(m.localPoint1);
		localPoint2.SetV(m.localPoint2);
		separation = m.separation;
		normalImpulse = m.normalImpulse;
		tangentImpulse = m.tangentImpulse;
		id.key = m.id.key;
	}
	public var localPoint1:B2Vec2 ;
	public var localPoint2:B2Vec2 ;
	public var separation:Float;
	public var normalImpulse:Float;
	public var tangentImpulse:Float;
	public var id:B2ContactID ;
}