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
package box2D.dynamics.joints;


import box2D.common.math.B2Vec2;

class B2Jacobian
 {
	public function new() { 
	linear1 = new B2Vec2();
	linear2 = new B2Vec2();
	}
	
	public var linear1:B2Vec2 ;
	public var angular1:Float;
	public var linear2:B2Vec2 ;
	public var angular2:Float;
	public function SetZero() : Void{
		linear1.SetZero(); angular1 = 0.0;
		linear2.SetZero(); angular2 = 0.0;
	}
	public function Set(x1:B2Vec2, a1:Float, x2:B2Vec2, a2:Float) : Void{
		linear1.SetV(x1); angular1 = a1;
		linear2.SetV(x2); angular2 = a2;
	}
	public function Compute(x1:B2Vec2, a1:Float, x2:B2Vec2, a2:Float):Float{
		
		//return B2Math.b2Dot(linear1, x1) + angular1 * a1 + B2Math.b2Dot(linear2, x2) + angular2 * a2;
		return (linear1.x*x1.x + linear1.y*x1.y) + angular1 * a1 + (linear2.x*x2.x + linear2.y*x2.y) + angular2 * a2;
	}
}