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
import box2D.common.B2Settings;

// A manifold for two touching convex shapes.
class B2Manifold
 {
	
	public function new(){
		pointCount = 0;
		points = new Array();
		for (i in 0...B2Settings.b2_maxManifoldPoints){
			points[i] = new B2ManifoldPoint();
		}
		normal = new B2Vec2();
	}
	public function Reset() : Void{
		for (i in 0...B2Settings.b2_maxManifoldPoints){
			points[i].Reset();
		}
		normal.SetZero();
		pointCount = 0;
	}
	public function Set(m:B2Manifold) : Void{
		pointCount = m.pointCount;
		for (i in 0...B2Settings.b2_maxManifoldPoints){
			points[i].Set(m.points[i]);
		}
		normal.SetV(m.normal);
	}
	public var points:Array<B2ManifoldPoint>;	///< the points of contact
	public var normal:B2Vec2;	///< the shared unit normal vector
	public var pointCount:Int ;	///< the number of manifold points
}