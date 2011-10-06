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
package box2D.dynamics.contacts;

import box2D.common.math.B2Vec2;

class B2ContactConstraintPoint
 {
	public function new() { 
		localAnchor1 = new B2Vec2();
		localAnchor2 = new B2Vec2();
		r1 = new B2Vec2();
		r2 = new B2Vec2();
		normalImpulse = 0.0;
		tangentImpulse = 0.0;
		positionImpulse = 0.0;
		normalMass = 0.0;
		tangentMass = 0.0;
		equalizedMass = 0.0;
		separation = 0.0;
		velocityBias = 0.0;
	}
	
	public var localAnchor1:B2Vec2;
	public var localAnchor2:B2Vec2;
	public var r1:B2Vec2;
	public var r2:B2Vec2;
	public var normalImpulse:Float;
	public var tangentImpulse:Float;
	public var positionImpulse:Float;
	public var normalMass:Float;
	public var tangentMass:Float;
	public var equalizedMass:Float;
	public var separation:Float;
	public var velocityBias:Float;
}