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
package box2D.common.math;
	
import box2D.common.B2Color;
import box2D.common.B2Settings;
	
	
/// A transform contains translation and rotation. It is used to represent
/// the position and orientation of rigid frames.
class B2XForm
 {
	/// The default constructor does nothing (for performance).
	
	/// The default constructor does nothing (for performance).
	public function new(?pos:B2Vec2=null, ?r:B2Mat22=null) {
		position = new B2Vec2();
		R =  new B2Mat22();
		
		if (pos != null){
			position.SetV(pos);
			
		}
		if (r != null) {
			R.SetM(r);
		}
	}
	/// Initialize using a position vector and a rotation matrix.
	public inline function Initialize(pos:B2Vec2, r:B2Mat22) : Void 
	{
		position.SetV(pos);
		R.SetM(r);
	}
	/// Set this to the identity transform.
	public inline function SetIdentity() : Void
	{
		position.SetZero();
		R.SetIdentity();
	}
	
	public inline function Set(x:B2XForm) : Void{
		position.SetV(x.position);
		R.SetM(x.R);
	}
	public var position:B2Vec2 ;
	public var R:B2Mat22 ;
	
	#if debug
	public function toString () :String
	{
		return "[x=" + position.x + ", y=" + position.y + ", angle=" + R.GetAngle() + "]"; 
	}
	#end
}